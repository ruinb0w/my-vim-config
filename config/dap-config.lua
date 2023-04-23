--[[ dap ]]
vim.keymap.set("n", "<leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { silent = true })
vim.keymap.set("n", "<leader>di", ":lua require'dap'.repl.open()<CR>", { silent = true })

-- ts and js
for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    }
  }
end

require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})
