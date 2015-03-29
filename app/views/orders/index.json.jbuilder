json.array!(@orders) do |order|
  json.extract! order, :id, :uname, :uaddress, :upost, :uphone, :uhomephone, :pirce
  json.url order_url(order, format: :json)
end
