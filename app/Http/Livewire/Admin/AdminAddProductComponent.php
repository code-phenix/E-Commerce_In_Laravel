<?php

namespace App\Http\Livewire\Admin;

use App\Models\AttributeValue;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\Subcategory;
use Carbon\Carbon;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithFileUploads;


class AdminAddProductComponent extends Component
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
   public $images;
   public $subcategory_id;

   public $attribute;
   public $inputs=[];
   public $attribute_array=[];
   public $attribute_values;

   //public $product_ID;
   public function mount(){
    $this->stock_status='instock';
    $this->featured=0;
    }

    // public function generateProductID(){
    //     $category=Category::class;
    //     // $temp='Trade-cls'.$category->getCategory-
    // }

    public function addAttribute(){
        if(!in_array($this->attribute,$this->attribute_array)){
            array_push($this->inputs,$this->attribute);
            array_push($this->attribute_array,$this->attribute);
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
            'slug'=>'required|unique:products',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'required',
            'SKU'=>'required',
            'stock_status'=>'required',
            'featured'=>'required',
            'quantity'=>'required|numeric',
            'image'=>'required|mimes:jpeg,png',
            'category_id' => 'required'
        ]);
    }
    public function addProduct(){
        $this->validate([
            'name'=>'required',
            'slug'=>'required|unique:products',
            'short_description'=>'required',
            'description'=>'required',
            'regular_price'=>'required|numeric',
            'sale_price'=>'required',
            'SKU'=>'required',
            'stock_status'=>'required',
            'featured'=>'required',
            'quantity'=>'required|numeric',
            'image'=>'required|mimes:jpeg,png',
            'category_id' => 'required'
        ]);
        $product=new Product();
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
        $imageName=Carbon::now()->timestamp.'.'.$this->image->extension();
        $this->image->storeAs('products',$imageName);
        $product->image=$imageName;

        if($this->images){
            $imagesname='';
            foreach($this->images as $key=>$image){
                $imgName=Carbon::now()->timestamp. $key.'.'.$this->image->extension();
                $image->storeAs('products',$imgName);
                $imagesname=$imagesname.','.$imgName;
            }
            $product->images=$imagesname;
        }
        $product->category_id=$this->category_id;
        if($this->subcategory_id){
            $product->subcategory_id=$this->subcategory_id;
        }
        $product->save();

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
        session()->flash('message','Product has been created successfully!');

    }
    public function changeSubcategory(){
        $this->subcategory_id=0;
         
    }
    public function render()
    {
        $categories=Category::all();
        $subcategories=Subcategory::where('category_id',$this->category_id)->get();
        $product_attributes=ProductAttribute::all();
        return view('livewire.admin.admin-add-product-component',['categories'=>$categories,'subcategories'=>$subcategories,'product_attributes'=>$product_attributes])->layout('layouts.base');
    }
}
