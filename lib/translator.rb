require 'yaml'
require 'pry'

# {"angel"=>["O:)", "☜⌒▽⌒)☞],          ?, no closing "
# "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
# "bored"=>[":O", "(ΘεΘ;)"],
# "confused"=>["%)", "(゜.゜)"],
# "embarrased"=>[":$", "(#^.^#)"],
# "fish"=>["><>", ">゜))))彡"],
# "glasses"=>["8D", "(^0_0^)"],
# "grinning"=>["=D", "(￣ー￣)"],
# "happy"=>[":)", "(＾ｖ＾)"],
# "kiss"=>[":*", "(*^3^)/~☆],          ?, no closing "
# "sad"=>[":'(", "(Ｔ▽Ｔ)"],
# "surprised"=>[":o", "o_O"],
# "wink"=>[";)", "(^_-)"]}

def load_library(path)
  list = YAML.load_file(path)

  hash = {"get_meaning" => {}, "get_emoticon" => {}}

  list.each do |item|
    meaning = item[0]
    english = item[1][0]
    japanese = item[1][1]
    hash["get_meaning"][japanese] = meaning
    hash["get_emoticon"][english] = japanese
  end

  # item[0] = "angel", item[1][0] = "O:)", item[1][1] = "☜⌒▽⌒)☞
  # get_meaning => {"☜⌒▽⌒)☞" => "angel", "ヽ(ｏ`皿′ｏ)ﾉ" => "angry", etc...}
  # get_emoticon => {"O:)" => "☜⌒▽⌒)☞", ">:(" => "ヽ(ｏ`皿′ｏ)ﾉ", etc...}

  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  hash["get_emoticon"].each do |emo|
    if emoticon == emo[0]
      return emo[1]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  hash["get_meaning"].each do |emo|
    if emoticon == emo[0]
      return emo[1]
    end
  end
  return "Sorry, that emoticon was not found"
end
