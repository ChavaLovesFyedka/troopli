require 'csv'


class Parser

  def initialize(file_path)
    @file_path = file_path
  end


  def badge_list
    CSV.foreach(@file_path, headers: true) do |row|
      Badge.create!(row.to_hash)
    end
  end

end
