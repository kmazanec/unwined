class User < ActiveRecord::Base

  has_secure_password

  belongs_to :calendar

  after_create :create_calendar

  private

  def create_calendar
    if calendar.nil?
      self.calendar = Calendar.create()
      self.save
    end
  end
    
end