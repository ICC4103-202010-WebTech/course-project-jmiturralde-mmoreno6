class CreateHyperLinkComments < ActiveRecord::Migration[6.0]
  def change
    create_table :hyper_link_comments do |t|
      t.string :hyperlink

      t.timestamps
    end
  end
end
