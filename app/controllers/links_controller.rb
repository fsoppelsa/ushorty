class LinksController < ApplicationController
  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])
    @link.hashed = create_hash(Rails.application.config.hash_length)

    respond_to do |format|
        if @link.save 
          format.js
        else
          format.html { render :action => "new" }
        end
    end
  end

  # Redirects to the "long" url saved hashed
  def redirect
    @link = params[:hashed]
    # Redirects to the original URL: if collisions happen,
    # old links (.last is taken) are overwritten
    unless @redirection = Link.where("hashed = ?", @link).last
      redirect_to error_page_path
    else
      # If hashed URL exists in database, redirect
      redirect_to @redirection.original
    end
  end

  def ws_url
    logger.error(params[:url])
  end

  private

  # Returns a n-length hash of mixed chars and numbers
  def create_hash(n)
    alpha = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    
    hashed = ""
    1.upto(n) do |i| 
      hashed << alpha[rand(alpha.size-1)] 
    end

    return hashed
  end
end
