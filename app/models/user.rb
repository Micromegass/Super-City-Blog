# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(100)
#  password_digest :string
#  name            :string(100)
#  username        :string(100)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_secure_password validations: false

    validates :email, uniqueness: true, format: /@/
    validates :password, presence: true, on: :create
    validates :password, length: { in: 6..20 }, allow_nil: true
    validates :name, presence: true
    validates :username, presence: true

end
