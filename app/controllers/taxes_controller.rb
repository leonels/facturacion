class TaxesController < ApplicationController
  # GET /taxes
  # GET /taxes.json
  def index
    @taxes = Tax.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxes }
    end
  end

  # GET /taxes/1
  # GET /taxes/1.json
  def show
    @taxis = Tax.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxis }
    end
  end

  # GET /taxes/new
  # GET /taxes/new.json
  def new
    @taxis = Tax.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxis }
    end
  end

  # GET /taxes/1/edit
  def edit
    @taxis = Tax.find(params[:id])
  end

  # POST /taxes
  # POST /taxes.json
  def create
    @taxis = Tax.new(params[:taxis])

    respond_to do |format|
      if @taxis.save
        format.html { redirect_to @taxis, notice: 'Tax was successfully created.' }
        format.json { render json: @taxis, status: :created, location: @taxis }
      else
        format.html { render action: "new" }
        format.json { render json: @taxis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxes/1
  # PUT /taxes/1.json
  def update
    @taxis = Tax.find(params[:id])

    respond_to do |format|
      if @taxis.update_attributes(params[:taxis])
        format.html { redirect_to @taxis, notice: 'Tax was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @taxis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxes/1
  # DELETE /taxes/1.json
  def destroy
    @taxis = Tax.find(params[:id])
    @taxis.destroy

    respond_to do |format|
      format.html { redirect_to taxes_url }
      format.json { head :ok }
    end
  end
end
