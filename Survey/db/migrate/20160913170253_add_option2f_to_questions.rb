class AddOption2fToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :option2, :string
  end
end
