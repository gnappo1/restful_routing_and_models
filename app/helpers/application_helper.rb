module ApplicationHelper

    def display_list_conditionally(collection)
        if collection.length == 0
            content_tag(:h4, "There are currently no resources, go create one", class: "no-products")
        else
            tag.div class: class_name(collection) do
                render collection
                # collection does three things for us:
                # 1. iterates
                # 2. finds the right partial (has to be called like the model but singular)
                # 3. passes the object to the partial
            end
        end
    end

    def class_name(collection)
        collection.first.class == Brand ? "brand table--3cols" : "table table--3cols"
    end

    def check_edit_path(object)
        object.call == Product ? edit_product_path(object) : edit_brand_path(object)
    end

    def conditional_errors(object)
        render partial: "products/errors", locals: {object: object} if object.errors.any?
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to products_path if logged_in?
    end
end
