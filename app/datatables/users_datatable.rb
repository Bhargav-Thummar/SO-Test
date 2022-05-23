class UsersDatatable < Effective::Datatable
  datatable do
    col :full_name

    col :email

    col :is_admin, search: { as: :select, collection: [["Yes", true], ["No", false]] }
  end

  collection do
    User.accessible_by(current_ability)
  end
end