require 'rails_helper'

RSpec.describe Api::Animal::AnimalsController, :type => :controller do
    describe "POST create" do 
        it "create animal successfully with valid attributes" do
            attrs = attributes_for(:animal)
            post :create, params: attrs
            expect(response).to have_http_status(:ok)
        end

        it "throw error with invalid name" do
            animal = attributes_for(:animal, name: nil)
            expect { post :create, params: animal }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it "throw error with invalid birth" do
            animal = attributes_for(:animal, birth: nil)
            expect { post :create, params: animal }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it "throw error with invalid species" do
            animal = attributes_for(:animal, species: nil)
            expect { post :create, params: animal }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it "throw error with invalid breed" do
            animal = attributes_for(:animal, breed: nil)
            expect { post :create, params: animal }.to raise_error(ActiveRecord::RecordInvalid)
        end
    end

    describe "GET requests" do
        it "find existing animal with success" do
            animal = create(:animal)
            get :show, params: { id: animal.id }
            expect(response.body).not_to be_empty
        end

        it "throw error when animal doesnt exist" do
            expect { get :show, params: { id: -1 } }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
end