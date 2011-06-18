require "string"

ignore = {
	[">.<"] = 1,
	[">_<"] = 1,
	[">_>"] = 2,
	[">.>"] = 2
}

function removeIgnore(text)
	for k,v in pairs(ignore) do
		find = text:find(k, 1, true)
		if find then
			repd = text:sub(find):gsub(">", "@#@#", v)
			text = text:sub(1, find-1) .. repd
		end
	end
	return text
end

function fixIgnore(text)
	return text:gsub("@#@#", ">")
end

function handleGreenText(word, word_eol, data)
	text = word_eol[1]
	text = removeIgnore(text)
	channel = xchat.get_info("channel")
	index = string.find(text, "[%s]+>") or string.find(text, "^>")

	if not (index == nil) then
		xchat.commandf("msg %s %s03%s", channel, fixIgnore(text:sub(1, index-1)), fixIgnore(text:sub(index))) 
		return xchat.EAT_ALL
	end

	return xchat.EAT_NONE
end

function xchat_register()
	return "Greentext", "Makes text after >s green.", "1"
end

function xchat_init()
	xchat.hook_command("", "handleGreenText")
end

