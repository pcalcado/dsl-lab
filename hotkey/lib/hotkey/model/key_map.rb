class KeyMap
    def initialize
        @combinations={}
    end

    def []=(keystroke,command)
        @combinations[keystroke.to_sym]=command
    end

    def [](keystroke)
        @combinations[keystroke.to_sym]
    end

    def size
        @combinations.keys.size
    end

end
