# -*- coding: utf-8 -*-    

module FlickrUtil

  module Search

    # get recent images
    def get_recent
      list   = flickr.photos.getRecent
      list.each do |obj|
        obj_id = obj.id
        obj_secret = obj.secret
        info = flickr.photos.getInfo :photo_id => obj_id, :secret => obj_secret
        p "title = #{info.title} "
        p "info.dates.taken = #{info.dates.taken} "
      end
    end
    module_function :get_recent

  end
  
end