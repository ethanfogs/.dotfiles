local lga = {
  actions = require("telescope-live-grep-args.actions")
}

lga.auto_quoting = true

lga.mappings = {
  i = {
    ["<C-k>"] = lga.actions.quote_prompt(),
  }
}

print(1)

return {

}
