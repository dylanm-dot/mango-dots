local plugins_dir = vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', 'plugins')

for name, type in vim.fs.dir(plugins_dir) do
    if type == 'file' and name:match('%.lua$') then
        local module = 'plugins.' .. name:gsub('%.lua$', '')
        local ok, err = pcall(require, module)
    end
end
