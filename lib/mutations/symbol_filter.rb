module Mutations
  class SymbolFilter < AdditionalFilter
    @default_options = {
      :strip => true,          # true calls data.strip if data is a string
      :strict => true,        # If false, then strings are converted to a symbol with to_sym.
      :nils => false,          # true allows an explicit nil to be valid. Overrides any other options
      :empty => false,         # false disallows "".  true allows "" and overrides any other validations (b/c they couldn't be true if it's empty)
    }

    def filter(data)

      # Handle nil case
      if data.nil?
        return [nil, nil] if options[:nils]
        return [nil, :nils]
      end

      # At this point, data is not nil. If it's not a string, convert it to a string for some standard classes
      if !options[:strict] && data.is_a?(String)
        data = data.strip if options[:strip]
        return [data, :empty] if data == ""
        data = data.to_sym if !options[:strict] && data.is_a?(String)
      end

      # Now ensure it's a symbol:
      return [data, :symbol] unless data.is_a?(Symbol)

      # We win, it's valid!
      [data, nil]
    end
  end
end
