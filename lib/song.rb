require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = self.new
    self.all << song
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  def self.create_by_name(name)
    self.new_by_name(name)
  end
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort_by { |song| song.name  }
  end
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    puts filename
    song = self.new
    song.name = filename[1].split(".mp3")[0]
    song.artist_name = filename[0]
    self.all << song
    song
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  def self.destroy_all
    self.all.clear
  end
end
# song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
# binding.pry
