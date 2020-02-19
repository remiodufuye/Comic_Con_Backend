class FavoritesController < ApplicationController

    def index
        favorites = Favorite.all 
        render json:favorites.to_json(serialized_data)
    end 

  
    def create 
        favorite = Favorite.create(strong_params)
        if favorite.valid? 
            #  render json: favorite.to_json(serialized_data)
            render json: {message: "Movie added to favorites!", favorite: favorite.to_json(serialized_data)}
        else 
            render json: { message: "Movie already added to favorites"}
        end
        # byebug
    end 

    def show
        favorite = Favorite.find(params[:id])
        render json: favorite.to_json(serialized_data)
    end

    def destroy
        favorite = Favorite.find(params[:id])
        favorite.delete
        render json: {message: "Movie removed from favorites"}
    end
  
    private 

    def strong_params 
        params.require(:favorite).permit(:user_id , :movie_id)
    end 

    def serialized_data
        {:except => [:created_at,:updated_at],
            :include => {
                :movie => 
                {
                    :except => [:created_at, :updated_at]
                },
                :user => 
                {
                    :except => [:created_at, :updated_at]
                }
            }}
    end 

end

