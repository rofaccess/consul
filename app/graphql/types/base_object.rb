module Types
  class BaseObject < GraphQL::Schema::Object
    # def self.field(field_name, type, null:)
    #   super

    #   if field_name.include?("_")
    #     reason = "Snake case fields are deprecated. Please use #{field_name.to_s.camelize(:lower)}."
    #     super field_name, type, null: null, camelize: false, deprecation_reason: reason
    #   end
    # end

    def self.field(*args, **kwargs, &block)
      super(*args, **kwargs, &block)

      field_name = args[0]

      if field_name.to_s.include?("_")
        reason = "Snake case fields are deprecated. Please use #{field_name.to_s.camelize(:lower)}."
        kwargs = kwargs.merge({ camelize: false, deprecation_reason: reason })
        super(*args, **kwargs, &block)
      end
    end

    # def self.field_with_deprecated_sibling(field_name, type, null:)
    #   reason = "Snake case fields are deprecated. Please use #{field_name.to_s.camelize(:lower)}."

    #   field field_name, type, null: null
    #   field field_name, type, null: null, camelize: false, deprecation_reason: reason
    # end
  end
end
