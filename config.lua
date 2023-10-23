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
  ["<C-u>"] = "<Cmd>UndotreeToggle<CR>",   -- Toggle Undotree
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
}


lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.terminal.insert_mappings = true
lvim.builtin.terminal.shell = "fish"
lvim.builtin.terminal.autochdir = true

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

lvim.plugins = {
  { 'lunarvim/colorschemes' },
  { 'AlphaTechnolog/pywal.nvim',    name = 'pywal' },
  { 'mbbill/undotree' },
  { 'iamcco/markdown-preview.nvim', build = [[sh -c 'cd app && yarn install']] },
  { 'ap/vim-css-color' },
  { 'tpope/vim-surround' },
  { 'mg979/vim-visual-multi' },
  { 'metakirby5/codi.vim' },
  { 'sindrets/diffview.nvim',       dependencies = 'nvim-lua/plenary.nvim' },
  { 'brooth/far.vim' },
  { 'kkoomen/vim-doge' },
  { 'lervag/vimtex' },
  { 'ibhagwan/fzf-lua',             dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'folke/todo-comments.nvim',     dependencies = 'nvim-lua/plenary.nvim' },
  { 'TimUntersberger/neogit',       dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } },
  { 'Pocco81/TrueZen.nvim' },
  { 'SidOfc/mkdx' },
  { "ellisonleao/glow.nvim",        branch = 'main' },
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },
  { "kevinhwang91/rnvimr" },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { 'preservim/vim-markdown' },
  { 'othree/html5.vim' },
  { 'pangloss/vim-javascript' },
  { 'evanleck/vim-svelte',    branch = 'main' }
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ current_line_only = false })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })


require 'lspconfig'.tailwindcss.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
}


local pywal = require('pywal')

pywal.setup()


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


require 'lspconfig'.eslint.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' }
}
