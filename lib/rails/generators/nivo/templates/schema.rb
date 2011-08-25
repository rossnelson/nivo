ActiveRecord::Schema.define(:version => 0) do
  create_table :sliders, :force => true do |t|
    t.string :caption
    t.string :url
    t.boolean :active
    t.integer :position
    t.timestamps
  end
end
