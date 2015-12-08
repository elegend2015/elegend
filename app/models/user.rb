class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  has_many :genres
  has_many :titles
  has_many :cplayers
  has_many :consoles
  has_many :channels
  acts_as_taggable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]
  
  #after_create :send_mail
  mount_uploader :profile_pic, ProfileUploader
  
  # def send_mail
  #   UserMailer.registration_email(self).deliver
  # end

    def self.all_except(user)
  		where.not(id: user)
	  end


    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        #user.name = auth.info.name   # assuming the user model has a name
        #user.image = auth.info.image # assuming the user model has an image
      end
    end

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end



 end

