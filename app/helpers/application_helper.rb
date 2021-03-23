module ApplicationHelper
    def display_list_conditionally(collection)
        if collection.length == 0
            content_tag(:h4, "There are currently no resources, go create one", class: "no-products")
        else
            tag.div class: class_name(collection) do
                render collection
            end
        end
    end

    def class_name(collection)
        collection.first.class == Brand ? "brand table--3cols" : "table table--3cols"
    end

    def check_edit_path(object)
        object.call == Product ? edit_product_path(object) : edit_brand_path(object)
    end
end
