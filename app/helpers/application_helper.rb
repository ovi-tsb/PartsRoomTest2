module ApplicationHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		# link_to title, params.merge(:sort => column, :direction => direction, :page => nil).permit(:sort, :direction, :page), {:class => css_class}
		link_to title, params.to_unsafe_h.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
		# link_to title, params.permit(:page).merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}



		# link_to title, params.merge(:sort => "column", :direction => "direction", :page => nil), {:class => "css_class"}



		# link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end
end
