class ListMusicsController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist_id])
    @list_music = @playlist.list_musics.create(list_music_params)
    redirect_to user_playlist_path(@playlist.user, @playlist)
  end

  def create_array_form
    @playlist = Playlist.find(params[:playlist_id])
  end

  def create_array
    @playlist = Playlist.find(params[:playlist_id])

    params[:list_music] = {}
    params[:music_id_array].each do |music|
      params[:list_music][:music_id] = music
      @list_music = @playlist.list_musics.create(list_music_params)
    end

    redirect_to user_playlist_path(@playlist.user_id, @playlist)
  end

  def destroy_array_form
    @playlist = Playlist.find(params[:playlist_id])
  end

  def destroy_array
    @playlist = Playlist.find(params[:playlist_id])

    params[:id_array].each do |id|
      @music = @playlist.list_musics.find(id)
      @music.destroy
    end
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @music = @playlist.list_musics.find(params[:id])
    @music.destroy
    redirect_to user_playlist_path(@playlist.user_id, @playlist), status: :see_other
  end

  private
    def list_music_params
      params.require(:list_music).permit(:music_id)
    end
end
