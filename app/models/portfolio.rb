class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                #data validation, reject if blank
                                reject_if: lambda {|attrs| attrs['name'].blank?}

  validates_presence_of :title, :body
  # carrierwave gem method for image uploading
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

#########################################################################
  # CUSTOM SCOPES EXAMPLES
  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails, -> {where(subtitle: 'Ruby on Rails')}
#########################################################################

  def self.by_position
    order("position ASC")
  end
end
