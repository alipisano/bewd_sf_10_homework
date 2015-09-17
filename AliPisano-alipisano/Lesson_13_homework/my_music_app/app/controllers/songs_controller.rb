class songsController < ApplicationController
  def index #all songs
    @songs = Song.all
  end
 
  def show #one song
    @song = Song.find(params[:id])
  end
 
  def new 
    @song = Song.new
  end
 
  def edit #taking you to the update page or ability to update
    @song = Song.find(params[:id])
  end
 
  def create #create a new song
    @song = Song.new(song_params)
 
    if @song.save
      redirect_to @song
    else
      render 'new'
    end
  end
 
  def update #the actual action of updating an song
    @song = Song.find(params[:id])
 
    if @song.update(song_params)
      redirect_to @song
    else
      render 'edit'
    end
  end
 
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
 
    redirect_to songs_path
  end
 
  private
    def song_params
      params.require(:song).permit(:title, :text)
    end
end