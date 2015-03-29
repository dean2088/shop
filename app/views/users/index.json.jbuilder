json.array!(@users) do |user|
  json.extract! user, :id, :uname, :upwd, :umail, :uphone, :uaddress, :uimpower
  json.url user_url(user, format: :json)
end
