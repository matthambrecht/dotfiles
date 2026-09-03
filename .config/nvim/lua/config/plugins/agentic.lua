return {
	"carlos-algms/agentic.nvim",
	opts = {
		provider = "claude-agent-acp",
		keymaps = {
			widget = {
				switch_model = "<leader>am",
				switch_provider = "<leader>ap",
				change_thought_level = "<leader>at",
				open_options = "<leader>ao",
				select_session = "<leader>as",
				destroy_session = "<leader>ad",
			},
		},
	},
	keys = {
		{
			"<leader>aa",
			function()
				require("agentic").toggle()
			end,
			mode = { "n", "v" },
			desc = "Agentic toggle chat",
		},
		{
			"<leader>ac",
			function()
				require("agentic").add_selection_or_file_to_context()
			end,
			mode = { "n", "v" },
			desc = "Agentic add file/selection to context",
		},
		{
			"<leader>an",
			function()
				require("agentic").new_session()
			end,
			mode = { "n", "v" },
			desc = "Agentic new session",
		},
		{
			"<leader>ap",
			function()
				require("agentic").switch_provider()
			end,
			mode = { "n", "v" },
			desc = "Agentic switch provider",
		},
	},
}
