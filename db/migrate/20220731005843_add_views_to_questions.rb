class AddViewsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :views, :integer ,default: ra0
  end
end
