class GroupMusicsController < ApplicationController
  def create
    @user = Group.find(params[:group_id]).group_users.find_by(user_id: params[:group_music][:user_id])
    @playlist = GroupPlaylist.find(params[:group_playlist_id])
    if @user != nil
      @playlist.group_musics.create(group_music_params)
    end
    redirect_to group_group_playlist_path(@playlist.group_id, @playlist)
  end

  def show
    @music = GroupMusic.find(params[:id])
  end

  def destroy
    @user = Group.find(params[:group_id]).group_users.find_by(user_id: params[:user_id])
    @playlist = GroupPlaylist.find(params[:group_playlist_id])
    if @user != nil
      @music = GroupMusic.find(params[:id])
      @music.destroy
    end
    redirect_to group_group_playlist_path(@playlist.group_id, @playlist), status: :see_other
  end

  private
    def group_music_params
      params.require(:group_music).permit(:music_id, :user_id)
    end
end
