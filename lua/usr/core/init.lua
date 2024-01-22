local modules = {
	"usr.core.set",
	"usr.core.remap",
	"usr.core.autocmd",
}

for _, module in ipairs(modules) do
	require(module)
end
