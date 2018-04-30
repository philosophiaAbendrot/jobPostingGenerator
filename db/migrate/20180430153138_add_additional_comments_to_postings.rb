class AddAdditionalCommentsToPostings < ActiveRecord::Migration[5.2]
  def change
    add_column :postings, :additional_comments, :text
  end
end
