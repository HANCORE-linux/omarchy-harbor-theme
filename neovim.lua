return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#dfe4c4", -- Default background
                base01 = "#5f8170", -- Lighter background (status bars)
                base02 = "#dfe4c4", -- Selection background
                base03 = "#a07e8f", -- Comments, invisibles
                base04 = "#384f54", -- Dark foreground
                base05 = "#1c2d28", -- Default foreground
                base06 = "#1c2d28", -- Light foreground
                base07 = "#384f54", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#bf616a", -- Variables, errors, red
                base09 = "#808000", -- Integers, constants, orange
                base0A = "#2f788f", -- Classes, types, yellow
                base0B = "#556b2f", -- Strings, green
                base0C = "#4a8c99", -- Support, regex, cyan
                base0D = "#5e81ac", -- Functions, keywords, blue
                base0E = "#4b7152", -- Keywords, storage, magenta
                base0F = "#d08770", -- Deprecated, brown/yellow
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")
            vim.o.background = "light"
            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
