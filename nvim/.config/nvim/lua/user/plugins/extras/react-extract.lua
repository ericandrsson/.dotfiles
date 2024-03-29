local M = {
	"napmn/react-extract.nvim",
	opts = {
		-- add any options here
	},
}

function M.config()
	local wk = require("which-key")
	-- Using setup function with default values
	require("react-extract").setup({
		ts_type_property_template = "[INDENT][PROPERTY]: any\n",
		ts_template_before = "type [COMPONENT_NAME]Props = {\n[TYPE_PROPERTIES]}\n[EMPTY_LINE]\n"
			.. "export const [COMPONENT_NAME]: React.FC<[COMPONENT_NAME]Props> = "
			.. "([PROPERTIES]) => {\n"
			.. "[INDENT]return (\n",
		ts_template_after = "[INDENT])\n}",
		js_template_before = "export const [COMPONENT_NAME] = " .. "([PROPERTIES]) => {\n" .. "[INDENT]return (\n",
		js_template_after = "[INDENT])\n}",
		jsx_indent_level = 2,
		use_class_props = false,
		use_autoimport = true,
		autoimport_defer_ms = 350,
		local_extract_strategy = "BEFORE",
	})
	wk.register({
		["<Leader>re"] = {
			"<cmd>lua require('react-extract').extract_to_new_file()<cr>",
			"Extract to New File (Visual)",
			mode = "v",
		},
		["<Leader>rc"] = {
			"<cmd>lua require('react-extract').extract_to_current_file()<cr>",
			"Extract to Current File (Visual)",
			mode = "v",
		},
	})
end

return M
