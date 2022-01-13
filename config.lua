--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "wal"
lvim.transparent_window = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.termguicolors = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undodir = "/home/mai/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = false
vim.opt.numberwidth = 2
vim.opt.wrap = true
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.spell = false
-- vim.opt.spelllang = "en"
vim.opt.autochdir = false
vim.opt.timeoutlen = 100

vim.opt.shell = "/usr/bin/sh" -- Better performance than 'fish' shell


lvim.line_wrap_cursor_movement = false


-- lvim.builtin.telescope.live_grep.file_previewer = 


-- colorscheme
--cmd "au ColorScheme * hi CursorLine ctermbg=5 ctermfg=0 guibg=none cterm=reverse term=reverse"


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode = {
  ["<C-s>"] = ":w<cr>",
  ["<C-p>"] = "<Cmd>Telescope find_files<CR>",
  ["<Leader>p"] = "<Cmd>NvimTreeToggle<CR>",


  ["<Leader>so"] = "<Cmd>set spell!<CR>",
  -- ["<C-v>"] = "<Esc>Pli",
  ["<C-f>"] = "<Cmd>Telescope live_grep<CR>", -- Search files
  ["<C-u>"] = "<Cmd>UndotreeToggle<CR>",          -- Toggle Undotree
  ["<Leader>m"] = "<Cmd>MarkdownPreviewToggle<CR>",

  -- Navigate buffers
  ["<Tab>"] = ":bnext<CR>",
  ["<S-Tab>"] = ":bprevious<CR>",

  -- Select entire buffer
  ["vaa"] = "ggvGg_",
  ["<C-a>"] = "ggvGg",

  -- Disable AutoComplete for buffer
  ["<Leader>ac"] = "<Cmd>lua require('cmp').setup.buffer { enabled = false }<CR>",

}

-- visual keybinds
lvim.keys.visual_mode = {

  ["<C-c>"] = "y<Esc>i",
  ["<C-v>"] = "\"_dP",
  ["s"] = "\"_s", -- Don't copy on 's'
  [">"] = ">gv", -- Keeps indentation selection
  ["<"] = "<gv"
  -- ["d"] = "\"_d"

}

-- insert keybinds
lvim.keys.insert_mode = {
  ["C-v"] = "<Esc>pi" -- Paste in insert mode with ctrl+v


}

vim.cmd("imap <c-v> <Esc>pli")


-- plugins

lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"ChngYrNick/wal.vim"}, -- Follow pywal colorscheme
  {"mbbill/undotree"},
  {'iamcco/markdown-preview.nvim', run = [[sh -c 'cd app && yarn install']]},
  {'ap/vim-css-color'},
  {'tpope/vim-surround'},
  {'mg979/vim-visual-multi'},
  {'metakirby5/codi.vim'},
  { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'brooth/far.vim' },
  { 'kkoomen/vim-doge' },
}

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

-- Settings for MarkdownPreview
vim.cmd("let g:mkdp_browser = 'firefox-nightly'")
vim.cmd("let g:mkdp_auto_start = 0")
vim.cmd("let g:mkdp_markdown_css = expand('~/.config/nvim/markdowncss.css')")
vim.cmd("let g:VM_mouse_mappings = 1")

