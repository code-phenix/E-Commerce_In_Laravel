<?php

namespace App\Http\Livewire\Admin;

use App\Models\ProductAttribute;
use Livewire\Component;

class AdminAddAttributesComponent extends Component
{
    public $name;

    public function updated($fields){
        $this->validateOnly($fields,[
            'name' =>"required"
        ]);
    }

    public function storeAttribute(){
        $this->validate([
            'name' =>"required"
        ]);
        $product_attribute =new ProductAttribute();
        $product_attribute->name=$this->name;
        $product_attribute->save();
        session()->flash('message','Attribute has been created successfully!..');
    }
    public function render()
    {
        return view('livewire.admin.admin-add-attributes-component')->layout('layouts.base');
    }
}
