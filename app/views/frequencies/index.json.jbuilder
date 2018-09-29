json.array!(@frequencies) do |frequency|
  json.extract! frequency, :id, :description
  json.url frequency_url(frequency, format: :json)
end
