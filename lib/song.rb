require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song=self.new
    @@all<< song
    song
  end 
  
  def self.new_by_name(song_name)
   
    song =self.new
    song.name=song_name
    song
  end
  
  def self.create_by_name(song_name_and_save)
    song=self.new
    song.name=song_name_and_save
    @@all<< song 
    song
  end
  
  def self.find_by_name(song_name)
   @@all.find{|x| x.name == song_name}
  end
  def save
    self.class.all << self
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
def self.alphabetical 
all.sort_by {|song| song.name}
end

def self.new_from_filename(filename)
  song= self.new
  song.artist_name= filename.scan(/\w+/)[0]
  song.name= filename.scan(/\w+/)[1..-2].join(" ")
  song

end 


def self.create_from_filename(filename)
 @@all << self.new_from_filename(filename) 
  
end

def self.destroy_all
  @@all.clear
  
end 
end





