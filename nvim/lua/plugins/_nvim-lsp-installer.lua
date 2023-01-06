return function()
    local lsp_installer = require "nvim-lsp-installer"
    local lsps = require "common.lsp-setup"

    lsp_installer.on_server_ready(function(server)
        server:setup(lsps[server.name] or {})
    end)
end
