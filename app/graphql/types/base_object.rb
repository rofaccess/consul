module Types
  class BaseObject < GraphQL::Schema::Object
    def self.field(*args, **kwargs, &block)
      super(*args, **kwargs, &block)

      field_name = args[0]

      if field_name.to_s.include?("_")
        reason = "Snake case fields are deprecated. Please use #{field_name.to_s.camelize(:lower)}."
        kwargs = kwargs.merge({ camelize: false, deprecation_reason: reason })
        super(*args, **kwargs, &block)
      end
    end
  end
end
