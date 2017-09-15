class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:google_oauth2]

  validates :first_name, :last_name, presence: true

  before_validation :generate_verification_code, on: :create

  has_many :rents, dependent: :destroy

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])
    unless user
      user = User.create(
        email: data['email'], password: Devise.friendly_token[0, 20],
        first_name: data['first_name'], last_name: data['last_name']
      )
    end
    user
  end
end
