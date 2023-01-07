return function (use)
  -- file tree
  use {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = "require('plugins.configs.fileTree')"
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
    cmd = 'Telescope',
    config = "require('plugins.configs.telescope')"
  }
end
