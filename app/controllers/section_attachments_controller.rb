class SectionAttachmentsController < ApplicationController
  # GET /section_attachments
  # GET /section_attachments.json
  def index
    @section_attachments = SectionAttachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @section_attachments }
    end
  end

  # GET /section_attachments/1
  # GET /section_attachments/1.json
  def show
    @section_attachment = SectionAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section_attachment }
    end
  end

  # GET /section_attachments/new
  # GET /section_attachments/new.json
  def new
    @section_attachment = SectionAttachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section_attachment }
    end
  end

  # GET /section_attachments/1/edit
  def edit
    @section_attachment = SectionAttachment.find(params[:id])
  end

  # POST /section_attachments
  # POST /section_attachments.json
  def create
    @section_attachment = SectionAttachment.new(params[:section_attachment])

    respond_to do |format|
      if @section_attachment.save
        format.html { redirect_to @section_attachment, notice: 'Section attachment was successfully created.' }
        format.json { render json: @section_attachment, status: :created, location: @section_attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @section_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /section_attachments/1
  # PUT /section_attachments/1.json
  def update
    @section_attachment = SectionAttachment.find(params[:id])

    respond_to do |format|
      if @section_attachment.update_attributes(params[:section_attachment])
        format.html { redirect_to @section_attachment, notice: 'Section attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_attachments/1
  # DELETE /section_attachments/1.json
  def destroy
    @section_attachment = SectionAttachment.find(params[:id])
    @section_attachment.destroy

    respond_to do |format|
      format.html { redirect_to section_attachments_url }
      format.json { head :no_content }
    end
  end
end
