module ApplicationHelper
    def display_text_for_no_resource(collection)
        if collection.length == 0
            content_tag(:h4, "There are currently no products, go create one", class: "no-products")
        end
    end
end
