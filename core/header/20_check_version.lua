function nrc.check_version(a, b)
	a = a or 0
	b = b or 0
	local ca, cb = crawl.version("major"):match("(%d*).(%d*)")
	ca = tonumber(ca)
	cb = tonumber(cb)
	return (ca > a) or (ca == a and cb >= b)
end
