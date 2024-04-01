<div>
    <div class="container" style="padding:30px 0;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-6">
                                Edit Product
                            </div>
                            <div class="col-md-6">
                                <a href="{{route('admin.products')}}" class="btn btn-success pull-right">All Products</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        @if (Session::has('message'))
                            <div class="alert alert-success" role="alert">{{Session::get('message')}}</div>
                        @endif
                        <form class="form-horizontal" enctype="multipart/form-data" wire:submit.prevent="updateProduct">
                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Product Name</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Product Name" class="form-control input-md" wire:model="name" wire:keyup="generateSlug"/>
                                    @error('name') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Product Slug</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Product Slug" class="form-control input-md" wire:model="slug"/>
                                    @error('slug') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Short Description</label>
                                <div class="col-md-4" wire:ignore>
                                    <textarea class="form-control" id="short_description" placeholder="Short Description" wire:model="short_description"></textarea>
                                    @error('short_description') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Description</label>
                                <div class="col-md-4" wire:ignore>
                                    <textarea class="form-control" id="description" placeholder="Description" wire:model="description"></textarea>
                                    @error('description') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Regular Price</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Regular Price" class="form-control input-md" wire:model="regular_price"/>
                                    @error('regular_price') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Sale Price</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Sale Price" class="form-control input-md" wire:model="sale_price"/>
                                    @error('sale_price') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">SKU</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="SKU" class="form-control input-md" wire:model="SKU"/>
                                    @error('SKU') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Stock</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="stock_status">
                                        <option value="instock">InStock</option>
                                        <option value="outofstock">Out of Stock</option>
                                    </select>
                                    @error('stock_status') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Featured</label>
                                {{-- <div class="col-md-4" wire:model="sfeatured"> --}}
                                <div class="col-md-4" wire:model="featured">
                                    <select class="form-control">
                                        <option value="0">No</option>
                                        <option value="1">Yes</option>
                                    </select>
                                    {{-- @error('sfeatured') <p class="text-danger">{{$message}}</p> @enderror --}}
                                    @error('featured') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Quantity</label>
                                <div class="col-md-4">
                                    <input type="text" placeholder="Quantity" class="form-control input-md" wire:model="quantity"/>
                                    @error('quantity') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Product Image</label>
                                <div class="col-md-4">
                                    <input type="file"  class="input-file" wire:model="newimage" />
                                    @if($newimage)
                                        <img src="{{$newimage->temporaryUrl()}}" alt=""width="120"/>
                                    @else
                                        <img src="{{asset('assets/images/products')}}/{{$image}}" alt="" width="120"/> 
                                    @endif
                                    @error('newimage') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Product Gallery</label>
                                <div class="col-md-4">
                                    <input type="file"  class="input-file" wire:model="newimages" multiple/>
                                    @if($newimages)
                                        @foreach($newimages as $newimage)
                                            @if($newimage)
                                                <img src="{{$newimage->temporaryUrl()}}" alt=""width="120"/>    
                                            @endif
                                        @endforeach
                                    @else
                                    
                                    @foreach ($images as $image)
                                        @if($image)
                                            <img src="{{asset('assets/images/products')}}/{{$image}}" alt="" width="120"/>
                                        @endif
                                    @endforeach
                                    @endif
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">class</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="category_id" wire:change="changeSubcategory">
                                        <option disabled="disabled">Select class</option>
                                        @foreach ($categories as $category)
                                        <option value="{{$category->id}}">{{$category->name}}</option>     
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Sub Category</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="subcategory_id">
                                        <option value="0" disabled="disabled">Select Sub Category</option>
                                        @foreach ($subcategories as $subcategory)
                                        <option value="{{$subcategory->id}}">{{$subcategory->name}}</option>     
                                        @endforeach
                                    </select>
                                    @error('subcategory_id') <p class="text-danger">{{$message}}</p> @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label">Product Attributes</label>
                                <div class="col-md-4">
                                    <select class="form-control" wire:model="attribute">
                                        <option value="0" disabled="disabled">Select Attributes</option>
                                        @foreach ($product_attributes as $product_attribute)
                                        <option value="{{$product_attribute->id}}">{{$product_attribute->name}}</option>     
                                        @endforeach
                                    </select>
                                    
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-info" wire:click.prevent="addAttribute">Add</button>
                                </div>
                            </div>
                            @foreach ($inputs as $key => $value)
                                <div class="form-group">
                                    <label for="" class="col-md-4 control-label">{{$product_attribute->where('id',$attribute_array[$key])->first()->name}}</label>
                                    <div class="col-md-4">
                                        <input type="text" placeholder="{{$product_attribute->where('id',$attribute_array[$key])->first()->name}}" class="form-control input-md" wire:model="attribute_values.{{$value}}"/>
                                    </div>
                                    <div class="col-md-1">
                                        <button type="button" class="btn btn-danger btn-sn" wire:click.prevent="removeAttribute({{$key}})">Remove</button>
                                    </div>
                                </div>
                            @endforeach

                            <div class="form-group">
                                <label for="" class="col-md-4 control-label"></label>
                                <div class="col-md-4">
                                    <button type="submit"  class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>

@push('scripts')
    <script>
        $(function(){
            tinymce.init({
                selector:'#short_description',
                branding: false,
                setup:function(editor){
                    editor.on('Change',function(e){
                        tinyMCE.triggerSave();
                        var sd_data=$('#short_description').val();
                        @this.set('short_description',sd_data);
                    });
                }
            })
        });
        $(function(){
            tinymce.init({
                selector:'#description',
                branding: false,
                setup:function(editor){
                    editor.on('Change',function(e){
                        tinyMCE.triggerSave();
                        var d_data=$('#description').val();
                        @this.set('description',d_data);
                    });
                }
            })
        });
    </script>
@endpush
