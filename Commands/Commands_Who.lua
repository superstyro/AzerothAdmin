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
    AzerothAdmin:LogAction("Getting Who.")
    local whoCount = 0
    table.foreachi(AzerothAdmin.db.account.buffer.who, function() whoCount = whoCount + 1 end)
    if whoCount > 0 then
      ma_whoscrollframe1:SetText("Loading")
      local lineplusoffset
      local line
      ma_whoscrollframe:Show()
      FauxScrollFrame_Update(ma_whoscrollframe,whoCount,12,16);
      for line = 1,12 do
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_whoscrollframe)
        if lineplusoffset <= whoCount then
          local object = AzerothAdmin.db.account.buffer.who[lineplusoffset]
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
      --AzerothAdmin:NoResults("ticket")
    end
--  else
--  end
--AzerothAdmin.db.account.buffer.tickets = {}
--AzerothAdmin.db.char.requests.ticket = false
end

function WhoDetail(tAcc, tChar, tMap, tZone)
--     AzerothAdmin.db.char.requests.ticket = false
--   AzerothAdmin:ChatMsg(tNumber)
--     tNumber=string.gsub(tNumber, "00", "")
--   AzerothAdmin:ChatMsg(tNumber)
    --x = x - 1
--    tNumber = string.match(tNumber, "%d+")
    AzerothAdmin:ChatMsg(".pinfo "..tChar)
    ma_whoid:SetText(tAcc)
    ma_who:SetText(tChar)
    local MapName=ReturnMapName(tMap)
    local AreaName=ReturnAreaName(tZone)
    ma_whowhere:SetText(MapName.."-"..AreaName)
    AzerothAdmin:LogAction("Displaying character detail on "..tAcc..":"..tChar)
--    local ticketdetail = AzerothAdmin.db.account.buffer.ticketsfull
end

function ResetWho()
    AzerothAdmin.db.account.buffer.who = {}
    wipe(AzerothAdmin.db.account.buffer.who)
    AzerothAdmin.db.account.buffer.who = {}
    WhoUpdate()
end

function Who(value)
  if value == "delete" then
    AzerothAdmin:ChatMsg(".kick "..ma_who:GetText())
    AzerothAdmin:LogAction("Kicked: "..ma_who:GetText())
    ResetWho()
  elseif value == "gochar" then
    AzerothAdmin:ChatMsg(".appear "..ma_who:GetText())
  elseif value == "getchar" then
    AzerothAdmin:ChatMsg(".summon "..ma_who:GetText())
  elseif value == "answer" then
    AzerothAdmin:TogglePopup("mail", {recipient = ma_who:GetText(), subject = ""})
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
    AzerothAdmin:ChatMsg(".character customize "..ma_who:GetText())
  elseif value == "chardelete" then
    AzerothAdmin:ChatMsg(".character delete "..ma_who:GetText())
  elseif value == "charrename" then
    AzerothAdmin:ChatMsg(".character rename "..ma_who:GetText())
  elseif value == "1dayban" then
    AzerothAdmin:ChatMsg(".ban character "..ma_who:GetText().." 1d 1Day ban by GM")
  elseif value == "permban" then
    AzerothAdmin:ChatMsg(".ban character "..ma_who:GetText().." -1d Permanent ban by GM")
  elseif value == "jaila" then
    cname=ma_who:GetText()
    AzerothAdmin:ChatMsg(".tele name "..cname.." ma_AllianceJail")
    AzerothAdmin:LogAction("Jailed player "..cname..".")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
  elseif value == "jailh" then
    cname=ma_who:GetText()
    AzerothAdmin:ChatMsg(".tele name "..cname.." ma_HordeJail")
    AzerothAdmin:LogAction("Jailed player "..cname..".")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
  elseif value == "unjail" then
    cname=ma_who:GetText()
    AzerothAdmin:ChatMsg(".recall "..cname)
    AzerothAdmin:LogAction("UnJailed player "..cname..".")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been pardoned and released from jail.")

  end

end
