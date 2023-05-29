module ApplicationHelper
  def page_title(title)
    # content_for(:title) { title }
    [title.presence, 'K.H.S'].compact.join(' / ')
  end
end
