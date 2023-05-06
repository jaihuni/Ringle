class PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.create(playlist_params)

    @list_count = Playlist.where("user_id = ?", params[:user_id]).count
    if(@list_count > 100)
      @old_list = Playlist.where("user_id = ?", params[:user_id]).order('created_at ASC').first
      @old_list.destroy
    end

    redirect_to user_path(@user)
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update(playlist_params)
      redirect_to user_playlist_path(@playlist.user_id, @playlist)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to user_path(@user), status: :see_other
  end

  def add_musics_form
    @playlist = Playlist.find(params[:playlist_id])
    @count = 5
    if params[:input] && params[:input] != ""
      @count = params[:input].to_i
    end
  end

  def add_musics
    @playlist = Playlist.find(params[:playlist_id])

    params[:list_music] = {}
    params[:music_id_array].each do |music|
      params[:list_music][:music_id] = music
      @list_music = @playlist.list_musics.create(list_music_params)
    end

    redirect_to user_playlist_path(@playlist.user_id, @playlist)
  end

  def delete_musics_form
    @playlist = Playlist.find(params[:playlist_id])
    @count = 5
    if params[:input] && params[:input] != ""
      @count = params[:input].to_i
    end
  end

  def delete_musics
    @playlist = Playlist.find(params[:playlist_id])

    params[:id_array].each do |id|
      @music = @playlist.list_musics.find(id)
      @music.destroy
    end
  end

  private
    def playlist_params
      params.require(:playlist).permit(:title)
    end

    def list_music_params
      params.require(:list_music).permit(:music_id)
    end
end
