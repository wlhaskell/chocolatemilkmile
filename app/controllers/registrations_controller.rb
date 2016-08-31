class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy, :checkout, :confirmation]
  before_action :validate_session, only: [:show, :edit, :update, :destroy, :checkout, :confirmation]
  before_action :validate_admin, only: [:index]

  def home
  end

  def confimration
  end

  def unauthorized
  end

  def checkout
    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => params[:total], # Amount in cents
        :currency => "usd",
        :source => token,
        :description => "Registration #{params[:id]}",
        :metadata => {'registration_id' => params[:id]}
      )
      @registration.confirmation = true
      @registration.save
      redirect_to confirmation_path(id: params[:id])
    rescue Stripe::CardError => e
      redirect_to @registration, notice: 'There was an issue with credit card payment: #{e.message} %>'
    end
  end
  # GET /registrations
  # GET /registrations.json
  def index
    
    params[:sort] ||= 'all'

    case params[:sort]
    when 'all'
      @participants = Participant.all
    when 'paid'
      @participants = Participant.joins(:registration).where("registrations.confirmation = ?", true)
    when 'volunteer'
      @participants = Participant.where("volunteer = ?", 1)
    when 'unpaid'
      @participants = Participant.joins(:registration).where("registrations.confirmation = ?", false)
    when 'runners'
      @participants = Participant.where("level <> ?", 0)
    end
      @participants.order!(:name)
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
    @registration.participants.push Participant.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)
    @registration.confirmation = false

    respond_to do |format|
      if @registration.save
        session[:id] = @registration.id
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update

    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:street, :city, :state, :zip, :phone, :donation, :xs_shirts, :s_shirts, :m_shirts, :l_shirts, :xl_shirts, :participants_attributes => [:id, :name, :age, :shirt, :level, :volunteer, :_destroy])
    end

    def validate_session
      if session[:id] != @registration.id || !session[:admin]
        redirect_to unauthorized_path
      end
    end

    def validate_admin
      if !session[:admin]
        redirect_to login_admin_path
      end
    end
end
