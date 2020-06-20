class Api::Tutor::TutorsController < ApplicationController
  def index
    tutors = Tutor.all.order(created_at: :desc)
    render json: tutors
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
    if tutor 
      render json: tutor
    else 
      render json: tutor.errors
    end
  end

  def destroy
    tutor&.destroy
    render json: { message: 'tutor deleted!' }
  end

  def update
    tutor.update!(tutor_params)

    if tutor
      render json: tutor
    else
      render json: tutor.errors
    end
  end

  private

  def tutor_params
    params.permit(:name, :identification, :email, :phone)
  end

  def tutor
    @tutor ||= Tutor.find(params[:id])
  end
end
