class ClansController < ApplicationController
  before_action :logged_in_user, only: [:new, :destroy]
  before_action :correct_user,   only: :destroy


def index
end

def dasboard

end


def show

  @user = current_user
  @alliancerequest = @user.alliancerequest
end


  def new
    @user = current_user
          @alliancerequest = current_user.build_alliancerequest if logged_in?
          @alliancerequest = @user.alliancerequest
     end



end
