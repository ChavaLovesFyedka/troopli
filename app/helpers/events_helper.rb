module EventsHelper
  def display_date date
    date.strftime("%B %-d, %Y") 
  end
end
