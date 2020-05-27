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
    # @@all << song
    song
    
  end

  def self.create_by_name(name)
    song =  self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.each do |element|
      if element.name == name
        return element
      end
      
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ||= self.create_by_name(name)
    song
  end

  def self.alphabetical
    sorted = @@all.sort_by(&:name)
    sorted.map do |element|
      element.name
    end
    sorted
  end

  def self.new_from_filename(filename)
    arr = filename.split(/ - |.mp3/)
    song = Song.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
    
  end

  def self.create_from_filename(filname)
    song = self.new_from_filename(filname)
    song.save
  end

  def self.destroy_all
    @@all = []
  end



end
