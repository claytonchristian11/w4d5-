require 'rails_helper'
require 'user.rb'

RSpec.describe User, type: :model do
  subject(:user) do

    User.create!(
    username: Faker::GreekPhilosophers.name,
    password: 'nottobe'
    )

  end

  describe "user validations" do
    it { should validate_presence_of(:username) }

    it { should validate_presence_of(:password_digest) }

    it { should validate_presence_of(:cheers) }

    it { should validate_length_of(:password).is_at_least(6) }

  end

  describe "user associations" do
  end

  describe "user instance method" do

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "goalie", password: "roflcopter")
    end

    it "does not store password into DB" do
      user1 = User.find_by(password_digest: 'nottobe')
      expect(user1).to be_nil
    end

    it "resets_session_token when called" do
      current_token = user.session_token
      next_token = user.resets_session_token

      expect(current_token).not_to eq(next_token)
    end

    it "gives a session_token to user if none" do
      user.session_token = nil
      user.ensure_session_token
      expect(user.session_token).not_to be_nil
    end

  end

end
