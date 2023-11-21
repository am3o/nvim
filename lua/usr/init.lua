local modules = {
    "usr.lazy",
    "usr.core",
}

for _, module in ipairs(modules) do
    require(module)
end
