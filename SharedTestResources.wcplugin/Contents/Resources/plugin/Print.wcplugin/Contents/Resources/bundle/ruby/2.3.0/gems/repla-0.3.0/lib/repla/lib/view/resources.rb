module Repla
  class View < Window
    require 'open-uri'

    require_relative "../constants"
    require_relative "../module"

    attr_accessor :title
    
    CSS_EXTENSION = ".css"
    CSS_PATH_COMPONENT = "css/"
    def shared_stylesheet_link_tag(resource)
      uri = URI.join(shared_resources_url, CSS_PATH_COMPONENT, resource + CSS_EXTENSION)
      stylesheet_link_tag(uri.to_s)
    end

    def stylesheet_link_tag(url)
      "<link rel=\"stylesheet\" href=\"#{url}\" />"
    end

    JS_EXTENSION = ".js"
    JS_PATH_COMPONENT = "js/"
    def shared_javascript_include_tag(resource)
      uri = URI.join(shared_resources_url, JS_PATH_COMPONENT, resource + JS_EXTENSION)
      javascript_include_tag(uri.to_s)
    end

    def javascript_include_tag(url)
      "<script type=\"text/javascript\" src=\"#{url}\"></script>"
    end

    def title
      @title ||= ENV.has_key?(PLUGIN_NAME_KEY) ? ENV[PLUGIN_NAME_KEY] : nil      
    end

    private

    def shared_resources_url
      @shared_resources_url || ENV.has_key?(SHARED_RESOURCES_URL_KEY) ? ENV[SHARED_RESOURCES_URL_KEY] : Repla::shared_resources_url
    end
  end
end
