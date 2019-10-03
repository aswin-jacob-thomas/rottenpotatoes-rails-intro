class MoviesController < ApplicationController
  
  helper_method :sort_attribute
  helper_method :direction_attribute

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
      
    # will render app/views/movies/show.<extension> by default
  end
  
  def sort_attribute
    params[:sort] || session['sort']
  end
  
  def direction_attribute
    params[:direction] || session['direction']
  end  
  
  def index
    @all_ratings = Movie.all_ratings  
    
    @sort = sort_attribute 
    
    @direction = direction_attribute
    
    @sort_parameters = @sort + ' ' + @direction if @sort && @direction
    
    @ratings = params[:ratings] ||session['ratings']|| @all_ratings
    
    if(params[:ratings]!=session['ratings'] or params[:sort]!=session['sort'] or params[:ratings]!=session['ratings'])
      flash.keep
      redirect_to movies_path sort: @sort, ratings: @ratings, direction: @direction
    end  
    
    @movies = Movie.where({rating:@ratings.keys}).order(@sort_parameters)
    
    session['sort'] = @sort
    session['direction'] = @direction
    session['ratings'] = @ratings
  end
  
  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
