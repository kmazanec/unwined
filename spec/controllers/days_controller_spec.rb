require "spec_helper"

describe DaysController do

  describe "#show" do
    let(:current_user) { FactoryGirl.create(:user) }
    let(:day) { FactoryGirl.create(:day) }

    before do
      get :show, day, current_user
    end

    it "responds successfully" do
      expect(response.code).to eql "200"
    end

    it "renders the days show page for that user" do

    end
  end

end