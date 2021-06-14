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


	def pagination_options
	  {
	    renderer: DropPagination::LinkRenderer,
	    previous_label: '<i class="icon icon-hand-left"></i>',
	    next_label: '<i class="icon icon-hand-right"></i>',
	    class: 'pagination row-fluid',
	  }
	end



end


module DropPagination
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer

    def to_html
      html = pagination.map do |item|
        item.is_a?(Fixnum) ? page_number(item, total_pages) : send(item)
      end.join(@options[:link_separator])
      @options[:container] ? html_container(html) : html
    end

  protected

    def previous_or_next_page(page, text, classname)
      if page
        link(text, page, :class => classname + ' btn')
      else
        tag(:a, text, :class => classname + ' btn disabled')
      end
    end

    def page_number(page, total_pages)
      m = '<form class="form-inline">'
      m += "<select name='page'>" if page == 1

      if page == current_page
        m += tag(:option, page, value: page, selected: true)
      else
        m += tag(:option, page, value: page)
      end

      m += "</select>" if page == total_pages
      m += '</form>'

      m
    end

    # Calculates visible page numbers using the <tt>:inner_window</tt> and
    # <tt>:outer_window</tt> options.
    def windowed_page_numbers
      inner_window, outer_window = @options[:inner_window].to_i, @options[:outer_window].to_i

      # override inner window -VS
      # we want to always display all the pages
      inner_window = total_pages.to_i

      window_from = current_page - inner_window
      window_to = current_page + inner_window

      # adjust lower or upper limit if other is out of bounds
      if window_to > total_pages
        window_from -= window_to - total_pages
        window_to = total_pages
      end
      if window_from < 1
        window_to += 1 - window_from
        window_from = 1
        window_to = total_pages if window_to > total_pages
      end

      # these are always visible
      middle = window_from..window_to

      # left window
      if outer_window + 3 < middle.first # there's a gap
        left = (1..(outer_window + 1)).to_a
        left << :gap
      else # runs into visible pages
        left = 1...middle.first
      end

      # right window
      if total_pages - outer_window - 2 > middle.last # again, gap
        right = ((total_pages - outer_window)..total_pages).to_a
        right.unshift :gap
      else # runs into visible pages
        right = (middle.last + 1)..total_pages
      end

      left.to_a + middle.to_a + right.to_a
    end
  end
end
