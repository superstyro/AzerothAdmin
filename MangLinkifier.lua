-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
--
-- Copyright (C) 2018 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------

local function RGBPercToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r*255, g*255, b*255)
end
function MangLinkifier_Decompose(chatstring)
  if chatstring ~= nil then
    ----------====~~GO Target Command Match Text ~~====----------
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargid1"]) do --TARGET ID
      chatstring = string.gsub (chatstring, Strings["lfer_GOtargid2"], MangLinkifier_Link(Strings["lfer_GOtargid3"], "%2", "targid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargguid1"]) do --TARGET GUID
      chatstring = string.gsub (chatstring, Strings["lfer_GOtargguid1"], MangLinkifier_Link(Strings["lfer_GOtargguid3"], "%1", "targguid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_GOtargxyz1"]) do --TARGET XYZ
      chatstring = string.gsub (chatstring, Strings["lfer_GOtargxyz2"], MangLinkifier_Link(Strings["lfer_GOtargxyz3"], "1 %2 %3 %4", "targxyz"))
    end
    ----------====~~ NPC Info Command Match Text ~~====----------
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfoguid1"]) do --NPCINFO GUID
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfoguid2"], MangLinkifier_Link(Strings["lfer_NPCInfoguid3"], "%1", "npcguid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfoentry1"]) do --NPCINFO Entry
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfoentry2"], MangLinkifier_Link(Strings["lfer_NPCInfoentry3"], "%1", "npcentry"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfodisplay1"]) do --NPCINFO Display
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfodisplay2"], MangLinkifier_Link(Strings["lfer_NPCInfodisplay3"], "%1", "npcdisplay"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_NPCInfodisplay21"]) do --NPCINFO Display Native
      chatstring = string.gsub (chatstring, Strings["lfer_NPCInfodisplay22"], MangLinkifier_Link(Strings["lfer_NPCInfodisplay23"], "%1", "npcdisplay2"))
    end
    ----------====~~ ADD GO Command Match Text ~~====----------
    for guid in string.gmatch(chatstring, Strings["lfer_AddGoguid1"]) do --ADDGO GUID
      chatstring = string.gsub (chatstring, Strings["lfer_AddGoguid2"], MangLinkifier_Link(Strings["lfer_AddGoguid3"], "%1", "addgoguid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_AddGoid1"]) do --ADDGO ID
      chatstring = string.gsub (chatstring, Strings["lfer_AddGoid2"], MangLinkifier_Link(Strings["lfer_AddGoid3"], "%1", "addgoid"))
    end
    for guid in string.gmatch(chatstring, Strings["lfer_AddGoxyz1"]) do --ADDGO XYZ
      chatstring = string.gsub (chatstring, Strings["lfer_AddGoxyz2"], MangLinkifier_Link(Strings["lfer_AddGoxyz3"], "%1 %2 %3", "addgoxyz"))
    end
    ----------====~~ GPS Command Match Text ~~====----------
    for guid in string.gmatch(chatstring, Strings["lfer_GPSxyz1"]) do --GPS XYZ
      chatstring = string.gsub (chatstring, Strings["lfer_GPSxyz2"], MangLinkifier_Link(Strings["lfer_GPSxyz3"], "%1 %2 %3", "gpsxyz"))
    end
    ----------====~~ Added Options for Clickable Links Made by Mangos ~~====----------
    for guid in string.gmatch(chatstring, "%|cffffffff%|Hquest:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP QUEST
      chatstring = string.gsub (chatstring, "%|cffffffff%|Hquest:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookupquest"))
    end
    for guid in string.gmatch(chatstring, "%|cff(.*)%|Hitem:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP ITEM -- Bug when more than 1 item is linked in chat, it is not  translated
      chatstring = string.gsub (chatstring, "%|cff(.*)%|Hitem:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%3-%1", "%2", "lookupitem"))
    end
    for guid in string.gmatch(chatstring, "%|cffffffff%|Hgameobject_entry:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP OBJECT
      chatstring = string.gsub (chatstring, "%|cffffffff%|Hgameobject_entry:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookupgo"))
    end
    for guid in string.gmatch(chatstring, "%|cffffffff%|Hcreature_entry:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP CREATURE
      chatstring = string.gsub (chatstring, "%|cffffffff%|Hcreature_entry:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookupcreature"))
    end
    for guid in string.gmatch(chatstring, "%|cffffffff%|Hspell:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP SPELL
      chatstring = string.gsub (chatstring, "%|cffffffff%|Hspell:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookupspell"))
    end
    for guid in string.gmatch(chatstring, "%|cffffffff%|Htele:(.*)%|h%[(.*)%]%|h%|r") do --LOOKUP TELE
      chatstring = string.gsub (chatstring, "%|cffffffff%|Htele:(.*)%|h%[(.*)%]%|h%|r", MangLinkifier_Link("%2", "%1", "lookuptele"))
    end
  end
  return chatstring
end

function MangLinkifier_Link(orgtxt, id, type)
  local color = MangAdmin.db.account.style.color.linkifier
  local urlcolor = RGBPercToHex(color.r,color.g,color.b)
  --local urlcolor = (string.rep("0",6-string.len((string.upper(string.format("%x", dec)))))..(string.upper(string.format("%x", dec))))
  ----------====~~GO Target Command Replace Text ~~====----------
  if(type == "targid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargidadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargidlist:" .. id .. "|h["..Locale["lfer_List"].."]|h|r "
  elseif(type == "targguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargguidgo:" .. id .. "|h["..Locale["lfer_Goto"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargguidmove:" .. id .. "|h["..Locale["lfer_Move"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargguidturn:" .. id .. "|h["..Locale["lfer_Turn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Htargguiddel:" .. id .. "|h["..Locale["lfer_Delete"].."]|h|r \n"
  elseif(type == "targxyz") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Htargxyz:" .. id .. "|h["..Locale["lfer_Teleport"].."]|h|r "
  ----------====~~ NPC Info Command Replace Text ~~====----------
  elseif(type == "npcguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcguidgo:" .. id .. "|h["..Locale["lfer_Goto"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hnpcguidmove:" .. id .. "|h["..Locale["lfer_Move"].."]|h|r "
  elseif(type == "npcentry") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcentryadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hnpcentrylist:" .. id .. "|h["..Locale["lfer_List"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hnpcentryreload:" .. id .. "|h["..Locale["lfer_Reload"].."]|h|r "
  elseif(type == "npcdisplay") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcdisplay:" .. id .. "|h["..Locale["lfer_Morph"].."]|h|r "
  elseif(type == "npcdisplay2") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hnpcdisplay2:" .. id .. "|h["..Locale["lfer_Morph"].."]|h|r "
  ----------====~~ ADD GO Command Replace Text ~~====----------
  elseif(type == "addgoguid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Haddgoguidgo:" .. id .. "|h["..Locale["lfer_Goto"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Haddgoguidmove:" .. id .. "|h["..Locale["lfer_Move"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Haddgoguidturn:" .. id .. "|h["..Locale["lfer_Turn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Haddgoguiddel:" .. id .. "|h["..Locale["lfer_Delete"].."]|h|r \n"
  elseif(type == "addgoid") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Haddgoid:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r \n"
  elseif(type == "addgoxyz") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Haddgoxyz:" .. id .. "|h["..Locale["lfer_Teleport"].."]|h|r "
  ----------====~~ GPS Command Replace Text ~~====----------
  elseif(type == "gpsxyz") then
    link = orgtxt .." - |cff" .. urlcolor .. "|Hgpsxyz:" .. id .. "|h["..Locale["lfer_Teleport"].."]|h|r "
  ----------====~~ Added Options for Clickable Links Made by Mangos ~~====----------
  elseif(type == "lookupquest") then
    link = "|cffffffff|Hquest:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupquestadd:" .. id .. "|h["..Locale["lfer_Add"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hlookupquestrem:" .. id .. "|h["..Locale["lfer_Remove"].."]|h|r "
  elseif(type == "lookupitem") then
    for orgtxt, color in string.gmatch (orgtxt, "(.*)%-(.*)") do
      link = "|cff" .. color .."|Hitem:" .. id .. "|h[" .. orgtxt .. "]|h|r"
      link = link .." - |cff" .. urlcolor .. "|Hlookupitemadd:" .. id .. "|h["..Locale["lfer_Add"].."]|h|r "
      link = link .." - |cff" .. urlcolor .. "|Hlookupitemlist:" .. id .. "|h["..Locale["lfer_List"].."]|h|r "
    end
  elseif(type == "lookupgo") then
    link = "|cffffffff|Hgameobject_entry:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupgoadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hlookupgolist:" .. id .. "|h["..Locale["lfer_List"].."]|h|r "
  elseif(type == "lookupcreature") then
    link = "|cffffffff|Hcreature_entry:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupcreatureadd:" .. id .. "|h["..Locale["lfer_Spawn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hlookupcreaturelist:" .. id .. "|h["..Locale["lfer_List"].."]|h|r "
  elseif(type == "lookupspell") then
    link = "|cffffffff|Hspell:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupspelllearn:" .. id .. "|h["..Locale["lfer_Learn"].."]|h|r "
    link = link .." - |cff" .. urlcolor .. "|Hlookupspellunlearn:" .. id .. "|h["..Locale["lfer_Unlearn"].."]|h|r "
  elseif(type == "lookuptele") then
    link = "|cffffffff|Htele:" .. id .. "|h[" .. orgtxt .. "]|h|r"
    link = link .." - |cff" .. urlcolor .. "|Hlookupteledelete:" .. id .. "|h["..Locale["lfer_Delete"].."]|h|r "
  else
    link = orgtxt .." - |cffc20000"..Locale["lfer_Error"].." |r |cff008873" .. type .. "|r"
  end
  return link
end

function MangLinkifier_SetItemRef(link, text, button)
  ----------====~~Target Command Functions ~~====----------
  if ( strsub(link, 1, 9) == "targidadd" ) then
    SendChatMessage(".gobject add "..strsub(link, 11), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 10) == "targidlist" ) then
    SendChatMessage(".list object "..strsub(link, 12), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 10) == "targguidgo" ) then
    SendChatMessage(".go object "..strsub(link, 12), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "targguidmove" ) then
    SendChatMessage(".gobject move "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "targguidturn" ) then
    SendChatMessage(".gobject turn "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "targguiddel" ) then
    SendChatMessage(".gobject delete "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 7) == "targxyz" ) then
    SendChatMessage(".go "..strsub(link, 9), say, nil, nil)
    return;
  ----------====~~ NPC Info Command Functions ~~====----------
  elseif ( strsub(link, 1, 9) == "npcguidgo" ) then
    SendChatMessage(".go creature "..strsub(link, 11), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "npcguidmove" ) then
    SendChatMessage(".go creature "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "npcentryadd" ) then
    SendChatMessage(".npc add "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "npcentrylist" ) then
    SendChatMessage(".list creature "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 14) == "npcentryreload" ) then
    SendChatMessage(".reload creature_template "..strsub(link, 16), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 10) == "npcdisplay" ) then
    SendChatMessage(".modify morph "..strsub(link, 12), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "npcdisplay2" ) then
    SendChatMessage(".modify morph "..strsub(link, 13), say, nil, nil)
    return;
  ----------====~~ ADD GO Command Functions ~~====----------
  elseif ( strsub(link, 1, 11) == "addgoguidgo" ) then
    SendChatMessage(".go object "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 13) == "addgoguidmove" ) then
    SendChatMessage(".gobject move "..strsub(link, 15), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 13) == "addgoguidturn" ) then
    SendChatMessage(".gobject turn "..strsub(link, 15), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "addgoguiddel" ) then
    SendChatMessage(".gobject delete "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 7) == "addgoid" ) then
    SendChatMessage(".gobject add "..strsub(link, 9), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 8) == "addgoxyz" ) then
    SendChatMessage(".go "..strsub(link, 10), say, nil, nil)
    return;
  ----------====~~ GPS Command Functions ~~====----------
  elseif ( strsub(link, 1, 6) == "gpsxyz" ) then
    SendChatMessage(".go  "..strsub(link, 8), say, nil, nil)
    return;
  ----------====~~ Support for Clickable Links Made by Mangos and Added Options ~~====----------
  elseif ( strsub(link, 1, 5) == "quest" ) then
    SendChatMessage(".quest add "..strsub(link, 7), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 14) == "lookupquestadd" ) then
    SendChatMessage(".quest add "..strsub(link, 16), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 14) == "lookupquestrem" ) then
    SendChatMessage(".quest remove "..strsub(link, 16), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 13) == "lookupitemadd" ) then
    SendChatMessage(".additem "..strsub(link, 15), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 14) == "lookupitemlist" ) then
    SendChatMessage(".list item "..strsub(link, 16), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 16) == "gameobject_entry" ) then
    SendChatMessage(".gobject add "..strsub(link, 18), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 11) == "lookupgoadd" ) then
    SendChatMessage(".gobject add "..strsub(link, 13), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 12) == "lookupgolist" ) then
    SendChatMessage(".list object "..strsub(link, 14), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 14) == "creature_entry" ) then
    SendChatMessage(".npc add "..strsub(link, 16), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 17) == "lookupcreatureadd" ) then
    SendChatMessage(".npc add "..strsub(link, 19), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 18) == "lookupcreaturelist" ) then
    SendChatMessage(".list creature "..strsub(link, 20), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 10) == "gameobject" ) then
    SendChatMessage(".go object "..strsub(link, 12), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 8) == "creature" ) then
    SendChatMessage(".go creature "..strsub(link, 10), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 5) == "spell" ) then
    SendChatMessage(".learn "..strsub(link, 7), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 16) == "lookupspelllearn" ) then
    SendChatMessage(".learn "..strsub(link, 18), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 18) == "lookupspellunlearn" ) then
    SendChatMessage(".unlearn "..strsub(link, 20), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 4) == "tele" ) then
    SendChatMessage(".tele "..strsub(link, 6), say, nil, nil)
    return;
  elseif ( strsub(link, 1, 16) == "lookupteledelete" ) then
    SendChatMessage(".tele del "..strsub(link, 18), say, nil, nil)
    return;
  end
  MangLinkifier_SetItemRef_Original(link, text, button);
end
