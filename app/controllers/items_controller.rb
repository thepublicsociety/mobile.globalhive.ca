class ItemsController < ApplicationController
  before_filter :set_class, :authorize_or_redirect
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @item.item_attachments.build
    @panels = Panel.where("active=?", true)
    @items = Item.where("active=?", true).order("title asc")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @panels = Panel.where("active=?", true)
    @items = Item.where("active=?", true).order("title asc")
    @related = Item.find @item.related_modules.blank? ? [] : @item.related_modules.split(",").collect(&:strip)
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @panels = Panel.where("active=?", true)
    @items = Item.where("active=?", true)
    @related = Item.find @item.related_modules.blank? ? [] : @item.related_modules.split(",").collect(&:strip)


    if @item.save
      if params[:item][:itemphoto].blank?
        redirect_to items_url, notice: 'Item was successfully updated.'
      else
        redirect_to "/crop/#{@item.id.to_s}"
      end
    else
      render action: "new"
    end

  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @panels = Panel.where("active=?", true)
    @items = Item.where("active=?", true)
    @related = Item.find @item.related_modules.blank? ? [] : @item.related_modules.split(",").collect(&:strip)

    if @item.update_attributes(params[:item])
      if params[:item][:itemphoto].blank?
        if !params[:item][:crop_y].blank?
          @item.update_attribute("i_p_crop_y", params[:item][:crop_y])
          redirect_to items_url, notice: 'Item was successfully updated.'
        else
          redirect_to items_url, notice: 'Item was successfully updated.'
        end
      else
        redirect_to "/crop/#{@item.id.to_s}"
      end
    else
      render action: "edit"
    end
  end
  
  def cropping
    @item = Item.find(params[:id])
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    Item.all.each do |i|
      r = i.related_modules
      r = r.blank? ? [] : r.split(",").collect(&:strip)
      if r.include?(@item.id.to_s)
        r.delete(@item.id.to_s)
        i.update_attribute("related_modules", r.join(","))
      end
    end
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  
  def arrange
    by = params[:by]
    if by == "title"
      @items = Item.find(:all, :order => "title asc")
    elsif by == "category"
      @items = Item.find(:all, :joins => :panel, :order => "panels.name")
    else
      @items = Item.find(:all, :order => "subcategory asc")
    end
  end
  
  private
  
  def set_class
    @bodyclass = "admin admin-page"
  end
end
