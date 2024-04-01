<?php

namespace App\Http\Livewire\Supplier;

use Livewire\Component;

class SupplierDashboardComponent extends Component
{
    public function render()
    {
        return view('livewire.supplier.supplier-dashboard-component')->layout("layouts.base");
    }
}
