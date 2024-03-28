class CustomerApplicationsController < ApplicationController
  before_action :set_customer_application, only: %i[ show edit update destroy ]

  # GET /customer_applications or /customer_applications.json
  def index
    @customer_applications = CustomerApplication.all
  end

  # GET /customer_applications/1 or /customer_applications/1.json
  def show
  end

  # GET /customer_applications/new
  def new
    @customer_application = CustomerApplication.new
  end

  # GET /customer_applications/1/edit
  def edit
  end

  # POST /customer_applications or /customer_applications.json
  def create
    @customer_application = CustomerApplication.new(customer_application_params)

    respond_to do |format|
      if @customer_application.save
        # format.html { redirect_to customer_application_url(@customer_application), notice: "Customer application was successfully created." }
        format.html { redirect_to root_path, notice: "Customer application was successfully created." }
        format.json { render :show, status: :created, location: @customer_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_applications/1 or /customer_applications/1.json
  def update
    respond_to do |format|
      if @customer_application.update(customer_application_params)
        format.html { redirect_to customer_application_url(@customer_application), notice: "Customer application was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_applications/1 or /customer_applications/1.json
  def destroy
    @customer_application.destroy!

    respond_to do |format|
      format.html { redirect_to customer_applications_url, notice: "Customer application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_application
      @customer_application = CustomerApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_application_params
      params.require(:customer_application).permit(:name, :email, :mobile)
    end
end
