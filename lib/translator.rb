# require modules here
require "yaml"

def load_library(path)
  # code goes here
  hash = YAML.load_file(path)
  new = {"get_meaning" => {}, "get_emoticon" => {}}
  hash.each do |meaning, emo|
    new["get_meaning"][emo[1]] = meaning
    new["get_emoticon"][emo[0]] = emo[1]
  end
  return new
end

def get_japanese_emoticon(path, emo)
  # code goes here
  hash = load_library(path)
  if hash["get_emoticon"][emo] == nil
    return "Sorry, that emoticon was not found"
  else
    return hash["get_emoticon"][emo]
  end
end

def get_english_meaning(path, emo)
  # code goes here
  hash = load_library(path)
  if hash["get_meaning"][emo] == nil
    return "Sorry, that emoticon was not found"
  else
    return hash["get_meaning"][emo]
  end
end