class GroupsController < ApplicationController
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]

  before_action :find_group, only: [:show, :destroy]

  def index
    @groups = Group.all
  end

  def show
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(get_params())

    if @group.save
      current_user.join!(@group)
      flash[:notice] = 'Create was successfully created.'
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])

    if @group.update(get_params())
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])

    @group.destroy

    redirect_to groups_path
  end

  def join
    @group = Group.find(params[:id])

    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
    else
      flash[:warning] = 'You already joined this group'
    end

    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])

    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
    else
      flash[:warning] = 'You are not member of this group'
    end

    redirect_to group_path(@group)
  end


private

  def get_params
    params.require(:group).permit(:title, :description)
  end

  def find_group
    @group = Group.find(params[:id])

  end


end
