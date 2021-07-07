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
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.new_from_filename(file_name)
    arr = file_name.split(/\./)[0].split(' - ')
    puts "#{arr}"
    song = self.new_by_name(arr[1])
    song.artist_name = arr[0]
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    end
    song
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
