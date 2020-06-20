require 'rails_helper'
require 'date'

RSpec.describe Api::Animal::AnimalsController, type: :controller do
    let(:animal) { create(:animal) }
    let(:attrs_animal) { attributes_for(:animal) }

    def get_value_from_json(key)
        JSON.parse(response.body)[key]
    end

    describe "GET #index" do
        it "find all animals" do
            get :index
            expect(response.body).to_not be_empty
            expect(response).to have_http_status(:ok)
        end
    end

    describe "POST #create" do 
        it "create animal successfully with valid attributes" do
            post :create, params: attrs_animal
            expect(response.body).to_not be_empty
            expect(response).to have_http_status(:ok)
        end

        it "throw error with invalid name" do
            attrs_animal[:name] = nil
            expect { post :create, params: attrs_animal }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it "throw error with invalid birth" do
            attrs_animal[:birth] = nil
            expect { post :create, params: attrs_animal }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it "throw error with invalid species" do
            attrs_animal[:species] = nil
            expect { post :create, params: attrs_animal }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it "throw error with invalid breed" do
            attrs_animal[:breed] = nil
            expect { post :create, params: attrs_animal }.to raise_error(ActiveRecord::RecordInvalid)
        end
    end

    describe "GET #show" do
        it "find existing animal with success" do
            get :show, params: { id: animal.id }
            expect(response.body).not_to be_empty
        end

        it "throw error when animal doesnt exist" do
            animal.id = -1
            expect { get :show, params: { id: animal.id } }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

    describe "DELETE #destroy" do
        it "destroy existing animal" do
            delete :destroy, params: { id: animal.id }
            expect(response.body).to eq('{"message":"animal deleted!"}')
        end

        it "throw error when animal doesnt exist" do
            animal.id = -1
            expect { delete :destroy, params: { id: animal.id } }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

    describe "PUT #update" do
        it "update animal name with success" do
            put :update, params: { id: animal.id, name: "luna fernandes" }
            expect(get_value_from_json("name")).to_not eql(animal.name)
        end

        it "update animal birth with success" do
            put :update, params: { id: animal.id, birth: "2006-07-09" }
            updated_birth = Date.parse(get_value_from_json("birth"))
            expect(updated_birth).to_not eql(animal.birth)
        end

        it "update animal species with success" do
            put :update, params: { id: animal.id, species: "doggo" }
            expect(get_value_from_json("species")).to_not eql(animal.species)
        end

        it "update animal breed with success" do
            put :update, params: { id: animal.id, breed: "cocker spainel" }
            expect(get_value_from_json("breed")).to_not eql(animal.breed)
        end
    end
end