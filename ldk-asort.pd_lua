-- sort an array using the table library's sort
-- in1: trig sort, in2: symbol for array name

require("table")

local asort = pd.Class:new():register("ldk-asort")

function asort:initialize(sel, atoms)
	 self.inlets = 2
	 self.outlets = 0
	 if type(atoms[1]) == "string" then
	    self.name = atoms[1]
	 else
	    self.name = nil
	 end
	 return true
end

function asort:in_1_bang()
	 local t = pd.Table:new():sync(self.name)
	 if t~= nil then
	    local t_n = t:length()
	    local temp = {n=t_n}
	    for i=1,t_n do
	    	temp[i] = t:get(i-1)
	    end
	    table.sort(temp)
	    for i=1,t_n do
	    	t:set(i-1,temp[i])
	    end
	end
end

function asort:in_2_symbol(s)
	 self.name = s
end