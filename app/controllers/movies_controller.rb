class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(title: params[:movie][:title],
      release_date: params[:movie][:release_date],
      synopsis: params[:movie][:synopsis],
      country: params[:movie][:country],
      length: params[:movie][:length],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id]
    )

    if @movie.save
      flash.notice = 'Movie created successfully'
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(title: params[:movie][:title],
      release_date: params[:movie][:release_date],
      synopsis: params[:movie][:synopsis],
      country: params[:movie][:country],
      length: params[:movie][:length],
      director_id: params[:movie][:director_id],
      genre_id: params[:movie][:genre_id]
    )
      flash.notice = 'Movie updated successfully'
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end
end