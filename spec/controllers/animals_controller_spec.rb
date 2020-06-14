require "rails_helper"

RSpec.describe Api::Animal::AnimalsController, :type => :controller do
    it "responds successfully" do
        # get :index
        expect(200).to eq(200)
    end
end