local function read_file(path)
  local f = io.open(path, "r")
  if not f then
    return ""
  end
  local content = f:read("*all")
  f:close()
  return content
end

local function get_system_prompt()
  return read_file(vim.fn.expand("~/.config/nvim/CLAUDE.md"))
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_fim_compatible",
        n_completions = 1,
        context_window = 2048,
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Llama.cpp",
            end_point = "http://localhost:8081/v1/completions",
            model = "PLACEHOLDER",
            optional = {
              max_tokens = 256,
              top_p = 0.95,
              temperature = 0.2,
            },
            template = {
              prompt = function(before, after, _)
                local system = get_system_prompt()

                return system .. "\n\n" .. "<|fim_prefix|>" .. before .. "<|fim_suffix|>" .. after .. "<|fim_middle|>"
              end,
              suffix = false,
            },
          },
        },
        virtualtext = {
          auto_trigger_ft = { "lua", "cpp", "python", "javascript", "rust" },
          keymap = {
            accept = "<A-A>",
            accept_line = "<A-a>",
            accept_n_lines = "<A-z>",
            prev = "<A-[>",
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
      })
    end,
  },
}
