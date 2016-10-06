###
# TranslateGE API
####

require 'net/http'
require 'uri'
require 'json'

class TranslateGe
  @@url = "http://translate.ge/"

  def initialize()
    uri = URI.parse @@url

    @http = Net::HTTP.new uri.host, uri.port
  end

  def is_en?(word)
    word.chars[0].between?('a', 'z')
  end

  def get_lang(word)
    is_en?(word) ? 'en' : 'ge'
  end

  def search(word)
    path = '/api/' + URI.escape(word)
    request = Net::HTTP::Get.new path

    object = JSON.parse @http.request(request).body

    return object["rows"]
  end
end
