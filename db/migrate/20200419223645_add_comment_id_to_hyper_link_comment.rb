class AddCommentIdToHyperLinkComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :hyper_link_comments, :comment, null: true, foreign_key: true
  end
end
