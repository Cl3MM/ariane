module ApplicationHelper
  def css(*files)
    content_for(:head) { stylesheet_link_tag(*files) }
  end
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
end
