local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "marko-cerovac/material.nvim",
    dependencies = { "nvim-lualine/lualine.nvim" },
    config = function()
      require("lualine").setup {
        options = {
          theme = "material-stealth"
        }
      }
      local material = require("material")
      material.setup({
        disable = {
          background = true
        },
        lualine_style = "stealth",
        custom_colors = function(colors)
          colors.syntax.comments = "#646c8c"
        end
      })
      vim.cmd.colorscheme("material")
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "latte"
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- harmless warning in treesitter, is an official bug
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "vue", "typescript", "r", "html", "json", "bash", "cpp", "css", "javascript", "jinja", "kotlin", "nix", "python", "tsx", "rust" },

        auto_install = true,

        highlight = {
          enable = true,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>ss",
            node_incremental = "<Leader>sd",
            scope_incremental = "<Leader>sf",
            node_decremental = "<Leader>sa",
          },
        },

        textobjects = {
          select = {
            enable = true,

            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'v', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()
    end
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",

    opts = {
      keymap = { preset = "super-tab" },

      appearance = {
        nerd_font_variant = "mono"
      },

      completion = { documentation = { auto_show = true } },

      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pp', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      local actions = require("telescope.actions")
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          file_ignore_patterns = { "node_modules" }
        },
      })
      telescope.load_extension("file_browser")
      vim.keymap.set("n", "<Leader>fb", ":Telescope file_browser<CR>")
      vim.keymap.set("n", "<Leader>pi", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    end
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "lewis6991/gitsigns.nvim" },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = "<Leader>cc",
        block = "<Leader>bc",
      }
    }
  }
})

