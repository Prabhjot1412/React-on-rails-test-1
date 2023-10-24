class MainPageController < ApplicationController
  def index
    @main_page_index_props = {
      **user_details,
      csrf_token: session[:_csrf_token],
      difficulties: Profile::DIFFICULTIES,
      profile_create_path: profile_index_path,
      redirect_path: root_path,
    }
  end

  private

  def user_details
    return {} unless current_user.present?

    current_user.to_hash
  end
end
