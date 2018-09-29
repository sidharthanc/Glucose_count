json.array!(@dosage_forms) do |dosage_form|
  json.extract! dosage_form, :id, :dosage_type
  json.url dosage_form_url(dosage_form, format: :json)
end
