module Mutations
  class FloatMoneyFilter < FloatFilter

    def filter(data)
      if data.is_a?(String)
          # this presents a very lax sense of money
        data = data.gsub(/[^0-9.+-]/, '')
      end
      super(data)
    end

  end
end
