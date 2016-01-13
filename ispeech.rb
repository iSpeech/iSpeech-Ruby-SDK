require "net/http"
require "URI"
require "base64"

class ISpeech

  def initialize()
    @parameters = {"device-type"=>"ruby-sdk-0.1"}
    @server = ""
  end

  def set_attribute(key, value)
    if (key == "server")
      @server = URI.parse(value);
    else
      @parameters[key] = value;
    end

  end

  def make_request()
    request = Net::HTTP::Get.new(@server.path+"?"+URI.encode_www_form(@parameters))
    response = Net::HTTP.start(@server.host, @server.port) {|http|
      http.request(request)
    }

    if (response.code != "200")
      return {"error"=>response.body}
    else
      return response.body
    end

  end

end

class SpeechSynthesizer < ISpeech
  def initialize()
    super()
    set_attribute("action", "convert")
  end
end

class SpeechRecognizer < ISpeech
  def initialize()
    super()
    set_attribute("action", "recognize")
  end
end


