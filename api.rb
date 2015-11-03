###
# TranslateGE API
####

require 'net/http'
require 'uri'
require 'json'

class TranslateGe
  @@url = "http://beta.translate.ge/"

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
    params = {
      "lang" => get_lang(word),
      "text" => word
    }

    query = params.map{|k, v| "#{k}=#{v}" }.join("&")
    path = '/Main/Translate?' + URI.escape(query)
    request = Net::HTTP::Get.new path

    object = JSON.parse @http.request(request).body

    return object
  end
end
