class ItemAttachmentsController < ApplicationController
  # GET /item_attachments
  # GET /item_attachments.json
  def index
    @item_attachments = ItemAttachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_attachments }
    end
  end

  # GET /item_attachments/1
  # GET /item_attachments/1.json
  def show
    @item_attachment = ItemAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_attachment }
    end
  end

  # GET /item_attachments/new
  # GET /item_attachments/new.json
  def new
    @item_attachment = ItemAttachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_attachment }
    end
  end

  # GET /item_attachments/1/edit
  def edit
    @item_attachment = ItemAttachment.find(params[:id])
  end

  # POST /item_attachments
  # POST /item_attachments.json
  def create
    @item_attachment = ItemAttachment.new(params[:item_attachment])

    respond_to do |format|
      if @item_attachment.save
        format.html { redirect_to @item_attachment, notice: 'Item attachment was successfully created.' }
        format.json { render json: @item_attachment, status: :created, location: @item_attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @item_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_attachments/1
  # PUT /item_attachments/1.json
  def update
    @item_attachment = ItemAttachment.find(params[:id])

    respond_to do |format|
      if @item_attachment.update_attributes(params[:item_attachment])
        format.html { redirect_to @item_attachment, notice: 'Item attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_attachments/1
  # DELETE /item_attachments/1.json
  def destroy
    @item_attachment = ItemAttachment.find(params[:id])
    @item_attachment.destroy

    respond_to do |format|
      format.html { redirect_to item_attachments_url }
      format.json { head :no_content }
    end
  end
end
