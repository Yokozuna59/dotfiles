-- configurations for nvim-lint

local lint = require("lint")

-- lint.linters.dartfmt = {
-- 	cmd = "dart",
-- 	stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
-- 	append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
-- 	args = { "analyze", "--fatal-infos" },
-- 	stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
-- 	ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
-- 	env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
-- 	parser = your_parse_function,
-- }

-- lint.linters.your_linter_name = {
-- 	cmd = "linter_cmd",
-- 	stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
-- 	append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
-- 	args = {}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
-- 	stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
-- 	ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
-- 	env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
-- 	parser = your_parse_function,
-- }

lint.linters_by_ft = {
    css = { "stylelint" },
    javascript = { "eslint" },
    markdown = { "markdownlint" },
    lua = { "selene" },
    sh = { "shellcheck" },
    vim = { "vint" },
    yaml = { "yamllint" },
}

-- run linters on read and write
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
-- print(
--     "yaml|yml|json|toml|ini|xml|html|js|jsx|py|ipynd|pyi|dart"
--         .. "|cjs|mjs|cts|mts|ts|tsx|rs|bash|sh|lua|css|html|less|sass|scss|vim"
-- )
