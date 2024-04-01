<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Product;
use Livewire\WithPagination;
use Cart;
use App\Models\Category;
use App\Models\Subcategory;

class CategoryComponent extends Component
{
    public $sorting;
    public $pagesize;
    public $category_slug;
    public $subcategory_slug;

    public function mount($category_slug,$subcategory_slug=null){
        $this->sorting="default";
        $this->pagesize=12;
        $this->category_slug=$category_slug;
        $this->subcategory_slug=$subcategory_slug;
    }
    public function store($product_id,$product_name,$product_price){
        Cart::add($product_id,$product_name,1,$product_price)->associate('App\Models\Product');
        session()->flash('success_message','Item added in Cart');
        return redirect()->route('product.cart');

    }
    use WithPagination;
    public function render()
    {
        $category_id=null;
        $category_name="";
        $filter="";
        if($this->subcategory_slug){
            $subcategory=Subcategory::where('slug',$this->subcategory_slug)->first();
            $category_id=$subcategory->id;
            $category_name=$subcategory->name;
            $filter="sub";
        }
        else{
            $category=Category::where('slug',$this->category_slug)->first();
            $category_id=$category->id;
            $category_name=$category->name;
            $filter="";
        }
        if($this->sorting=='date'){
            $products=Product::where($filter.'category_id',$category_id)->orderBy('created_at','DESC')->paginate($this->pagesize);
        }
        else if($this->sorting=='price'){
            $products=Product::where($filter.'category_id',$category_id)->orderBy('regular_price','ASC')->paginate($this->pagesize);
        }
        else if($this->sorting=='price-desc'){
            $products=Product::where($filter.'category_id',$category_id)->orderBy('regular_price','DESC')->paginate($this->pagesize);
        }
        else{
            // dd($filter.'category_id');
            $products=Product::where($filter.'category_id',$category_id)->paginate($this->pagesize);
        }
        $categories=Category::all();
        return view('livewire.category-component',['products' => $products,'categories' => $categories,'category_name' =>$category_name])->layout("layouts.base");
    }
}

