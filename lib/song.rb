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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    cleaned_name = filename.chomp!('.mp3')
    name_array = cleaned_name.split(' - ')
    song = self.new
    song.name = name_array[1]
    song.artist_name = name_array[0]
    song
    
  end

   def self.create_from_filename(filename)
    cleaned_name = filename.chomp!('.mp3')
    name_array = cleaned_name.split(' - ')
    song = self.new
    song.name = name_array[1]
    song.artist_name = name_array[0].to_s
    @@all << song
    song
   end

   def self.destroy_all
    @@all = []
   end
    
end

#forlove = Song.new_from_filename("Thundercat - For Love I Come.mp3")

 #binding.pry
 #0