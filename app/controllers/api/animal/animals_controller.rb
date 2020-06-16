class Api::Animal::AnimalsController < ApplicationController
  def index
  end

  def create
    animal = Animal.create!(animal_params)

    if animal
      render json: animal
    else
      render json: animal.errors
    end
  end

  def show
    if animal
      render json: animal
    else
      render animal.errors
    end
  end

  def destroy
  end

  private

  def animal_params
    params.permit(:name, :birth, :species, :breed)
  end

  def animal
    @animal ||= Animal.find(params[:id])
  end
end
