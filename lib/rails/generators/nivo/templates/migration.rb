class CreateNivoTables < ActiveRecord::Migration
  def self.up
    SCHEMA_AUTO_INSERTED_HERE
    CmsMenuItem.create({:title =>"Slides", :controller_name => "nivo/slides", :url => "/nivo/slides"})
  end

  def self.down
    drop_table :slides
    item = CmsMenuItem.find_by_title("Slides")
    item.destroy
  end
end
