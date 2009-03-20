class CreateQuips < ActiveRecord::Migration
  def self.up
    create_table :quips do |t|
      t.column :text, :string
    end
    q = Quip.new
    q.text = 'Add some quips!'
    q.save
  end

  def self.down
    drop_table :quips
  end
end
