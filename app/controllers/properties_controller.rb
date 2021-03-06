class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, except: [:show, :email_agent, :view_all]
  before_action :account_owns_property?, only: [:edit, :update, :detroy]
  before_action :set_sidebar

  # GET /properties or /properties.json
  def index
    @properties = Property.where(account_id: current_account.id)
  end

  # GET /properties/1 or /properties/1.json
  def show
    @agent = @property.account
    @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_path, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def email_agent
    agent_id = params[:agent_id]
    name = params[:sender_name]
    email = params[:sender_email]
    message = params[:sender_message]

    ContactMailer.email_agent(agent_id, name, email, message).deliver_now

    # response back when method is called
    respond_to do |format|
      format.json { head :no_content }
    end

  end

  def view_all
    @latest_properties = Property.avaliable.latest
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :parking_spaces, :description, :for_sale, :photo, :avaliable_date, :status)
    end

    def account_owns_property?
      if @property.account_id != current_account.id 
        redirect_to properties_path, alert: "The property does not belong to you." and return
      end
    end
end
