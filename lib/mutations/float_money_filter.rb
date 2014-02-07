module Mutations
  class FloatMoneyFilter < FloatFilter

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
