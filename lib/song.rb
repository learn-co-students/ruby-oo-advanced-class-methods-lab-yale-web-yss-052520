require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create()
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |s|
      s.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical()
    self.all.sort_by do |s|
      s.name
    end
  end

  def self.new_from_filename(filename)
    ary = filename.split("-")
    song = self.new
    song.name = ary[1][1...-4]
    song.artist_name = ary[0][0...-1]
    song
  end

  def self.create_from_filename(filename)
    ary = filename.split("-")
    song = self.new
    song.name = ary[1][1...-4]
    song.artist_name = ary[0][0...-1]
    self.all << song
  end

  def self.destroy_all()
    self.all.clear
  end


  def save
    self.class.all << self
  end

end

#song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
#puts song.name #=> "Blank Space"
#puts song.artist_name #=> "Taylor Swift"