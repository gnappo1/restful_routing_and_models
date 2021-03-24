#the following code comes from the lecture on refactoring with layout, partials, and helpers
module BrandsHelper
    def active_css(path)
        "active" if current_page?(path)
    end

    def display_h1_conditionally(resource)
        if resource
            content_tag(:h1, "#{resource.name}'s Catalog", class: "products-h1-header")
        else
            content_tag(:h1, "All Products", class: "products-h1-header")
        end
    end
    
end
