class User < ApplicationRecord
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end