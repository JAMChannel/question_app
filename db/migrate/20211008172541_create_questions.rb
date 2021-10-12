class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.boolean :solved, default: false
      t.integer :user_id
      t.timestamps
    end
  end
end
