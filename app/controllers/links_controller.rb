class LinksController < ApplicationController
  # GET /links
  # GET /links.json
  #def index
  #  @links = Link.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render :json => @links }
  #  end
  #end

  # GET /links/1
  # GET /links/1.json
  #def show
  #  @link = Link.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #  end
  #end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /links/1/edit
  #def edit
  #  @link = Link.find(params[:id])
  #end

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

  # PUT /links/1
  # PUT /links/1.json
  #def update
  #  @link = Link.find(params[:id])

  #  respond_to do |format|
  #    if @link.update_attributes(params[:link])
  #      format.html { redirect_to @link, :notice => 'Link was successfully updated.' }
  #      format.json { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.json { render :json => @link.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /links/1
  # DELETE /links/1.json
  #def destroy
  #  @link = Link.find(params[:id])
  #  @link.destroy

  #  respond_to do |format|
  #    format.html { redirect_to links_url }
  #    format.json { head :ok }
  #  end
  #end

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
