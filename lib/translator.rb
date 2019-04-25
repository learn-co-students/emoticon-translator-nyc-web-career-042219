# require modules here
require 'yaml'
require 'pry'
def load_library(filepath)
  # code goes here
  file = YAML.load_file(filepath)
  result = {'get_meaning' => {}, 'get_emoticon' => {}}

  file.each do |meaning, emoticon|
    emoticon.each do |emote|
      result['get_meaning'][emote] = meaning
    end
    result['get_emoticon'][emoticon[0]] = emoticon[1]
  end
  result
end

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  hash = load_library(filepath)
  result = hash['get_emoticon'].find {|k, v| emoticon == k}
  if result == nil
    "Sorry, that emoticon was not found"
  else
    result[1]
  end
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  hash = load_library(filepath)
  result = hash['get_meaning'].find {|k, v| emoticon == k}
  if result == nil
    "Sorry, that emoticon was not found"
  else
    result[1]
  end
end
