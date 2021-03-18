#the following code comes from the lecture on refactoring with layout, partials, and helpers
module BrandsHelper
    def active_css(path)
        "active" if current_page?(path)
    end
    
end
