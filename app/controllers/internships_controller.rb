class InternshipsController < ApplicationController
  before_action :set_internship, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :new, :create, :destroy]

  # GET /internships
  # GET /internships.json
  def index
    @set_title = true
    @internships = Internship.all
  end

  # GET /internships/1
  # GET /internships/1.json
  def show
  end

  # GET /internships/new
  def new
    @internship = Internship.new
    @internship.rank = Internship.count + 1
    @referee_hash = Hash[Referee.all.map{|i| i.name}.zip(Referee.all.map{|i| i.id})]
  end

  # GET /internships/1/edit
  def edit
    @referee_hash = Hash[Referee.all.map{|i| i.name}.zip(Referee.all.map{|i| i.id})]
  end

  # POST /internships
  # POST /internships.json
  def create
    @internship = Internship.new(internship_params)

    respond_to do |format|
      if @internship.save
        format.html { redirect_to @internship, notice: 'Internship was successfully created.' }
        format.json { render :show, status: :created, location: @internship }
      else
        format.html { render :new }
        format.json { render json: @internship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internships/1
  # PATCH/PUT /internships/1.json
  def update
    respond_to do |format|
      if @internship.update(internship_params)
        format.html { redirect_to @internship, notice: 'Internship was successfully updated.' }
        format.json { render :show, status: :ok, location: @internship }
      else
        format.html { render :edit }
        format.json { render json: @internship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internships/1
  # DELETE /internships/1.json
  def destroy
    @internship.destroy
    respond_to do |format|
      format.html { redirect_to internships_url, notice: 'Internship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internship
      # First, look for the internship with the matching id
      @internship = Internship.find params[:id] 
      rescue ActiveRecord::RecordNotFound
        # If such an internship can't be found, look for an internship whos hyperlink matches the id
        @internship = Internship.find_by hyperlink: params[:id]
        if not @internship
          # If the answer of the find_by request is nil, just dump everything and go back to the root
          redirect_to '/'
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internship_params
      params.require(:internship).permit(:title, :hyperlink, :description, :report_path, :location, :laboratory, :duration, :rank, :referee_id)
    end

end
