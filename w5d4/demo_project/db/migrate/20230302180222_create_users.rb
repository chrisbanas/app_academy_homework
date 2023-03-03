# we don't have to make id's as postgress will do that for us

# this is creating the table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t| # > t is just a variable and it is like a coloumn
    # t.data type | :column_name | constraints: true / false
      t.string :username, null: false
      t.string :email, null: false
      
      t.timestamps
    end
    # anytime you make something unique you want to put an index on it.
    # emails and usernames are unique so that is why you want to set them as unique, but users can have the same password so you wouldn't want to index that.

    # method  :table  :column    constraint:
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
