class WptsController < ApplicationController
  before_action :set_wpt, only: [:show, :edit, :update, :destroy]

  # GET /wpts
  # GET /wpts.json
  def index
    @wpts = Wpt.all
  end

  # GET /wpts/1
  # GET /wpts/1.json
  def show
  end

  # GET /wpts/new
  def new
    @wpt = Wpt.new
  end

  # GET /wpts/1/edit
  def edit
  end

  # POST /wpts
  # POST /wpts.json
  def create
    @wpt = Wpt.new(wpt_params)

    respond_to do |format|
      if @wpt.save
        format.html { redirect_to @wpt, notice: 'Wpt was successfully created.' }
        format.json { render :show, status: :created, location: @wpt }
      else
        format.html { render :new }
        format.json { render json: @wpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wpts/1
  # PATCH/PUT /wpts/1.json
  def update
    respond_to do |format|
      if @wpt.update(wpt_params)
        format.html { redirect_to @wpt, notice: 'Wpt was successfully updated.' }
        format.json { render :show, status: :ok, location: @wpt }
      else
        format.html { render :edit }
        format.json { render json: @wpt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wpts/1
  # DELETE /wpts/1.json
  def destroy
    @wpt.destroy
    respond_to do |format|
      format.html { redirect_to wpts_url, notice: 'Wpt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wpt
      @wpt = Wpt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wpt_params
      params.require(:wpt).permit(:url_id, :load_t, :first_byte_t, :dom_interactive_t, :document_complete_t, :request_count, :speed_index, :ref)
    end
end
