#!/usr/local/bin/ruby
require 'rubygems'
require 'file/tail'
# ���ޥ�ɥ饤������Υե�������Ф��ơ�tail -f�פ򥨥ߥ�졼�Ȥ��롣
ARGF.file.extend(File::Tail).tail {|line| puts line }
