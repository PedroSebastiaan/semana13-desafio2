class PetHistoriesController < ApplicationController
  before_action :set_pet_history, only: [:show, :edit, :update, :destroy]

  # GET /pet_histories
  # GET /pet_histories.json
  def index
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    @pet_histories = PetHistory.where(pet_id: @pet)
  end

  # GET /pet_histories/1
  # GET /pet_histories/1.json
  def show
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
  end

  # GET /pet_histories/new
  def new
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    @pet_history = PetHistory.new
  end

  # GET /pet_histories/1/edit
  def edit
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
  end

  # POST /pet_histories
  # POST /pet_histories.json
  def create
    @pet_history = PetHistory.new(pet_history_params)
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    @pet_history.pet = @pet
    respond_to do |format|
      if @pet_history.save
        format.html { redirect_to client_pet_pet_history_path(@client.id, @pet.id, @pet_history.id), notice: 'Pet history was successfully created.' }
        format.json { render :show, status: :created, location: @pet_history }
      else
        format.html { render :new }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_histories/1
  # PATCH/PUT /pet_histories/1.json
  def update
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    respond_to do |format|
      if @pet_history.update(pet_history_params)
        format.html { redirect_to client_pet_pet_history_path(@client.id, @pet.id, @pet_history.id), notice: 'Pet history was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_history }
      else
        format.html { render :edit }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_histories/1
  # DELETE /pet_histories/1.json
  def destroy
    @client = Client.find(params[:client_id])
    @pet = Pet.find(params[:pet_id])
    @pet_history.destroy
    respond_to do |format|
      format.html { redirect_to client_pet_pet_histories_path(@client.id), notice: 'Pet history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_history
      @pet_history = PetHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_history_params
      params.require(:pet_history).permit(:weight, :heigth, :description)
    end
end
