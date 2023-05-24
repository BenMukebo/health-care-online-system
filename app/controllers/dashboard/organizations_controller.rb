module Dashboard
  class OrganizationsController < DashboardController
    def index
      # @organizations = current_user.organizations
      @organizations = Organization.all
    end

    # def edit
    #   # @organization = Organization.find_by(slug: params[:id])
    #   # @admin = AdminDashboardService.new(current_user).new_job
    # end

    # def update
    #   @organization = Organization.find_by(slug: params[:id])
    #   @organization.update!(job_params)
    #   redirect_to dashboard_jobs_path
    # end

    # def new
    #   @admin = AdminDashboardService.new(current_user).new_job
    #   @organization = current_user.jobs.build
    # end

    # def create
    #   @organization = current_user.jobs.create(organization_params)
    #   @organization.location_id = current_user.company.location_id if organization_params[:location_id].blank?
    #   if @organization.save
    #     flash[:notice] = "Job created successfully."
    #     redirect_to dashboard_path
    #   else
    #     render :new
    #   end
    # end

    # private

    # def organization_params
    #   params.require(:job).permit(:title, :description, :company_id, :status, :location_id)
    # end
  end
end
