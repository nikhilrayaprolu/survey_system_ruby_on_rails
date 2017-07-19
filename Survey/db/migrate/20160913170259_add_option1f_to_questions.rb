class AddOption1fToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :option1, :string
  end
end
