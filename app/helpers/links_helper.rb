module LinksHelper

  def demo_link(controller)
    object = controller.split('/')[1].titleize || controller.titleize
    link = controller.gsub('/', '_')
    title
  end


    def action_link(method, object, controller=0, prefix=0 )
      controller   = controller.gsub('/', '_').singularize
      record       = object.id
      button_class = "btn btn-outline-dark btn-action"
      title = "#{method} #{controller}".titleize
      dataset = {toggle: "tooltip", placement: "left"}
      case
      when method == "show"
        link = link_to (content_tag(:i, "", class: 'bi bi-eye') + ""), send("#{controller}_path", {id: record}), class: button_class, data: dataset , "title"=> title
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
      when method == "pdf"
        link = link_to (content_tag(:i, "", class: 'bi bi-file-pdf') + ""), send("#{prefix}_#{controller}_path", {id: record, format: "pdf"}), class: button_class, data: dataset, "title"=> title
      when method == "inspect"
        link = []
        link << controller.inspect
        link << object.class.name.downcase
      else
        ""
      end
      link
    end

    def action_link_new(object, prefix=0 )
      button_class = "btn btn-outline-dark new_button"
      dataset = {toggle: "tooltip", placement: "left"}
      link = link_to (content_tag(:i, "", class: 'bi bi-plus') + " Create #{object.titleize}"), send("new_#{object}_path"), class: button_class, data: dataset , "title"=> "Create New #{object}"
    end

end
