local configs = require 'lspconfig.configs'
local util = require 'lspconfig.util'

-- Having server name defined here is the convention, this is often times also the first entry in the `cmd` table.
local server_name = 'luahelper'
local cmd = { server_name }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '-mode=1' }
end

return {
  default_config = {
    -- This should be executable on the command line, arguments (such as `--stdio`) are additional entries in the list.
    cmd = cmd,
    -- These are the filetypes that the server will either attach or start in response to opening. The user must have a filetype plugin matching the filetype, either via the built-in runtime files or installed via plugin.
    filetypes = { 'lua' },
    -- The root directory that lspconfig uses to determine if it should start a new language server, or attach the current buffer to a previously running language server.
    root_dir = function(fname)
        return util.root_pattern('luahelper.json')(fname) or util.find_git_ancestor(fname)
    end,
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
    settings = { 
    },
  },
  docs = {
    -- The description should include at minimum the link to the github project, and ideally the steps to install the language server.
    description = [[
tencent/luahelper
]],
  },
}
