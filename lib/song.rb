require "pry"

class Song

  attr_accessor :artist_name, :name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    s = self.new
    s.name = song_name
    s
  end

  def self.create_by_name(song_name)
    s = self.new
    s.name = song_name
    s
    @@all << s
    s
  end

  def self.find_by_name(title)
    Song.all.find do |i|
      if title == i.name
        title
      end
    end
  end

  def self.find_or_create_by_name(title)
    if title == Song.find_by_name(title)
      Song.find_by_name(title)
    elsif
      Song.create_by_name(title)
    end
    Song.find_by_name(title) || Song.create_by_name(title)
  end

  def self.alphabetical
    Song.all.sort_by do |a|
      a.name
    end
  end

  def self.new_from_filename(filename)
    title = filename.split(".")
    title.collect do |words|
      i = words.split(" - ")
      name = i[1]
      artist_name = i[0]

    #binding.pry
    end
  end
end
