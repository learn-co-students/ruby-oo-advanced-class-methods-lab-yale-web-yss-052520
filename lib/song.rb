require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # Class constructor Song.create
  # Return the song instance that was initialized and saved 
  def self.create 
    new_song = self.new 
    new_song.save #cannot use implicit self here because calling instance method within class method
    new_song
  end 

  # Class constructor Song.new_by_name 
  # @param string name of song 
  # @return song instance with name set as its property 
  def self.new_by_name(song)
    new_song = self.new 
    new_song.name = song 
    new_song 
  end 

  # Class constructor takes in string name of song
  # Returns song instance with name set as its property and 
  # song saved to the all property 
  def self.create_by_name(song)
    new_song = self.create 
    new_song.name = song 
    new_song 
  end 

  # Class finder accepts string name and returns matching instance of the song 
  # with that specific name. 
  def self.find_by_name(song)
    # binding.pry
    self.all.find {|entry| entry.name == song}
  end 

  # Find or create by name 
  def self.find_or_create_by_name(song)
    find_by_name(song).nil? ? create_by_name(song) : find_by_name(song)
  end 

  #Returns all songs in ascending alphabetical order 
  def self.alphabetical
    all.sort_by {|song| song.name}
  end 

  # Accepts parameter in following form: "Taylor Swift - Blank Space.mp3"
  # Returns a Song instance with appropriate fields initialized
  def self.new_from_filename(filename)
    song_artist, song_name, extension = filename.split(/- |\./)
    #Get rid of any extra whitespace 
    song_artist = song_artist.strip 
    song_name = song_name.strip 

    #Now assign attributes to the new instance
    new_song = create_by_name(song_name)
    new_song.artist_name = song_artist
    new_song 
  end 

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save 
  end 

  def self.destroy_all 
    self.all.clear 
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
