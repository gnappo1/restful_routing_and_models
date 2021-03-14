module ApplicationHelper
    def active_css(path)
        "active" if current_page?(path)
    end
end
