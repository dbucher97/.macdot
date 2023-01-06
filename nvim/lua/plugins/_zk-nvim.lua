return function()
	require("zk").setup({
		picker = "telescope",
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
		},

		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	})

	local zk = require("zk")
	local commands = require("zk.commands")

	local function make_edit_fn(defaults, picker_options)
		return function(options)
			options = vim.tbl_extend("force", defaults, options or {})
			zk.edit(options, picker_options)
		end
	end

	local function make_new_fn(defaults)
		return function(options)
			options = vim.tbl_extend("force", defaults, options or {})
			zk.new(options)
		end
	end

	-- Edit and find functions
	commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
	commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))
	commands.add("ZkDailies", make_edit_fn({ hrefs = { "daily" } }, { title = "Zk Dailies" }))
	commands.add("ZkFleetings", make_edit_fn({ hrefs = { "fleeting" } }, { title = "Zk Fleetings" }))
	commands.add("ZkLiteratures", make_edit_fn({ hrefs = { "literature" } }, { title = "Zk Literatures" }))
	commands.add(
		"ZkPermanent",
		make_edit_fn({ excludeHrefs = { "daily", "fleeting", "literature" } }, { title = "Zk Permanent Notes" })
	)

	-- Create Funcions
	commands.add("ZkToday", make_new_fn({ dir = "daily" }))
	commands.add("ZkFleeting", make_new_fn({ dir = "fleeting", tag = "toprocess" }))

	local function edit_one_fn(defaults)
		return function(created, options)
			local root = vim.env.ZK_NOTEBOOK_DIR
			options = vim.tbl_extend("force", defaults or {}, options or {})
			options = vim.tbl_extend("force", { select = { "path" }, created = created }, options or {})
			require("zk.api").list(options.notebook_path, options, function(err, notes)
				assert(not err, tostring(err))
				if next(notes) ~= nil then
					vim.cmd("edit " .. root .. notes[1].path)
				else
					vim.notify("No note found for '" .. (created or "") .. "'!")
				end
			end)
		end
	end
	commands.add("ZkFrom", edit_one_fn({ hrefs = { "daily" } }))

	-- Insert links
	local function insert_at_pos(str)
		local pos = vim.api.nvim_win_get_cursor(0)
		local line = vim.api.nvim_get_current_line()
		local nline = line:sub(0, pos[2]) .. str .. line:sub(pos[2] + 1)
		vim.api.nvim_set_current_line(nline)
		vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + 4 + str:len() })
	end

	local function insert_link(defaults)
		return function(options)
			options = vim.tbl_extend("force", defaults or {}, options or {})
			zk.pick_notes(options, { title = "Zk Pick link note" }, function(notes, err)
				assert(not err, tostring(err))
				local path = notes[1].path:match("^(.+)%.[^%.]+")
				insert_at_pos("[[" .. path .. "]]")
			end)
		end
	end
	commands.add("ZkILink", insert_link())

	local function insert_tag(defaults)
		return function(options)
			options = vim.tbl_extend("force", defaults or {}, options or {})
			zk.pick_tags(options, { title = "Zk Pick link note" }, function(tags, err)
				assert(not err, tostring(err))
				local tag = tags[1].name
				insert_at_pos("#" .. tag)
			end)
		end
	end
	commands.add("ZkITag", insert_tag())

	-- Sketches
	local Job = require("plenary.job")

	local function zk_sketch(options)
		local args = { "sketch" }
		for k, v in pairs(options or {}) do
			if k == "invert" then
				if v then
					table.insert(args, "-i")
				else
					table.insert(args, "-n")
				end
			elseif k == "timeout" then
				table.insert(args, "-t")
				table.insert(args, v)
			elseif k == "folder" then
				table.insert(args, "-f")
				table.insert(args, v)
			end
		end
		Job
			:new({
				command = "zk",
				args = args,
				on_exit = vim.schedule_wrap(function(j, return_val)
					local res = j:result()
					if return_val == 124 then
						vim.notify("Sketch: Timeout!", vim.log.levels.WARN)
						return
					elseif return_val ~= 0 or res[1] == nil then
						vim.notify("Sketch: Error " .. tostring(return_val) .. "!", vim.log.levels.ERROR)
						return
					end
					local path = res[1]
					vim.fn.setreg('"', "![](" .. path .. ")")
					vim.notify("Sketch: Link (" .. path .. ") copied to clipboard!", vim.log.levels.INFO)
				end),
			})
			:start()
	end
	commands.add("ZkSketch", zk_sketch)

	require("telescope").load_extension("zk")
end
