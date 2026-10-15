local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local esn = sn(nil, {})

local vs = vim.fn.search
local fmta = require("luasnip.extras.fmt").fmta

require('luasnip-latex-snippets').setup({use_treesitter = false})
local is_math = utils.with_opts(utils.is_math, false)
local not_math = utils.with_opts(utils.not_math, false)

local function ensure_command(cmd, snip, math_only) -- Requires a dynamic node (d) to work.
		local line = vs("^\\\\newcommand", "bnW")
		local anchor = vs("% --- Custom Commands --- %", "n") + 1
		local search = vs("\\V" .. cmd:gsub("\\", "\\\\"), "bnw")
		line = line > 0 and line or anchor

		if math_only == nil or math_only < 0 or math_only > 2 then math_only = 1 end
		if search <= 0 then
			vim.api.nvim_buf_set_lines(0, line, line, false, {cmd})
		end

		if math_only == 1 then
			if not is_math() then return esn end
		elseif math_only == 2 then
			if is_math() then return esn end
		end

		return snip
end

-- local env_name = vim.fn["vimtex#env#get_inner().name"]
-- vim.keymap.set('i', '<CR>', function()
--	if env_name == "pmatrix" then
--		return "\\\\"
-- end
-- end)

ls.add_snippets("tex", {

	s({ -- Therefore (trf)
	   trig = "trf",
	   snippetType = "autosnippet",
	   condition = is_math
	},
	{
	   t("\\therefore")
	}),

	s({ -- Mathrm (mrm)
	   trig = "mrm",
	   condition = not_math
	},
	{
	  t("$\\mathrm{"),i(1),t("}$")
	}),

	s({ -- Startnote (startnote)
	  trig = "startnote2",
	  name = "Starts the note",
	  dscr = "Expands to the standard structure of my note with a few packages.",
	  condition = not_math
	},
	{
	t({"\\documentclass[a4paper, 12pt]{article}",
	  "\\usepackage{amsmath}",
	  "\\usepackage{amssymb}",
	  "\\usepackage{amsthm}",
	  "\\usepackage{indentfirst}",
	  "\\usepackage[english, brazilian]{babel}",
	  "\\newtheorem{theorem}{Teorema}[section]",
	  "\\newtheorem{definition}{Definição}[section]",
	  "\\newtheorem*{obs}{Observação}",
	  "",
	  "% --- Custom Commands --- %",
	  "",
	  "\\title{\\textbf{" }), i(1), t({ "}}",
	  "\\author{Vitor C.}",
	  "\\date{\\today}",
	  "",
	  "\\begin{document}",
		"\\selectlanguage{brazilian}",
	  	"\\maketitle",
		"",
		"",
		}),i(2),
	    t({ "",
	  "\\end{document}"})
	}),

	s({ -- Startnote (startnote)
	  trig = "startnote",
	  name = "Starts the note",
	  dscr = "Expands to the standard structure of my note with a few packages.",
	  condition = not_math
	},
	{
	t({"\\documentclass[a4paper, 12pt]{article}",
	  "\\input{~/Documents/.latex/note.tex}",
	  "\\title{\\textbf{" }), i(1), t({ "}}",
	  "\\author{Vitor C.}",
	  "\\date{\\today}",
	  "",
	  "\\begin{document}",
		"\\selectlanguage{brazilian}",
	  	"\\maketitle",
		"",
		"",
		}),i(2),
	    t({ "",
	  "\\end{document}"})
	}),

	s({ -- Power (pwr)
	  trig = "pwr",
	  wordTrig = false,
	  snippetType = "autosnippet"
	},
	{
	  t("^{"),i(1),t("}")
	}),

	s({ -- Boxed (boxed)
	  trig = "boxed",
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{
	 t("\\boxed{"), i(1), t("}")
	}),

	s({ -- Underbrace + text (underbrace)
	  trig = "underbrace",
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{
	  t("\\underbrace{"), i(1), t("}_{\\text{"), i(2), t("}}")
	}),

	s({ -- Vector (vec)
	  trig = "([\\%w]*)vec",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{
	  d(1, function(_, parent)
		local match = parent.snippet.captures[1]

		if match == "" then
			return sn(nil, fmta([[\vec{<>}]], { i(1) }))
		else
			return sn(nil, fmta([[\vec{<>}]], { t(match)}))
		end
		end)
	}),

	s({ -- Section (section)
	  trig = "section",
	  snippetType = "autosnippet",
	  condition = not_math,
	},
	{
	  t("\\section{"), i(1), t("}"), i(2)
	}),

	s({ -- Partial Symbol (par)
	  trig = "par",
	  condition = is_math,
	},
	{
	  t("\\partial")
	}),

	s({ -- Inner Product (nner)
	  trig = "nner",
	  name = "Inner Product",
	  dscr = "Checks to see if the inner product command was added before adding an inner product. If not, then add it first.",
	  snippetType = "autosnippet",
	},
	{
	  d(1, function()
		local inr = "\\newcommand{\\inner}[2]{\\left\\langle #1; #2 \\right\\rangle}"
		local snip = sn(nil, {t("\\inner{"), i(1), t("}{"), i(2), t("}")})

		return ensure_command(inr, snip, 1)
	  end)
	}),

	s({ -- Math Blackboard (bb)
	  trig = "([\\%w]*)bb",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{
	  d(1, function(_, parent)
		local match = parent.snippet.captures[1]

		if match == "" then
			return sn(nil, fmta([[\mathbb{<>}]], { i(1) }))
		else
			return sn(nil, fmta([[\mathbb{<>}]], { t(match)}))
		end
		end)
	}),

	s({ -- Top (top)
	  trig = "top",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{ t("^\\top") }),

	s({ -- Prime (prime)
	  trig = "prime",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{ t("^\\prime") }),

	s({ -- Rn (rn)
	  trig = "rn",
	  condition = is_math,
	},
	{ t("\\mathbb{R}^{"), i(1, "n"), t("}"), i(2)
	}),

	s({ -- Math Caligraphy (mathcal)
	  trig = "([\\%w]*)mathcal",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{
	  d(1, function(_, parent)
		local match = parent.snippet.captures[1]

		if match == "" then
			return sn(nil, fmta([[\mathcal{<>}]], { i(1) }))
		else
			return sn(nil, fmta([[\mathcal{<>}]], { t(match)}))
		end
		end)
	}),

	s({ -- Determinant (det)
	  trig = "([\\%w]*)det",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = is_math,
	},
	{ t("\\det("), i(1), t(")"), i(2)
	}),

	s({ -- Textit (italic)
	  trig = "italic",
	  regTrig = true,
	  wordTrig = false,
	  snippetType = "autosnippet",
	  condition = not_math,
	},
	{ t("\\textit{"), i(1), t("}"), i(2) }),

	s({ -- Definition (definition)
	  trig = "definition",
	  condition = not_math,
	},
	{
	  t({ "\\begin{definition}",
	      "",}), i(1), t({"", "\\end{definition}"})
	}),

	s({ -- Theorem (theorem)
	  trig = "theorem",
	  condition = not_math,
	},
	{
	  t({ "\\begin{theorem}",
	      "",}), i(1), t({"", "\\end{theorem}"})
	}),

	s({ -- Note (note)
	  trig = "obs",
	  condition = not_math,
	},
	{
	  t({ "\\begin{obs}",
	      "",}), i(1), t({"", "\\end{obs}"})
	}),

})
