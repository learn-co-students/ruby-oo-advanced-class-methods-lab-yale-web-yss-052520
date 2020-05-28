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
    another_one = self.new
    another_one.save
    another_one  
  end

  def self.new_by_name(name)
    new_one = self.new 
    new_one.name = name
    new_one  
  end

  def self.create_by_name(name)
    one_more = self.create 
    one_more.name = name
    one_more 
  end

  # def find_by_name(name, array)
  #   winner = array.find {|song_name| song_name == name}
  #   winner 
  # end

  # def self.find_by_name(name)
  #   song_search = find_by_name(name, self.all) 
  #   song_search  
  # end

  def self.find_by_name(name)
    winner = self.all.find {|song_name| song_name.name == name}
    winner 
  #  binding.pry 
  end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end 

  def self.alphabetical
    sorted = []
    sorted = self.all.sort_by do |song_name|
      song_name.name
    end
    # binding.pry
    sorted 
  end

  def self.new_from_filename(string) 
    array = string.split(/(\s-\s|\.)+/)
    artist = array[0]
    song_name = array[2]
    person = self.new_by_name(song_name)
     
    person.artist_name = array[0]
    person
    # binding.pry 
  end

   def self.create_from_filename(string)
    array = string.split(/(\s-\s|\.)+/)
    artist = array[0]
    song_name = array[2]
    person = self.create_by_name(song_name)
    person.artist_name = array[0]
    person  
  end
   
  # binding.pry
  # 0
   def self.destroy_all
     self.all.replace([])
   end
end

