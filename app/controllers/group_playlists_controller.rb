class GroupPlaylistsController < ApplicationController
  def show
    @playlist = GroupPlaylist.find_by(id: params[:id], group_id: params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @playlist = @group.group_playlists.create(playlist_params)

    @list_count = GroupPlaylist.where("group_id = ?", params[:group_id]).count
    if(@list_count > 100)
      @old_list = GroupPlaylist.where("group_id = ?", params[:group_id]).order('created_at ASC').first
      @old_list.destroy
    end

    redirect_to group_path(@group)
  end

  def edit
    @playlist = GroupPlaylist.find_by(id: params[:id], group_id: params[:group_id])
  end

  def update
    @playlist = GroupPlaylist.find_by(id: params[:id], group_id: params[:group_id])

    if @playlist.update(playlist_params)
      redirect_to user_playlist_path(@playlist.user_id, @playlist)
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
