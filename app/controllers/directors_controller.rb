class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(name: params[:director][:name],
      nationality: params[:director][:nationality],
      dob: params[:director][:dob],
      genre_id: params[:director][:genre_id]
    )

    if @director.save
      flash.notice = 'Director created successfully'
      redirect_to director_path(@director.id)
    else
      render :new
    end
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])

    if @director.update(name: params[:director][:name],
      nationality: params[:director][:nationality],
      dob: params[:director][:dob],
      genre_id: params[:director][:genre_id]
    )
      flash.notice = 'Director updated successfully'
      redirect_to director_path(@director.id)
    else
      render :edit
    end
  end
end