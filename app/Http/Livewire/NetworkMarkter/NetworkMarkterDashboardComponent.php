<?php

namespace App\Http\Livewire\NetworkMarkter;

use Livewire\Component;

class NetworkMarkterDashboardComponent extends Component
{
    public function render()
    {
        return view('livewire.network-markter.network-markter-dashboard-component')->layout("layouts.base");
    }
}
