return {
  settings = {
		Lua = {
      diagnostics = {
				globals = { "vim", "spec" },
			},
      runtime = {
				version = "LuaJIT",
				special = {
					spec = "require",
				},
			},
    },
  },
}
