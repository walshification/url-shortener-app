class Link < ActiveRecord::Base
  validates :slug, :presence => true
  validates :slug, :uniqueness => true
  validates :target_url, :presence => true

  belongs_to :user
end
