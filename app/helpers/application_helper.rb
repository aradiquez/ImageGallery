module ApplicationHelper

  def btn_group view_path, edit_path, delete_path
    content_tag(:div, class: "btn-group") do
      concat link_to 'View', view_path, type: 'button', class: 'btn btn-sm btn-outline-secondary'
      concat link_to 'Edit',  edit_path, type: 'button', class: 'btn btn-sm btn-outline-secondary'
      concat link_to 'Delete', delete_path, method: :delete, data: { confirm: 'Are you sure?' },
        type: 'button', class: 'btn btn-sm btn-outline-danger'
    end
  end

  def notice_tag msg
    return unless msg
    content_tag(:div, id: "notice", class: "alert alert-success") do
      msg
    end
  end

  def errors_for(object)
    return unless object.errors.any?
    content_tag(:div, class: 'card text-white bg-danger mb-3') do
      concat(
        content_tag(:div, class: 'card-header') do
          concat(
            content_tag(:h4) do
              concat "#{pluralize(object.errors.count, 'error')}
                prohibited this #{object.class.name.downcase} from being saved:"
            end
          )
        end
      )
      concat(
        content_tag(:div, class: 'card-body') do
          concat(
            content_tag(:ul) do
              object.errors.full_messages.each do |msg|
                concat content_tag(:li, msg)
              end
            end
          )
        end
      )
    end
  end

end
