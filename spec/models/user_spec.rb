require "spec_helper"

describe User do

  describe "Validations and Associations" do

    it { should belong_to(:calendar) }

  end

  describe "#create_calendar" do
    let(:user_data) do
      {
        name: "Keith Mazanec",
        email: "k.mazanec@gmail.com",
        password: "password",
        password_confirmation: "password"
      }
    end

    it "creates a calendar if the user does not have one already" do
      expect(User.create(user_data).calendar).to be_a Calendar 
    end

  end

end
