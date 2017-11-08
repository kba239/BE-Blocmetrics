class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :registered_apps

  # after_create :send_welcome

  # def send_welcome
  #   WelcomeMailer.send_welcome(self).deliver_now
  # end

end
