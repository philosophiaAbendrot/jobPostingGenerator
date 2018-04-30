class CreatePostings < ActiveRecord::Migration[5.2]
  def change
    create_table :postings do |t|
      t.string :company_name
      t.string :position_name
      t.text :link
      t.text :summary
      t.string :summary_name
      t.text :qualifications
      t.string :qualifications_name
      t.text :duties
      t.string :duties_name
      t.string :additional_comments_name
      t.text :additional_comments
      t.timestamps
    end
  end
end
