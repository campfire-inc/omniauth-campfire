require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Campfire < OAuth2
      option :name, :campfire

      option :client_options, {
        site: "https://camp-fire.jp",
        authorize_path: "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"],
          name: raw_info["name"],
          profile: raw_info["profile"],
          profile_image_url: raw_info["profile_image_path"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed['user_data']
      end
    end
  end
end
