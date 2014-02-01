require "spec_helper"

describe UsersController do
  describe "#new" do
    it "returns the new user creation form successfully" do
      get :new
      expect(response.code).to eq "200"
    end
  end

  describe "#create" do
    let(:user_params) do
      {
        user: 
        {
          name: "Keith Mazanec",
          email: "k.mazanec@gmail.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    it "redirects to another place upon creation" do
      post :create, user_params
      expect(response.code).to eq "302"
    end

    it "creates a new user from params passed in" do
      expect{ post :create, user_params }.to change{ User.all.length }
    end

    it "sets the current user" do
      post :create, user_params
      expect(controller.current_user.email).to eq user_params[:user][:email]
    end

  end

end