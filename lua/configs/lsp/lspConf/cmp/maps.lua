local cmp = require('cmp')
local luasnip = require("luasnip")
local map = cmp.mapping
local confirm = map.confirm {
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
}

local down = function(arg)
  return map(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
      -- vim.cmd([[exe "normal! \<Down>"]])
    end
  end, arg)
end

local up = function(arg)
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      if cmp.visible() then
        cmp.select_next_item()
      else
        -- vim.cmd([[exe "normal! \<Up>"]])
        fallback()
      end
    end
  end, arg)
end


local tab = function()
  return map(function(fallback)
    if luasnip.jumpable() then
      luasnip.jump(1)
      return
    end
    if cmp.visible() then
      confirm()
      return
    end
    fallback()
  end, { 'i' })
end
local cr = function()
  return map(function(fallback)
    if cmp.visible() then
      confirm()
      return
    end
    fallback()
  end, { 'i' })
end

local confirmCmd = function()
  return map(function(fallback)
    if cmp.visible() then
      confirm()
      return
    end
    fallback()
  end, { 'c', 's' })
end

local M = {
  ['<C-b>'] = map.scroll_docs(-4),
  ['<C-m>'] = map.scroll_docs(4),
  ['<C-Space>'] = map.complete(),
  ['<C-e>'] = map.abort(),
  ['<Tab>'] = tab(),
  ['<CR>'] = cr(),
  ['<Down>'] = down({ 'i', 's' }),
  ['<Up>'] = up({ 'i', 's' }),
  ['<C-j>'] = down({ 'i', 's', 'c' }),
  ['<C-k>'] = up({ 'i', 's', 'c' }),
  ['<C-l>'] = confirmCmd(),
}

return M
