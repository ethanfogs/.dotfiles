local auto_pairs = require("nvim-autopairs")
auto_pairs.rule = require("nvim-autopairs.rule")

auto_pairs.setup()

auto_pairs.add_rule(auto_pairs.rule("<", ">", { "vim" }))

auto_pairs.add_rule(auto_pairs.rule("**", "**", { "markdown" }))
auto_pairs.add_rule(auto_pairs.rule("__", "__", { "markdown" }))
