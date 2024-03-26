--- @param tbl table
--- @param start number|nil
--- @param endd number|nil
return function(tbl, start, endd)
	start = start or 1
	endd = endd or #tbl

	if (#tbl == 0) or (start > #tbl) or (endd < start) then
		return {}
	end

	local sliced = {}
	for index = start, endd, 1 do
		table.insert(sliced, tbl[index])
	end
	return sliced
end
