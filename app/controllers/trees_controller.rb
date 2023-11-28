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
    end
  end
end
