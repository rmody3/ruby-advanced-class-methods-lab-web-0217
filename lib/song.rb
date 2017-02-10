require "pry"

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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    check = self.find_by_name(name)
    if check
      check
    else
      self.new_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song| song.name end
  end

  def self.convert_filename(filename)
    filename = filename.chomp!(".mp3")
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    {artist: artist, name: name}
  end

  def self.new_from_filename(filename)
    song_info = self.convert_filename(filename)
    song = self.new_by_name(song_info[:name])
    song.artist_name = song_info[:artist]
    song
  end

  def self.create_from_filename(filename)
    song_info = self.convert_filename(filename)
    song = self.create_by_name(song_info[:name])
    song.artist_name = song_info[:artist]
    song
  end

  def self.destroy_all
    self.all.clear
  end









end
