require "spec_helper"


describe CalendarsController do

  describe "#index" do
    it "renders the home page successfully" do
      get :index
      expect(response.code).to eql "200"
    end
  end

  describe "#show" do

    context "when not logged in" do
      before do
        controller.stub(:logged_in?).and_return(false)
      end

      it "redirects to the home page" do
        get :show, id: 1
        expect(response).to redirect_to "/"
      end
    end

    context "when logged in" do
      before do
        controller.stub(:logged_in?).and_return(true)
      end

      it "renders the calendar show page" do
        get :show, id: 1
        expect(response.body).to render_template :show
      end
    end
    
  end
  
end