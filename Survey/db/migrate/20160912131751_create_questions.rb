class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :optioncount
      t.string :options
      t.string :created_at
      t.string :modified_at

      t.timestamps null: false
    end
  end
end
