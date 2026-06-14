class MSpacesController < ApplicationController
  before_action :set_m_space, only: %i[ show edit update destroy ]

  # GET /m_spaces or /m_spaces.json
  def index
    @m_spaces = MSpace.all
  end

  # GET /m_spaces/1 or /m_spaces/1.json
  def show
  end

  # GET /m_spaces/new
  def new
    @m_space = MSpace.new
  end

  # GET /m_spaces/1/edit
  def edit
  end

  # POST /m_spaces or /m_spaces.json
  def create
    @m_space = MSpace.new(m_space_params)

    respond_to do |format|
      if @m_space.save
        format.html { redirect_to @m_space, notice: "M space was successfully created." }
        format.json { render :show, status: :created, location: @m_space }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @m_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /m_spaces/1 or /m_spaces/1.json
  def update
    respond_to do |format|
      if @m_space.update(m_space_params)
        format.html { redirect_to @m_space, notice: "M space was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @m_space }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @m_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_spaces/1 or /m_spaces/1.json
  def destroy
    @m_space.destroy!

    respond_to do |format|
      format.html { redirect_to m_spaces_path, notice: "M space was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m_space
      @m_space = MSpace.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def m_space_params
      params.expect(m_space: [ :profile_pic ])
    end
end
