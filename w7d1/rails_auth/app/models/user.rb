# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :password_cannot_be_blank


    def password_cannot_be_blank
        if password_digest.empty?
            errors.add(:password_digest, "Password can't be blank")
        end
    end

end
