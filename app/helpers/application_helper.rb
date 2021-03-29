module ApplicationHelper
  def page_title
    title = "Animal images"
    title = @page_title + " - " + title if @page_title
    title
  end
end
