class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten
      flash[:notice] = "#{@kitten.name} the kitten has been created!"
    else
      flash.now[:alert] = "You have to fill out all fields!"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update!(kitten_params)
    flash[:notice] = "#{@kitten.name} the kitten has been edited!"
    redirect_to @kitten
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "#{@kitten.name} the kitten has been destroyed :("
    redirect_to kittens_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
