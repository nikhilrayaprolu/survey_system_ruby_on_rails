class AddOption4fToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :option4, :string
  end
end
