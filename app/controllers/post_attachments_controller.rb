class PostAttachmentsController < ApplicationController
  # GET /post_attachments
  # GET /post_attachments.json
  def index
    @post_attachments = PostAttachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post_attachments }
    end
  end

  # GET /post_attachments/1
  # GET /post_attachments/1.json
  def show
    @post_attachment = PostAttachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post_attachment }
    end
  end

  # GET /post_attachments/new
  # GET /post_attachments/new.json
  def new
    @post_attachment = PostAttachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post_attachment }
    end
  end

  # GET /post_attachments/1/edit
  def edit
    @post_attachment = PostAttachment.find(params[:id])
  end

  # POST /post_attachments
  # POST /post_attachments.json
  def create
    @post_attachment = PostAttachment.new(params[:post_attachment])

    respond_to do |format|
      if @post_attachment.save
        format.html { redirect_to @post_attachment, notice: 'Post attachment was successfully created.' }
        format.json { render json: @post_attachment, status: :created, location: @post_attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /post_attachments/1
  # PUT /post_attachments/1.json
  def update
    @post_attachment = PostAttachment.find(params[:id])

    respond_to do |format|
      if @post_attachment.update_attributes(params[:post_attachment])
        format.html { redirect_to @post_attachment, notice: 'Post attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_attachments/1
  # DELETE /post_attachments/1.json
  def destroy
    @post_attachment = PostAttachment.find(params[:id])
    @post_attachment.destroy

    respond_to do |format|
      format.html { redirect_to post_attachments_url }
      format.json { head :no_content }
    end
  end
end
