class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                #data validation, reject if blank
                                reject_if: lambda {|attrs| attrs['name'].blank?}

  include Placeholder

  validates_presence_of :title, :body, :main_image, :thumb_image

#########################################################################
  # CUSTOM SCOPES EXAMPLES
  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails, -> {where(subtitle: 'Ruby on Rails')}
#########################################################################


  after_initialize :set_defaults

  def set_defaults
    # ||= is a short cut for the below codes
    # if self.main_image == nil
    #   self.main_image = "http://placehold.it/600x400"

    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

end
