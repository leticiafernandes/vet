class Api::Tutor::TutorsController < ApplicationController
  def index
  end

  def create
    tutor = Tutor.create!(tutor_params)

    if tutor
      render json: tutor
    else 
      render json: tutor.errors
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def tutor_params
    params.permit(:name, :identification, :email, :phone)
  end
end
