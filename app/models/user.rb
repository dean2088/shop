class User < ActiveRecord::Base
    validates_presence_of(:uname,:upwd,:umail,:message=>"can not be empty")
  validates_length_of(:upwd,:within=>6..18, :message=>"too short or too long")
  validates_confirmation_of(:upwd,:umail,:message=>"input not the same")
end
