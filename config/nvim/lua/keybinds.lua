---------------------
-- K E Y B I N D S --
---------------------

-- LSP signature
vim.keymap.set({'n'}, '<leader>s', "<CMD>lua require('lsp_signature').toggle_float_win()<CR>", {silent=true, desc='toggle signature'})
vim.keymap.set({'n', 'i'}, '<C-s>', "<CMD>lua require('lsp_signature').toggle_float_win()<CR>", {desc='toggle signature'})

-- nvimtree
vim.keymap.set({'n', 'v', 'i'}, '<C-n>', '<CMD>NvimTreeToggle<CR>', {silent=true, desc='toggle file tree'})
vim.keymap.set({'n', 'v', 'i'}, '<F5>',  '<CMD>RunCode<CR>', {silent=true, desc='toggle file tree'})
vim.keymap.set({'n', 'v', 'i'}, '<S-Enter>' ,'<CMD>Lspsaga code_action<CR>', {silent=true, desc='do a code action'})
vim.keymap.set({'n', 'v', 'i'}, '<F2>' ,'<CMD>Lspsaga rename<CR>', {silent=true, desc='rename something'})
vim.keymap.set({'n', 'v', 'i'}, '<A-/>' ,'<CMD>Lspsaga hover_doc<CR>', {silent=true, desc=' show documentation'})
vim.keymap.set({'n', 'v', 'i'}, '<A-v>' ,'<CMD>Lspsaga term_toggle<CR> ', {silent=true, desc='toggle terminal'})
vim.keymap.set({'n', 'v', 'i'}, '<C-a>' ,'<CMD>Lspsaga outline<CR>', {silent=true, desc='toggle outline of functions'})




-- toggle keymappings for venn using <leader>v
vim.keymap.set('n', '<leader>v', "<CMD>lua Toggle_venn()<CR>", { silent=true, noremap = true, desc='toggle venn diagram drawing' })

-- BarBar

-- Move to previous/next
vim.keymap.set({'n', 'v', 'i'}, '<A-,>', '<CMD>BufferPrevious<CR>', {silent=true, desc='Go to previous buffer'})
vim.keymap.set({'n', 'v', 'i'}, '<A-.>', '<CMD>BufferNext<CR>', {silent=true, desc='Go to next buffer'})
vim.keymap.set({'n', 'v', 'i'}, '<A-c>', '<CMD>enew<CR>', {silent=true, desc='open new buffer'})


-- Re-order to previous/next
vim.keymap.set({'n', 'v', 'i'}, '<A-<>', '<CMD>BufferMovePrevious<CR>', {silent=true, desc='Move buffer left'})
vim.keymap.set({'n', 'v', 'i'}, '<A->>', '<CMD>BufferMoveNext<CR>', {silent=true, desc='Move buffer right'})

-- Goto buffer in position...
vim.keymap.set({'n', 'v', 'i'}, '<A-1>', '<CMD>BufferGoto 1<CR>', {silent=true, desc='Go to buffer 1'})
vim.keymap.set({'n', 'v', 'i'}, '<A-2>', '<CMD>BufferGoto 2<CR>', {silent=true, desc='Go to buffer 2'})
vim.keymap.set({'n', 'v', 'i'}, '<A-3>', '<CMD>BufferGoto 3<CR>', {silent=true, desc='Go to buffer 3'})
vim.keymap.set({'n', 'v', 'i'}, '<A-4>', '<CMD>BufferGoto 4<CR>', {silent=true, desc='Go to buffer 4'})
vim.keymap.set({'n', 'v', 'i'}, '<A-5>', '<CMD>BufferGoto 5<CR>', {silent=true, desc='Go to buffer 5'})
vim.keymap.set({'n', 'v', 'i'}, '<A-6>', '<CMD>BufferGoto 6<CR>', {silent=true, desc='Go to buffer 6'})
vim.keymap.set({'n', 'v', 'i'}, '<A-7>', '<CMD>BufferGoto 7<CR>', {silent=true, desc='Go to buffer 7'})
vim.keymap.set({'n', 'v', 'i'}, '<A-8>', '<CMD>BufferGoto 8<CR>', {silent=true, desc='Go to buffer 8'})
vim.keymap.set({'n', 'v', 'i'}, '<A-9>', '<CMD>BufferGoto 9<CR>', {silent=true, desc='Go to buffer 9'})
vim.keymap.set({'n', 'v', 'i'}, '<A-0>', '<CMD>BufferLast<CR>', {silent=true, desc='Go to last buffer'})

-- Pin/unpin buffer
vim.keymap.set({'n', 'v', 'i'}, '<A-p>', '<CMD>BufferPin<CR>', {silent=true, desc='Pin buffer'})

-- Goto pinned/unpinned buffer)
--                          :BufferGotoPinned)
--                          :BufferGotoUnpinned)

-- Close buffer
vim.keymap.set({'n', 'v', 'i'}, '<A-w>', '<CMD>BufferClose<CR>', {silent=true, desc='Close buffer'})
-- Restore buffer
vim.keymap.set({'n', 'v', 'i'}, '<A-s-c>', '<CMD>BufferRestore<CR>', {silent=true, desc='Restore buffer'})

-- Wipeout buffer
--                          :BufferWipeout
-- Close commands
--                          :BufferCloseAllButCurrent
--                          :BufferCloseAllButVisible
--                          :BufferCloseAllButPinned
--                          :BufferCloseAllButCurrentOrPinned
--                          :BufferCloseBuffersLeft
--                          :BufferCloseBuffersRight

-- Magic buffer-picking mode
vim.keymap.set({'n', 'v', 'i'}, '<C-p>', '<CMD>BufferPick<CR>', {silent=true, desc='Pick buffer'})
vim.keymap.set({'n', 'v', 'i'}, '<C-p>', '<CMD>BufferPickDelete<CR>', {silent=true, desc='Pick delete buffre'})

-- Sort automatically by...
vim.keymap.set({'n', 'v'}, '<leader>bb', '<CMD>BufferOrderByBufferNumber<CR>', {silent=true, desc='Order buffer by buffer number'})
vim.keymap.set({'n', 'v'}, '<leader>bn', '<CMD>BufferOrderByName<CR>', {silent=true, desc='Order buffer by name'})
vim.keymap.set({'n', 'v'}, '<leader>bd', '<CMD>BufferOrderByDirectory<CR>', {silent=true, desc='Order buffer by directory'})
vim.keymap.set({'n', 'v'}, '<leader>bl', '<CMD>BufferOrderByLanguage<CR>', {silent=true, desc='Order buffer by language'})
vim.keymap.set({'n', 'v'}, '<leader>bw', '<CMD>BufferOrderByWindowNumber<CR>', {silent=true, desc='Order buffer by window number'})

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - disable tab bar
