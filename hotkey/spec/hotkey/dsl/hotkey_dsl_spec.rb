require File.dirname(__FILE__) + '/../../spec_helper'


describe 'Hotkeys Definition', 'single-keys' do

    before do
        @key_map = KeyMap.new
        @dsl = HotKeyDsl.new @key_map
    end


    it 'should be possible to define a hotkey as a letter' do
        @dsl.map {{
            [a] => 'anything'
         }}

        @key_map.size.should eql(1)
        @key_map[KeyStroke.new([:a])].should_not be_nil
    end

    it 'should distinguish between lowercase and upercase letters' do
        @dsl.map {{
            [A] => 'anything',
            [a] => 'other thing'
         }}

        @key_map.size.should eql(2)
        @key_map[KeyStroke.new([:a])].should_not be_nil
        @key_map[KeyStroke.new([:A])].should_not be_nil
    end

    it 'should be possible to use ctrl, cmd, alt and shift as commands' do
        @dsl.map {{
            [ctrl] => 'a',
            [shift] => 'b',
            [alt] => 'c',
            [cmd] => 'd'
         }}

        @key_map.size.should eql(4)
        @key_map[KeyStroke.new([:ctrl])].should_not be_nil
        @key_map[KeyStroke.new([:shift])].should_not be_nil
        @key_map[KeyStroke.new([:alt])].should_not be_nil
        @key_map[KeyStroke.new([:cmd])].should_not be_nil
    end

end

describe 'Hotkeys Definition', 'multi-keys' do

    before do
        @key_map = KeyMap.new
        @dsl = HotKeyDsl.new @key_map
    end

    it 'should be possible to use combinations of ctrl, cmd, alt and shift as commands' do
        @dsl.map {{
            [ctrl] + [alt] +[shift] => 'a'
         }}

        @key_map.size.should eql(1)
        @key_map[KeyStroke.new([:ctrl, :alt, :shift])].should_not be_nil
    end
end
