local key = vim.keymap.set
local opts = {silent = true, noremap = true, replace_keycodes = false, buffer = true}
local function mappingWiki()
  key("n","<leader>'",":VimwikiToggleListItem<CR>",opts)
  key("n","<leader>vs",":VimwikiListChangeSymbolI",opts)
  key("v","<Space>vs",":VimwikiListChangeSymbolI",opts)
  key("v","<leader>'",":VimwikiToggleListItem<CR>",opts)
  vim.cmd [[
    syntax match CheckListNotClear /^.*\[\ \]\(\s\|\w\|\:\)*/
    syntax match CheckListClearTitle /^.*\[\(\ \|\*\)\@!\]\(\s\|\w\|\:\)*/
    syntax match CheckListClear /^.*- \[x\].*/
    syntax match CheckListClearHalf /^.*- \[\(○\|\.\)\].*/
    hi CheckListClear guibg=none guifg=gray50
    hi CheckListClearHalf guibg=none guifg=orange
    hi CheckListNotClear guibg=none guifg=lightgreen
    hi CheckListClearTitle guibg=blue
  ]]
end
vim.api.nvim_create_autocmd(
  {"Vimenter","BufNewFile","BufRead"},
    { pattern = "*.md", callback = mappingWiki }
)