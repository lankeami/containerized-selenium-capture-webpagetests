class CreateWpts < ActiveRecord::Migration[5.1]
  def change
    create_table :wpts do |t|
      t.references :url, foreign_key: true
      t.decimal :load_t
      t.decimal :first_byte_t
      t.decimal :dom_interactive_t
      t.decimal :document_complete_t
      t.integer :request_count
      t.decimal :speed_index
      t.text :ref

      t.timestamps
    end
  end
end
