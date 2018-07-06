class Listing < ApplicationRecord
	belongs_to :sort
	mount_uploaders :image, ImageUploader
	serialize :image, JSON # If you use SQLite, add this line.
end
