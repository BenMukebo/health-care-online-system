class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

def create
  @hospital = Hospital.new(hospital_params)

  if @hospital.save
    redirect_to @hospital
  else
    render :new
  end
end

def edit
  @hospital = Hospital.find(params[:id])
end


end


end
