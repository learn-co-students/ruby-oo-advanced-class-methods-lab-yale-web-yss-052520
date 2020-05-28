require 'pry'
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
    return new_song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song 
  end 

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song 
  end 

  def self.find_by_name(name)
    self.all.detect do |songs|
      songs.name == name 
    end 
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical 
    self.all.sort_by { |song| song.name }
  end 

  def self.new_from_filename(file_name)
    new_file = file_name.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3", "")

    song = self.new 
    song.name = song_name 
    song.artist_name = artist_name 
    return song
  end  

  def self.create_from_filename(file_name)
    new_file = file_name.split(" - ")
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3", "")

    song = self.create 
    song.artist_name = artist_name 
    song.name = song_name
    return song 
  end

  def self.destroy_all 
    self.all.clear
  end 
end 

# binding.pry
# 0 

