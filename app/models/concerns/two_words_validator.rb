class TwoWordsValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value.split(" ").count < 2
            record.errors.add(attribute, "has to be two words long")
        end
    end
end