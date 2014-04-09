# -*- coding: utf-8 -*-    

module FlickrUtil

  module Auth

    def test
      p FlickRaw.api_key
      p FlickRaw.shared_secret
    end
    module_function :test

    # open auth page
    def auth
      token = flickr.get_request_token
      auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'read')
      system "open #{auth_url}"
    end
    module_function :auth

    # verify auth code
    def verify code
      token = flickr.get_request_token
      flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], code)
      login = flickr.test.login
      puts flickr.access_token #<= Access Tokenです。メモして下さい。
      puts flickr.access_secret #<= Access Secretです。メモして下さい。
    end
    module_function :verify

  end
end
