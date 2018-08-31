function str_split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

local top = pd.Class:new():register("ldk-top")

function top:initialize(sel, atoms)
    self.inlets = 1
    self.outlets = 1
    return true
end

function top:in_1_bang()
    local handle = io.popen("top -b -n 1 -o P | sed -n '8, 50{s/^ *//;s/ *$//;s/  */,/gp;};30q'")
    local result = handle:read("*a")
    local resplit = str_split(result, "\n")
    handle:close()
    for k,v in pairs(resplit) do
        self:outlet(1, "list" ,str_split(v, ","))
     end
    end


    
