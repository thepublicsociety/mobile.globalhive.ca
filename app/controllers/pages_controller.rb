class PagesController < ApplicationController
  before_filter :authorize_or_redirect, :only => :admin
  before_filter :history
  require 'open-uri'

  def admin
    @bodyclass = "admin"
    @title = "Global Hive :: Administration"
    @metatag = "Administration homepage for website"
  end

  def index
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    #@featureditems = Panel.where("featured=?", true).limit(2).order("number asc")
    @featureditems = Item.where("featured=?", true).limit(2)
    @posts = Post.where("active=?",true).order("created_at desc").limit(3)
    @items = Item.where("active=?", true)
  end
  def explore
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "name_french" => sub[2], "value" => sub[0]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @featureditems = Panel.where("featured=?", true).limit(2).order("number asc")
    @posts = Post.where("active=?",true).order("created_at desc").limit(3)
    @items = Item.where("active=?", true)
  end
  def expand
    @item = Item.find(params[:item])
    @related = Item.find(@item.related_modules.blank? ? [] : @item.related_modules.split(","))
    @left = params[:left] == "244" ? "263" : params[:left] == "979" ? "263" : "19"
    @top = params[:top]
  end
  def hub
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @panel = Panel.find(params[:id])
    @items = Item.where("active=?", true)
    @panelitems = @panel.items.order("number asc")
  end
  def pdf
    @panel = Panel.find(params[:id])
    @items = Item.where("active=?", true)
    @panelitems = @panel.items.order("number asc")
  end
  def story
    @item = Item.find(params[:id])
    @related = Item.find(@item.related_modules.blank? ? [] : @item.related_modules.split(","))
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @featureditems = Panel.where("featured=?", true).limit(2).order("number asc")
    @posts = Post.where("active=?",true).order("created_at desc").limit(3)
    @items = Item.where("active=?", true)
    @twitter_count = "twitter search count"
  end
  def news
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @featureditems = Panel.where("featured=?", true).limit(2).order("number asc")
    @posts = Post.paginate(:order => "created_at DESC", :per_page => 5, :page => params[:page])
    @items = Item.where("active=?", true)
  end
    def news_story
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @featureditems = Panel.where("featured=?", true).limit(2).order("number asc")
    @post = Post.find_by_title(params[:title])
    @posts = Post.where("active=? and author = ?", true, @post.author).order("created_at DESC").limit(3)
    @items = Item.where("active=?", true)
  end
  def about
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @items = Item.where("active=?", true)
    @sections = Section.where("active=?", true)
  end
  def contact
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @items = Item.where("active=?", true)
  end
  def glossary
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @items = Item.where("active=?", true)
    @terms = Term.paginate(:order => "name asc", :per_page => 10, :page => params[:page], :conditions => ["active=?", true])
  end
  def term_all
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "value" => sub[0], "name_french" => sub[2]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @items = Item.where("active=?", true)
    @terms = Term.paginate(:order => "name asc", :per_page => 10, :page => params[:page], :conditions => ["active=?", true])
  end
  def term_select
    range = params[:range]
    if range == "all"
      @terms = Term.paginate(:order => "name asc", :per_page => 10, :page => params[:page], :conditions => ["active=?", true])
    else
      #@terms = Term.paginate(:order => "name asc", :per_page => 1, :page => params[:page], :conditions => ["active=? and LEFT(name, 1) IN(?)", true, selection])
      selection = (range[0]..range[2]).to_a
      @terms = []
      selection.each do |l|
        t = Term.find(:all, :order => "name asc", :conditions => ["lower(name) like ? and active = ?", "#{l}%", true])
        unless t.blank?
          t.each do |q|
            @terms.push(q)
          end
        end
      end
      
#      @terms = []
#      terms.each do |t|
#        @terms.push(t[0])
#      end
      #@terms = terms[0].paginate(:per_page => 1, :page => params[:page])
      #@terms = Term.find_by_range(range)      
    end
  end
  
  
  def email
    @emails = []
    hash = {"email" => "test@test.com", "name" => "test"}
    s = OpenStruct.new hash
    @emails.push(s)
    @message = Message.new
  end
  def send_mail
  	@message = Message.new(params[:message])
  	email = params[:email]
  	subject = params[:subject]
  	sender = params[:from]
  	SendMail.email(sender, email, subject, @message).deliver
  	redirect_to website_path, :notice => "Email was delivered"
  end
  
  def history
    @history = []
    cookies[:history].blank? ? ch = [] : ch = cookies[:history].split(",").collect(&:strip)
    subs = ["context", "good-practices", "tools", "case-studies", "resources", "webinars"]
    ch.each do |c|
      if subs.include?(c)
        hash = {"type" => "sub", "value" => c}
        s = OpenStruct.new hash
        @history.push(s)
      else
        hash = {"type" => "cat", "value" => c}
        s = OpenStruct.new hash
        @history.push(s)
      end
    end
  end
  
  def search
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "name_french" => sub[2], "value" => sub[0]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @featureditems = Panel.where("featured=?", true).limit(2).order("number asc")
    @posts = Post.where("active=?",true).order("created_at desc").limit(3)
    @query = params[:query]
    @items = Item.where("title like ? or title_french like ? or body like ? or body_french like ?", "%#{@query}%", "%#{@query}%", "%#{@query}%" ,"%#{@query}%")
  end

  def hist
    thing = params[:thing]
    @item = Item.find_by_title(thing)
    @related = Item.find(@item.related_modules.blank? ? [] : @item.related_modules.split(","))
    @left = params[:left] == "244" ? "263" : params[:left] == "979" ? "263" : "19"
    @top = params[:top]
  end

  def modules
    @categories = Panel.where("active=?", true).order("number asc")
    @subcategories = []
    [["context", "Context", "Contexte"], ["good-practices", "Good Practices", "Principe"], ["tools", "Tools", "Outil"], ["case-studies", "Case Studies", "Cas"], ["resources", "Resources", "Ressources"], ["webinars", "Webinars", "Webinaires"]].each do |sub|
      hash = {"name" => sub[1], "name_french" => sub[2], "value" => sub[0]}
      s = OpenStruct.new hash
      @subcategories.push(s)
    end
    @module = Item.find(params[:id])
    @related = Item.find(@module.related_modules.blank? ? [] : @module.related_modules.split(","))
  end
  
end
