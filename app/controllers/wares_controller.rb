class WaresController < ApplicationController
  before_action :set_ware, only: [:show, :edit, :update, :destroy]

  # GET /wares
  # GET /wares.json
  def index
    @wares = Ware.all
  end

  # GET /wares/1
  # GET /wares/1.json
  def show
  end

  # GET /wares/new
  def new
    @ware = Ware.new
  end

  # GET /wares/1/edit
  def edit
  end

  # POST /wares
  # POST /wares.json
  def create
    @ware = Ware.new(ware_params)

    respond_to do |format|
      if @ware.save
        format.html { redirect_to @ware, notice: 'Ware was successfully created.' }
        format.json { render :show, status: :created, location: @ware }
      else
        format.html { render :new }
        format.json { render json: @ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wares/1
  # PATCH/PUT /wares/1.json
  def update
    respond_to do |format|
      if @ware.update(ware_params)
        format.html { redirect_to @ware, notice: 'Ware was successfully updated.' }
        format.json { render :show, status: :ok, location: @ware }
      else
        format.html { render :edit }
        format.json { render json: @ware.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wares/1
  # DELETE /wares/1.json
  def destroy
    @ware.destroy
    respond_to do |format|
      format.html { redirect_to wares_url, notice: 'Ware was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def downImg
  io = File.open("#{Rails.root}/public/images/goodsImage/"+params[:filename])
  io.binmode
  send_data(io.read,
  :filename=>params[:filename],
  :type=>"image.jpg",
  :disposition=>"inline"
  )
  io.close
  end
  
  #显示上传界面
  def uploadImg
  
  end 
  
  #上传文件
  def upload
      image=params[:img]
      content_size=image.size
      file_data=image.read
      filetype=image.content_type
      @filename=image.original_filename
      fileext=File.basename(@filename).split(".")[1]
      @time=Time.now.to_s
      timeext=File.basename(@time).split("+")[0]
      newfilename=timeext+"."+fileext
      File.open("#{Rails.root}/public/"+ newfilename,"wb"){
        |f| f.write(file_data)
      }
   flash[:notice] ="Image:"+newfilename+" upload success!"+" upload time:"+(Time.now).to_s
   render :action=>"uploadImg"
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ware
      @ware = Ware.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ware_params
      params.require(:ware).permit(:wname, :wdesc, :wtype, :wfactory, :wprice, :wimg)
    end
end
