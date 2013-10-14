class Item < ActiveRecord::Base
  attr_accessible :active, :body, :category, :description, :featured, :name, :subcategory, :title, :item_attachments_attributes, :panel_id, :size, :related_modules, :feature_title, :name_french, :body_french, :title_french, :subcategory_french, :feature_title_french, :itemphoto, :crop_x, :crop_y, :crop_w, :crop_h, :i_p_caption, :i_p_caption_french, :i_p_width, :i_p_height, :i_p_crop_x, :i_p_crop_y, :i_p_crop_w, :i_p_crop_h, :o_width, :o_height, :o_file, :number
  belongs_to :panel, :foreign_key => "panel_id"
  has_many :item_attachments, dependent: :destroy
  accepts_nested_attributes_for :item_attachments, allow_destroy: true
  has_attached_file :itemphoto, :styles => {:large => "500x500>", :display => "696x"}, :default_url => "/assets/empty.png"
  #validates_attachment_size :itemphoto, :in => 0.megabytes..1.megabytes
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :o_width, :o_height, :o_file

  def itemphoto_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(itemphoto.path(style))
  end 
end
