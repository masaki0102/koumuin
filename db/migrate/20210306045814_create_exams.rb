class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.integer    :category_id,  null: false
      t.date       :date, null: false
      t.integer    :age,  null: false
      t.references :government,  foerign_key: true
      t.timestamps
    end
  end
end
