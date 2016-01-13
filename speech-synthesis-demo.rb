require File.dirname(__FILE__) + '/ispeech.rb'

Synthesizer = SpeechSynthesizer.new()
Synthesizer.set_attribute("server", "http://api.ispeech.org/api/rest")
Synthesizer.set_attribute("apikey", "developerdemokeydeveloperdemokey")
Synthesizer.set_attribute("text", "hello world")
Synthesizer.set_attribute("voice", "usenglishfemale")
Synthesizer.set_attribute("output", "json")
Synthesizer.set_attribute("format", "mp3")
result = Synthesizer.make_request()

if (result.class == Hash) #Error occured, print error
  puts result["error"]
else
  outputFile = File.new("output.mp3", "wb")
  puts outputFile.write(result)
  outputFile.close
end