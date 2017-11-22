class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  # SYNTAXE: before_action :ensure_permission, only: [ :edit, :update ]

  # donne l'instruction de jouer la méthode privée set_restaurant avec toutes les autres
  # uniquement pour les actions présentes entre []

  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    # commenté car plus nécessaire, on le fait avec set_restaurant now
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # si true
      redirect_to restaurants_path
    else # si le restaurant n'est pas sauvable car invalide (cf validators présents dans le model de Restaurant)
      render :new
      # render permet de conserver le contenu renseigné par l'utilisateur dans le form
      # et on le redirige vers la view new.html.erb
    end
  end


private

def restaurant_params
  # SYNTAXE: permitted = params.require(:person).permit(:name, :age)
  params.require(:restaurant).permit(:name, :address, :phone_number, :category)
end

def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end

end
