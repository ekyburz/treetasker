class TreesController < ApplicationController
  def show
    @tree = Tree.find(params[:id])
  end

  def new
    @tree = Tree.new
  end

  def create
    @tree = Tree.new(tree_params)
    if @tree.save
      redirect_to @tree
    else
      render :new
      # hello
    end
  end

  private

  def tree_params
    params.require(:tree).permit(:name, :taks_id, :garden_id)
  end
end
