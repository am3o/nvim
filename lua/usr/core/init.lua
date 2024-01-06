local modules = {
    "usr.core.set",
    "usr.core.remap"
}

for _, module in ipairs(modules) do
    require(module)
end
