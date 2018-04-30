class AddLastSectionToPostings < ActiveRecord::Migration[5.2]
  def change
    add_column :postings, :radio_last_section, :string
    add_column :postings, :last_section, :text
    add_column :postings, :last_section_name, :string
  end
end
