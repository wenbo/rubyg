open("temp.rb", "w") do |f|
  at_exit { File.unlink f.path } # 終了時に削除する
  f.write "temporary script\n"
end
