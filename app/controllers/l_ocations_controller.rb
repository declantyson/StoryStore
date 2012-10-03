class LOcationsController < ApplicationController
  # GET /l_ocations
  # GET /l_ocations.json
  def index
    @l_ocations = LOcation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @l_ocations }
    end
  end

  # GET /l_ocations/1
  # GET /l_ocations/1.json
  def show
    @l_ocation = LOcation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @l_ocation }
    end
  end

  # GET /l_ocations/new
  # GET /l_ocations/new.json
  def new
    @l_ocation = LOcation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @l_ocation }
    end
  end

  # GET /l_ocations/1/edit
  def edit
    @l_ocation = LOcation.find(params[:id])
  end

  # POST /l_ocations
  # POST /l_ocations.json
  def create
    @l_ocation = LOcation.new(params[:l_ocation])

    respond_to do |format|
      if @l_ocation.save
        format.html { redirect_to @l_ocation, notice: 'L ocation was successfully created.' }
        format.json { render json: @l_ocation, status: :created, location: @l_ocation }
      else
        format.html { render action: "new" }
        format.json { render json: @l_ocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /l_ocations/1
  # PUT /l_ocations/1.json
  def update
    @l_ocation = LOcation.find(params[:id])

    respond_to do |format|
      if @l_ocation.update_attributes(params[:l_ocation])
        format.html { redirect_to @l_ocation, notice: 'L ocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @l_ocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /l_ocations/1
  # DELETE /l_ocations/1.json
  def destroy
    @l_ocation = LOcation.find(params[:id])
    @l_ocation.destroy

    respond_to do |format|
      format.html { redirect_to l_ocations_url }
      format.json { head :no_content }
    end
  end
end
