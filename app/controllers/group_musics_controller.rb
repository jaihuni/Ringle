class GroupMusicsController < ApplicationController
  def create
    @user = GroupUser.select(:id).find_by(group_id: params[:group_id], user_id: params[:group_music][:user_id])
    @playlist = GroupPlaylist.select(:id).find_by(group_id: params[:group_id], id: params[:group_playlist_id])
    if @user != nil
      @playlist.group_musics.create(group_music_params)
    end
    redirect_to group_group_playlist_path(params[:group_id], @playlist)
  end

  def show #delete
    @playlist = GroupPlaylist.find_by(group_id: params[:group_id], id: params[:group_playlist_id])
    @music = @playlist.group_musics.select(:id).find(params[:id])
  end

  def destroy
    @user = GroupUser.select(:id).find_by(group_id: params[:group_id], user_id: params[:user_id])
    @playlist = GroupPlaylist.select(:group_id, :id).find_by(group_id: params[:group_id], id: params[:group_playlist_id])
    if @user != nil
      @music = @playlist.group_musics.select(:id).find(params[:id])
      @music.destroy
    end
    redirect_to group_group_playlist_path(@playlist.group_id, @playlist), status: :see_other
  end

  private
    def group_music_params
      params.require(:group_music).permit(:music_id, :user_id)
    end
end
