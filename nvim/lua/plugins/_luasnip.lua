return function()
    require("luasnip.loaders.from_vscode").lazy_load()

    local ls = require "luasnip"

    ls.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    }

    local rec_ls
    local sn = ls.sn
    local t = ls.t
    local c = ls.c
    local i = ls.i
    local s = ls.s
    local d = ls.d
    rec_ls = function()
        return sn(nil, {
            c(1, {
                t { "" },
                sn(nil, { t { "", "\t\\item " }, i(1), d(2, rec_ls, {}) }),
            }),
        })
    end

    local vsp = ls.parser.parse_snippet

    local name = "David Bucher"
    local email = "d.bucher97@gmail.com"

    local licenses = require "common.licenses"
    local lic_snip = {}

    for key, value in pairs(licenses) do
        local content = value:gsub("THEAUTHOR", name):gsub("THEEMAIL", email)
        local str = ""
        for line in content:gmatch "([^\n]*)\n?" do
            if line == "" then
                str = str .. "$LINE_COMMENT\n"
            else
                str = str .. "$LINE_COMMENT " .. line .. "\n"
            end
        end
        table.insert(lic_snip, vsp(key, str))
    end

    ls.snippets = {
        all = lic_snip,
        tex = {
            vsp("=", "\\begin{align}\n\t$1\n\\end{align}\n"),
            vsp("&", "\\begin{alignat}{${1:3}}\n\t$2\n\\end{alignat}\n"),
            vsp(
                "doc",
                [[\\documentclass[a4paper]{${1:scrartcl}}

\\author{${2:David Bucher}}

\\begin{document}

$3

\end{document}]]
            ),
            s("ls", {
                t { "\\begin{itemize}", "\t\\item " },
                i(1),
                d(2, rec_ls, {}),
                t { "", "\\end{itemize}" },
                i(0),
            }),
        },
    }
end
