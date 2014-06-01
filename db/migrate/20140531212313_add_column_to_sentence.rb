class AddColumnToSentence < ActiveRecord::Migration
  def change
    add_column :sentences, :is_left, :boolean
  end
end
