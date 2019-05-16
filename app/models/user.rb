class User < ApplicationRecord
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    find_by(email: email, password: password)
  end
end