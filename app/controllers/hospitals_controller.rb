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
  
end
