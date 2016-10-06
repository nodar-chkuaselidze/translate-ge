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
  res.each {|v|
    o = v["value"]

    fb.add_item({
      :uid => "",
      :title => o["Word"].gsub(/\s+/, ' '),
      :subtitle => o["Text"].gsub(/\s+/, ' ').strip
    })
  }

  puts fb.to_xml(ARGV)
end
