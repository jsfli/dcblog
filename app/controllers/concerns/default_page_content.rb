module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "WebDev大減價"
    @seo_keywords = "WebDev大減價"
  end
end
