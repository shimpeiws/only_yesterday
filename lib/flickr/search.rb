# -*- coding: utf-8 -*-    

module FlickrUtil

  module Search

    # get recent images
    def get_recent
      images   = flickr.photos.getRecent
      flickr_images images
    end
    module_function :get_recent

    def get_photoset photoset_id
      images = flickr.photosets.getPhotos(photoset_id: photoset_id)["photo"]
      flickr_images images
    end
    module_function :get_photoset

    def flickr_images images
      thumbnail_size = "m"
      original_size = "z"
      flickr_images = []
      images.each do |image|
        flickr_images << FlickrImage.new(
          id: image["id"],
          title: image["title"],
          description: "",
          link_url: "http://www.flickr.com/photos/#{image["owner"]}/#{image["id"]}",
          thumbnail_url: "http://farm#{image["farm"]}.static.flickr.com/#{image["server"]}/#{image["id"]}_#{image["secret"]}_#{thumbnail_size}.jpg",
          original_url: "http://farm#{image["farm"]}.static.flickr.com/#{image["server"]}/#{image["id"]}_#{image["secret"]}_#{original_size}.jpg"
        )
      end
      flickr_images
    end
    module_function :flickr_images

  end
  
end
