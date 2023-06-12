local status, copilot = pcall(require, "copilot")

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
