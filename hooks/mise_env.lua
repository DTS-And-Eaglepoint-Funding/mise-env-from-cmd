--- @param name string
--- @return string|nil
local function run_cmd(cmd)
    local handle, errmsg = io.popen("sh -c '" .. cmd .. "'")
    local data = handle:read("*a")
    suc, exitcode, code = handle:close()

    
    -- Trim trailing whitespace (newlines, spaces, tabs)
    data = data:gsub("%s+$", "")
    return data
end

function PLUGIN:MiseEnv(ctx)

    local env_vars = {}

    for env_var_name, cmd in pairs(ctx.options) do
        local result = run_cmd(cmd)
        if result == nil then
            error("Could not run command [" .. cmd .. "]")
        end
        table.insert(env_vars, {key = env_var_name, value = result})
    end

    return env_vars

end
