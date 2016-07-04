#!/usr/bin/ruby

require 'rubygems' unless defined? Gem
require 'bundler/setup'
require 'alfred'
require 'plist'
require File.dirname(__FILE__) + '/api'

translater = TranslateGe.new

Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  fb = alfred.feedback

  word = ARGV[0]

  res = translater.search word
  res.each {|o|
    fb.add_item({
      :uid => "",
      :title => o["Word"],
      :subtitle => o["Text"]
    })
  }

  puts fb.to_xml(ARGV)
end
