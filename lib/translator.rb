# require modules here

def load_library(file)
  require 'yaml'
  cnf = YAML.load(File.open(file))
  new_hash = Hash.new(0)
  new_hash["get_meaning"] = Hash.new(0)
  new_hash["get_emoticon"] = Hash.new(0)
  new_hash["get_meaning"] = cnf.inject({}){|hash, (k, v)| hash.merge(v[1] => k)}
  new_hash["get_emoticon"] = cnf.inject({}){|hash, (k, v)| hash.merge(v[0] => v[1])}

  new_hash
end

def get_japanese_emoticon(file, emoticon)
  cnf = load_library(file)
  cnf["get_emoticon"].each do |key, value|
    if key == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  cnf = load_library(file)
  cnf["get_meaning"].each do |key, value|
    if key == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end
