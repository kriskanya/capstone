class ChangeDatetimeToDate < ActiveRecord::Migration
  def up
    change_table :courses do |t|
      t.change :date, :date
    end
  end

  def down
    change_table :courses do |t|
      t.change :date, :datetime
    end
  end
end
