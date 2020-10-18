require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first_name presence' do
      user = User.new(last_name: "Shah", email: "tshah@gmail.com", password: "GRAPES")
      expect(user.valid?).to eq(false)
    end

    it 'ensures last_name presence' do
      user = User.new(first_name: "Taimur", email: "tshah@gmail.com", password: "GRAPES")
      expect(user.valid?).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(first_name: "Taimur", last_name: "Shah", password: "GRAPES")
      expect(user.valid?).to eq(false)
      end

    it 'ensures password presence' do
      user = User.new(first_name: "Taimur", last_name: "Shah", email: "tshah@gmail.com")
      expect(user.valid?).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(first_name: "Taimur", last_name: "Shah", email: "tshah@gmail.com", password: "GRAPES")
      expect(user.valid?).to eq(true)
    end
  end

  context 'scope tests' do

  end

end
