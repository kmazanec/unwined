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
      
    end

    context "when logged in" do
      
    end
    
  end
  
end