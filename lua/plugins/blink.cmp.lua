return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}

      opts.sources.default = vim.list_extend(opts.sources.default or {}, { "minuet" })

      opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers or {}, {
        minuet = {
          name = "minuet",
          module = "minuet.blink",
          async = true,
          score_offset = 120,
          min_keyword_length = 1,
        },
      })

      return opts
    end,
  },
}
