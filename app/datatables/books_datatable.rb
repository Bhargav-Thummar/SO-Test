class BooksDatatable < Effective::Datatable
  datatable do
    col :title

    col :category_id, sql_column: 'books.category', search: { as: :select, collection: Category.order(:title).map { |category| [category.title, category.id] }} do |rec|
      rec.category&.title
    end

    col :auther

    if can?(:destroy, Book)
      col :id, label: 'Actions', search: false, sort: false do |rec|
        link_to "Delete", admin_book_path(rec), method: "delete", data: { confirm: 'Are you sure to delete the book?' }
      end
    end

    if current_user.present?
      col :id, label: 'Actions', search: false, sort: false do |rec|
        link_to get_favourite_button_title(current_user, rec), add_or_remove_favorite_books_user_dashboard_index_path(rec), method: :post
      end
    end
  end

  collection do
    Book.accessible_by(current_ability)
  end
end