local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

local present = vim.fn.empty(vim.fn.glob(packer_path)) == 0

if not present then
   print "Cloning packer.."
   -- remove the dir before cloning
   vim.fn.delete(packer_path, "rf")
   vim.fn.system {
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      "--depth",
      "20",
      packer_path,
   }
end

vim.cmd[[packadd packer.nvim]]
local ok, packer = pcall(require, "packer")

if not ok then
  print("Loading Packer resulted in Error\n\n" .. packer)
end

packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
   },
   git = {
      clone_timeout = 6000, -- seconds
   },
   auto_clean = true,
   compile_on_sync = true,
}

return packer
