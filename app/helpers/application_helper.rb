module ApplicationHelper
  def title
    base_title = "Global Hive"
    if @title.nil?
      base_title
    else 
      "#{@title} :: #{base_title}"
    end
  end
  def metatag
    base_desc = "Global Hive"
    if @metatag.nil?
      base_desc
    else 
      "#{@metatag}"
    end
  end
  def bodyclass
    base_class = "page"
    if @bodyclass.nil?
      base_class
    else 
      "#{@bodyclass}"
    end
  end
  def smart_truncate(s, h, opts = {})
    opts = {:words => 12}.merge(opts)
    if opts[:sentences]
      return s.split(/\.(\s|$)+/)[0, opts[:sentences]].map{|s| s.strip}.join('. ') + '.'
    end
    a = s.split(/\s/) # or /[ ]+/ to only split on spaces
    n = opts[:words]
    a[0...n].join(' ') + (a.size > n ? '&hellip; <a href="'+h+'" class="more">read more &raquo;</a>' : '')
  end
  def word_truncate(s, opts = {})
    opts = {:words => 12}.merge(opts)
    if opts[:sentences]
      return s.split(/\.(\s|$)+/)[0, opts[:sentences]].map{|s| s.strip}.join('. ') + '.'
    end
    a = s.split(/\s/) # or /[ ]+/ to only split on spaces
    n = opts[:words]
    a[0...n].join(' ') + (a.size > n ? '&hellip;' : '')
  end
  
  def content(name, tag)
    @content = Content.find_by_name(name)
    if @content.blank?
      if user_signed_in?
        if current_user.admin?
          "<a href='#{new_content_path}'>Add</a>".html_safe
        end
      end
    else
      @header = "#{tag} #{@content.title}"
      render "layouts/content"
    end
  end
  
  def to_rgb(hexidecimal)
    hex = hexidecimal.gsub("#", "").scan(/../)
    r = hex[0].hex
    g = hex[1].hex
    b = hex[2].hex
    return "rgb(#{r},#{g},#{b})"
  end
  def to_rgba(hexidecimal, alpha)
    hex = hexidecimal.gsub("#", "").scan(/../)
    r = hex[0].hex
    g = hex[1].hex
    b = hex[2].hex
    a = alpha.to_f/10
    return "rgba(#{r},#{g},#{b},#{a})"
  end
  def darken_color(hex_color, amount=0.4)
    hex_color = hex_color.gsub('#','')
    rgb = hex_color.scan(/../).map(&:hex).map{|color| color * amount}.map(&:round)
    "#%02x%02x%02x" % rgb
  end
  def thisPage
    return controller.action_name
  end
  def date_string(time)
    return time.strftime("%m.%d.%y")
  end
  def edit_if_admin(model, id)
    if user_signed_in?
      if current_user.admin?
        return "<a href='/administration/#{model.downcase.pluralize}/#{id}/edit' class='edit-link'>Edit</a>".html_safe
      end
    end
  end
  def link_if_admin(url, name)
    if user_signed_in?
      if current_user.admin?
        return "<a href='#{url}' class='admin-link admin-helper-link'>#{name}</a>".html_safe
      end
    end
  end
end
