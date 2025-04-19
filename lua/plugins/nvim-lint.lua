-- ~/.config/nvim/lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      asm               = { "compiler"       },
      bash              = { "shellcheck"     },
      c                 = { "clangtidy"      },
      c_sharp           = { "csharpier"      },
      cpp               = { "clangtidy"      },
      dockerfile        = { "hadolint"       },
      git_config        = { "gitlint"        },
      git_rebase        = { "gitlint"        },
      gitattributes     = { "gitlint"        },
      gitcommit         = { "commitlint"     },
      go                = { "golangcilint"   },
      html              = { "htmlhint"       },
      java              = { "checkstyle"     },
      javascript        = { "eslint_d"       },
      jq                = { "jsonlint"       },
      jsdoc             = { "eslint-plugin-jsdoc" },
      json              = { "jsonlint"       },
      lua               = { "luacheck"       },
      luadoc            = { "luacheck"       },
      lua_patterns      = { "luacheck"       },
      markdown          = { "markdownlint"   },
      markdown_inline   = { "markdownlint"   },
      nginx             = { "nginx-lint"     },
      nim               = { "nimble_lint"    },
      nim_format_string = { "nimble_lint"    },
      perl              = { "perlcritic"     },
      php               = { "phpcs"          },
      phpdoc            = { "phpmd"          },
      powershell        = { "psscriptanalyzer" },
      python            = { "pylint"         },
      ruby              = { "rubocop"        },
      rust              = { "clippy"         },
      superhtml         = { "htmlhint"       },
      svelte            = { "eslint_d"       },
      toml              = { "taplo"          },
      tsv               = { "csvlint"        },
      typescript        = { "eslint_d"       },
      vim               = { "vint"           },
      vimdoc            = { "vint"           },
      xml               = { "tidy"           },
      yaml              = { "yamllint"       },
    }

    -- any custom linters:
    lint.linters.csharpier = {
      cmd          = "csharpier",
      args         = { "--check", "$FILENAME" },
      stdin        = false,
      append_fname = true,
    }

    vim.api.nvim_create_autocmd(
      { "BufWritePost", "BufReadPost", "InsertLeave" },
      { callback = function() lint.try_lint() end }
    )
  end,
}

