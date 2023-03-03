# this is correcting a mistake because we did not add the coloumn for age

class AddAgeToUsers < ActiveRecord::Migration[7.0]
  def change
    # method :table name, :column_name, :data_type, constraints
    add_column :users, :age, :integer, null: false
                                      # (this means it is required)
  end
end
