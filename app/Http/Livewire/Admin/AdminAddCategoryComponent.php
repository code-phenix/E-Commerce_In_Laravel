<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\Subcategory;
use Livewire\Component;
use Illuminate\Support\Str;

class AdminAddCategoryComponent extends Component
{
    public $name;
    public $slug;

    public $category_id;
    
    public function generateslug(){
        $this->slug = Str::slug($this->name);
    }
    public function updated($fields){
        $this->validateOnly($fields,[
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);
    }
    
    public function storeCategory(){
        $this->validate([
            'name' => 'required',
            'slug' => 'required|unique:categories'
        ]);
        if($this->category_id){
            $sub_catogory=new Subcategory();
            $sub_catogory->name=$this->name;
            $sub_catogory->slug=$this->slug;
            $sub_catogory->category_id=$this->category_id;
            $sub_catogory->save();
        }
        else{
            $catogory=new Category();
            $catogory->name=$this->name;
            $catogory->slug=$this->slug;
            $catogory->save();
        }
        session()->flash('message','Category has been created successfully!');
    }
    public function render()
    {
        $catogories=Category::all();
        return view('livewire.admin.admin-add-category-component',['catogories'=>$catogories])->layout('layouts.base');
    }
}
