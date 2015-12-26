class Channel < ActiveRecord::Base
	 mount_uploader :channel_img, ChannelUploader
end
