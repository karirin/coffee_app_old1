# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'COFFEE APP'
    if page_title.empty?
      base_title
    else
      base_title + '__' + page_title
    end
  end
end
