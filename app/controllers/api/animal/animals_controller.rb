class Api::Animal::AnimalsController < ApplicationController
  def index
    animals = Animal.all.order(created_at: :desc)
    render json: animals
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
      render json: animal.errors
    end
  end

  def destroy
    animal&.destroy
    render json: { message: 'animal deleted!' }
  end

  def update
    animal.update!(animal_params)

    if animal
      render json: animal
    else
      render json: animal.errors
    end
  end

  private

  def animal_params
    params.permit(:name, :birth, :species, :breed)
  end

  def animal
    @animal ||= Animal.find(params[:id])
  end
end
