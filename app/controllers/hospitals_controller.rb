class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  def index
    @hospitals = Hospital.all
  end

  def show
    @treatments = @hospital.treatments
    @healthcare_requests = @hospital.healthcare_requests
  end
  
end
