require "yaml"

def load_library(file_path)
  lib = YAML.load_file(file_path)
  translator = { "get_meaning" => {}, "get_emoticon" => {} }
  lib.each do |meaning, emoticon_array|
    emoticon_array.each_with_index do |emoticon, index|
      if index == 1
        translator["get_meaning"][emoticon] = meaning
      elsif index == 0
        translator["get_emoticon"] [emoticon] = emoticon_array[1]
      end
    end
  end
  translator
end

def get_japanese_emoticon(yaml_file_path, emoticon)
  translator = load_library(yaml_file_path)
  translator["get_emoticon"].each do |english_emote, japanese_emote|
    return japanese_emote if english_emote == emoticon
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file_path, emoticon)
  translator = load_library(yaml_file_path)
  translator["get_meaning"].each do |japanese_emote, meaning|
    return meaning if japanese_emote == emoticon
  end
  "Sorry, that emoticon was not found"
end
