<?php

namespace App\Http\Livewire\Admin;

use App\Models\Category;
use App\Models\Subcategory;
use Livewire\Component;
use Livewire\WithPagination;

class AdminCategoryComponent extends Component
{
    use WithPagination;
    // "class" is defined as "category"  in the code logic 
    public function deleteCategory($id){
        $category= Category::find($id);
        $category->delete();
        session()->flash('message','Category has been deleted successfully!');
    }
    public function deleteSubCategory($id){
        $subcategory= Subcategory::find($id);
        $subcategory->delete();
        session()->flash('message','SubCategory has been deleted successfully!');
    }
    public function render()
    {
        $categories=Category::paginate(5);
        return view('livewire.admin.admin-category-component',['categories' => $categories])->layout('layouts.base');
    }
}
