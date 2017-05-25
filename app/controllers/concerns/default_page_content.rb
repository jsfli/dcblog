module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Web Dev On Sale"
    @seo_keywords = "Web Dev On Sale"
  end
end
