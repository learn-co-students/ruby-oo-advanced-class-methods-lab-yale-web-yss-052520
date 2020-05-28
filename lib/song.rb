require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@all_song_names = []

  def self.all
    @@all
  end

  def self.clear
    self.all.clear
    self.all_song_names.clear
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    self.all << new_song
    return new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    return new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    self.all << new_song
    return new_song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.all_song_names
    self.all.each do |song|
      @@all_song_names << song.name
    end
    @@all_song_names
  end


  def self.find_or_create_by_name(song_name)
    # binding.pry
    # if self.all_song_names.include?(song_name)
      self.find_by_name(song_name) || self.create_by_name(song_name)
    # else 
    # end
  end

  def self.alphabetical
    # binding.pry
    self.all_song_names.sort.collect do |song_name|
      self.find_by_name(song_name)
    end
  end

  def self.new_from_filename(mp3_name)
    data = mp3_name.split(/(\s-\s)|(\.)/)
      a_name = data[0]
      s_name = data[2] 
    song = self.new
      song.name = s_name
      song.artist_name = a_name
    return song
  end

  def self.create_from_filename(mp3_name)
    new_song = self.new_from_filename(mp3_name)
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
# binding.pry