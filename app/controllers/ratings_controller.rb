class RatingsController < ApplicationController

  def index
    Rails.cache.write('beer top 3', Beer.top(3), :expires_in => 10.minutes)
    Rails.cache.write('brewery top 3', Brewery.top(3), :expires_in => 10.minutes)
    Rails.cache.write('style top 3', Style.top(3), :expires_in => 10.minutes)
    Rails.cache.write('rating latest 5', Rating.latest(5), :expires_in => 10.minutes)
    Rails.cache.write('user active 5', User.most_active(5), :expires_in => 10.minutes)
    Rails.cache.write('rating all', Rating.all, :expires_in => 10.minutes)

    @top_beers = Rails.cache.read 'beer top 3'
    @top_breweries = Rails.cache.read 'brewery top 3'
    @top_styles = Rails.cache.read 'style top 3'
    @recent_ratings = Rails.cache.read 'rating latest 5'
    @most_active_users = Rails.cache.read 'user active 5'
    @ratings = Rails.cache.read 'rating all'
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.create params.require(:rating).permit(:score, :beer_id)
    if current_user.nil?
      redirect_to signin_path, notice:'you should be signed in'
    elsif @rating.save
      current_user.ratings << @rating  ## virheen aiheuttanut rivi
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end
  
  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end  
end