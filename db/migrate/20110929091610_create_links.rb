class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :hashed, :case_sensitive => true
      t.string :original

      t.timestamps
    end
  end
end
