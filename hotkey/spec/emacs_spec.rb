require File.dirname(__FILE__) + '/spec_helper'


describe 'Smoke Test', 'simple emacs keys' do

    before do
        @key_map = KeyMap.new
        @dsl = HotKeyDsl.new @key_map
    end

    it 'should be possible to define some simple emacs keybindings' do
        @dsl.map{{
                [ctrl] + [space] => lambda{ puts "set-mark-command"},
                [ctrl] + [q]     => lambda{ puts "quoted-insert"},
                [ctrl] + [a]     => lambda{ puts "beginning-of-line"},
                [ctrl] + [r]     => lambda{ puts "isearch-backward"},
                [ctrl] + [b]     => lambda{ puts "backward-char"},
                [ctrl] + [s]     => lambda{ puts "isearch-forward"},
                [ctrl] + [c]     => lambda{ puts "exit-recursive-edit"},
                [ctrl] + [t]     => lambda{ puts "transpose-chars"},
                [ctrl] + [d]     => lambda{ puts "delete-char"},
                [ctrl] + [u]     => lambda{ puts "universal-argument"},
                [ctrl] + [e]     => lambda{ puts "end-of-line"},
                [ctrl] + [v]     => lambda{ puts "scroll-up"},
                [ctrl] + [f]     => lambda{ puts "forward-char"},
                [ctrl] + [w]     => lambda{ puts "kill-region"},
                [ctrl] + [h]     => lambda{ puts "help-command"},
                [ctrl] + [x]     => lambda{ puts "[ctrl]ontrol-X-prefix"},
                [TAB]            => lambda{ puts "indent-for-tab-command"},
                [ctrl] + [y]     => lambda{ puts " yank"},
                [ctrl] + [z]     => lambda{ puts "suspend-emacs"},
                [ctrl] + [k]     => lambda{ puts "kill-line"},
                [ESC]            => lambda{ puts "ESC-prefix"},
                [ctrl]           => lambda{ puts "+ [l] recenter"},
                [ctrl] + [_]     => lambda{ puts "undo"},
                [ctrl] + [n]     => lambda{ puts "next-line"},
                [ctrl] + [o]     => lambda{ puts "open-line"},
                [DEL]            => lambda{ puts "delete-backward-char"},
                [ctrl]           => lambda{ puts "+ [p] previous-line"}
            }}
    end
end
