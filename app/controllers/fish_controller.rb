class FishController < ApplicationController
    def index
      # byebug
        if params[:search]
            @fish = Fish.where("species_name LIKE ?", "%#{params[:search]}%")
            render json: @fish
          else
            @fish = Fish.all 
            render json: @fish
          end
    end

    def show
        @fish = Fish.find(params[:id])
        if @fish
           render json: @fish
        else
            render json: {message:"We couldn't find a fish with that id"}
        end
    end

    def create
        @fish = Fish.new(
            species_name: params[:species_name],
            scientific_name: params[:scientific_name],
            habitat: params[:habitat],
            location: params[:location],
            species_illustration_photo: params[:species_illustration_photo]
        )
        if @fish.save
            redirect_to `http://localhost:3001/`
        else 
            render status: 422
        end
    end

    def update 
        if @fish.update(
            species_name: params[:species_name],
            scientific_name: params[:scientific_name],
            habitat: params[:habitat],
            location: params[:location],
            species_illustration_photo: params[:species_illustration_photo]
          )
          render json: @fish 
        else
          render status: 422
        end
    end

    def destroy
        @fish = Fish.find(params[:id])
        if @fish.destroy 
          redirect_to action: "index"
        else
          render status: 422
        end
    end
end
