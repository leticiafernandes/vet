require "rails_helper"

RSpec.describe Animal, :type => :model do
    before do
        @animal = Animal.new(name: "luna", birth: "2008-07-09", species: "dog", breed: "cocker")
    end

    it "is valid with attributes" do
        expect(@animal).to be_valid
    end

    it "is not valid without a name" do
        @animal.name = nil
        expect(@animal).to_not be_valid
    end

    it "is not valid without a birth" do
        @animal.birth = nil
        expect(@animal).to_not be_valid
    end

    it "is not valid without a species"do
        @animal.species = nil
        expect(@animal).to_not be_valid
    end
    
    it "is not valid without a breed"do
        @animal.breed = nil
        expect(@animal).to_not be_valid
    end
end