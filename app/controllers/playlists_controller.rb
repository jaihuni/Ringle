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

  def destroy
    @user = User.find(params[:user_id])
    @playlist = @user.playlists.find(params[:id])
    @playlist.destroy
    redirect_to user_path(@user), status: :see_other
  end

  private
    def playlist_params
      params.require(:playlist).permit(:title)
    end
end
