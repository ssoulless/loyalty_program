json.array!(@stores) do |store|
  json.extract! store, :id, :name, :type, :address, :phone, :description
  json.url store_url(store, format: :json)
end
