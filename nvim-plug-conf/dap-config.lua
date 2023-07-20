function init()
  vim.keymap.set("n", "<leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
  vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { silent = true })
  vim.keymap.set("n", "<leader>di", ":lua require'dap'.repl.open()<CR>", { silent = true })
  vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", { silent = true })
  vim.keymap.set("n", "<leader>dO", ":lua require'dap'.step_out()<CR>", { silent = true })

  local dap, dapui = require("dap"), require("dapui")

  dapui.setup()
  vim.keymap.set("n", "<leader>du", dapui.toggle, { silent = true })

  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = { "/Users/ruinb0w/.config/nvim/js-debug/src/dapDebugServer.js", "${port}" },
    }
  }

  dap.configurations.javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  }

  dap.configurations.typescript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      runtimeExecutable = "ts-node",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  }
end

return function(use)
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }
  init()
end
