Handlebars.registerHelper "unless_eq", (context, options) ->
	compare = options.hash.compare
	# if compare is a String && starts and ends with "/"
	if typeof compare == "string" and compare.match(/^\/.*?\/$/)
		# convert compare to RegExp after removing "/" at start and end
		compare = new RegExp compare.replace(/^\/(.*?)\/$/,'$1')
		if compare.test(context) then return options.inverse this
		return options.fn this
	return options.inverse(this) if context in options.hash.compare.split("||")
	options.fn this
