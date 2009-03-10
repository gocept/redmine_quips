class CreateQuips < ActiveRecord::Migration
  def self.up
    create_table :quips do |t|
      t.column :text, :string
    end
  end

  def self.down
    drop_table :quips
  end
end
