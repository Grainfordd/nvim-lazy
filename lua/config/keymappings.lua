local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local g = vim.g
local noremapSilent = {noremap = true, silent = true}
local noremap = {noremap = true, silent = true}


g.mapleader = ' '
map('n', '<Space>', '<NOP>', noremapSilent)


map('n', '<Leader>q', ':q<CR>', noremapSilent)
map('n', '<Leader>w', ':w<CR>', noremapSilent)
map('n', '<Enter>', 'o<ESC>', noremap)
map('n', '<C-n>', ':bnext<CR>', noremap)
map('n', '<K>', '10<k>', noremap)
map('n', '<J>', '10<j>', noremap)


-- Move betwenn buffers
map('n', '<S-h>', ':bprevious<CR>', noremapSilent)
map('n', '<S-l>', ':bnext<CR>', noremapSilent)
map('n', '<S-w>', ':bd<CR>', noremapSilent)

map('n', '<Leader>nt', ':NvimTreeToggle<CR>', noremap)

-- EasyMotion
map('n', '<Leader>s', '<Plug>(easymotion-s2)', noremap)

-- C++
map('n', '<Leader>r', ':!g++ -Wall % && a.exe<CR>', noremapSilent)

map('n', 'J', '5j', noremapSilent)
map('n', 'K', '5k', noremapSilent)

-- Latex
map('n', '<Leader>,', ':VimtexCompile<CR>', noremapSilent)

--Terminal
map('t', '<Esc>', '<C-\\><C-N>', noremapSilent)

--Matlab
map('n', '<Leader>m', ':terminal matlab -nodisplay -nosplash -nodesktop -r "run(\'%\');<CR>"', noremapSilent)

-- Python
map('n', '<Leader>p', ':terminal python %<CR>', noremapSilent)

-- C
--map('n', '<Leader>c', ':terminal python %<CR>', noremapSilent)


-- LSP floattoggle
vim.g.diagnostics_active = true
vim.keymap.set('n', '<leader>tt', function()
    -- If we find a floating window, close it.
    local found_float = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
            found_float = true
        end
    end

    if found_float then
        return
    end

    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Diagnostics' })
