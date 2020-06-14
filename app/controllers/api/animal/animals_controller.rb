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
  end

  def destroy
  end

  private

  def animal_params
    params.permit(:name, :birth, :species, :breed)
  end
end
