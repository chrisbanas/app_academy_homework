# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  age        :integer          not null
#
class User < ApplicationRecord
    validates :username, :email, presence: true, uniqueness: true


    # this has a corrosponding belongs to on the chrip class
    has_many :chirps, # < this is the name of the method that we are making
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Chirp

    has_many :likes,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like,
        dependent: :destory


    # go through an association you already have. Like doing a sql join.

    has_many :liked_chirps,
    through: :likes, # < we are joining on this
    source: :chirp

end

# chris = User.new(username: "chris", email: "chris@gmail.com")

# .new will just create an instance but not save it to the database.
# .save / .save! this is when the validations will run
