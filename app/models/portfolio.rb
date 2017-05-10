class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image



  # CUSTOM SCOPES EXAMPLES
  # def self.angular
  #   where(subtitle: "Angular")
  # end
  #
  # scope :ruby_on_rails, -> {where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    # ||= is a short cut for the below codes
    # if self.main_image == nil
    #   self.main_image = "http://placehold.it/600x400"
    
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x150"
  end

end
