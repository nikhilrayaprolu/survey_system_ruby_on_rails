class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :question_id
      t.string :user_id
      t.string :option
      t.string :textbox

      t.timestamps null: false
    end
  end
end
