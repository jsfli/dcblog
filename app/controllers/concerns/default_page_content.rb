module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Jeff's portfolio website"
    @seo_keywords = "Jeffrey Li portfolio"
  end
end
