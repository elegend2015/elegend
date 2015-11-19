class Pannel < ActiveRecord::Base
	mount_uploader :pannel_img, PannelUploader
end
