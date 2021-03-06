class RecommendationsController < ApplicationController
  before_filter :require_login, only: [:index]

  def index
    @recommendations = Recommendation.recommendations_for(current_user, params[:languange])
  end
end
