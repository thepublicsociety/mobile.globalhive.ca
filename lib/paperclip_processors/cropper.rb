module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      crop_command + super.join(' ').sub(/ -crop \S+/, '').split(' ') # super returns an array like this: ["-resize", "100x", "-crop", "100x100+0+0", "+repage"]
    end

    def crop_command
      target = @attachment.instance
      ["-crop", "#{target.crop_w.blank? ? 0 : target.crop_w}x#{target.crop_h.blank? ? 0 : target.crop_h}+#{target.crop_x.blank? ? 0 : target.crop_x}+#{target.crop_y.blank? ? 0 : target.crop_y}"] 
    end
  end
end