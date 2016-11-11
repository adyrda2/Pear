class User < ActiveRecord::Base
  has_many :memberships
  has_many :rooms, through: :memberships
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.image    = auth.info.image.sub("_normal", "")
      user.save
    end
  end
end
