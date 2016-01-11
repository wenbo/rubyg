File.fnmatch '\*', '*'                          # => true
File.fnmatch '\*', '*', File::FNM_NOESCAPE      # => false
File.fnmatch '\*', '\hoge', File::FNM_NOESCAPE  # => true

File.fnmatch '*', '/'                      # => true
File.fnmatch '*', '/', File::FNM_PATHNAME  # => false

File.fnmatch '*.txt', 'FOO.TXT'                      # => false
File.fnmatch '*.txt', 'FOO.TXT', File::FNM_CASEFOLD  # => true

File.fnmatch '*', '.emacs'                      # => false
File.fnmatch '*', '.emacs', File::FNM_DOTMATCH  # => true

File.fnmatch '*.el', '.emacs.EL', File::FNM_DOTMATCH | File::FNM_CASEFOLD  # => true
