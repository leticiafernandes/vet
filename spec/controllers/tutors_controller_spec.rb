require 'rails_helper'

RSpec.describe Api::Tutor::TutorsController, type: :controller do
  let(:tutor) { create(:tutor) }
  let(:attrs_tutor) { attributes_for(:tutor) }

  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/api/tutor/tutors/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

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

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/api/tutor/tutors/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/api/tutor/tutors/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/api/tutor/tutors/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
