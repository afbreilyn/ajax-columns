class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
    	t.string :body
    	
      t.timestamps
    end
  end
end
