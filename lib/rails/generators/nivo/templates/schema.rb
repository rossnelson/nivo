ActiveRecord::Schema.define(:version => 0) do
  create_table :sliders, :force => true do |t|
    t.string :caption
    t.string :url
    t.boolean :active
    t.integer :position
    t.string :image_file_name
    t.string :image_content_type
    t.integer :image_file_size
    t.datetime :image_updated_at
    t.timestamps
  end
end
