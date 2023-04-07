class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  def index
    @hospitals = Hospital.all
  end

  def show
    @treatments = @hospital.treatments
    @healthcare_requests = @hospital.healthcare_requests
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to @hospital, notice: 'Hospital was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hospital.update(hospital_params)
      redirect_to @hospital, notice: 'Hospital was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @hospital.destroy
    redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.'
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

end
