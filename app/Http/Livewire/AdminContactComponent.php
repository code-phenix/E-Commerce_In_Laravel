<?php

namespace App\Http\Livewire;

use Livewire\Component;

class AdminContactComponent extends Component
{
    public function render()
    {
        return view('livewire.admin.admin-contact-component')->layout('layouts.base');
    }
}
