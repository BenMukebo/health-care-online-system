module Dashboard
    class ContractsController < DashboardController
        before_action :ensure_frame_response, only: [:new, :edit]

        def index
            @contracts = Contract.all
        end

        def new
            @contract = Contract.new
        end

        def create
            @contract = Contract.new(contract_params)

            respond_to do |format|
                if @contract.save?
                    format.html { redirect_to dashboard_url, notice: "Contract created successfully." }
                    format.json { render :show, status: :created, location: @contract }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @contract.errors, status: :unprocessable_entity }
                end
            end
        end


        def contract_params
            params.require(:contract).permit(:hopsital_id, :status, :value, :start_date, :end_date, :agreement_type,:terms_of_agreement, :legal_document)
        end
    end
end