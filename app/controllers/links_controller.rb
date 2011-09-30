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
    @link.hashed = create_hash(6)

    respond_to do |format|
      if @link.save!
        format.js
        #format.html { redirect_to root_url }
        #format.html { redirect_to @link }
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
    redirect_to Link.where("hashed = ?", @link).last.original
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
