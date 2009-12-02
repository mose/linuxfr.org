class CreateParagraphs < ActiveRecord::Migration
  def self.up
    create_table :paragraphs do |t|
      t.references :news, :null => false
      t.integer :position
      t.boolean :second_part
      t.text :body
      t.text :wiki_body
    end
    add_index :paragraphs, [:news_id, :second_part, :position]
  end

  def self.down
    drop_table :paragraphs
  end
end
