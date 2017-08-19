class CreateTaskRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :task_relationships do |t|
      t.integer :task_id
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
