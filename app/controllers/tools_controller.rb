class ToolsController < ApplicationController

  before_action :set_tool, only: [:show, :edit, :update, :destroy]

  def index
    @tools = Tool.all
    session[:most_recent_tool_id] = Tool.all.last.id
  end

  def show
    set_tool
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @user = User.find(session[:user_id])
    if @tool.save
      flash[:notice] = "Tool created."
      @user.tools << @tool
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
    end
    redirect_to tools_path #index
    # redirect_to tool_path(tool) #show
  end

  def edit
    set_tool
  end

  def update
    set_tool
    @tool.update(tool_params)
    redirect_to @tool
  end

  def destroy
    set_tool
    @tool.destroy
    redirect_to tools_path
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :use)
  end

end
