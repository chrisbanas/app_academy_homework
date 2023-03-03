class Like < ApplicationRecord
    validates :chirp_id, uniqueness: {scope: :liker_id}


    # when you have a belongs to, it auto makes a presence true validation

    belongs_to :chirp,
        primary_key: :id,
        foreign_key: :chirp_id,
        class_name: :Chirp

    belongs_to :liker
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :User

end
