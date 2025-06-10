local modules = {
	"usr.core",
}

for _, module in ipairs(modules) do
	require(module)
end
