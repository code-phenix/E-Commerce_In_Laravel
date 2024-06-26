<?php

namespace App\Http\Livewire\Admin;

use App\Models\HomeSlider;
use Livewire\Component;

class AdminHomeSliderComponent extends Component
{
    public function deleteSlide($slide_id){
        $slider=HomeSlider::find($slide_id);
        $slider->delete();
        session()->flash('message','Slider has been deleted successfully!');
    }
    public function render()
    {
        $slider=HomeSlider::all();
        return view('livewire.admin.admin-home-slider-component',['sliders'=>$slider])->layout("layouts.base");
    }
}
