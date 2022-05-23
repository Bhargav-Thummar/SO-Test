class CategoriesDatatable < Effective::Datatable
  datatable do
    col :title

    if can?(:destroy, Category)
      col :id, label: 'Actions', search: false, sort: false do |rec|
        link_to "Delete", admin_category_path(rec), method: "delete", data: { confirm: 'Are you sure to delete the category?' }
      end
    end
  end

  collection do
    Category.accessible_by(current_ability)
  end
end