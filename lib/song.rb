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
    song = Song.new 
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name 
    song
  end
  
  def self.create_by_name(name)
    song = Song.new 
    song.name = name
    song.save 
    song
  end
  
  def self.find_by_name(name)
    output = nil
    @@all.each do |value|
      if value.name == name 
        output = value
      end
    end
    output
  end
  
  def self.find_or_create_by_name(name)
    song = nil 
    if self.find_by_name(name) == nil 
      song = self.create_by_name(name)
    else 
      song = self.find_by_name(name)
    end
    song
  end
  
  def self.alphabetical 
    @@all.sort_by{ |song| song.name } 
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split(' ')
    dash_index = file_array.find_index('-')
    artist_array = []
    name_array = []
    file_array.each_with_index do |val, i|
      artist_array << val unless i >= dash_index 
      name_array << val unless i <= dash_index
    end
    song = Song.new 
    song.artist_name = artist_array.join(" ")
    len = name_array.last.length - 4
    name_array[-1] = name_array.last.slice(0, len)
    song.name = name_array.join(" ")
    song 
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
  
  def self.destroy_all
    @@all.clear
  end
end
