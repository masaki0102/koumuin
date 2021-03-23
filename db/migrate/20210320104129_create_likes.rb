class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :exam,  foerign_key: true
      t.references :user,  foerign_key: true
      t.timestamps
    end
  end
end
