class ListMusicsController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @playlist.list_musics.create(list_music_params)
    redirect_to user_playlist_path(@playlist.user_id, @playlist)
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @music = ListMusic.find(params[:id])
    @music.destroy
    redirect_to user_playlist_path(@playlist.user_id, @playlist), status: :see_other
  end

  private
    def list_music_params
      params.require(:list_music).permit(:music_id)
    end
end
