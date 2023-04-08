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

def update
  @hospital = Hospital.find(params)

if @hospital.update(hospital_params)
  redirect_to @hospital
else
  render :edit
 end
end

end
end


end
