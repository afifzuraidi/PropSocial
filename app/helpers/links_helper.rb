module LinksHelper

  def action_link(method, object, controller=0, prefix=0 )
    controller   = controller.gsub('/', '_').singularize
    record       = object.id
    button_class = "btn btn-outline-dark btn-action"
    title = "#{method} #{controller}".titleize
    dataset = {toggle: "tooltip", placement: "left"}
    case
    when method == "edit"
      link = link_to (content_tag(:i, "", class: 'bi bi-pencil') + ""), send("edit_#{controller}_path", {id: record}), class: button_class, data: dataset, "title"=> title
    when method == "approve"
      link = link_to (content_tag(:i, "", class: 'bi bi-check-lg') + ""), send("approve_#{controller}_path", {id: record}), data: { turbo_method: :patch }, class: button_class, data: dataset, "title"=> title
    when method == "reject"
      link = link_to (content_tag(:i, "", class: 'bi bi-ban') + ""), send("reject_#{controller}_path", {id: record}), data: { turbo_method: :patch }, class: button_class, data: dataset, "title"=> title
    when method == "archive"
      link = link_to (content_tag(:i, "", class: 'bi bi-archive') + ""), send("archive_#{controller}_path", {id: record}), data: { turbo_method: :patch }, class: button_class, data: dataset, "title"=> title
    when method == "delete"
      link = link_to (content_tag(:i, "", class: 'bi bi-trash') + ""), send("#{controller}_path", {id: record}), data: { turbo_method: :delete, turbo_confirm: "Are you sure?" }, class: button_class, "title"=>title
    end
    link
  end
end
