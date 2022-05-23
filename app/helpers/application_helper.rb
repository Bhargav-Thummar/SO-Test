module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice', 'success' then 'alert alert-info'
    when 'error', 'alert' then 'alert alert-danger'
    end
  end
  
  def get_dashboard_path(user)
    if user.is_admin?
      admin_dashboard_index_path
    else
      user_dashboard_index_path
    end
  end

  def get_favourite_button_title(user, book)
    user.favourite_books.where(book_id: book.id).present? ? "Remove from Favourites" : "Add to Favourites"
  end
end
