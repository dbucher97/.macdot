return function()
    local lspconfig = require "lspconfig"

    vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
    }

    -- local lsps = require "common.lsp-setup"
    -- for key, value in pairs(lsps) do
    --   lspconfig[key].setup(value)
    -- end

    local symbols = require "common.symbols"

    for _, e in ipairs { "error", "warn", "info", "hint" } do
        local type = e:sub(1, 1):upper() .. e:sub(2)
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = symbols[e], texthl = hl, numhl = hl })
    end

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts.border = opts.border or "rounded"
        print "BORDER"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
    --[[
  local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
  }
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
  --]]
end
