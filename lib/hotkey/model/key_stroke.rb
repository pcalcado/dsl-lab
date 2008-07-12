class KeyStroke
    attr_reader :key

    def initialize(key)
        @key=key
    end

    def to_sym
        key
    end
end
