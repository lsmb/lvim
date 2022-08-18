--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

local home_path = vim.fn.expand('$HOME')

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "pywal"
lvim.transparent_window = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undodir = home_path .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = false
vim.opt.numberwidth = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.spell = false
-- vim.opt.spelllang = "en"
vim.opt.autochdir = false
vim.opt.timeoutlen = 100

vim.opt.shell = "/usr/bin/sh" -- Better performance than 'fish' shell

-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
--   vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<Cmd>close<Cr>]], opts)
--   vim.api.nvim_buf_set_keymap(1, 't', '<esc>', [[<Cmd>close<Cr>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end

-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


lvim.line_wrap_cursor_movement = false


-- lvim.builtin.telescope.live_grep.file_previewer =


-- colorscheme
--cmd "au ColorScheme * hi CursorLine ctermbg=5 ctermfg=0 guibg=none cterm=reverse term=reverse"


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode = {
  ["<C-s>"] = ":w<cr>",
  ["<C-p>"] = "<Cmd>FzfLua files<CR>",
  ["<Leader>p"] = "<Cmd>NvimTreeToggle<CR>",


  ["<Leader>so"] = "<Cmd>set spell!<CR>",
  -- ["<C-v>"] = "<Esc>Pli",
  ["<C-f>"] = "<Cmd>FzfLua live_grep<CR>", -- Search files
  ["<C-u>"] = "<Cmd>UndotreeToggle<CR>", -- Toggle Undotree
  ["<Leader>m"] = "<Cmd>MarkdownPreviewToggle<CR>",

  -- Navigate buffers
  ["<Tab>"] = ":bnext<CR>",
  ["<S-Tab>"] = ":bprevious<CR>",

  -- Select entire buffer
  ["vaa"] = "ggvGg_",
  ["<C-a>"] = "ggvGg",

  -- Disable AutoComplete for buffer
  ["<Leader>ac"] = "<Cmd>lua require('cmp').setup.buffer { enabled = false }<CR>",

  -- Search and replace word underneath
  ["<Leader>r"] = ":%s/<C-r><C-w>/",
  ["<Leader>t"] = "<Cmd>ToggleTerm<CR>",

}

-- visual keybinds
lvim.keys.visual_mode = {
  ["<C-c>"] = "y<Esc>i",
  ["<C-v>"] = "\"_dP",
  -- ["s"] = "\"_s", -- Don't copy on 's'
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
  { 'lunarvim/colorschemes' },
  -- { 'ChngYrNick/wal.vim' }, -- Follow pywal colorscheme
  { 'AlphaTechnolog/pywal.nvim', as = 'pywal' },
  { 'mbbill/undotree' },
  { 'iamcco/markdown-preview.nvim', run = [[sh -c 'cd app && yarn install']] },
  { 'ap/vim-css-color' },
  { 'tpope/vim-surround' },
  { 'mg979/vim-visual-multi' },
  { 'metakirby5/codi.vim' },
  { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'brooth/far.vim' },
  { 'kkoomen/vim-doge' },
  { 'lervag/vimtex' },
  { 'ibhagwan/fzf-lua', requires = 'kyazdani42/nvim-web-devicons' },
  -- { 'nyngwang/NeoRoot.lua' },
  -- { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } },
  { 'Pocco81/TrueZen.nvim' },
  { 'SidOfc/mkdx' },
  { "ellisonleao/glow.nvim", branch = 'main' },
  {
    "mattn/vim-gist",
    event = "BufRead",
    requires = "mattn/webapi-vim",
  },
  { "kevinhwang91/rnvimr" },
  { "uga-rosa/cmp-dictionary" },
  { "simrat39/rust-tools.nvim" },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ current_line_only = false })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })

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
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

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

-- For gist
vim.cmd("let g:gist_use_password_in_gitconfig = 1")


-- Settings for MarkdownPreview
vim.cmd("let g:mkdp_browser = 'firefox-nightly'")
vim.cmd("let g:mkdp_auto_start = 0")
vim.cmd("let g:mkdp_markdown_css = expand('~/.config/nvim/markdowncss.css')")
vim.cmd("let g:VM_mouse_mappings = 1")


vim.cmd("let g:vimtex_view_method = 'zathura'")
vim.cmd("let g:codi#rightalign = 1")

-- Settings for Markdown MKDX plugin
vim.cmd("let g:mkdx#settings = { 'highlight': { 'enable': 1 }, 'enter': { 'shift': 1 }, 'links': { 'external': { 'enable': 1 } }, 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 }, 'fold': { 'enable': 1 } }")


-- lua
-- vim.g.nvim_tree_respect_buf_cwd = 1
-- vim.g.ello12 = 2

require("nvim-tree").setup({
  update_cwd = true,
  -- update_focused_file = {
  --   enable = true,
  --   update_cwd = true
  -- },
})

require('nvim-ts-autotag').setup()

-- require("todo-comments").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
-- }

require('neogit').setup {
  disable_commit_confirmation = true,
  disable_insert_on_commit = false,
  integrations = {
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
    -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    -- use {
    --   'TimUntersberger/neogit',
    --   requires = {
    --     'nvim-lua/plenary.nvim',
    --     'sindrets/diffview.nvim'
    --   }
    -- }
    --
    diffview = true
  }
}

require('lspconfig').volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  typescript = {
    serverPath = home_path .. '/.npm-global/lib/node_modules/typescript/lib/tsserverlibrary.js'
  },
  init_options = {
    typescript = {
      serverPath = home_path .. '.npm-global/lib/node_modules/typescript/lib/tsserverlibrary.js'
    }
  }
}

-- require'lspconfig'.volar.setup{}

-- require'lspconfig'.vuels.setup{}

-- require'lspconfig'.tsserver.setup{
--   filetypes = {'vue', 'typescript', 'javascriptreact'}
-- }

require 'lspconfig'.tailwindcss.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
}

local true_zen = require("true-zen")

true_zen.setup({
  ui = {
    bottom = {
      laststatus = 0,
      ruler = false,
      showmode = false,
      showcmd = false,
      cmdheight = 1,
    },
    top = {
      showtabline = 0,
    },
    left = {
      number = false,
      relativenumber = false,
      signcolumn = "no",
    },
  },
  modes = {
    ataraxis = {
      left_padding = 32,
      right_padding = 32,
      top_padding = 1,
      bottom_padding = 1,
      ideal_writing_area_width = { 0 },
      auto_padding = true,
      keep_default_fold_fillchars = true,
      custom_bg = { "none", "" },
      bg_configuration = true,
      quit = "untoggle",
      ignore_floating_windows = true,
      affected_higroups = {
        NonText = true,
        FoldColumn = true,
        ColorColumn = true,
        VertSplit = true,
        StatusLine = true,
        StatusLineNC = true,
        SignColumn = true,
      },
    },
    focus = {
      margin_of_error = 5,
      focus_method = "experimental"
    },
  },
  integrations = {
    vim_gitgutter = false,
    galaxyline = false,
    tmux = false,
    gitsigns = false,
    nvim_bufferline = false,
    limelight = false,
    twilight = false,
    vim_airline = false,
    vim_powerline = false,
    vim_signify = false,
    express_line = false,
    lualine = false,
    lightline = false,
    feline = false
  },
  misc = {
    on_off_commands = false,
    ui_elements_commands = false,
    cursor_by_mode = false,
  }
})

local pywal = require('pywal')

pywal.setup()


-- Autosave

-- local autosave = require("autosave")

-- autosave.setup(
--     {
--         enabled = true,
--         execution_message = "Saved at " .. vim.fn.strftime("%H:%M:%S"),
--         events = {"InsertLeave", "TextChanged"},
--         conditions = {
--             exists = true,
--             filename_is_not = {},
--             filetype_is_not = {},
--             modifiable = true
--         },
--         write_all_buffers = false,
--         on_off_commands = true,
--         clean_command_line_interval = 0,
--         debounce_delay = 1000
--     }
-- )

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})


local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
