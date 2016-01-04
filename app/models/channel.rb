class Channel < ActiveRecord::Base
	 mount_uploader :channel_img, ChannelUploader
	 def self.search(search)
	  where("name LIKE ?", "%#{search}%")
	end
end
