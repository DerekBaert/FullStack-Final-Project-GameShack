class PlatformsController < ApplicationController
  before_action :set_platform, only: %i[ show edit update destroy ]

  # GET /platforms or /platforms.json
  def index
    @filter = params[:filter]
    if(params[:filter] == "All" || params[:filter].nil?)
      @platforms = Platform.all.page(params[:page])
    elsif(params[:filter] == "Sale")
      @platforms = Platform.where.not(sale: nil).page(params[:page])
    elsif(params[:filter] == "Recent")
      @platforms = Platform.where(created_at: 3.days.ago..).page(params[:page])
    end
  end

  # GET /platforms/1 or /platforms/1.json
  def show
  end

  # GET /platforms/new
  def new
    @platform = Platform.new
  end

  # GET /platforms/1/edit
  def edit
  end

  # POST /platforms or /platforms.json
  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        format.html { redirect_to platform_url(@platform), notice: "Platform was successfully created." }
        format.json { render :show, status: :created, location: @platform }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platforms/1 or /platforms/1.json
  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to platform_url(@platform), notice: "Platform was successfully updated." }
        format.json { render :show, status: :ok, location: @platform }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platforms/1 or /platforms/1.json
  def destroy
    @platform.destroy

    respond_to do |format|
      format.html { redirect_to platforms_url, notice: "Platform was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def platform_params
      params.require(:platform).permit(:name, :description, :price)
    end
end
