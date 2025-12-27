# AzerothAdmin Localization Guide

## Overview

AzerothAdmin now supports multiple languages! This document explains the localization system and how to contribute translations.

## Supported Languages

The addon currently includes support for the following WoW client locales:

- **enUS** - English (US) - *Complete*
- **frFR** - French - *Needs translation*
- **deDE** - German - *Needs translation*
- **esES** - Spanish - *Needs translation*
- **itIT** - Italian - *Needs translation*
- **ptPT** - Portuguese - *Needs translation*
- **ruRU** - Russian - *Needs translation*
- **koKR** - Korean - *Needs translation*
- **zhCN** - Chinese (Simplified) - *Needs translation*
- **zhTW** - Chinese (Traditional) - *Needs translation*

## File Structure

Each language has its own subfolder within the `Locales/` directory, containing two files:

1. **`<locale>/<locale>.lua`** - Contains user-visible strings (UI text, tooltips, messages)
2. **`<locale>/strings_<locale>.lua`** - Contains pattern matching strings for parsing server responses

### Directory Structure

```text
Locales/
├── README_LOCALIZATION.md
├── enUS/
│   ├── enUS.lua
│   └── strings_enUS.lua
├── frFR/
│   ├── frFR.lua
│   └── strings_frFR.lua
├── deDE/
│   ├── deDE.lua
│   └── strings_deDE.lua
└── ... (other locales)
```

### Example

- `Locales/frFR/frFR.lua` - French UI strings
- `Locales/frFR/strings_frFR.lua` - French pattern strings

## How to Translate

### Prerequisites

All locale files currently contain English text as placeholders. This allows the addon to work immediately in all locales while awaiting proper translations.

### Translation Process

1. **Choose Your Language**
   - Navigate to your language's subfolder (e.g., `Locales/deDE/` for German)
   - Open the main locale file (e.g., `deDE.lua`)

2. **Translate the Strings**
   - Look for lines like: `["key_name"] = "English Text",`
   - Translate ONLY the text on the right side of the `=` sign
   - **DO NOT** change the key names (text in square brackets)
   - **DO NOT** change color codes (e.g., `|cFF00FF00` and `|r`)

3. **Special Cases**

   **Color Codes:**

   ```lua
   ["info_revision"] = "|cFF00FF00AzerothCore rev.|r "
   ```

   Only translate the text between the color codes:

   ```lua
   ["info_revision"] = "|cFF00FF00Révision AzerothCore:|r "
   ```

   **DO NOT TRANSLATE:**

   ```lua
   ["slashcmds"] = { "/AzerothAdmin", "/aa" }  -- These are commands
   ["realm"] = "|cFF00FF00Realm:|r "..GetCVar("realmName")  -- Contains code
   ["char"] = "|cFF00FF00Char:|r "..UnitName("player")  -- Contains code
   ```

4. **Pattern Files (Advanced)**
   - The `strings_<locale>.lua` files contain Lua pattern matching strings
   - These are used to parse server responses
   - **Only translate if the server responses are localized in your language**
   - Most servers use English, so these files can usually remain unchanged

### Translation Guidelines

1. **Consistency** - Use consistent terminology throughout
2. **Context** - Consider the UI context when translating
3. **Length** - Try to keep translations similar in length to avoid UI overflow
4. **Gaming Terms** - Use standard WoW terminology in your language
5. **Tooltips** - Be clear and concise for tooltip translations

### Common Tokens

| English | Token | Notes |
| --------- | ------- | ------- |
| Tooltip | `tt_*` | Help text shown on hover |
| Button | `ma_*Button` | Button labels |
| Label | `ma_*Label` | Text labels |
| Tab | `tabmenu_*` | Tab names |
| Error | `*error*` | Error messages |

## File Organization

The locale files are organized by functional areas:

1. **General** - Common UI elements
2. **GM Tab** - Game Master tools
3. **Char Tab** - Character management
4. **NPC Tab** - NPC tools
5. **GObjects Tab** - Game Object tools
6. **Tele Tab** - Teleportation
7. **Tickets Tab** - Ticket management
8. **Misc Tab** - Miscellaneous settings
9. **Server Tab** - Server management
10. **Pop UPs** - Popup windows
11. **Linkifier** - In-game link handling

## Contributing Your Translation

1. Complete your translation in the appropriate locale file
2. Test the addon with your locale to ensure:
   - All text displays correctly
   - No text overflows UI boundaries
   - Special characters render properly
3. Submit your translation via:
   - Pull request on GitHub
   - Issue on the GitHub repository
   - Direct contact with the development team

## Testing Your Translation

1. Make sure your WoW client is set to your locale
2. Load the addon in-game
3. Navigate through all tabs and features
4. Check for:
   - Missing translations (English text in your locale)
   - UI overflow or truncated text
   - Proper character encoding

## Color Code Reference

Color codes used in the addon (DO NOT TRANSLATE THESE):

```text
LIGHTRED       |cffff6060
LIGHTBLUE      |cff00ccff
GREEN          |cff00ff00
RED            |cffff0000
GOLD           |cffffcc00
GREY           |cff888888
WHITE          |cffffffff
YELLOW         |cffffff00
CYAN           |cff00ffff
```

Color codes always follow the pattern:

- Opening: `|cXXXXXXXX` (where X is a hex color code)
- Closing: `|r`

## Questions?

If you have questions about localization, please:

- Check the comments in the locale files
- Review the English locale files in `Locales/enUS/` as a reference
- Contact the development team via GitHub issues

## Credits

Thank you to all translators who contribute to making AzerothAdmin accessible to players worldwide!

---

**Note:** The pattern files (`strings_*.lua`) typically don't need translation unless your server provides localized responses. Most AzerothCore servers use English for GM commands and responses.
