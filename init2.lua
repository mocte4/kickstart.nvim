--[[
DEPENDENCIES FOR THIS init.lua CONFIG:
- utilities included in the Kickstart repo like Neotree
- vim-plug by junegunn
]]

-- ANTIOVERHIGHLIGHTER (https://www.reddit.com/r/neovim/comments/1ct2w2h/comment/l4bgvn1)
vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('auto-hlsearch', { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function()
        vim.cmd.nohlsearch()
      end)
    end
  end,
})

-- LAZY SETUP


-- PLUGS (https://github.com/junegunn/vim-plug)
-- use :PlugUpdate to install or update plugins
-- use :PlugClean to delete things you've removed from the plug list
-- use :Telescope colorscheme to change colour scheme for this session (requires Telescope obv)
-- put at the very end because it has strange interactions with things
local vim = vim
local Plug = vim.fn['plug#']
vim.call 'plug#begin'
--Plug 'tpope/vim-sensible'-- placeholder I left in
--Plug 'sheerun/vim-polyglot'-- broke, idk why and I forget why I have it anyway
--Plug 'casperstorm/ferra'-- not even sure it's compatible with neovim
Plug 'rebelot/kanagawa.nvim'
Plug 'morhetz/gruvbox'
Plug 'ku1ik/vim-monokai'
Plug 'phanviet/vim-monokai-pro'
Plug 'Mofiqul/dracula.nvim'
Plug 'matgd/godotcolor-vim'
Plug 'armannikoyan/rusty'
vim.call 'plug#end'


-- FINISH STARTUP
vim.cmd('Neotree')
local godotprojectfile = vim.fs.root(0, '/project.godot')
if godotprojectfile then
  vim.cmd 'colorscheme godotcolor'
else
  vim.cmd 'colorscheme monokai'
end
do
  return
end-- emulates vimscript finish, which vim-plug won't load properly without (https://github.com/junegunn/vim-plug/issues/613) (https://www.reddit.com/r/neovim/comments/pkgp1q/is_there_a_lua_equivalent_for_the_finish_command/)
