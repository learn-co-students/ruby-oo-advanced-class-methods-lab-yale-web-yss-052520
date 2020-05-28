require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end


  def self.new_by_name(name)
    song = self.new
    song.name = name
  
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    return create_by_name(name) if (find_by_name(name)) == nil
    find_by_name(name)
  end
          
  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    # binding.pry
    song = self.new_by_name(names[1].gsub(".mp3", ""))
    song.artist_name = names[0]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save

  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


end

