require 'yaml/dbm'
YAML::DBM.open("yaml-dbm.yaml") do |dbm|
  dbm["one"] = "1"
  dbm["two"] = 2
  dbm["many"] = 3..9999
end
YAML::DBM.open("yaml-dbm.yaml") do |dbm|
  dbm["one"]   # => "1"
  dbm["two"]   # => 2
  dbm["many"]  # => 3..9999
  dbm.keys     # => ["one", "two", "many"]
end
