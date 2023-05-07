class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  #ゲストログイン機能
  def self.guest
  find_or_create_by!(email: 'aaa@aaa.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.password_confirmation = customer.password
    customer.nickname = 'サンプル'
    customer.birthday = '2000-01-01'
   end
  end

end
