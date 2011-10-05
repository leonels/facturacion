class ContactsController < ApplicationController
  load_and_authorize_resource

  def index
    # @contacts = Contact.all
    respond_to do |format|
      format.html
    end
  end

  def show
    # @contact = Contact.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    # @contact = Contact.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    # @contact = Contact.find(params[:id])
  end

  def create
    # @contact = Contact.new(params[:contact])
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    # @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    # @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
    end
  end
end
