class GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group.group_users.create(group_user_params)
    redirect_to group_path(@group)
  end

  def destroy
    @user = GroupUser.find_by(group_id: params[:group_id], id: params[:id])
    @user.destroy
    redirect_to group_path(@user.group_id), status: :see_other
  end

  private
    def group_user_params
      params.require(:group_user).permit(:user_id)
    end
end
