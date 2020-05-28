require_relative "song.rb"
require "pry"

Song.create_by_name("Beauty")
Song.create_by_name("Dumb")
Song.create_by_name("Cartoon")
Song.create_by_name("Animal")

binding.pry
0