-- Sets up the core utilities to get Nvim working.
-- Should only include plugins that are
-- language-agnostic, or help support LazyVim as a whole.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "proto",
        "python",
        "query",
        "regex",
        "rust",
        "sql",
        "toml",
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
        "buf", -- Protocol buffer lsp / linter / formatter
        "debugpy", -- Python debugger
        "gofumpt",
        "goimports",
        "golangci-lint", -- Golang linter
        "gopls", -- Golang LSP
        "hadolint", -- Dockerfile linter
        "lua-language-server",
        "pyproject-fmt", -- For pyproject.tmol
        "pyright", -- Python LSP
        "ruff", -- Python formatter
        "rust-analyzer", -- Rust
        "shfmt", -- Shell formatter
        "stylua",
        "tombi", --toml lsp
        "yaml-language-server", -- All hail yaml LSP
        "yamlfix", -- Yaml formatter
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
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      ensure_installed = {},
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        toml = { "pyproject-toml" },
        yaml = { "yamlfix" },
        yml = { "yamlfix" },
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
