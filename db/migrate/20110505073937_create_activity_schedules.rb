class CreateActivitySchedules < ActiveRecord::Migration
  def self.up
    create_table :activity_schedules do |t|
      t.references :day
      t.references :activity
      t.string     :time
      t.timestamps
    end
  end

  def self.down
    drop_table :activity_schedules
  end
end

