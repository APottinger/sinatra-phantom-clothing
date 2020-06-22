class ProductsController < ApplicationController
  
  #Create
    get "/products/new" do
      authenticate
      erb :'products/new'
    end

    post '/products' do
      authenticate
      @product = Product.create(item: params[:item], price: params[:price], brand: params[:brand], user: current_user)
      redirect '/products'
    end


  #Read
    get '/products' do
      authenticate
      @products = current_user.products
      #binding.pry
      erb :'/products/index'
    end

    get '/products/:id' do
      authenticate
      @product = Product.find(params[:id])
      erb :'/products/show'
    end
    #establish the user link route to this page


  #Update
    get '/products/:id/edit' do
      authenticate
      @product = Product.find(params[:id])
      authorize(@authorize)
      erb :'/products/edit'
    end
    
    patch '/products/:id' do
      @product = Product.find(params[:id])
      authorize(@authorize)
      @product.update(
        item: params[:item], 
        price: params[:price], 
        brand: params[:brand]
      )
      redirect '/products/#{@product.id}'
    end


    #Delete
    delete 'products/:id' do
      p = Product.find(params[:id])
      authorize(p)
      p.destroy
      redirect '/products'
    end
    
end 