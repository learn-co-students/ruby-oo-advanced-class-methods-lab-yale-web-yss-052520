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
    new_one = self.new 
    @@all << new_one 
    return new_one 
  end 

  def self.new_by_name(new_name)
    song = self.new    
    song.name = new_name 
    song 
  end 


  def self.create_by_name(new_name)
    song = self.create     
    song.name = new_name 
    song 
  end 

  def self.find_by_name(str_name)
    @@all.find {|song| song.name == str_name}
  end 

  def self.find_or_create_by_name(str_name)
    if self.find_by_name(str_name)
      return self.find_by_name(str_name)
    end 
    self.create_by_name(str_name)  
  end 

  def self.alphabetical 
    @@all.sort_by{|obj| obj.name} 
  end 

  def self.new_from_filename(file_name)
    s_artist = file_name.split("-")[0].strip 
    s_name = file_name.split(/-|\./)[1].strip
    s_new = self.new
    s_new.name = s_name 
    s_new.artist_name = s_artist
    s_new  
  end 

  def self.create_from_filename(file_name)
    s_artist = file_name.split("-")[0].strip 
    s_name = file_name.split(/-|\./)[1].strip
    s_new = self.create 
    s_new.name = s_name 
    s_new.artist_name = s_artist
    s_new  
  end 

  def self.destroy_all
    @@all = []
  end 
end

Song.new_from_filename("Thundercat - For Love I Come.mp3")