local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap"}
}

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch GDB",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Launch GDB with Arguments",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
            local args_str = vim.fn.input({
                prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
    end,
    cwd = "${workspaceFolder}",  },
  {
    name = "Attach GDB to process",
    type = 'gdb',
    request = 'attach',
    pid = function()
      local input_pid = vim.fn.input('Enter process ID: ')
      if input_pid ~= '' then
        return tonumber(input_pid)
      end
      return nil
    end,
  },


  {
    name = 'Launch LLDB',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
  {
    name = "Launch LLDB with Arguments",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
            local args_str = vim.fn.input({
                prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach LLDB to process",
    type = 'lldb',
    request = 'attach',
    pid = function()
      local input_pid = vim.fn.input('Enter process ID: ')
      if input_pid ~= '' then
        return tonumber(input_pid)
      end
      return nil
    end,
  },
}
