# require modules here
def load_library (path)
  require 'yaml'
  cnf =  YAML.load_file(path)
  get_meaning =  {}
  get_emoticon = {}
  for i,j in cnf
    get_meaning[j [1]] = i
    get_emoticon[j[0]] = j[1]
  end
  out_hash = {get_meaning:  get_meaning, get_emoticon:  get_emoticon }
return out_hash
end

def load_library_one (path)
  require 'yaml'
  cnf =  YAML.load_file(path)
  cnf[:get_meaning] = [:get_meaning]
  cnf[:get_emoticon] = [:get_emoticon]
return cnf
end

def get_japanese_emoticon (path, emo)
  cnf = load_library_one(path)
  out_put = []
  for i,j in cnf
    if j.include?(emo)
      out_put.append(j[1])
      return j[1]
    end
  end
  if out_put ==[]
    return ("Sorry, that emoticon was not found")
  end
end


def get_english_meaning (path, emo)
  cnf = load_library_one(path)
  out_put = []
  for i,j in cnf
    if j.include?(emo)
      out_put.append(i)
      return i
    end
  end
  if out_put ==[]
    return ("Sorry, that emoticon was not found")
  end
end