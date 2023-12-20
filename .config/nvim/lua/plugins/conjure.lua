return {
  "Olical/conjure",
  ft = { "clojure" },
  config = function(_)
    require("conjure.main").main()
    require("conjure.mapping")["on-filetype"]()
  end,
  init = function()
    vim.g["conjure#mapping#doc_word"] = false
    vim.g["conjure#mapping#def_word"] = false

    vim.api.nvim_create_autocmd("BufNewFile", {
      group = vim.api.nvim_create_augroup("ConjureLogDisableDiagnostics", { clear = true }),
      pattern = { "conjure-log-*" },
      callback = function()
        return vim.diagnostic.disable(0)
      end,
    }
    )
  end,
}
