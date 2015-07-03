require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Entry, type: :model do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:message) }

  it 'passes validation with name and message' do
    entry = FactoryGirl.build(:entry)
    expect(entry).to be_valid
  end

  it 'fails validation without name' do
    entry = FactoryGirl.build(:entry, name: '')
    expect(entry).to_not be_valid
    expect(entry.errors[:name].size).to eq(1)
    expect(entry.errors[:name]).to include("can't be blank")
  end

  it 'fails validation without message' do
    entry = FactoryGirl.build(:entry, message: '')
    expect(entry).to_not be_valid
    expect(entry.errors[:message].size).to eq(1)
    expect(entry.errors[:message]).to include("can't be blank")
  end

  it 'fails validation without name and message' do
    entry = FactoryGirl.build(:entry, name: '', message: '')
    expect(entry).to_not be_valid
    expect(entry.errors.size).to eq(2)
  end
end
