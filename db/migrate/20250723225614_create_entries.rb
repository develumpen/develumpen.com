class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.boolean :draft, null: false, default: false
      t.datetime :published_at
      t.text :body_markdown, null: false
      t.text :body_html, null: false

      t.timestamps
    end
  end
end
