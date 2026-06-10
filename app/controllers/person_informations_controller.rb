class PersonInformationsController < ApplicationController
  before_action :set_person_information, only: %i[ show edit update destroy ]

  # GET /person_informations or /person_informations.json
  def index
    @person_informations = PersonInformation.all
  end

  # GET /person_informations/1 or /person_informations/1.json
  def show
  end

  # GET /person_informations/new
  def new
    @person_information = PersonInformation.new
  end

  # GET /person_informations/1/edit
  def edit
  end

  # POST /person_informations or /person_informations.json
  def create
    @person_information = PersonInformation.new(person_information_params)

    respond_to do |format|
      if @person_information.save
        format.html { redirect_to @person_information, notice: "Person information was successfully created." }
        format.json { render :show, status: :created, location: @person_information }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_informations/1 or /person_informations/1.json
  def update
    respond_to do |format|
      if @person_information.update(person_information_params)
        format.html { redirect_to @person_information, notice: "Person information was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @person_information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_informations/1 or /person_informations/1.json
  def destroy
    @person_information.destroy!

    respond_to do |format|
      format.html { redirect_to person_informations_path, notice: "Person information was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_information
      @person_information = PersonInformation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def person_information_params
      params.expect(person_information: [ :address, :dob ])
    end
end
