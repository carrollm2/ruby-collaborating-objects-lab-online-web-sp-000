class Song
  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def self.new_by_filename(file_name)
    file_name_array = file_name.split("-")

    stripped_file_names = []
    file_name_array.each do | fn|
      stripped_file_names.push(fn.strip)
    end

    song = Song.new(stripped_file_names[1])
    song.artist_name=(stripped_file_names[0])
    # song.artist = Artist.new(stripped_file_names[0])
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
