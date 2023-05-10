class ListMusicsController < ApplicationController
  def create
    @playlist = Playlist.find_by(user_id: params[:user_id], id: params[:playlist_id])
    @playlist.list_musics.create(list_music_params)
    redirect_to user_playlist_path(@playlist.user_id, @playlist)
  end

  def destroy
    @playlist = Playlist.find_by(user_id: params[:user_id], id: params[:playlist_id])
    @music = @playlist.list_musics.find(params[:id])
    @music.destroy
    redirect_to user_playlist_path(@playlist.user_id, @playlist), status: :see_other
  end

  private
    def list_music_params
      params.require(:list_music).permit(:music_id)
    end
end
