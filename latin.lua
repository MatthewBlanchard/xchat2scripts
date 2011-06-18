require "table"
require "string"

conversionTable = {
["a"]="ａ",
["b"]="ｂ",
["c"]="ｃ",
["d"]="ｄ",
["e"]="ｅ",
["f"]="ｆ",
["g"]="ｇ",
["h"]="ｈ",
["i"]="ｉ",
["j"]="ｊ",
["k"]="ｋ",
["l"]="ｌ",
["m"]="ｍ",
["n"]="ｎ",
["o"]="ｏ",
["p"]="ｐ",
["q"]="ｑ",
["r"]="ｒ",
["s"]="ｓ",
["t"]="ｔ",
["u"]="ｕ",
["v"]="ｖ",
["w"]="ｗ",
["x"]="ｘ",
["y"]="ｙ",
["z"]="ｚ",
["A"]="Ａ",
["B"]="Ｂ",
["C"]="Ｃ",
["D"]="Ｄ",
["E"]="Ｅ",
["F"]="Ｆ",
["G"]="Ｇ",
["H"]="Ｈ",
["I"]="Ｉ",
["J"]="Ｊ",
["K"]="Ｋ",
["L"]="Ｌ",
["M"]="Ｍ",
["N"]="Ｎ",
["O"]="Ｏ",
["P"]="Ｐ",
["Q"]="Ｑ",
["R"]="Ｒ",
["S"]="Ｓ",
["T"]="Ｔ",
["U"]="Ｕ",
["V"]="Ｖ",
["W"]="Ｗ",
["X"]="Ｘ",
["Y"]="Ｙ",
["Z"]="Ｚ",
["!"]="！",
["\""]="＂",
["#"]="＃",
["$"]="＄",
["%"]="％",
["&"]="＆",
["'"]="＇",
["("]="（",
[")"]="）",
["*"]="＊",
["+"]="＋",
[","]="，",
["-"]="－",
["."]="．",
["/"]="／",
["0"]="０",
["1"]="１",
["2"]="２",
["3"]="３",
["4"]="４",
["5"]="５",
["6"]="６",
["7"]="７",
["8"]="８",
["9"]="９",
[":"]="：",
[";"]="；",
["<"]="＜",
["="]="＝",
[">"]="＞",
["?"]="？",
["@"]="＠",
["["]="［",
["\\"]="＼",
["]"]="］",
["^"]="＾",
["_"]="＿",
["`"]="｀",
["{"]="｛",
["|"]="｜",
["}"]="｝",
["~"]="～",
["¢"]="￠",
["£"]="￡",
["¥"]="￥",
[" "]="　"
}

function convert(word, word_eol, userdata)
	text = word_eol[2]
	text = explode(text)

	channel = xchat.get_info("channel")

	for i = 1, table.maxn(text) do
		text[i] = conversionTable[text[i]] or text[i] 
	end

	xchat.commandf("msg %s %s", channel, table.concat(text, ""))
	return xchat.EAT_ALL
end

function xchat_register()
	return "Latin", "Changes text to full width latin.", "1"
end

function xchat_init()
	xchat.hook_command("LTN", "convert")
end

function explode(str)
	exploded = {}
	for i = 1, str:len() do
		exploded[i] = str:sub(i,i)
	end
	return exploded
end
