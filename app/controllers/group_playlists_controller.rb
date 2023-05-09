class GroupPlaylistsController < ApplicationController
  def create
    @group = Group.select(:id).find(params[:group_id])
    @group.group_playlists.create(playlist_params)

    @playlist_list = GroupPlaylist.where("group_id = ?", params[:group_id])
    @list_count = @playlist_list.count(:id)
    if(@list_count > 100)
      @old_list = @playlist_list.select(:id).order('created_at ASC').first
      @old_list.destroy
    end

    redirect_to group_path(@group)
  end

  def show
    @playlist = GroupPlaylist.select(:id, :name, :group_id).find_by(id: params[:id], group_id: params[:group_id])
  end

  def update
    @playlist = GroupPlaylist.find_by(id: params[:id], group_id: params[:group_id])

    if @playlist.update(playlist_params)
      redirect_to group_group_playlist_path(@playlist.group_id, @playlist)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist = GroupPlaylist.find_by(id: params[:id], group_id: params[:group_id])
    @playlist.destroy
    redirect_to user_path(@user), status: :see_other
  end

  private
    def playlist_params
      params.require(:group_playlist).permit(:name)
    end
end
