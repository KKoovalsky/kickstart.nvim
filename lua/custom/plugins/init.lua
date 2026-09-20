-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Keeps a ctags `tags` file up to date in the background so ctrl-]/ctrl-t
    -- work everywhere, without touching any project repo: tag files live
    -- under Neovim's own cache dir, never inside the project tree.
    'ludovicchabant/vim-gutentags',
    init = function()
      vim.g.gutentags_cache_dir = vim.fn.stdpath 'cache' .. '/tags'
      -- Deliberately VCS-root markers only (gutentags' own default): some repos
      -- here (e.g. lidar-firmware) nest a CMakeLists.txt per submodule
      -- (devices/sl2001/CMakeLists.txt etc), and including build-file markers
      -- makes gutentags stop at that submodule instead of walking up to the
      -- repo root, fragmenting tags into one file per module.
      vim.g.gutentags_project_root = { '.git', '.hg', '.svn' }
      vim.g.gutentags_ctags_exclude = {
        'build',
        '.cache',
        '.mypy_cache',
        '.ruff_cache',
        '*.o',
        '*.a',
        '*.so',
      }
    end,
  },
}
