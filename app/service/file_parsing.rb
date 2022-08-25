class FileParsing
  def initialize(file:)
    @file = file
    @parsed_file = []
  end

  def parse
    File.foreach(@file.path).with_index do |line, _index|
      parsed_line = {}
      parsed_line[:title] = line.match(/\D+/).to_s.strip
      parsed_line[:duration] = line.match?('lightning') ? 5 : line.match(/\d+/).to_s.to_i

      @parsed_file << parsed_line
    end

    @parsed_file
  end
end
