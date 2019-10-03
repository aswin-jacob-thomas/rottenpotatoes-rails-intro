module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def sortable(column)
    title = column.titleize
    direction = column == sort_attribute && direction_attribute == "asc" ? "desc" : "asc"
    link_to title, movies_path(:sort=>column, :direction=>direction), :class=>"links", :id=>column+"_header"
  end  
  
  def sorted(column)
    if(sort_attribute == column)
      return "hilite"
    else
      return "bg-warning"
    end  
  end
  
end
