class CreatePdfEventPages < ActiveRecord::Migration[6.0]
  def change
    create_table :pdf_event_pages do |t|
      t.string :pdf

      t.timestamps
    end
  end
end
