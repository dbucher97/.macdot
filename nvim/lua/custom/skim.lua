local M = {}

function M:open_skim()
    -- Find Tectonic.toml in current directory or walk up
    local function find_tectonic_toml()
        local current_dir = vim.fn.expand("%:p:h")
        local toml_path = current_dir .. "/Tectonic.toml"

        -- Check current directory first
        if vim.fn.filereadable(toml_path) == 1 then
            return toml_path
        end

        -- Walk up directories to find Tectonic.toml
        local path_parts = vim.split(current_dir, "/")
        for i = #path_parts, 1, -1 do
            local check_path = table.concat(vim.list_slice(path_parts, 1, i), "/")
                .. "/Tectonic.toml"
            if vim.fn.filereadable(check_path) == 1 then
                return check_path
            end
        end

        return nil
    end

    -- Read and parse the TOML file
    local function parse_tectonic_toml(filepath)
        local file = io.open(filepath, "r")
        if not file then
            return nil
        end

        local content = file:read("*all")
        file:close()

        local output_section = content:match("%[%[output%]%](.-)%[%[")
            or content:match("%[%[output%]%](.+)")
        if not output_section then
            print("No [[output]] section found in Tectonic.toml")
            return nil
        end

        -- Simple parsing for output_filename
        local name = output_section:match("name%s*=%s*[\"']([^\"']+)[\"']")
        return name
    end

    ----------------------------------------------------------------------------------

    local toml_file = find_tectonic_toml()
    if not toml_file then
        print("Tectonic.toml not found")
        return
    end
    -- print("TOML: " .. toml_file)

    local name = parse_tectonic_toml(toml_file)
    if not name then
        print("Could not find name in Tectonic.toml")
        return
    end
    -- print("NAME: " .. name)

    local toml_dir = vim.fn.fnamemodify(toml_file, ":h")
    local pdf_path = toml_dir .. "/build/" .. name .. "/" .. name .. ".pdf"
    -- print("PDF: " .. pdf_path)

    local args = { "open", "-a", "Skim", pdf_path }

    vim.system(args, {
        env = {
            VIM_SERVERNAME = vim.v.servername,
        },
        detach = true,
    })
end

return M
