require 'rails_helper'

RSpec.describe Tutor, type: :model do
  let(:tutor) { create(:tutor) }

  it "is valid with attributes" do
    expect(tutor).to be_valid
  end

  it "is not valid without a name" do
    tutor.name = nil
    expect(tutor).to_not be_valid
  end

  it "is not valid without an identification" do
    tutor.identification = nil
    expect(tutor).to_not be_valid
  end

  it "is not valid if identification lenght is higher than 11" do
    tutor.identification = "123456789012"
    expect(tutor).to_not be_valid
  end

  it "is not valid without an email" do
    tutor.email = nil
    expect(tutor).to_not be_valid
  end

  it "is not valid if does not match email regex" do
    tutor.email = 'leticia'
    expect(tutor).to_not be_valid
  end

  it "is not valid without an phone" do
    tutor.phone = nil
    expect(tutor).to_not be_valid
  end

  it "is not valid if phone lenght is higher than 11" do
    tutor.phone = "123456789012"
    expect(tutor).to_not be_valid
  end
end