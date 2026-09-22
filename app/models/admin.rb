class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, :full_name, presence: true

  def self.from_omniauth(auth)
    email = auth.info.email.to_s.downcase.presence
    admin = find_or_initialize_by(email: email)
    admin.uid = auth.uid
    admin.full_name = auth.info.name.presence || email
    admin.avatar_url = auth.info.image
    admin.save!
    admin
  end
end
