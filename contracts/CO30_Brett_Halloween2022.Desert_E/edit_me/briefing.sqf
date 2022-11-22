#include "..\do_not_edit\script_component.hpp"
/*
 * Author: Kresky, Jonpas
 * Adds briefing based on side.
 * Call from initPlayerLocal.sqf.
 * Copy to other side briefings if you want to add briefings to those sides.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(briefing);
 *
 * New Line:
 * <br/>
 *
 * Text Colour (Hex colour Code)
 * <font color='#FF0000'>TEXT HERE</font>
 *
 * Clickable Marker Link:
 * <marker name = 'MARKER_NAME'>MARKER_TEXT</marker>
 *
 * Image:
 * <img image='FOLDER\IMAGE.jpg' width='200' height='100'/>
 */

params ["_player"];

switch (side _player) do {
    // BLUFOR briefing
    case west: {
        
    };

    // OPFOR briefing
    case east: {

    };

    // RESISTANCE/INDEPENDENT briefing
    case resistance: {
        _player createDiaryRecord ["Diary", ["Employer", "
            <br/>舐©舐Â¶â€š� Â£¶Ř§ŮÞ¥¿Ř§Ů—óÞ¢áñ 舐Þ¥¿—Â£
        "]];

        _player createDiaryRecord ["Diary", ["Situation", "
            <br/>╟ðsžšåÞяÞ¥¿—Ř§Ůñâmå•Þ¥¿舐 Â£¶—Ř§Ů????½	© Ř§Ů½	 —â€š�舐 Â£舐Â£ Â£舐 Ř§ŮæØ¢Ãâ€š�—Ř§Ů½	æØ¢Ã ????☒舐 —â€š�舐 ¶????½	—????Þ¥¿ ???? Þ¥¿????¶Â£Þ¥¿ ©ðsžšåÞяñâmå•ñâmå•Þ¥¿Ř§Ů舐©. ©????╟舐 ╟Â£óÞ¢áñ »舐 ????ñâmå•舐½	Þ¥¿óÞ¢áñ â€š�????©—Ř§ŮÞ¥¿舐� ????—â€š�舐© ╟Â£óÞ¢áñ »舐 ½	舐ðsžšåÞя—Â£Þ¥¿.
                <br/> 
                <br/>— ¶????Þ¥¿????='#1▀696'>Ř§Ů舐½	▀Þ¥¿óÞ¢áñ ????¶舐©:
                <br/>- ©óÞ¢áñ½	Ř§Ů•舐 ¶????½	—Â£¶—????©
                <br/>
                <br/>— ¶????Þ¥¿????='#139120'>Ř§Ů½	▀舐ñâmå•舐½	▀舐½	— ????¶舐©:
                <br/>- Þ¥¿????¶Â£Þ¥¿ ╟Ř§ŮÞ¥¿Ř§Ů—Ř§ŮÂ£©
                <br/>
                <br/>— ¶????Þ¥¿????='#▀81717'>舐½	舐╟óÞ¢áñ ????¶舐©:
                <br/>- Þ¥¿????¶Â£Þ¥¿ ╟Ř§ŮÞ¥¿Ř§Ů—Ř§ŮÂ£©
        "]];

        _player createDiaryRecord ["Diary", ["Mission", "
            <br/>RáÚÆ 舐 â€š�Â£☒舐 »舐舐½	 ¶????½	—Â£¶—舐▀ —???? ▀舐Þ¥¿Ř§Ů☒舐 ©ðsžšåÞяñâmå•ñâmå•Þ¥¿Ř§Ů舐© —???? Â£ 舐╟????—舐 ☒Ř§ŮÞ¥¿Þ¥¿Â£æØ¢Ã舐. —â€š�舐 舐æØ¢ÃŘ§Ů????½	 ©ðsžšåÞя舐© ????╟ Þ¥¿Â£¶Š ???? Ř§Ů½	Â£©—ðsžšåÞя¶—ðsžšåÞя舐 Â£½	▀ ©ðsžšåÞяñâmå•ñâmå•Þ¥¿Ř§Ů舐©. ©舐☒舐Â£Þ¥¿ Â£¶—Ř§Ů????½	© â€š�Â£☒舐 »舐舐½	 ¶????╟ñâmå•舐—Ř§Ů½	æØ¢Ã ???? ¶????½	—????Þ¥¿ ???? —â€š�舐 Â£舐Â£.
            <br/>
            <br/>— ¶????Þ¥¿????='#舐3▀310'>ñâmå•Ř§Ů╟Â£óÞ¢áñ ????»áÍÞæ舐¶—Ř§Ů☒舐©:
            <br/>- —Â£½	©ñâmå•????— —â€š�舐 ©ðsžšåÞяñâmå•ñâmå•Þ¥¿Ř§Ů舐© —???? <╟Â£Š舐 ½	Â£╟舐 = '▀舐Þ¥¿Ř§Ů☒舐óÞ¢áñ'>—ðsžšåÞяÂ£ráÚÆ Â£</╟Â£Š舐>
            <br/>
            <br/>— ¶????Þ¥¿????='#舐3▀310'>©舐¶????½	▀Â£óÞ¢áñ ????»áÍÞæ舐¶—Ř§Ů☒舐©:
            <br/>- ¶????½	©—ðsžšåÞя¶— Â£ »Ř§Ů▀æØ¢Ã舐 Ř§Ů½	 —â€š�舐 <╟Â£Š舐 ½	Â£╟舐 = '»Ř§Ů▀æØ¢Ã舐'>▀舐©Ř§ŮæØ¢Ã½	Â£—舐▀ Â£舐Â£.</╟Â£Š舐>
        "]];        
    };

    // CIVILIAN briefing
    case civilian: {

    };
};
