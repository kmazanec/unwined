require "spec_helper"

describe DaysController do

  describe "#show" do
    let(:current_user) { FactoryGirl.create(:user) }
    let(:day) { FactoryGirl.create(:day) }

    context "user logged in" do

      before do
        controller.stub(:logged_in?).and_return(true)
        get :show, user_id: current_user.id, id: day.id
      end

      it "responds successfully" do
        expect(response.code).to eql "200"
      end

      it "renders the days show page" do
        expect(response.body).to render_template "show"
      end

      it "renders the page for the correct user and day" do
        expect(request.path_info).to eql "/users/#{current_user.id}/days/#{day.id}"
      end
    end

    context "user not logged in" do
      before do
        controller.stub(:logged_in?).and_return(false)
        get :show, user_id: current_user.id, id: day.id
      end

      it "redirects to the login page" do
        expect(response).to redirect_to login_path
      end
    end
  end

end