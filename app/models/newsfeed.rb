class Newsfeed < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
