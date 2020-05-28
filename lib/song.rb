require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end


  def self.find_or_create_by_name(song_name)
   if  self.find_by_name(song_name)
    self.find_by_name(song_name)
   else 
    self.create_by_name(song_name)
   end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    split_parts_array1 = filename.split(" - ")
    song.name = split_parts_array1[1].chomp(".mp3")
    song.artist_name = split_parts_array1[0]
    song
  end

  def self.create_from_filename (filename)
    song = self.new
    split_parts_array1 = filename.split(" - ")
    song.name = split_parts_array1[1].chomp(".mp3")
    song.artist_name = split_parts_array1[0]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end


end
