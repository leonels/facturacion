class InvoicesController < ApplicationController
  load_and_authorize_resource

  def index
    # @invoices = Invoice.all
    respond_to do |format|
      format.html
    end
  end

  def show
    # @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    # @invoice = Invoice.new
    @organizations = Organization.all(:conditions => ['account_id = ?', current_user.account_id])
    @items = Item.all(:conditions => ['account_id = ?', current_user.account_id])
    3.times do
      line_item = @invoice.line_items.build
    end
    respond_to do |format|
      format.html
    end
  end

  def edit
    # @invoice = Invoice.find(params[:id])
  end

  def create
    # @invoice = Invoice.new(params[:invoice])
    @invoice.account_id = current_user.account_id
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    # @invoice = Invoice.find(params[:id])
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    # @invoice = Invoice.find(params[:id])
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
    end
  end
end
