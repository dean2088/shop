class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        session[:tuser]=@user.uname
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def showLogin
    render :action=>'showLogin', :layout=>"user"
  end
  
  def login
    uname=params[:user][:name]
    upwd=params[:user][:pass]
    session[:tuser]=nil;
    user = User.find_by_uname_and_upwd(uname,upwd)
    if user
      session[:tuser]=uname
      @tuser=session[:tuser]
      redirect_to :action=>"index",:controller=>'wares'
    else
      session[:tuser]=nil
      flash[:notice]='error'
      redirect_to :action=>'showLogin'
    end 
  end
  
   def checkname
   names = User.find_by_uname(params[:uname])
   if names!=nil then
   @msg="account name exist, please create a new one"
   else
   @msg="Welcome"
 end
 respond_to do |format|
  format.html {render :layout=>false}
   format.json { render json: @users }  
 end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:uname, :upwd, :umail, :uphone, :uaddress, :uimpower)
    end
end
