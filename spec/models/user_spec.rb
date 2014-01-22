require "spec_helper"

describe User do

  describe "Validations and Associations" do

    it { should belong_to(:calendar) }

  end

end
