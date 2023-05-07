class GroupUsersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group.group_users.create(group_user_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @user = GroupUser.find(params[:id])
    @user.destroy
    redirect_to group_path(@group), status: :see_other
  end

  private
    def group_user_params
      params.require(:group_user).permit(:user_id)
    end
end
