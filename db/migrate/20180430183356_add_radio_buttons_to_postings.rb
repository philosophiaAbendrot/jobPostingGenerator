class AddRadioButtonsToPostings < ActiveRecord::Migration[5.2]
  def change
    add_column :postings, :radio_summary, :string
    add_column :postings, :radio_duties, :string
    add_column :postings, :radio_qualifications, :string
    add_column :postings, :radio_additional_comments, :string
  end
end
