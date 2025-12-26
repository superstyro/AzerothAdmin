-------------------------------------------------------------------------------------------------------------
--
-- AzerothAdmin Version 3.x
-- AzerothAdmin is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <https://www.gnu.org/licenses/gpl-3.0.en.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Repository: https://github.com/superstyro/AzerothAdmin
--
-------------------------------------------------------------------------------------------------------------

function TeleScrollUpdate()
    if not ma_ZoneScrollBar then
      AzerothAdmin:ChatMsg("Lost ma_ZoneScrollBar")
    end
    local cont_temp = AzerothAdmin.db.char.selectedCont
    if cont_temp ~= nil then
        cont = cont_temp
    else
        cont = "EK_N"
    end
    --AzerothAdmin.db.char.selectedCont = cont
    --self:ChatMsg("Wrote cont:" ..cont)
    local TeleTable = {}
    local zoneCount = 0
    for index, value in pairsByKeys(ReturnTeleportLocations(cont)) do
      zoneCount = zoneCount + 1
      --AzerothAdmin:ChatMsg("Zone count:" .. zoneCount)
      --AzerothAdmin:LogAction("added index: "..index)
      table.insert(TeleTable, {name = index, subzones = value})
    end

    if zoneCount > 0 then
      --AzerothAdmin:ChatMsg("Zone count:" .. zoneCount)
      if not ma_ZoneScrollBar then
        AzerothAdmin:ChatMsg("Lost ma_ZoneScrollBar")
      end

      FauxScrollFrame_Update(ma_ZoneScrollBar, zoneCount, 12, 16);
      for line = 1,12 do
        --lineplusoffset = line + ((AzerothAdmin.db.account.tickets.page - 1) * 4)  --for paged mode
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_ZoneScrollBar)
        --self:ChatMsg("L+O:" ..lineplusoffset)
        if lineplusoffset <= zoneCount then
          local teleobj = TeleTable[lineplusoffset]
          if AzerothAdmin.db.char.selectedZone == teleobj.name then
            _G["ma_ZoneScrollBarEntry"..line]:SetText("|cffff0000"..teleobj.name.."|r")
          else
            _G["ma_ZoneScrollBarEntry"..line]:SetText(teleobj.name)
          end
          _G["ma_ZoneScrollBarEntry"..line]:SetScript("OnClick", function()
            AzerothAdmin.db.char.selectedZone = teleobj.name
            --AzerothAdmin.db.char.selectedCont = cont
            TeleScrollUpdate()
            --InlineScrollUpdate(cont)
            SubzoneScrollUpdate()
          end)
          _G["ma_ZoneScrollBarEntry"..line]:SetScript("OnEnter", function() cont = AzerothAdmin.db.char.selectedCont end)
          _G["ma_ZoneScrollBarEntry"..line]:SetScript("OnLeave", function() cont = AzerothAdmin.db.char.selectedCont end)
          _G["ma_ZoneScrollBarEntry"..line]:Enable()
          _G["ma_ZoneScrollBarEntry"..line]:Show()
        else
          _G["ma_ZoneScrollBarEntry"..line]:Hide()
        end
      end
    else
      AzerothAdmin:NoResults("zones")
    end
end

function SubzoneScrollUpdate()
 local cont_temp = AzerothAdmin.db.char.selectedCont
 if cont_temp ~= nil then
    cont = cont_temp
 else
    cont = "EK_N"
 end

--    cont = AzerothAdmin.db.char.selectedCont
  local TeleTable = {}
  local subzoneCount = 0
  local shownZone = "Alterac Mountains"
  if AzerothAdmin.db.char.selectedZone then
    shownZone = AzerothAdmin.db.char.selectedZone
  end
  ma_telesubzonetext:SetText(Locale["Zone"]..": "..shownZone)
  for index, value in pairsByKeys(ReturnTeleportLocations(cont)) do
    if index == shownZone then
      for i, v in pairsByKeys(value) do
        table.insert(TeleTable, {name = i, command = v})
        subzoneCount = subzoneCount + 1
      end
    end
  end
  --AzerothAdmin:ChatMsg("subs:" ..subzoneCount)
  --AzerothAdmin:ChatMsg("Cont:" ..cont)
  if subzoneCount > 0 then
    FauxScrollFrame_Update(ma_SubzoneScrollBar,subzoneCount,12,16);
    for line = 1,12 do
      --lineplusoffset = line + ((AzerothAdmin.db.account.tickets.page - 1) * 4)  --for paged mode
      lineplusoffset = line + FauxScrollFrame_GetOffset(ma_SubzoneScrollBar)
      if lineplusoffset <= subzoneCount then
        local teleobj = TeleTable[lineplusoffset]
        _G["ma_SubzoneScrollBarEntry"..line]:SetText(teleobj.name)
        _G["ma_SubzoneScrollBarEntry"..line]:SetScript("OnClick", function() AzerothAdmin:ChatMsg(teleobj.command) end)
        _G["ma_SubzoneScrollBarEntry"..line]:SetScript("OnEnter", function() cont = AzerothAdmin.db.char.selectedCont end)
        _G["ma_SubzoneScrollBarEntry"..line]:SetScript("OnLeave", function() cont = AzerothAdmin.db.char.selectedCont end)
        _G["ma_SubzoneScrollBarEntry"..line]:Enable()
        _G["ma_SubzoneScrollBarEntry"..line]:Show()
      else
        _G["ma_SubzoneScrollBarEntry"..line]:Hide()
      end
    end
  else
    AzerothAdmin:NoResults("subzones")
  end
end
