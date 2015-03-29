json.array!(@wares) do |ware|
  json.extract! ware, :id, :wname, :wdesc, :wtype, :wfactory, :wprice, :wimg
  json.url ware_url(ware, format: :json)
end
