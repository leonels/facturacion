class OrganizationsController < ApplicationController
  load_and_authorize_resource
  def index
    # @organizations = Organization.all
    respond_to do |format|
      format.html
    end
  end

  def show
    # @organization = Organization.find(params[:id])
    @contacts = @organization.contacts
    respond_to do |format|
      format.html
    end
  end

  def new
    @organization = Organization.new
    @organization.contacts.build
    respond_to do |format|
      format.html
    end
  end

  def edit
    # @organization = Organization.find(params[:id])
  end

  def create
    # @organization = Organization.new(params[:organization])
    @organization.contacts[0].account_id = current_user.account_id
    @organization.account_id = current_user.account_id if @organization.new_record?
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    # @organization = Organization.find(params[:id])
    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    # @organization = Organization.find(params[:id])
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
    end
  end
end
