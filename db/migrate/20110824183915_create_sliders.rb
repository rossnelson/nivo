class CreateSliders < ActiveRecord::Migration
  def self.up
    create_table :sliders do |t|
      t.string :caption
      t.string :url
      t.boolean :active
      t.integer :position
      t.timestamps
    end
  end

  # 

  def self.down
    drop_table :sliders
  end
end
