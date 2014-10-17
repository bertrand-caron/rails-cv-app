class AwardsController < ApplicationController
  add_breadcrumb "Awards", :awards_path
  before_action :set_award, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:show, :edit, :update, :new, :create, :destroy]

  # GET /awards
  # GET /awards.json
  def index
    @set_title = true
    @awards = Award.all
  end

  # GET /awards/1
  # GET /awards/1.json
  def show
  end

  # GET /awards/new
  def new
    @award = Award.new
    @award.rank = Award.count + 1
    add_breadcrumb "New", new_award_path
  end

  # GET /awards/1/edit
  def edit
    add_breadcrumb "Edit", edit_award_path
  end

  # POST /awards
  # POST /awards.json
  def create
    @award = Award.new(award_params)

    respond_to do |format|
      if @award.save
        format.html { redirect_to @award, notice: 'Award was successfully created.' }
        format.json { render :show, status: :created, location: @award }
      else
        format.html { render :new }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awards/1
  # PATCH/PUT /awards/1.json
  def update
    respond_to do |format|
      if @award.update(award_params)
        format.html { redirect_to @award, notice: 'Award was successfully updated.' }
        format.json { render :show, status: :ok, location: @award }
      else
        format.html { render :edit }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award.destroy
    respond_to do |format|
      format.html { redirect_to awards_url, notice: 'Award was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_award
      @award = Award.find(params[:id])
      add_breadcrumb @award.title, @award
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def award_params
      params.require(:award).permit(:title, :location, :description, :time, :rank)
    end
end
