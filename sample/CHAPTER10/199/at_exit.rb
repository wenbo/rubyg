open("temp.rb", "w") do |f|
  at_exit { File.unlink f.path } # ��λ���˺������
  f.write "temporary script\n"
end
