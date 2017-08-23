class AddFriendlyIdToCourses < ActiveRecord::Migration[5.0]

  def change
    add_column :courses, :friendly_id, :string
    add_index :courses, :friendly_id, :unique => true

    Course.find_each do |c|
      c.update(:friendly_id => SecureRandom.uuid)
    end
  end
  
end
