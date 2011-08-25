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

  # CmsMenuItem.create({:title =>"Sliders", :controller_name => "sliders", :url => "/sliders"})

  def self.down
    drop_table :sliders
  end
end
