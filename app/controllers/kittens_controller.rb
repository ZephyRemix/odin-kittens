class KittensController < ApplicationController
  def index
    @kitten = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(params[:kitten])
    if @kitten.save
      flash[:success] = "Kitten successfully created"
      redirect_to @kitten
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
    @kitten = Kitten.find(params[:kitten])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
      if @kitten.update_attributes(params[:kitten])
        flash[:success] = "Kitten was successfully updated"
        redirect_to @kitten
      else
        flash[:error] = "Something went wrong"
        render "edit"
      end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash[:success] = "Kitten was successfully deleted."
      redirect_to kittens_url
    else
      flash[:error] = "Something went wrong"
      redirect_to kittens_url
    end
  end
end
