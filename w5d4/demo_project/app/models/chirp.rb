class Chirp < ApplicationRecord

    # preset validations
    validates :body, presence: true
    validates :user_id, presence: true

    # custom validation to provide custom error messages to the user
    validate :body_too_long


    # when a table has a foreign_key you write a belongs to.
    # primary key is always id
    # AFTER writing you belongs to. WRITE THE CORRESPONDING has_many in the class_name

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User


    has_many :likes,
    primary_key: :id,
    foreign_key: :chirp_id,
    class_name: :like,
    dependent: :destroy # when the chirp is destoryed you delete all the like
    # when the chirp is deleted so are the likes.



end



def body_too_long
    if body && body.length > 10
        errors.add(:body, "too long")
    end
end
