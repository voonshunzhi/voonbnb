class Listing < ApplicationRecord
	include PgSearch
	validates :name,presence:true
	validates :price_per_night,presence:true,numericality:true
  	pg_search_scope :search,:against => [:country,:state,:street,:city,:name],:using => {
                     :tsearch => {:prefix => true}
                   }
	belongs_to :sort
	belongs_to :user
	has_many :reservations,dependent: :destroy
	mount_uploaders :image, ImageUploader

	def image_uploaded_is_less_than_5 
		image.length >= 5 ? false : true
	end
end
