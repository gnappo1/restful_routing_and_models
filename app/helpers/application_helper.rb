module ApplicationHelper
    def display_list_conditionally(collection)
        if collection.length == 0
            content_tag(:h4, "There are currently no products, go create one", class: "no-products")
        else
            tag.div class: "table table-header table--3cols" do
                tag.div class: "table-cell" do
                    content_tag(:h4, "Name")
                end
                tag.div class: "table-cell" do
                    content_tag(:h4, "Category")
                end
                tag.div class: "table-cell" do
                    content_tag(:h4, "Price")
                end
            end
            
            tag.div class: "table table--3cols" do
                render collection
            end

        end
    end

    def check_edit_path(object)
        object.call == Product ? edit_product_path(object) : edit_brand_path(object)
    end
end
