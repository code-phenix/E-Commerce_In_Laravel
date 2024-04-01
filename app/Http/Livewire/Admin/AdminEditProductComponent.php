<?php

namespace App\Http\Livewire\Admin;

use App\Models\AttributeValue;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\Subcategory;
use Attribute;
use Livewire\Component;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Livewire\WithFileUploads;

class AdminEditProductComponent extends Component
{
    use WithFileUploads;
    public $name;
    public $slug;
    public $short_description;
    public $description;
    public $regular_price;
    public $sale_price;
    public $SKU;
    public $stock_status;
    public $featured;
    public $quantity;
    public $image;
    public $category_id;
    public $newimage;
    public $product_id;

    public  $images;
    public $newimages;
    public $subcategory_id;

    public $attribute;
    public $inputs=[];
    public $attribute_array=[];
    public $attribute_values;

    public function mount($product_slug){
        $product=Product::where('slug',$product_slug)->first();
        $this->name=$product->name;
        $this->slug=$product->slug;
        $this->short_description=$product->short_description;
        $this->description=$product->description;
        $this->regular_price=$product->regular_price;
        $this->sale_price=$product->sale_price;
        $this->SKU=$product->SKU;
        $this->stock_status=$product->stock_status;
        $this->featured=$product->featured;
        $this->quantity=$product->quantity;
        $this->image=$product->image;
        $this->images= explode(",",$product->images);
        $this->subcategory_id=$product->subcategory_id;
        $this->category_id=$product->category_id;
        $this->product_id=$product->id;
        $this->inputs =$product->attributeValues->where('product_id',$product->id)->unique('product_attribute_id')->pluck('product_attribute_id');//attributeValues function from models 
        $this->attribute_array =$product->attributeValues->where('product_id',$product->id)->unique('product_attribute_id')->pluck('product_attribute_id');

        foreach($this->attribute_array as $attribute_array){
            $allAttributeValue=AttributeValue::where('product_id',$product->id)->where('product_attribute_id',$attribute_array)->get()->pluck('value');
            $valueString='';
            foreach($allAttributeValue as $value){
                $valueString=$valueString.$value.',';
            }
            $this->attribute_values[$attribute_array]=rtrim($valueString,",");
        }
    }

    public function addAttribute(){
        if(!$this->attribute_array->contains($this->attribute)){
            $this->inputs->push($this->attribute);
            $this->attribute_array->push($this->attribute);
        }
    }

    public function removeAttribute($attribute){
        unset($this->inputs[$attribute]);
    }

    public function generateSlug(){
        $this->slug=Str::slug($this->name,'-');
    }

    public function updated($fields){
        $this->validateOnly($fields,[
            'name'=>'required',
            'slug'=>'required',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'required',
            'SKU'=>'required',
            'stock_status'=>'required',
            'featured'=>'required',
            'quantity'=>'required|numeric',
            // 'newimage'=>'required|mimes:jpeg,png',
            'category_id' => 'required'
        ]);
        if($this->newimage){
            $this->validateOnly($fields,[
                'newimage' => 'required|mimes::jpeg,png,jpg'
            ]);
        }
    }

    public function updateProduct(){
        $this->validate([
            'name'=>'required',
            'slug'=>'required',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'required',
            'SKU'=>'required',
            'stock_status'=>'required',
            'featured'=>'required',
            'quantity'=>'required|numeric',
            // 'newimage'=>'required|mimes:jpeg,png',
            'category_id' => 'required'
        ]);

        if($this->newimage){
            $this->validate([
                'newimage' => 'required|mimes::jpeg,png,jpg'
            ]);
        }

        $product=Product::find($this->product_id);
        $product->name=$this->name;
        $product->slug=$this->slug;
        $product->short_description=$this->short_description;
        $product->description=$this->description;
        $product->regular_price=$this->regular_price;
        $product->sale_price=$this->sale_price;
        $product->SKU=$this->SKU;
        $product->stock_status=$this->stock_status;
        $product->featured=$this->featured;
        $product->quantity=$this->quantity;
        if($this->newimage){
            unlink('assets/images/products'.'/'.$product->image);//deleting the file from the folders
            $imageName=Carbon::now()->timestamp.'.'.$this->newimage->extension();
            $this->newimage->storeAs('products',$imageName);
            $product->image=$imageName;
        }
        if($this->newimages){
            if($product->images){
                $images=explode(",",$product->images);
                foreach($images as $image){
                    if($image){
                        unlink('assets/images/products'.'/'.$image);//deleting the file from the folders
                    }
                }
            }
            $imagesname='';
            foreach($this->newimages as $key=>$image){
                $imgName=Carbon::now()->timestamp.$key.'.'.$image->extension();
                $image->storeAs('products',$imgName);
                $imagesname=$imagesname.','.$imgName;
            }
            $product->images = $imagesname;
        }
        $product->category_id=$this->category_id;
        if($this->subcategory_id){
            $product->subcategory_id=$this->subcategory_id;
        }
        $product->save();

        AttributeValue::where('product_id',$product->id)->delete();
        foreach($this->attribute_values as $key => $attribute_value){
            $array_values=explode(",",$attribute_value);
            foreach($array_values as $array_value){
                $attribute_value=new AttributeValue();
                $attribute_value->product_attribute_id=$key;
                $attribute_value->value=$array_value;
                $attribute_value->product_id=$product->id;
                $attribute_value->save();
            }   
        }

        session()->flash('message','Product has been updated successfully!');
    }

    public function changeSubcategory(){
        $this->subcategory_id=0;
         
    }

    public function render()
    {
        $categories=Category::all();
        $subcategories=Subcategory::where('category_id',$this->category_id)->get();
        $product_attributes=ProductAttribute::all();
        return view('livewire.admin.admin-edit-product-component',['categories'=>$categories,'subcategories'=>$subcategories,'product_attributes'=>$product_attributes])->layout("layouts.base");
    }
}
