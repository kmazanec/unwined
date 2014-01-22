class Calendar < ActiveRecord::Base

  has_many :users
  has_many :days, dependent: :destroy

end