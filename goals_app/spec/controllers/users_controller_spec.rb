require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) do
    User.create!(
    username: Faker::GreekPhilosophers.name,
    password: 'nottobe'
    )
  end


  describe "POST #new" do
    it "renders the new users template" do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    it "makes a new user and saves DB" do
      post :create, params: { user: { username: 'spiderman', password: 'maryjane' } }
      user = User.find_by(username: 'spiderman')
      expect(user.username).to eq('spiderman')
    end
  end


end
