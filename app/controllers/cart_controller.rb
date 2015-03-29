class CartController < ApplicationController
def index
  @tuser=session[:tuser]
  if @tuser!=nil then
  @ware_shop= session[:ware_shopping]
  @ware_cart= Hash.new
  @total=0
  end
  if @ware_shop!=nil then
      @ware_shop.each do |ware_id,amount|
       
        ware=Ware.find(ware_id)
        @ware_cart[ware]=amount
        @total+=ware.wprice*amount
  end
end
end
  
    #将产品放置在购物车上
  def addcart
    #判断用户是否为空
    @tuser=session[:tuser]
    if @tuser!=nil then
    #根据商品ID查询一条信息
    ware=Ware.find(params[:id])
    #判断存入到购物车对象
    if (session[:ware_shopping]==nil) then
    session[:ware_shopping] = Hash.new
  end
      ware_shop= session[:ware_shopping]
      #判断购物车对象中是否存在商品对象 (存在则加数量加1)
      if(ware_shop.has_key?(ware.id.to_s)) then
      ware_shop[ware.id.to_s]= ware_shop[ware.id.to_s]+1
      puts ware_shop[ware.id.to_s]
      else
      ware_shop[ware.id.to_s]=1
    end
    redirect_to :action=>"index"
    else
     redirect_to :action=>"showLogin",:controller=>"users"
  end
end
  
def deleteWare
  id=params[:id]
  @tuser=session[:tuser]
  if @tuser!=nil then
ware=Ware.find(id)
  if(session[:ware_shopping]==nil) then
  session[:ware_shopping]=Hash.new
end
ware_shop=session[:ware_shopping]
#是否含有删除的商品对象
if ware_shop.has_key?(ware.id.to_s) then
ware_shop.delete(ware.id.to_s)
end
redirect_to :action=>"index"
else
  redirect_to :action=>"showLogin",:controller=>"users"
 end
end

def emptyWare
 @tuser=session[:tuser]
 if @tuser!=nil then
 session[:ware_shopping]=nil
redirect_to :action=>"index"
end
end
end
