class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end
  # 实作看板的“新增” new / create
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    # @group.save
    # flash[:notice] = "New Success"
    if @group.save
      redirect_to groups_path notice: "New Success"
    else
      render :new
    end
    # redirect_to groups_path notice: "New Success"
  end
  # 实作看板的“编辑” edit / update
  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    # @group.update(group_params)
    if @group.update(group_params)
      redirect_to groups_path, notice: "Update Success"
    else
      render :edit
    end
    # flash[:notice] = "Update Success"
    # redirect_to groups_path, notice: "Update Success"
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    # flash[:alert] = "Group deleted"
    redirect_to groups_path, alert: "Group deleted"
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
