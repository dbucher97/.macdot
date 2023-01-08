return function()
    require("fidget").setup {
        fmt = {
            task = function(_, _, _)
                return ""
            end,
        },
    }
end
