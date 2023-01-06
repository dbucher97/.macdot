return function()
    local Rule = require "nvim-autopairs.rule"
    local npairs = require "nvim-autopairs"
    local cond = require "nvim-autopairs.conds"

    npairs.setup {}

    npairs.add_rules {
        Rule("$", "$", { "tex", "latex" }):with_pair(cond.not_before_regex "\\"),
    }

    -- Autopairs stuff
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    require("cmp").event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done { map_char = { tex = "" } }
    )
end
