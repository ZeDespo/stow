-- Sets up the core utilities to get Nvim working.
-- Should only include plugins that are
-- language-agnostic, or help support LazyVim as a whole.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    lazy = false,
    build = ":TSUpdate",
  },

  {
    "mason-org/mason.nvim", -- LSP server orchestrator
    opts = {
      ensure_installed = {
        "debugpy", -- Python debugger
        "stylua",
        "lua-language-server",
        "pyright", -- Python LSP
        "pyproject-fmt", -- For pyproject.tmol
        "ruff", -- Python formatter
        "rust-analyzer", -- Rust
        "yaml-language-server", -- All hail yaml LSP
        "yamlfix", -- Yaml formatter
        "tombi", --toml lsp
      },
    },
  },
  {
    "neovim/nvim-lspconfig", -- LSP config loader
    opts = {
      servers = {
        taplo = { mason = false },
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
              pythonPath = vim.fn.exepath("python3"),
            },
            python = {
              analysis = {
                -- ignore = { "*" },
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              configuration = "~/.config/ruff/pyproject.toml",
            },
          },
        },
        yamlls = {
          settings = {
            format = {
              enable = false,
            },
            validate = true,
            hover = true,
            completion = true,
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "yamlfix" },
        yml = { "yamlfix" },
        toml = { "pyproject-toml" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      }
      opts.formatters = {
        yamlfix = {
          env = {
            YAMLFIX_SEQUENCE_STYLE = "block_style",
            YAMLFIX_INDENT_MAPPING = "4",
            YAMLFIX_LINE_LENGTH = "88",
            YAMLFIX_WHITE_LINES = "2",
            YAMLFIX_SECTION_WHITELINES = "1",
          },
        },
        ruff_fix = {
          args = {
            "check",
            "--fix",
            "--force-exclude",
            "--exit-zero",
            "--no-cache",
            "--config",
            "~/.config/ruff/pyproject.toml",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
        },
      }
    end,
  },
}
