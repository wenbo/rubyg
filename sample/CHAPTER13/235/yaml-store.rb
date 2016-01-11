require 'yaml/store'
db = YAML::Store.new("yaml-store.yaml")
db.transaction do
  db["foo"] = 1
end
db.transaction do
  db.roots   # => ["foo"]
  db["foo"]  # => 1
end
