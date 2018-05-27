class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :get_products]

  # Route: '/'
  def index
    ap 2.hours.from_now.strftime("%Y-%m-%d %H:%M:%S")
  end

  # Display all products into index page
  # used by service 'products_data'
  # Route: '/products'
  # format json
  def get_products
    data = []
    products = Product.all
    products.each do |p|
      liked = false
      # get all products liked by the current user
      if current_user
        favorite = Favorite.find_by_user_id_and_product_id(current_user.id, p.id)
        if favorite
          liked = true
        end
        display = Visbility.find_by_user_id_and_product_id(current_user.id, p.id)
        if (display) && (Time.now.to_i < display.date_display.to_i)
          liked = true
        end
      end

      data.push({
        id: p.id,
        name: p.libelle,
        price: p.price,
        latitude: p.latitude,
        longitude: p.longitude,
        like: liked,
        created: p.created_at
      })
    end
    render json: data
  end

  # After cliked on like button
  # used by service 'products_data'
  # Route: '/products/update/:id/:type'
  # format json
  def update_products
    if request.params[:id].blank? || request.params[:type].blank?
      render json: {"response" => "Bad Response"}
      return
    end

    if request.params[:type] == 'like'
      begin
        Favorite.create!([user_id: current_user.id, product_id: request.params[:id]])
      rescue => e
        render json: {"response" => "Bad Response"}
        ap "An error occured: #{e}"
        return
      end
    end

    if request.params[:type] == 'dislike'
      begin
        date_display = 2.hours.from_now.strftime("%Y-%m-%d %H:%M:%S")
        Visbility.create!([user_id: current_user.id, product_id: request.params[:id], date_display: date_display])
      rescue => e
        render json: {"response" => "Bad Response"}
        ap "An error occured: #{e}"
        return
      end
    end

    if request.params[:type] == 'remove'
      favorite = Favorite.find_by_user_id_and_product_id(current_user.id, request.params[:id])
      favorite.destroy
    end
    render json: {"response" => "success Response"}
    return
  end

  # Route: '/favorites'
  def favorites

  end

  # Display all favorites products into preferred shops page
  # used by service 'products_data'
  # Route: '/products/favorites'
  # format json
  def favorite_products
    data = []
    favorites = Favorite.where(user_id: current_user.id)
    favorites.each do |f|
      p = Product.find_by_id(f.product_id)
      data.push({
        id: p.id,
        name: p.libelle,
        price: p.price,
        latitude: p.latitude,
        longitude: p.longitude,
        like: true,
        created: p.created_at
      })
    end
    render json: data
  end

end
