-------------------------------------------------------------------------------------------------------------
--
-- AzerothAdmin Version 3.x
-- AzerothAdmin is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2024 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Repository: https://gitlab.superstyro.com/superstyro/azerothadmin
-------------------------------------------------------------------------------------------------------------

function WhoUpdate()
    MangAdmin:LogAction("Getting Who.")
    local whoCount = 0
    table.foreachi(MangAdmin.db.account.buffer.who, function() whoCount = whoCount + 1 end)
    if whoCount > 0 then
      ma_whoscrollframe1:SetText("Loading")
      local lineplusoffset
      local line
      ma_whoscrollframe:Show()
      FauxScrollFrame_Update(ma_whoscrollframe,whoCount,12,16);
      for line = 1,12 do
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_whoscrollframe)
        if lineplusoffset <= whoCount then
          local object = MangAdmin.db.account.buffer.who[lineplusoffset]
          if object then
            getglobal("ma_whoscrollframe"..line):SetText("Acct: |cffffffff"..object["tAcc"].."|r Char: |cffffffff"..object["tChar"].."|r GMLvl: |cffffffff"..object["tGMLevel"].."|r Exp: |cffffffff"..object["tExp"].."|r")
            ma_deletewhobutton:Enable()
            ma_answerwhobutton:Enable()
            ma_summonwhobutton:Enable()
            ma_gocharwhobutton:Enable()
            ma_whisperwhobutton:Enable()
            getglobal("ma_whoscrollframe"..line):SetScript("OnEnter", function() --[[Do nothing]] end)
            getglobal("ma_whoscrollframe"..line):SetScript("OnLeave", function() --[[Do nothing]] end)
            getglobal("ma_whoscrollframe"..line):SetScript("OnClick", function() WhoDetail(object["tAcc"], object["tChar"], object["tMap"], object["tZone"]) end)
            getglobal("ma_whoscrollframe"..line):Enable()
            getglobal("ma_whoscrollframe"..line):Show()
          end
        else
          getglobal("ma_whoscrollframe"..line):Hide()
        end
      end
    else
      --MangAdmin:NoResults("ticket")
    end
--  else
--  end
--MangAdmin.db.account.buffer.tickets = {}
--MangAdmin.db.char.requests.ticket = false
end

function WhoDetail(tAcc, tChar, tMap, tZone)
--     MangAdmin.db.char.requests.ticket = false
--   MangAdmin:ChatMsg(tNumber)
--     tNumber=string.gsub(tNumber, "00", "")
--   MangAdmin:ChatMsg(tNumber)
    --x = x - 1
--    tNumber = string.match(tNumber, "%d+")
    MangAdmin:ChatMsg(".pinfo "..tChar)
    ma_whoid:SetText(tAcc)
    ma_who:SetText(tChar)
    local MapName=ReturnMapName(tMap)
    local AreaName=ReturnAreaName(tZone)
    ma_whowhere:SetText(MapName.."-"..AreaName)
    MangAdmin:LogAction("Displaying character detail on "..tAcc..":"..tChar)
--    local ticketdetail = MangAdmin.db.account.buffer.ticketsfull
end

function ResetWho()
    MangAdmin.db.account.buffer.who = {}
    wipe(MangAdmin.db.account.buffer.who)
    MangAdmin.db.account.buffer.who = {}
    WhoUpdate()
end

function Who(value)
  if value == "delete" then
    MangAdmin:ChatMsg(".kick "..ma_who:GetText())
    MangAdmin:LogAction("Kicked: "..ma_who:GetText())
    ResetWho()
  elseif value == "gochar" then
    MangAdmin:ChatMsg(".appear "..ma_who:GetText())
  elseif value == "getchar" then
    MangAdmin:ChatMsg(".summon "..ma_who:GetText())
  elseif value == "answer" then
    MangAdmin:TogglePopup("mail", {recipient = ma_who:GetText(), subject = ""})
  elseif value == "whisper" then
   --ChatFrame1EditBox:Show()
  -- ChatEdit_GetLastActiveWindow():Show()
   --ChatEdit_ActivateChat(ChatEdit_GetActiveWindow());
--   ChatFrame1EditBox:Insert("/w "..ma_who:GetText().." ".. string.char(10)..string.char(13));
--   ChatEdit_FocusActiveWindow(1);
       local editbox = ChatFrame1EditBox
       if not editbox then
         -- Support for 3.3.5 and newer
         editbox = ChatEdit_GetActiveWindow()
       end
       ChatEdit_ActivateChat(editbox);
       if editbox then
         editbox:Insert("/w "..ma_who:GetText().." ");
       end
  elseif value == "customize" then
    MangAdmin:ChatMsg(".character customize "..ma_who:GetText())
  elseif value == "chardelete" then
    MangAdmin:ChatMsg(".character delete "..ma_who:GetText())
  elseif value == "charrename" then
    MangAdmin:ChatMsg(".character rename "..ma_who:GetText())
  elseif value == "1dayban" then
    MangAdmin:ChatMsg(".ban character "..ma_who:GetText().." 1d 1Day ban by GM")
  elseif value == "permban" then
    MangAdmin:ChatMsg(".ban character "..ma_who:GetText().." -1d Permanent ban by GM")
  elseif value == "jaila" then
    cname=ma_who:GetText()
    MangAdmin:ChatMsg(".tele name "..cname.." ma_AllianceJail")
    MangAdmin:LogAction("Jailed player "..cname..".")
    MangAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
  elseif value == "jailh" then
    cname=ma_who:GetText()
    MangAdmin:ChatMsg(".tele name "..cname.." ma_HordeJail")
    MangAdmin:LogAction("Jailed player "..cname..".")
    MangAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
  elseif value == "unjail" then
    cname=ma_who:GetText()
    MangAdmin:ChatMsg(".recall "..cname)
    MangAdmin:LogAction("UnJailed player "..cname..".")
    MangAdmin:ChatMsg(".notify "..cname.." has been pardoned and released from jail.")

  end

end