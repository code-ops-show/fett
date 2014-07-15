json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :price, :currency, :address, :latitude, :longtitude
  json.url job_url(job, format: :json)
end
