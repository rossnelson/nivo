class CreateNivoTables < ActiveRecord::Migration
  def self.up
    SCHEMA_AUTO_INSERTED_HERE
    CmsMenuItem.create({:title =>"Sliders", :controller_name => "sliders", :url => "/sliders"})
  end

  def self.down
    drop_table :sliders
    item = CmsMenuItem.find_by_title("Sliders")
    item.destroy
  end
end
