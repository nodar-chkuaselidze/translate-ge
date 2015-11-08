#!/usr/bin/ruby

require 'rubygems' unless defined? Gem
require 'bundler/setup'
require 'alfred'
require 'plist'
require File.dirname(__FILE__) + '/api'

class Translate < Alfred::Handler::Base
  def initialize(alfred)
    super
    @alfred = alfred
  end

  def generate_feedback
    #feedback.add_item({
    #  uid: '0105069110201',
    #  title: 'Nooooo',
    #  subtitle: '....'
    #})
  end

  def on_action(arg)
    puts arg
  end
end


Alfred.with_friendly_error do |alfred|
  alfred.with_rescue_feedback = true

  puts "!!!!"
  puts Alfred.instance_methods(false)
end
