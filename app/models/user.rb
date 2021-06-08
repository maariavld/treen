class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :reviews
  has_many :brands

  validates :first_name, :last_name, :username, :encrypted_password, presence: true
  validates :username, length: { minimum: 4, too_short: "minimum is %{count} characters" }
  validates :encrypted_password, length: { minimum: 6, too_short: "minimum is %{count} characters" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
