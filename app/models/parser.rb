require 'csv'


class Parser

  def initialize(file_path)
    @file_path = file_path
  end


  def badge_list
    CSV.foreach(@file_path) do |row|
      new_row = row.join(",")     
      name, logo, troop_type  = new_row.split(",")
      badge = Badge.create(:name => name.strip, :category => category.strip, :skill => skill.strip, :age_level => age_level.strip, :image => image.strip)
    end
  end

end
