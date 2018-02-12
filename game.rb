#!/usr/bin/env ruby

require 'tty-prompt'
require_relative 'session'
require_relative 'helpers/output'

include Output

prompt = TTY::Prompt.new

# Introduction
puts 'Welcome to lot!'


# Play?
q_play = prompt.yes? 'Would you like to play?'
return unless q_play


# Name?
q_name = prompt.ask 'What\'s your name?'


# X Create Game
game = Session.new
game.add_player(q_name)


# Start?
q_start = prompt.yes? 'Shall we start?'
return unless q_start


# X Start
game.start


cards = game.field.cards
formatted_cards = cards.map do |c|
  Output::Card.new.call(c)
end

puts Output::Field.new.call(formatted_cards)
