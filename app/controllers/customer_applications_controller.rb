class CustomerApplicationsController < ApplicationController
  before_action :authenticate_user!, except: %i[ new create ]
  before_action :set_customer_application, only: %i[ edit update approve reject archive destroy ]

  # GET /customer_applications or /customer_applications.json
  def index
    @statii = CustomerApplication.pluck(:status).uniq
    case params[:status]
    when 'Pending'
      @customer_applications = CustomerApplication.where(status: 'Pending')
    when 'Approved'
      @customer_applications = CustomerApplication.where(status: 'Approved')
    when 'Rejected'
      @customer_applications = CustomerApplication.where(status: 'Rejected')
    when 'Archived'
      @customer_applications = CustomerApplication.where(status: 'Archived')
    else
      @customer_applications = CustomerApplication.where.not(status: "Archived").order(:created_at)
    end
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
        if current_user
          format.html { redirect_to customer_applications_path, notice: "Customer application was successfully created." }
        else
          format.html { redirect_to root_path, notice: "Customer application was successfully created." }
        end
        format.json { render :show, status: :created, location: @customer_application }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.html { render 'home/index', status: :unprocessable_entity }
        format.json { render json: @customer_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_applications/1 or /customer_applications/1.json
  def update
    respond_to do |format|
      if @customer_application.update(customer_application_params)
        format.html { redirect_to customer_applications_url, notice: "Customer application was successfully updated." }
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

  def approve
    @customer_application.update(status: 'Approved')
    redirect_to customer_applications_url
  end

  def reject
    @customer_application.update(status: 'Rejected')
    redirect_to customer_applications_url
  end

  def archive
    @customer_application.update(status: 'Archived')
    redirect_to customer_applications_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_application
      @customer_application = CustomerApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_application_params
      params.require(:customer_application).permit(:name, :email, :mobile, :photo, :status)
    end
end
