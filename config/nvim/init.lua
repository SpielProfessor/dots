-----------------
-- N E O V I M --
-- main config --
-----------------
require("initRocks");
require("utilities");

--------------------
-- FISH SHELL FIX --
--------------------

-- when launched in fish, neovim throws "E71: Cannot expand Wildcards"
-- the following three lines fix this, because they "replace" neovim's default shell from fish to a POSIX shell (zsh)
if vim.fs.basename(vim.o.shell) == 'fish' then
    vim.opt.shell = '/bin/zsh'
end

--------------------
-- KEYBIND CONFIG --
--------------------

-- set space as leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- load keymaps
require("keybinds");

----------------------
-- COLORSCHEME INIT --
----------------------

require('gruvbox').setup({
  contrast="hard"
});


-- configure colourscheme - gruvbox-material
require('gruvbox-material').setup({
  contrast="hard",
})

local primary_theme=true;
if primary_theme then
  require("primary");
else 
-- configure colourscheme - everforest
local everforest = require("everforest");
everforest.setup({
  background="hard",
  transparency_background_level = 0,
  italics = true,
  disable_italic_comments = false,
  colours_override = function(palette)
    palette.bg0 = "#1e2326"
  end,
});
everforest.load();
end

---------------------------
-- VIMSCRIPT FILES START --
---------------------------

vim.cmd('source ~/.config/nvim/autostart.vim');

-------------------
-- P L U G I N S --
-------------------

---------
-- LSP --
---------

-- show context (function definition, ...)
require'treesitter-context'.setup{}
-- import local LSP configuration
require("lsp");

-- import local formatting configuration
require("conform").setup({
  formatters_by_ft = {
    rust = {"rustfmt"},
    c =    {"clang-format"},
    cpp = {"clang-format"}
  }
})
-- 2-wide tabs in rust
require("conform").formatters.rustfmt = {
  prepend_args = { "--config", "tab_spaces=2" },
}

-- format on write
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- LSP signature help
require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})
-- trouble - list all mistakes
require("trouble").setup {}
require'barbar'.setup {
  auto_hide = 1,
}

-- and todo-comments - nice formatting for comments like 
-- INFO: this is an example
require("todo-comments").setup()

-- nvim-tree: navigation tree
require("nvim-tree").setup();

--------------
-- RUN CODE --
--------------
require('code_runner').setup {
  filetype = {
    rust = {"cd $dir &&", "cargo run"},	
    c    = {"cd "..vim.fn.getcwd().." &&", "make run"},
    cpp  = {"cd "..vim.fn.getcwd().." &&", "make run"},
    make = {"cd "..vim.fn.getcwd().." &&", "make run"},
    asm  = {"cd $dir &&","make run"},
    python = "python3 -u",
    java = { "cd $dir &&", "javac $fileName &&", "java $fileNameWithoutExt" },
    lua = "lua",
  }	
}
--------------
-- MORE LSP --
--------------

-- lspsage - lsp utils
require("lspsaga").setup({});

-- Cargo.toml utilities
require("crates").setup({
  completion = {
    cmp = {
      enabled = true,
    },
    crates = {
      enabled = true, -- disabled by default
      max_results = 8, -- The maximum number of search results to display
      min_chars = 3 -- The minimum number of charaters to type before completions begin appearing
    }
  },
});

------------------
-- MORE PLUGINS --
------------------

-- local config: lualine panel
require("statusline");

-- show colors and color picker
local ccc = require("ccc")
local mapping = ccc.mapping

ccc.setup({
  -- Your preferred settings
  -- Example: enable highlighter
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
})
-- drawing ascii mode
require('plugins/venn');

-- loading neorg
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
})
require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
  }
});

-- obsidian.nvim
require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/notes/",
    },
  },
})

-- which-key
local wk = require("which-key")
wk.setup({
  win = {
    border = "single",  -- Set window border to single
  },
})

-- AI integration
require('gen').setup({
  model = "gemma2:2b", -- The default model to use.
  quit_map = "q", -- set keymap to close the response window
  retry_map = "<c-r>", -- set keymap to re-send the current prompt
  accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
  host = "localhost", -- The host running the Ollama service.
  port = "11434", -- The port on which the Ollama service is listening.
  display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
  show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
  show_model = false, -- Displays which model you are using at the beginning of your chat session.
  no_auto_close = false, -- Never closes the window automatically.
  file = false, -- Write the payload to a temporary file to keep the command short.
  hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
  init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
  -- Function to initialize Ollama
  command = function(options)
    local body = {model = options.model, stream = true}
    return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
  end,
  -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
  -- This can also be a command string.
  -- The executed command must return a JSON object with { response, context }
  -- (context property is optional).
  -- list_models = '<omitted lua function>', -- Retrieves a list of model names
  result_filetype = "markdown", -- Configure filetype of the result buffer
  debug = false -- Prints errors and the command which is run.
})


-- auto pairs (like ([{""}]))
require('nvim-autopairs').setup({})
-- mini.nvim components
-- require('mini.animate').setup()		              -- animation
require('mini.starter').setup({header=get_header()})  -- start screen
require('mini.comment').setup()                       -- quickly comment using gc in normal/visual mode 

-- load lush.nvim

