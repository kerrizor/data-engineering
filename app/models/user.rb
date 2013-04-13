class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def self.find_for_github(access_token, signed_in_resource = nil)
  data = access_token.info
  user = User.where(:email => data["email"]).first

  unless user
    user = User.create(
             name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
        )
  end

  user
  end

end
