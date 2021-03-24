module ProductsHelper
    def nested_product_form_conditional(resource, nested_resource, f)
        if !nested_resource
            render partial: "nested_brand", locals: {f: f, product: resource}
        else
            f.hidden_field :brand_id, value: nested_resource.id
        end
    end
end
