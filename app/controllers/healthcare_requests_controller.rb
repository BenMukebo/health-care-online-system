class HealthcareRequestsController < ApplicationController
  before_action :set_healthcare_request, only: %i[show edit update destroy]

  # GET /healthcare_requests or /healthcare_requests.json
  def index
    @healthcare_requests = HealthcareRequest.all
  end

  # GET /healthcare_requests/1 or /healthcare_requests/1.json
  def show; end

  # GET /healthcare_requests/new
  def new
    @healthcare_request = HealthcareRequest.new
  end

  # GET /healthcare_requests/1/edit
  def edit; end

  # POST /healthcare_requests or /healthcare_requests.json
  def create
    @healthcare_request = HealthcareRequest.new(healthcare_request_params)

    respond_to do |format|
      if @healthcare_request.save
        format.html do
          redirect_to healthcare_request_url(@healthcare_request),
                      notice: 'Healthcare request was successfully created.'
        end
        format.json { render :show, status: :created, location: @healthcare_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @healthcare_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /healthcare_requests/1 or /healthcare_requests/1.json
  def update
    respond_to do |format|
      if @healthcare_request.update(healthcare_request_params)
        format.html do
          redirect_to healthcare_request_url(@healthcare_request),
                      notice: 'Healthcare request was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @healthcare_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @healthcare_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healthcare_requests/1 or /healthcare_requests/1.json
  def destroy
    @healthcare_request.destroy

    respond_to do |format|
      format.html { redirect_to healthcare_requests_url, notice: 'Healthcare request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_healthcare_request
    @healthcare_request = HealthcareRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def healthcare_request_params
    params.require(:healthcare_request).permit(:title, :description, :received, :valided, :data, :status, :user_id,
                                               :organization_id, :hospital_id)
  end
end
