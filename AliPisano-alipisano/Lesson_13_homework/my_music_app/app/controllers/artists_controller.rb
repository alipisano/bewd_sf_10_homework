class ArtistsController < ApplicationController
  def index #all artists
    @artists = Artist.all
    render('index')
  end
 
  def show #one artist
    @artist = Artist.find(params[:id])
  end
 
  def new 
    @artist = Artist.new
  end
 
  def edit #taking you to the update page or ability to update
    @artist = Artist.find(params[:id])
  end
 
  def create #create a new artist
    @artist = Artist.new(artist_params)
 
    if @artist.save
      redirect_to @artist
    else
      render 'new'
    end
  end
 
  def update #the actual action of updating an artist
    @artist = Artist.find(params[:id])
 
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end
 
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
 
    redirect_to artists_path
  end
 
  private
    def artist_params
      params.require(:artist).permit(:title, :text)
    end
end