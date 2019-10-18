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

function TeleScrollUpdate()
    if not ma_ZoneScrollBar then
      MangAdmin:ChatMsg("Lost ma_ZoneScrollBar")
    end
    local cont_temp = MangAdmin.db.char.selectedCont
    cont = "EK_N"
    if cont_temp == Nil then
    else
        cont=cont_temp
    end
    --MangAdmin.db.char.selectedCont = cont
    --self:ChatMsg("Wrote cont:" ..cont)
    local TeleTable = {}
    local zoneCount = 0
    for index, value in pairsByKeys(ReturnTeleportLocations(cont)) do
      zoneCount = zoneCount + 1
      --MangAdmin:ChatMsg("Zone count:" .. zoneCount)
      if not MangAdmin.db.char.selectedZone and zoneCount == 0 then
        SubzoneScrollUpdate()
      end
      --MangAdmin:LogAction("added index: "..index)
      table.insert(TeleTable, {name = index, subzones = value})
    end

    if zoneCount > -1 then
      --MangAdmin:ChatMsg("Zone count:" .. zoneCount)
      if not ma_ZoneScrollBar then
        MangAdmin:ChatMsg("Lost ma_ZoneScrollBar")
      end

      FauxScrollFrame_Update(ma_ZoneScrollBar, zoneCount, 12, 16);
      for line = 1,12 do
        --lineplusoffset = line + ((MangAdmin.db.account.tickets.page - 1) * 4)  --for paged mode
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_ZoneScrollBar)
        --self:ChatMsg("L+O:" ..lineplusoffset)
        if lineplusoffset <= zoneCount then
          local teleobj = TeleTable[lineplusoffset]
          if MangAdmin.db.char.selectedZone == teleobj.name then
            getglobal("ma_ZoneScrollBarEntry"..line):SetText("|cffff0000"..teleobj.name.."|r")
          else
            getglobal("ma_ZoneScrollBarEntry"..line):SetText(teleobj.name)
          end
          getglobal("ma_ZoneScrollBarEntry"..line):SetScript("OnClick", function()
            MangAdmin.db.char.selectedZone = teleobj.name
            --MangAdmin.db.char.selectedCont = cont
            TeleScrollUpdate()
            --InlineScrollUpdate(cont)
            SubzoneScrollUpdate()
          end)
          getglobal("ma_ZoneScrollBarEntry"..line):SetScript("OnEnter", function() cont = MangAdmin.db.char.selectedCont end)
          getglobal("ma_ZoneScrollBarEntry"..line):SetScript("OnLeave", function() cont = MangAdmin.db.char.selectedCont end)
          getglobal("ma_ZoneScrollBarEntry"..line):Enable()
          getglobal("ma_ZoneScrollBarEntry"..line):Show()
        else
          getglobal("ma_ZoneScrollBarEntry"..line):Hide()
        end
      end
    else
      MangAdmin:NoResults("zones")
    end
end

function SubzoneScrollUpdate()
 local cont_temp = MangAdmin.db.char.selectedCont
 cont = "EK_N"
 if cont_temp == Nil then
 else
    cont=cont_temp
 end

--    cont = MangAdmin.db.char.selectedCont
  local TeleTable = {}
  local subzoneCount = 0
  local shownZone = "Alterac Mountains"
  if MangAdmin.db.char.selectedZone then
    shownZone = MangAdmin.db.char.selectedZone
  end
  ma_telesubzonetext:SetText(Locale["Zone"]..shownZone)
  for index, value in pairsByKeys(ReturnTeleportLocations(cont)) do
    if index == shownZone then
      for i, v in pairsByKeys(value) do
        table.insert(TeleTable, {name = i, command = v})
        subzoneCount = subzoneCount + 1
      end
    end
  end
  --MangAdmin:ChatMsg("subs:" ..subzoneCount)
  --MangAdmin:ChatMsg("Cont:" ..cont)
  if subzoneCount > 0 then
    FauxScrollFrame_Update(ma_SubzoneScrollBar,subzoneCount,12,16);
    for line = 1,12 do
      --lineplusoffset = line + ((MangAdmin.db.account.tickets.page - 1) * 4)  --for paged mode
      lineplusoffset = line + FauxScrollFrame_GetOffset(ma_SubzoneScrollBar)
      if lineplusoffset <= subzoneCount then
        local teleobj = TeleTable[lineplusoffset]
        getglobal("ma_SubzoneScrollBarEntry"..line):SetText(teleobj.name)
        getglobal("ma_SubzoneScrollBarEntry"..line):SetScript("OnClick", function() MangAdmin:ChatMsg(teleobj.command) end)
        getglobal("ma_SubzoneScrollBarEntry"..line):SetScript("OnEnter", function() cont = MangAdmin.db.char.selectedCont end)
        getglobal("ma_SubzoneScrollBarEntry"..line):SetScript("OnLeave", function() cont = MangAdmin.db.char.selectedCont end)
        getglobal("ma_SubzoneScrollBarEntry"..line):Enable()
        getglobal("ma_SubzoneScrollBarEntry"..line):Show()
      else
        getglobal("ma_SubzoneScrollBarEntry"..line):Hide()
      end
    end
  else
    MangAdmin:NoResults("subzones")
  end
end