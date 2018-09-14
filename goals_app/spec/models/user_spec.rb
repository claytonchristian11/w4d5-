require 'rails_helper'
require 'user.rb'

RSpec.describe User, type: :model do
  describe "user validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:cheers) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "user associations" do
  end

  describe "user class methods" do
  end

end
