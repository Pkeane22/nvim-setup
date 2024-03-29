require("dapui").setup()

local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>")
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dt", ":DapTerminate<CR>")
vim.keymap.set("n", "<leader>dx", function ()
    dap.terminate()
    dapui.close()
end)
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>")
vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>")
