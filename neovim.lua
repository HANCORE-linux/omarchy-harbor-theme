return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg = "#dfe4c4",
        dark_bg = "#dfe4c4",
        darker_bg = "#d8d9b8",   -- slightly darker for statusline, etc.
        lighter_bg = "#ecebbd",

        fg = "#1c2d28",
        dark_fg = "#253631",
        light_fg = "#858f8b",
        bright_fg = "#acb3b1",
        muted = "#606c68",

        -- === Stronger syntax colors for light bg ===
        red = "#9d2e3a",          -- deeper red (errors, vars)
        orange = "#9d4b25",       -- better orange (numbers, constants)
        yellow = "#8f5424",       -- warm class/type yellow
        green = "#4a6a4a",        -- deeper forest green (strings)
        cyan = "#256b7a",         -- stronger cyan
        blue = "#386593",         -- richer function/keyword blue
        purple = "#5a4a7a",       -- deeper purple
        brown = "#835665",        -- warm deprecated

        bright_red = "#b03743",
        bright_yellow = "#955121",
        bright_green = "#466b46",
        bright_cyan = "#286b75",
        bright_blue = "#3c6499",
        bright_purple = "#695998",

        accent = "#3a6a9a",
        cursor = "#1c2d28",
        foreground = "#1c2d28",
        background = "#dfe4c4",
        selection = "#c8d4a8",           -- soft selection bg
        selection_foreground = "#1c2d28",
        selection_background = "#5e81ac",
      },
      on_highlights = function(hl, c)
                -- If it's "too dark", use a lighter grey like #2a2a2a
                hl.CursorLine = { bg = "#ecebbd" } 
                hl.CursorLineNr = { fg = c.orange, bold = true }
                -- clean, solid word-occurrence + selection highlights (no muddy computed bg)
                hl.Visual = { bg = "#c8d4a8" }
                hl.LspReferenceText  = { bg = "#d3d9b0" }
                hl.LspReferenceRead  = { bg = "#d3d9b0" }
                hl.LspReferenceWrite = { bg = "#d3d9b0" }
                hl.IlluminatedWordText  = { bg = "#d3d9b0" }
                hl.IlluminatedWordRead  = { bg = "#d3d9b0" }
                hl.IlluminatedWordWrite = { bg = "#d3d9b0" }
                hl.MatchParen = { bg = "#c8d4a8", bold = true }
                -- brackets/parens/braces: lift from aether's muted tone to a saturated warm tone
                hl["@punctuation.bracket"] = { fg = "#8f5424" }
                hl["@punctuation.special"] = { fg = "#8f5424" }
                -- keywords: aether renders these lilac internally -> force to palette.
                -- general keywords -> blue; exceptions (try/except/raise) -> purple slot
                local kw_blue = { fg = "#386593" }
                for _, g in ipairs({
                  "Keyword", "Conditional", "Repeat", "Statement", "Include", "StorageClass",
                  "@keyword", "@keyword.function", "@keyword.operator", "@keyword.return",
                  "@keyword.conditional", "@keyword.repeat", "@keyword.import",
                  "@keyword.coroutine", "@conditional", "@repeat", "@include",
                }) do
                  hl[g] = kw_blue
                end
                local kw_exc = { fg = "#5a4a7a" }
                for _, g in ipairs({ "Exception", "@keyword.exception", "@exception" }) do
                  hl[g] = kw_exc
                end
            end,
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "aether" },
  },
}