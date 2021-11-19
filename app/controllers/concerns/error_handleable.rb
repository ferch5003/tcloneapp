module ErrorHandleable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render404
  end

  private

  def render404
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, alert: "Can't find anything, please search again" }
    end
  end
end
