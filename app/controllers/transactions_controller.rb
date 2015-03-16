class TransactionsController < ApplicationController
	before_action :set_transaction, only: [:show]
	def new
		@transaction = Transaction.new
		@client = Client.find_by(cedula: params[:client_document])
	end
	def create
	    @transaction = Transaction.new(transaction_params)
	    @transaction.client = Client.find_by(cedula: params[:client_document])
	    @transaction.store = Store.find(params[:store_id])
	    membership = ((Membership.find_by(store_id: @transaction.store.id, client_id: @transaction.client.id)).nil?) ? Membership.new : Membership.find_by(store_id: @transaction.store.id, client_id: @transaction.client.id)
	    
	    respond_to do |format|
	      if @transaction.save
	      	@transaction.client.addpoints!(@transaction.points_awarded)
	      	if membership.persisted?
	      		membership.addpoints!(@transaction.points_awarded)
	    	else
	    		membership.client = @transaction.client
	    		membership.store = @transaction.store
	    		membership.save!
	    		membership.addpoints!(@transaction.points_awarded)
	    	end
	        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
	        format.json { render :show, status: :created, location: @transaction }
	      else
	        format.html { render :new }
	        format.json { render json: @transaction.errors, status: :unprocessable_entity }
	      end
	    end		
	end

	def show

	end
	private
	# Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:description, :total, :points_awarded)
    end
    def set_transaction
    	@transaction = Transaction.find(params[:id])
    end
end
