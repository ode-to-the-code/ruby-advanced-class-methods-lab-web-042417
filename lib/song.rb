require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

  def self.create
    x = self.new
    @@all << x
    x
  end

  def self.new_by_name(name)
    # binding.pry
    x = self.new
    x.name = name
    x
  end

  def self.create_by_name(name)
    x = self.new
    x.name = name
    @@all << x
    x
  end

  def self.find_by_name(name)
    @@all.each do |instance|
        if instance.name == name
          return instance
        end
      end
  end


  def self.find_or_create_by_name(name)
      # binding.pry
      # @@all.each do |song|
      #     if song.name == name
      #       return song
      #     else
      #       x = self.create
      #       x.name = name
      #       @@all << x
      #     end
      #     x
      #   end
        if self.all.detect{|song| song.name == name} != true
        x = self.create
        x.name = name
        @@all << x
        x
      else
        return self.all.detect{|song| song.name == name}
      end


    end


  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end


  def self.new_from_filename(artist_and_name)
    x = self.new
    # artist_and_name.slice(-4..-1)
    # artist_and_name = artist_and_name.split(" - ")
    artist_and_name = artist_and_name[0..(artist_and_name.length - 5)]
    artist_and_name = artist_and_name.split(" - ")
    x.artist_name = artist_and_name[0]
    x.name = artist_and_name[1]
    x
  end

  def self.create_from_filename(artist_and_song)
    x = self.new
    # artist_and_name.slice(-4..-1)
    # artist_and_name = artist_and_name.split(" - ")
    artist_and_song = artist_and_song[0..(artist_and_song.length - 5)]
    artist_and_song = artist_and_song.split(" - ")
    x.artist_name = artist_and_song[0]
    x.name = artist_and_song[1]
    @@all  << x
  end

  def self.destroy_all
    @@all.slice!(0..-1)
  end

end
