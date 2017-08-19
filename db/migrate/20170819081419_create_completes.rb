class CreateCompletes < ActiveRecord::Migration[5.0]
  def change
    create_table :completes do |t|
      t.integer :user_id
      t.integer :task_id
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
