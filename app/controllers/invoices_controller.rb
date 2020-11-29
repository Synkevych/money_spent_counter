class InvoicesController < ApplicationController
  before_action :set_invoice!, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction, :sort_filter
  
  # GET /invoices/
  def index
    @invoices = Invoice.all
                       .available_for(current_user)
                       .order(sort_column + ' ' + sort_direction)
    paginate_invoices
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:success] = 'Invoice was successfully created.'
      redirect_to invoice_path(@invoice)
    else
      flash[:error] = @invoice.errors.full_messages.join("\n")
      render :new, status: 422
    end
  end

  # PATCH/PUT /invoices/1
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, flash: {success: 'Invoice was successfully updated.' }}
      else
        format.html { render :edit, flash: {error: @invoice.errors, status: :unprocessable_entity }}
      end
    end
  end

  # DELETE /checklists/1
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      flash[:success] = 'Invoice was successfully destroyed.'
    end
  end
  
  def error
  end

  private
    # Find a invoice using it ID
    def set_invoice!
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:title, :description, :category, :amount, :user_id)
    end

    def sort_column
      params[:sort] || 'created_at'
    end
    
    def sort_direction
      params[:direction] || 'desc'
    end
    
    def sort_filter
      params[:filter] || 'saved'
    end

    protected     

    def paginate_invoices
      @invoices = @invoices.paginate(page: params[:page])
      @current_page = @invoices.current_page
      @total_pages = @invoices.total_pages
    end
    
end
