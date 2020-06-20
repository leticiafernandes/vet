require 'rails_helper'
require 'utils'

RSpec.describe Api::Tutor::TutorsController, type: :controller do
  let(:tutor) { create(:tutor) }
  let(:attrs_tutor) { attributes_for(:tutor) }

  describe "GET #index" do
    it "find all tutors" do
      get :index
      expect(response.body).to_not be_empty
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it "create tutor successfully with valid attributes" do
      post :create, params: attrs_tutor
      expect(response.body).to_not be_empty
      expect(response).to have_http_status(:ok)
    end

    it "throw error with invalid name" do
      attrs_tutor[:name] = nil
      expect { post :create, params: attrs_tutor }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "throw error with invalid identification" do
      attrs_tutor[:identification] = nil
      expect { post :create, params: attrs_tutor }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "throw error with invalid email" do
      attrs_tutor[:email] = nil
      expect { post :create, params: attrs_tutor }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "throw error with invalid phone" do
      attrs_tutor[:phone] = nil
      expect { post :create, params: attrs_tutor }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "GET #show" do
    it "find existing tutor with success" do
      get :show, params: { id: tutor.id }
      expect(response.body).not_to be_empty
    end

    it "throw error when tutor does not exist" do
      tutor.id = -1
      expect { get :show, params: { id: tutor.id } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "DELETE #destroy" do
    it "destroy existing tutor" do
      delete :destroy, params: { id: tutor.id }
      expect(response.body).to eq('{"message":"tutor deleted!"}')
    end

    it "throw error when tutor doesnt exist" do
      tutor.id = -1
      expect { delete :destroy, params: { id: tutor.id } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "PUT #update" do
    it "update tutor name with success" do
      put :update, params: { id: tutor.id, name: "new name" }
      expect(get_value_from_json("name")).to_not eql(tutor.name)
    end

    it "update tutor identification with success" do
      put :update, params: { id: tutor.id, identification: "99999999999" }
      expect(get_value_from_json("identification")).to_not eql(tutor.identification)
    end

    it "update tutor email with success" do
      put :update, params: { id: tutor.id, email: "emailchange@email.com" }
      expect(get_value_from_json("email")).to_not eql(tutor.email)
    end

    it "update tutor phone with success" do
      put :update, params: { id: tutor.id, phone: "0088887777" }
      expect(get_value_from_json("phone")).to_not eq(tutor.phone)
    end
  end
end
