module Mutations
  class FloatMoneyFilter < FloatFilter
    @default_options = {
      :nils => false,       # true allows an explicit nil to be valid. Overrides any other options
      :empty => true,       # true allows empty string, false rejects empty strings as non-numeric
      :min => nil,          # lowest value, inclusive
      :max => nil           # highest value, inclusive
    }

    def initialize(opts = {})
      self.options = (self.class.default_options || {}).merge(opts)
    end

    def filter(data)
      if data.is_a?(String)
          # this presents a very lax sense of money
#        data = data.gsub(/[^0-9.+-]/, '')
          # this is a little better, but US-centric
        data = data.strip.gsub(/[$,]/, '')
      end
      super(data)
    end

  end
end
