# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  library = YAML.load_file(file)
  # binding.pry
  new_hash ={"get_emoticon" => {}, "get_meaning" => {}}
  library.each do |name, emoticons|
  	# binding.pry
  	new_hash["get_meaning"][emoticons[1]] = name
  	new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  new_hash
end

def get_japanese_emoticon(file, emoticon)
	emoticon_hash = load_library(file)
  	if !emoticon_hash["get_emoticon"][emoticon]
  		"Sorry, that emoticon was not found"
  	else
  		emoticon_hash["get_emoticon"][emoticon]
  	end
end

def get_english_meaning(file, emoticon)
	emoticon_hash = load_library(file)
	if !emoticon_hash["get_meaning"][emoticon]
		"Sorry, that emoticon was not found"
	else 
		emoticon_hash["get_meaning"][emoticon]
	end
end