-- sort an incoming list using the table library's sort
-- in1: list for sorting, out1: sorted list

require("table")

local lsort = pd.Class:new():register("ldk-lsort")

function lsort:initialize(sel, atoms)
	 self.inlets = 1
	 self.outlets = 1
	 return true
end

function lsort:in_1(sel, atoms)
	 table.sort(atoms)
	 self:outlet(1, sel, atoms)
end

