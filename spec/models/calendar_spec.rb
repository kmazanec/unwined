require "spec_helper"

describe Calendar do

  describe "Validations and Associations" do

    it { should have_many(:users) }
    it { should have_many(:days) }

  end

end
