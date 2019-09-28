module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  
  def sortable(column)
    title = column.titleize
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to title, movies_path(:sort=>column, :direction=>direction), :class=>"links", :id=>column+"_header"
  end  
  
  def sorted(column)
    puts "came to sorted"
    if(params[:sort] == column)
      return "hilite"
    else
      return "bg-warning"
    end  
  end
  
end
