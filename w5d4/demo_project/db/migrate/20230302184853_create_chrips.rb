# t.string can only accept 255 chars when t.text can accept around a million chars


class CreateChrips < ActiveRecord::Migration[7.0]
  def change
    create_table :chrips do |t|
      t.text :body, null: false

      # t.bigint :author_id, null: false

      # (whenever you use references it puts id on for you)

          # t.references :author, null: false, foreign_key:{to_table: :users}

      # :author > the id will be added automatically, constraints, say which table were referencing. If you put "author_id" then you will actually get "author_id_id"

      t.references :user, null: false, foreign_key: true # we did not have to put the block because we referenced user at the start.

      t.timestamps
    end
  end
end
