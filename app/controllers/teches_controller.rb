class TechesController < ApplicationController
  before_action :set_tech, only: %i[ show edit update destroy ]

  # GET /teches or /teches.json
  def index
    @teches = Tech.all
  end

  # GET /teches/1 or /teches/1.json
  def show
  end

  # GET /teches/new
  def new
    @tech = Tech.new
  end

  # GET /teches/1/edit
  def edit
  end

  # POST /teches or /teches.json
  def create
    @tech = Tech.new(tech_params)

    respond_to do |format|
      if @tech.save
        format.html { redirect_to @tech, notice: "Tech was successfully created." }
        format.json { render :show, status: :created, location: @tech }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teches/1 or /teches/1.json
  def update
    respond_to do |format|
      if @tech.update(tech_params)
        format.html { redirect_to @tech, notice: "Tech was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @tech }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teches/1 or /teches/1.json
  def destroy
    @tech.destroy!

    respond_to do |format|
      format.html { redirect_to teches_path, notice: "Tech was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech
      @tech = Tech.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tech_params
      params.expect(tech: [ :first_name, :last_name, :description ])
    end
end
