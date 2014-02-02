require "spec_helper"

describe SessionsController do
  
  describe "#new" do
    before do
      get :new
    end

    it "responds successfully" do
      expect(response.code).to eql "200"
    end

    it "renders the login page" do
      expect(response.body).to render_template "new"
    end
  end

  describe "#create" do
    let(:user) { FactoryGirl.create(:user, password: "password") }

    context "valid attributes" do
      let(:valid_user_info) { { email: user.email, password: "password" } }

      before do
        post :create, valid_user_info
      end

      it "sets the current user" do
        expect(controller.current_user.email).to eql user.email
      end

      it "redirects to the user's calendar" do
        expect(response).to redirect_to calendar_path(user.calendar)
      end
    end

    context "invalid attributes" do
      let(:invalid_user_info) { { email: user.email, password: "INVALID_PASSWORD" } }

      before do
        post :create, invalid_user_info
      end

      it "renders the login page again" do
        expect(response.body).to render_template "new"
      end

      it "sends the errors in a flash notice" do
        expect(flash[:error]).to eql "Incorrect Email or Password"
      end
    end
  end

  describe "#destroy" do
    let(:user) { FactoryGirl.create(:user, password: "password") }

    before do
      post :create, email: user.email, password: "password"
      delete :destroy
    end

    it "sets the session user id to nil" do
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the login page" do
      expect(response).to redirect_to login_path
    end
  end
end