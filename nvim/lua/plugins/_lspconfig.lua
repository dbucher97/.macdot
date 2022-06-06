return function()
  local lspconfig = require "lspconfig"

  local lsps = require "common.lsp-setup"
  for key, value in pairs(lsps) do
    lspconfig[key].setup(value)
  end

  local symbols = require "common.symbols"

  for _, e in ipairs { "error", "warn", "info", "hint" } do
    local type = e:sub(1, 1):upper() .. e:sub(2)
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = symbols[e], texthl = hl, numhl = hl })
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
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
  --]]
end
