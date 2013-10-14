class PanelAttachmentsController < ApplicationController
  # GET /panel_attachments
  # GET /panel_attachments.json
  def index
    @panel_attachments = PanelAttachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @panel_attachments }
    end
  end

  # GET /panel_attachments/1
  # GET /panel_attachments/1.json
  def show
    @panel_attachment = PanelAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @panel_attachment }
    end
  end

  # GET /panel_attachments/new
  # GET /panel_attachments/new.json
  def new
    @panel_attachment = PanelAttachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @panel_attachment }
    end
  end

  # GET /panel_attachments/1/edit
  def edit
    @panel_attachment = PanelAttachment.find(params[:id])
  end

  # POST /panel_attachments
  # POST /panel_attachments.json
  def create
    @panel_attachment = PanelAttachment.new(params[:panel_attachment])

    respond_to do |format|
      if @panel_attachment.save
        format.html { redirect_to @panel_attachment, notice: 'Panel attachment was successfully created.' }
        format.json { render json: @panel_attachment, status: :created, location: @panel_attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @panel_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /panel_attachments/1
  # PUT /panel_attachments/1.json
  def update
    @panel_attachment = PanelAttachment.find(params[:id])

    respond_to do |format|
      if @panel_attachment.update_attributes(params[:panel_attachment])
        format.html { redirect_to @panel_attachment, notice: 'Panel attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @panel_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panel_attachments/1
  # DELETE /panel_attachments/1.json
  def destroy
    @panel_attachment = PanelAttachment.find(params[:id])
    @panel_attachment.destroy

    respond_to do |format|
      format.html { redirect_to panel_attachments_url }
      format.json { head :no_content }
    end
  end
end
