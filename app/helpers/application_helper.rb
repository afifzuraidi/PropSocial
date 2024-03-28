module ApplicationHelper
    def title(controller, suffix=0 )
        title = controller.titleize
        title = controller.split('/')[1].titleize if title.include?("/")
        link = controller.gsub('/', '_')
        page_title = content_tag(:h1, title, class: "display-6")
        link_new   = content_tag(:p, (link_to (content_tag(:i, "", class: 'bi bi-plus') + " New " + title), send("new_#{link.singularize}_path"), class: "btn btn-outline-dark new_button"), class: "link_right")
        suffix == "nonew" ? page_title : page_title + link_new
    end    
end
