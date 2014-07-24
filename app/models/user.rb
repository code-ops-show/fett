class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable, 
         :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]
  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email


def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.username = auth.info.nickname
  end
end

def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end
end

def password_required?
  super && provider.blank?
end

def email_required?
  super && provider.blank?
end


end
