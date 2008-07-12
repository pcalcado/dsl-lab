require File.dirname(__FILE__) + '/../model/key_map'
require File.dirname(__FILE__) + '/../model/key_stroke'

#TODO:this is not good...
# this const_missing shoud be valid only for the DSL
class Module
    def const_missing(name)
        name
    end
end

class HotKeyDsl

    attr_reader :key_map

    def initialize(map)
      @key_map = map
    end

    def map(&definition_block)
        definition_hash = instance_eval &definition_block
        populate_map(definition_hash)
    end

    def populate_map(definition_hash)
        definition_hash.each_pair do | key, action|
            key_map[KeyStroke.new(key)]=action
        end
    end

    def method_missing(name, *args)
        name
    end
end
