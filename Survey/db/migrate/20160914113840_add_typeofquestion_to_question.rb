class AddTypeofquestionToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :typeofquestion, :string
  end
end
