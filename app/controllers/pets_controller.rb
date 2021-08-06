class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @client = Client.find(params[:client_id])
    @pets = Pet.where(client_id: @client)
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @client = Client.find(params[:client_id])
  end

  # GET /pets/new
  def new
    @client = Client.find(params[:client_id])
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
    @client = Client.find(params[:client_id])
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @client = Client.find(params[:client_id])
    @pet.client = @client
    respond_to do |format|
      if @pet.save
        format.html { redirect_to client_pet_path(@client.id, @pet.id), notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    @client = Client.find(params[:client_id])
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to client_pet_path(@client.id, @pet.id), notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @client = Client.find(params[:client_id])
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to client_pets_path(@client.id), notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :race, :birthdate)
    end
end
