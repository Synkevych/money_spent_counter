class InvoicesController < ApplicationController
  before_action :set_invoice!, only: [:show, :edit, :update, :destroy]
  
  # GET /invoices/
  def index
    @invoices = Invoice.all
      .order('created_at DESC')
      .paginate(page: params[:page])
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
end
