class AddCommentIdToImageComment < ActiveRecord::Migration[6.0]
  def change
    add_reference :image_comments, :comment, null: true, foreign_key: true
  end
end
