class PagesController < ApplicationController
  def home
    if current_user
      @match = Match.where(giver: current_user)
      @match = Match.where(receiver: current_user) if @match.nil?
    end
  end
end
