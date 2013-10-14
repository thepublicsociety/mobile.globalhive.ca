class AddIpCaptionIpCaptionFrenchIpWidthIpHeightIpCropXipCropYipCropWipAndCropHToItems < ActiveRecord::Migration
  def change
    add_column :items, :i_p_caption, :string
    add_column :items, :i_p_caption_french, :string
    add_column :items, :i_p_width, :string
    add_column :items, :i_p_height, :string
    add_column :items, :i_p_crop_x, :string
    add_column :items, :i_p_crop_y, :string
    add_column :items, :i_p_crop_w, :string
    add_column :items, :i_p_crop_h, :string
  end
end
