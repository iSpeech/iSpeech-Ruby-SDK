require File.dirname(__FILE__) + '/ispeech.rb';

Recognizer = SpeechRecognizer.new()
Recognizer.set_attribute("server", "http://api.ispeech.org/api/rest")
Recognizer.set_attribute("apikey", "developerdemokeydeveloperdemokey")
Recognizer.set_attribute("locale", "en-US")
Recognizer.set_attribute("freeform", "3")
Recognizer.set_attribute("output", "json")
Recognizer.set_attribute("content-type", "wav")

file = File.open("output.wav", "rb")
contents = file.read;
file.close;
Recognizer.set_attribute("audio", Base64.encode64(contents).gsub("\n", ""))
result = Recognizer.make_request()

if (result.class == Hash) #Error occured, print error
  puts result["error"]
else
  puts result;
end