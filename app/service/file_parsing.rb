class FileParsing
  def initialize(file:)
    @file = file
    @parsed_info = []
  end

  def parse
    File.foreach( @file.path ).with_index do |line, index|
      @parsed_info << line.match(/\d+/).to_s.to_i
    end

    @parsed_info
  end

end