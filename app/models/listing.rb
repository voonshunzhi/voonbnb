class Listing < ApplicationRecord
	include PgSearch
  	pg_search_scope :search,:against => [:country,:state,:street,:city,:name],:using => {
                     :tsearch => {:prefix => true}
                   }
	belongs_to :sort
	belongs_to :user
	mount_uploaders :image, ImageUploader
end
