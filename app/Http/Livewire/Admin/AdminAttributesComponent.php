<?php

namespace App\Http\Livewire\Admin;

use App\Models\ProductAttribute;
use Livewire\Component;

class AdminAttributesComponent extends Component
{
    public function deleteAttribute($attribute_id){
        $product_attribute=ProductAttribute::find($attribute_id);
        $product_attribute->delete();
        session()->flash('message','Attribute has been deleted successfully');
    }
    public function render()
    {
        $product_attributes=ProductAttribute::paginate(10);
        return view('livewire.admin.admin-attributes-component',['product_attributes'=>$product_attributes])->layout('layouts.base');
    }
}
