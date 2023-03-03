class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # t.integer :liker_id, null: false
      # t.integer :chirp_id, null: false

      t.references :chirp, null: false, foreign_key: true
      # this can also be written as
      # t.references :user, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      # this makes it so that the user can like mulitple posts but not the same post twice
      t.index [:chirp_id, :user_id], unique: true

      t.timestamps
    end
  end
end
