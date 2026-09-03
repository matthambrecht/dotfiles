return {
  "nvim-treesitter/nvim-treesitter",
  -- main branch requires nvim 0.12 nightly, master works on 0.11
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "svelte",
        "html",
        "css",
        "graphql",
        "http", -- kulala
        "prisma",
        "rust",
        "go",
        "c",
        "cpp",
        "bash",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
      },
      -- install missing parsers when entering a buffer
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
