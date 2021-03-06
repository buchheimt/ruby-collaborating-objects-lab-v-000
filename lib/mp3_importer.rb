class MP3Importer

attr_accessor :path, :filenames

  def initialize(path)
    @path = path
    @filenames = []
  end

  def files
    Dir["#{@path}/**/*.mp3"].each do |filename|
      @filenames << filename[filename.rindex("/") + 1..-1]
    end
    @filenames
  end

  def import
    self.files
    @filenames.map {|file| Song.new_by_filename(file)}
  end

end
