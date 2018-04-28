json.extract! posting, :id, :company_name, :position_name, :link, :summary, :summary_name, :qualifications, :qualifications_name, :duties, :duties_name, :created_at, :updated_at
json.url posting_url(posting, format: :json)
