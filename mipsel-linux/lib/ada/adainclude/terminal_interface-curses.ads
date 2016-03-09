------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                         Terminal_Interface.Curses                        --
--                                                                          --
--                                 S P E C                                  --
--                                                                          --
------------------------------------------------------------------------------
-- Copyright (c) 1998-2004,2006 Free Software Foundation, Inc.              --
--                                                                          --
-- Permission is hereby granted, free of charge, to any person obtaining a  --
-- copy of this software and associated documentation files (the            --
-- "Software"), to deal in the Software without restriction, including      --
-- without limitation the rights to use, copy, modify, merge, publish,      --
-- distribute, distribute with modifications, sublicense, and/or sell       --
-- copies of the Software, and to permit persons to whom the Software is    --
-- furnished to do so, subject to the following conditions:                 --
--                                                                          --
-- The above copyright notice and this permission notice shall be included  --
-- in all copies or substantial portions of the Software.                   --
--                                                                          --
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS  --
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF               --
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.   --
-- IN NO EVENT SHALL THE ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,   --
-- DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR    --
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR    --
-- THE USE OR OTHER DEALINGS IN THE SOFTWARE.                               --
--                                                                          --
-- Except as contained in this notice, the name(s) of the above copyright   --
-- holders shall not be used in advertising or otherwise to promote the     --
-- sale, use or other dealings in this Software without prior written       --
-- authorization.                                                           --
------------------------------------------------------------------------------
--  Author:  Juergen Pfeifer, 1996
--  Version Control:
--  $Revision: 1.37 $
--  $Date: 2006/06/25 14:30:22 $
--  Binding Version 01.00
------------------------------------------------------------------------------
--  curses binding.
--  This module is generated. Please don't change it manually!
--  Run the generator instead.
--  |
with System.Storage_Elements;
with Interfaces.C;   --  We need this for some assertions.

package Terminal_Interface.Curses is
   pragma Preelaborate (Terminal_Interface.Curses);
   pragma Linker_Options ("-lncurses");

   NC_Major_Version : constant := 5; --  Major version of the library
   NC_Minor_Version : constant := 6; --  Minor version of the library
   NC_Version : constant String := "5.6";  --  Version of library

   type Window is private;
   Null_Window : constant Window;

   type Line_Position   is new Natural; --  line coordinate
   type Column_Position is new Natural; --  column coordinate

   subtype Line_Count   is Line_Position   range 1 .. Line_Position'Last;
   --  Type to count lines. We do not allow null windows, so must be positive
   subtype Column_Count is Column_Position range 1 .. Column_Position'Last;
   --  Type to count columns. We do not allow null windows, so must be positive

   type Key_Code is new Integer;
   --  That is anything including real characters, special keys and logical
   --  request codes.

   --  FIXME: The "-1" should be Curses_Err
   subtype Real_Key_Code is Key_Code range -1 .. 8#777#;
   --  This are the codes that potentially represent a real keystroke.
   --  Not all codes may be possible on a specific terminal. To check the
   --  availability of a special key, the Has_Key function is provided.

   subtype Special_Key_Code is Real_Key_Code
     range 8#400# .. Real_Key_Code'Last;
   --  Type for a function- or special key number

   subtype Normal_Key_Code is Real_Key_Code range
     Character'Pos (Character'First) .. Character'Pos (Character'Last);
   --  This are the codes for regular (incl. non-graphical) characters.

   --  Constants for function- and special keys
   --
   Key_None                       : constant Special_Key_Code := 8#400#;
   Key_Code_Yes                   : constant Special_Key_Code := 8#400#;
   Key_Min                        : constant Special_Key_Code := 8#401#;
   Key_Break                      : constant Special_Key_Code := 8#401#;
   Key_Cursor_Down                : constant Special_Key_Code := 8#402#;
   Key_Cursor_Up                  : constant Special_Key_Code := 8#403#;
   Key_Cursor_Left                : constant Special_Key_Code := 8#404#;
   Key_Cursor_Right               : constant Special_Key_Code := 8#405#;
   Key_Home                       : constant Special_Key_Code := 8#406#;
   Key_Backspace                  : constant Special_Key_Code := 8#407#;
   Key_F0                         : constant Special_Key_Code := 8#410#;
   Key_F1                         : constant Special_Key_Code := 8#411#;
   Key_F2                         : constant Special_Key_Code := 8#412#;
   Key_F3                         : constant Special_Key_Code := 8#413#;
   Key_F4                         : constant Special_Key_Code := 8#414#;
   Key_F5                         : constant Special_Key_Code := 8#415#;
   Key_F6                         : constant Special_Key_Code := 8#416#;
   Key_F7                         : constant Special_Key_Code := 8#417#;
   Key_F8                         : constant Special_Key_Code := 8#420#;
   Key_F9                         : constant Special_Key_Code := 8#421#;
   Key_F10                        : constant Special_Key_Code := 8#422#;
   Key_F11                        : constant Special_Key_Code := 8#423#;
   Key_F12                        : constant Special_Key_Code := 8#424#;
   Key_F13                        : constant Special_Key_Code := 8#425#;
   Key_F14                        : constant Special_Key_Code := 8#426#;
   Key_F15                        : constant Special_Key_Code := 8#427#;
   Key_F16                        : constant Special_Key_Code := 8#430#;
   Key_F17                        : constant Special_Key_Code := 8#431#;
   Key_F18                        : constant Special_Key_Code := 8#432#;
   Key_F19                        : constant Special_Key_Code := 8#433#;
   Key_F20                        : constant Special_Key_Code := 8#434#;
   Key_F21                        : constant Special_Key_Code := 8#435#;
   Key_F22                        : constant Special_Key_Code := 8#436#;
   Key_F23                        : constant Special_Key_Code := 8#437#;
   Key_F24                        : constant Special_Key_Code := 8#440#;
   Key_Delete_Line                : constant Special_Key_Code := 8#510#;
   Key_Insert_Line                : constant Special_Key_Code := 8#511#;
   Key_Delete_Char                : constant Special_Key_Code := 8#512#;
   Key_Insert_Char                : constant Special_Key_Code := 8#513#;
   Key_Exit_Insert_Mode           : constant Special_Key_Code := 8#514#;
   Key_Clear_Screen               : constant Special_Key_Code := 8#515#;
   Key_Clear_End_Of_Screen        : constant Special_Key_Code := 8#516#;
   Key_Clear_End_Of_Line          : constant Special_Key_Code := 8#517#;
   Key_Scroll_1_Forward           : constant Special_Key_Code := 8#520#;
   Key_Scroll_1_Backward          : constant Special_Key_Code := 8#521#;
   Key_Next_Page                  : constant Special_Key_Code := 8#522#;
   Key_Previous_Page              : constant Special_Key_Code := 8#523#;
   Key_Set_Tab                    : constant Special_Key_Code := 8#524#;
   Key_Clear_Tab                  : constant Special_Key_Code := 8#525#;
   Key_Clear_All_Tabs             : constant Special_Key_Code := 8#526#;
   Key_Enter_Or_Send              : constant Special_Key_Code := 8#527#;
   Key_Soft_Reset                 : constant Special_Key_Code := 8#530#;
   Key_Reset                      : constant Special_Key_Code := 8#531#;
   Key_Print                      : constant Special_Key_Code := 8#532#;
   Key_Bottom                     : constant Special_Key_Code := 8#533#;
   Key_Upper_Left_Of_Keypad       : constant Special_Key_Code := 8#534#;
   Key_Upper_Right_Of_Keypad      : constant Special_Key_Code := 8#535#;
   Key_Center_Of_Keypad           : constant Special_Key_Code := 8#536#;
   Key_Lower_Left_Of_Keypad       : constant Special_Key_Code := 8#537#;
   Key_Lower_Right_Of_Keypad      : constant Special_Key_Code := 8#540#;
   Key_Back_Tab                   : constant Special_Key_Code := 8#541#;
   Key_Beginning                  : constant Special_Key_Code := 8#542#;
   Key_Cancel                     : constant Special_Key_Code := 8#543#;
   Key_Close                      : constant Special_Key_Code := 8#544#;
   Key_Command                    : constant Special_Key_Code := 8#545#;
   Key_Copy                       : constant Special_Key_Code := 8#546#;
   Key_Create                     : constant Special_Key_Code := 8#547#;
   Key_End                        : constant Special_Key_Code := 8#550#;
   Key_Exit                       : constant Special_Key_Code := 8#551#;
   Key_Find                       : constant Special_Key_Code := 8#552#;
   Key_Help                       : constant Special_Key_Code := 8#553#;
   Key_Mark                       : constant Special_Key_Code := 8#554#;
   Key_Message                    : constant Special_Key_Code := 8#555#;
   Key_Move                       : constant Special_Key_Code := 8#556#;
   Key_Next                       : constant Special_Key_Code := 8#557#;
   Key_Open                       : constant Special_Key_Code := 8#560#;
   Key_Options                    : constant Special_Key_Code := 8#561#;
   Key_Previous                   : constant Special_Key_Code := 8#562#;
   Key_Redo                       : constant Special_Key_Code := 8#563#;
   Key_Reference                  : constant Special_Key_Code := 8#564#;
   Key_Refresh                    : constant Special_Key_Code := 8#565#;
   Key_Replace                    : constant Special_Key_Code := 8#566#;
   Key_Restart                    : constant Special_Key_Code := 8#567#;
   Key_Resume                     : constant Special_Key_Code := 8#570#;
   Key_Save                       : constant Special_Key_Code := 8#571#;
   Key_Shift_Begin                : constant Special_Key_Code := 8#572#;
   Key_Shift_Cancel               : constant Special_Key_Code := 8#573#;
   Key_Shift_Command              : constant Special_Key_Code := 8#574#;
   Key_Shift_Copy                 : constant Special_Key_Code := 8#575#;
   Key_Shift_Create               : constant Special_Key_Code := 8#576#;
   Key_Shift_Delete_Char          : constant Special_Key_Code := 8#577#;
   Key_Shift_Delete_Line          : constant Special_Key_Code := 8#600#;
   Key_Select                     : constant Special_Key_Code := 8#601#;
   Key_Shift_End                  : constant Special_Key_Code := 8#602#;
   Key_Shift_Clear_End_Of_Line    : constant Special_Key_Code := 8#603#;
   Key_Shift_Exit                 : constant Special_Key_Code := 8#604#;
   Key_Shift_Find                 : constant Special_Key_Code := 8#605#;
   Key_Shift_Help                 : constant Special_Key_Code := 8#606#;
   Key_Shift_Home                 : constant Special_Key_Code := 8#607#;
   Key_Shift_Insert_Char          : constant Special_Key_Code := 8#610#;
   Key_Shift_Cursor_Left          : constant Special_Key_Code := 8#611#;
   Key_Shift_Message              : constant Special_Key_Code := 8#612#;
   Key_Shift_Move                 : constant Special_Key_Code := 8#613#;
   Key_Shift_Next_Page            : constant Special_Key_Code := 8#614#;
   Key_Shift_Options              : constant Special_Key_Code := 8#615#;
   Key_Shift_Previous_Page        : constant Special_Key_Code := 8#616#;
   Key_Shift_Print                : constant Special_Key_Code := 8#617#;
   Key_Shift_Redo                 : constant Special_Key_Code := 8#620#;
   Key_Shift_Replace              : constant Special_Key_Code := 8#621#;
   Key_Shift_Cursor_Right         : constant Special_Key_Code := 8#622#;
   Key_Shift_Resume               : constant Special_Key_Code := 8#623#;
   Key_Shift_Save                 : constant Special_Key_Code := 8#624#;
   Key_Shift_Suspend              : constant Special_Key_Code := 8#625#;
   Key_Shift_Undo                 : constant Special_Key_Code := 8#626#;
   Key_Suspend                    : constant Special_Key_Code := 8#627#;
   Key_Undo                       : constant Special_Key_Code := 8#630#;
   Key_Mouse                      : constant Special_Key_Code := 8#631#;
   Key_Resize                     : constant Special_Key_Code := 8#632#;

   Key_Max                        : constant Special_Key_Code
     := Special_Key_Code'Last;

   subtype User_Key_Code is Key_Code
     range (Key_Max + 129) .. Key_Code'Last;
   --  This is reserved for user defined key codes. The range between Key_Max
   --  and the first user code is reserved for subsystems like menu and forms.

   --  For those who like to use the original key names we produce them were
   --  they differ from the original. Please note that they may differ in
   --  lower/upper case.
   KEY_DOWN         : Special_Key_Code renames Key_Cursor_Down;
   KEY_UP           : Special_Key_Code renames Key_Cursor_Up;
   KEY_LEFT         : Special_Key_Code renames Key_Cursor_Left;
   KEY_RIGHT        : Special_Key_Code renames Key_Cursor_Right;
   KEY_DL           : Special_Key_Code renames Key_Delete_Line;
   KEY_IL           : Special_Key_Code renames Key_Insert_Line;
   KEY_DC           : Special_Key_Code renames Key_Delete_Char;
   KEY_IC           : Special_Key_Code renames Key_Insert_Char;
   KEY_EIC          : Special_Key_Code renames Key_Exit_Insert_Mode;
   KEY_CLEAR        : Special_Key_Code renames Key_Clear_Screen;
   KEY_EOS          : Special_Key_Code renames Key_Clear_End_Of_Screen;
   KEY_EOL          : Special_Key_Code renames Key_Clear_End_Of_Line;
   KEY_SF           : Special_Key_Code renames Key_Scroll_1_Forward;
   KEY_SR           : Special_Key_Code renames Key_Scroll_1_Backward;
   KEY_NPAGE        : Special_Key_Code renames Key_Next_Page;
   KEY_PPAGE        : Special_Key_Code renames Key_Previous_Page;
   KEY_STAB         : Special_Key_Code renames Key_Set_Tab;
   KEY_CTAB         : Special_Key_Code renames Key_Clear_Tab;
   KEY_CATAB        : Special_Key_Code renames Key_Clear_All_Tabs;
   KEY_ENTER        : Special_Key_Code renames Key_Enter_Or_Send;
   KEY_SRESET       : Special_Key_Code renames Key_Soft_Reset;
   KEY_LL           : Special_Key_Code renames Key_Bottom;
   KEY_A1           : Special_Key_Code renames Key_Upper_Left_Of_Keypad;
   KEY_A3           : Special_Key_Code renames Key_Upper_Right_Of_Keypad;
   KEY_B2           : Special_Key_Code renames Key_Center_Of_Keypad;
   KEY_C1           : Special_Key_Code renames Key_Lower_Left_Of_Keypad;
   KEY_C3           : Special_Key_Code renames Key_Lower_Right_Of_Keypad;
   KEY_BTAB         : Special_Key_Code renames Key_Back_Tab;
   KEY_BEG          : Special_Key_Code renames Key_Beginning;
   KEY_SBEG         : Special_Key_Code renames Key_Shift_Begin;
   KEY_SCANCEL      : Special_Key_Code renames Key_Shift_Cancel;
   KEY_SCOMMAND     : Special_Key_Code renames Key_Shift_Command;
   KEY_SCOPY        : Special_Key_Code renames Key_Shift_Copy;
   KEY_SCREATE      : Special_Key_Code renames Key_Shift_Create;
   KEY_SDC          : Special_Key_Code renames Key_Shift_Delete_Char;
   KEY_SDL          : Special_Key_Code renames Key_Shift_Delete_Line;
   KEY_SEND         : Special_Key_Code renames Key_Shift_End;
   KEY_SEOL         : Special_Key_Code renames Key_Shift_Clear_End_Of_Line;
   KEY_SEXIT        : Special_Key_Code renames Key_Shift_Exit;
   KEY_SFIND        : Special_Key_Code renames Key_Shift_Find;
   KEY_SHELP        : Special_Key_Code renames Key_Shift_Help;
   KEY_SHOME        : Special_Key_Code renames Key_Shift_Home;
   KEY_SIC          : Special_Key_Code renames Key_Shift_Insert_Char;
   KEY_SLEFT        : Special_Key_Code renames Key_Shift_Cursor_Left;
   KEY_SMESSAGE     : Special_Key_Code renames Key_Shift_Message;
   KEY_SMOVE        : Special_Key_Code renames Key_Shift_Move;
   KEY_SNEXT        : Special_Key_Code renames Key_Shift_Next_Page;
   KEY_SOPTIONS     : Special_Key_Code renames Key_Shift_Options;
   KEY_SPREVIOUS    : Special_Key_Code renames Key_Shift_Previous_Page;
   KEY_SPRINT       : Special_Key_Code renames Key_Shift_Print;
   KEY_SREDO        : Special_Key_Code renames Key_Shift_Redo;
   KEY_SREPLACE     : Special_Key_Code renames Key_Shift_Replace;
   KEY_SRIGHT       : Special_Key_Code renames Key_Shift_Cursor_Right;
   KEY_SRSUME       : Special_Key_Code renames Key_Shift_Resume;
   KEY_SSAVE        : Special_Key_Code renames Key_Shift_Save;
   KEY_SSUSPEND     : Special_Key_Code renames Key_Shift_Suspend;
   KEY_SUNDO        : Special_Key_Code renames Key_Shift_Undo;

------------------------------------------------------------------------------

   type Color_Number is range -1 .. Integer (Interfaces.C.short'Last);
   for Color_Number'Size use Interfaces.C.short'Size;
   --  (n)curses uses a short for the color index
   --  The model is, that a Color_Number is an index into an array of
   --  (potentially) definable colors. Some of those indices are
   --  predefined (see below), although they may not really exist.

   Default_Color    : constant Color_Number := -1;
   Black            : constant Color_Number := 0;
   Red              : constant Color_Number := 1;
   Green            : constant Color_Number := 2;
   Yellow           : constant Color_Number := 3;
   Blue             : constant Color_Number := 4;
   Magenta          : constant Color_Number := 5;
   Cyan             : constant Color_Number := 6;
   White            : constant Color_Number := 7;

   type RGB_Value is range 0 .. Integer (Interfaces.C.short'Last);
   for RGB_Value'Size use Interfaces.C.short'Size;
   --  Some system may allow to redefine a color by setting RGB values.

   type Color_Pair is range 0 .. 255;
   for Color_Pair'Size use 8;
   subtype Redefinable_Color_Pair is Color_Pair range 1 .. 255;
   --  (n)curses reserves 1 Byte for the color-pair number. Color Pair 0
   --  is fixed (Black & White). A color pair is simply a combination of
   --  two colors described by Color_Numbers, one for the foreground and
   --  the other for the background

   type Character_Attribute_Set is
      record
         Stand_Out               : Boolean;
         Under_Line              : Boolean;
         Reverse_Video           : Boolean;
         Blink                   : Boolean;
         Dim_Character           : Boolean;
         Bold_Character          : Boolean;
         Alternate_Character_Set : Boolean;
         Invisible_Character     : Boolean;
         Protected_Character     : Boolean;
         Horizontal              : Boolean;
         Left                    : Boolean;
         Low                     : Boolean;
         Right                   : Boolean;
         Top                     : Boolean;
         Vertical                : Boolean;
      end record;
   pragma Convention (C, Character_Attribute_Set);

   for Character_Attribute_Set use
      record
         Stand_Out               at 0 range  0 ..  0;
         Under_Line              at 0 range  1 ..  1;
         Reverse_Video           at 0 range  2 ..  2;
         Blink                   at 0 range  3 ..  3;
         Dim_Character           at 0 range  4 ..  4;
         Bold_Character          at 0 range  5 ..  5;
         Alternate_Character_Set at 0 range  6 ..  6;
         Invisible_Character     at 0 range  7 ..  7;
         Protected_Character     at 0 range  8 ..  8;
         Horizontal              at 0 range  9 ..  9;
         Left                    at 0 range 10 .. 10;
         Low                     at 0 range 11 .. 11;
         Right                   at 0 range 12 .. 12;
         Top                     at 0 range 13 .. 13;
         Vertical                at 0 range 14 .. 14;
      end record;
   for Character_Attribute_Set'Size use 16;
   --  Please note: this rep. clause is generated and may be
   --               different on your system.
   --  (n)curses uses all but the lowest 16 Bits for Attributes.

   Normal_Video : constant Character_Attribute_Set := (others => False);

   type Attributed_Character is
      record
         Attr  : Character_Attribute_Set;
         Color : Color_Pair;
         Ch    : Character;
      end record;
   pragma Convention (C, Attributed_Character);
   --  This is the counterpart for the chtype in C.

   for Attributed_Character use
      record
         Ch    at 0 range  0 ..  7;
         Color at 0 range  8 .. 15;
         Attr  at 0 range 16 .. 31;
      end record;
   for Attributed_Character'Size use 32;
      --  Please note: this rep. clause is generated and may be
      --               different on your system.

   Default_Character : constant Attributed_Character
     := (Ch    => Character'First,
         Color => Color_Pair'First,
         Attr  => (others => False));  --  preelaboratable Normal_Video

   type Attributed_String is array (Positive range <>) of Attributed_Character;
   pragma Pack (Attributed_String);
   --  In this binding we allow strings of attributed characters.

   ------------------
   --  Exceptions  --
   ------------------
   Curses_Exception     : exception;
   Wrong_Curses_Version : exception;

   --  Those exceptions are raised by the ETI (Extended Terminal Interface)
   --  subpackets for Menu and Forms handling.
   --
   Eti_System_Error    : exception;
   Eti_Bad_Argument    : exception;
   Eti_Posted          : exception;
   Eti_Connected       : exception;
   Eti_Bad_State       : exception;
   Eti_No_Room         : exception;
   Eti_Not_Posted      : exception;
   Eti_Unknown_Command : exception;
   Eti_No_Match        : exception;
   Eti_Not_Selectable  : exception;
   Eti_Not_Connected   : exception;
   Eti_Request_Denied  : exception;
   Eti_Invalid_Field   : exception;
   Eti_Current         : exception;

   --------------------------------------------------------------------------
   --  External C variables
   --  Conceptually even in C this are kind of constants, but they are
   --  initialized and sometimes changed by the library routines at runtime
   --  depending on the type of terminal. I believe the best way to model
   --  this is to use functions.
   --------------------------------------------------------------------------

   function Lines            return Line_Count;
   pragma Inline (Lines);

   function Columns          return Column_Count;
   pragma Inline (Columns);

   function Tab_Size         return Natural;
   pragma Inline (Tab_Size);

   function Number_Of_Colors return Natural;
   pragma Inline (Number_Of_Colors);

   function Number_Of_Color_Pairs return Natural;
   pragma Inline (Number_Of_Color_Pairs);

   ACS_Map : array (Character'Val (0) .. Character'Val (127)) of
     Attributed_Character;
   pragma Import (C, ACS_Map, "acs_map");
   --
   --
   --  Constants for several characters from the Alternate Character Set
   --  You must use this constants as indices into the ACS_Map array
   --  to get the corresponding attributed character at runtime.
   --
   ACS_Upper_Left_Corner    : constant Character := 'l';
   ACS_Lower_Left_Corner    : constant Character := 'm';
   ACS_Upper_Right_Corner   : constant Character := 'k';
   ACS_Lower_Right_Corner   : constant Character := 'j';
   ACS_Left_Tee             : constant Character := 't';
   ACS_Right_Tee            : constant Character := 'u';
   ACS_Bottom_Tee           : constant Character := 'v';
   ACS_Top_Tee              : constant Character := 'w';
   ACS_Horizontal_Line      : constant Character := 'q';
   ACS_Vertical_Line        : constant Character := 'x';
   ACS_Plus_Symbol          : constant Character := 'n';
   ACS_Scan_Line_1          : constant Character := 'o';
   ACS_Scan_Line_9          : constant Character := 's';
   ACS_Diamond              : constant Character := Character'Val (96);
   ACS_Checker_Board        : constant Character := 'a';
   ACS_Degree               : constant Character := 'f';
   ACS_Plus_Minus           : constant Character := 'g';
   ACS_Bullet               : constant Character := '~';
   ACS_Left_Arrow           : constant Character := ',';
   ACS_Right_Arrow          : constant Character := '+';
   ACS_Down_Arrow           : constant Character := '.';
   ACS_Up_Arrow             : constant Character := '-';
   ACS_Board_Of_Squares     : constant Character := 'h';
   ACS_Lantern              : constant Character := 'i';
   ACS_Solid_Block          : constant Character := '0';
   ACS_Scan_Line_3          : constant Character := 'p';
   ACS_Scan_Line_7          : constant Character := 'r';
   ACS_Less_Or_Equal        : constant Character := 'y';
   ACS_Greater_Or_Equal     : constant Character := 'z';
   ACS_PI                   : constant Character := '{';
   ACS_Not_Equal            : constant Character := '|';
   ACS_Sterling             : constant Character := '}';

   --  |=====================================================================
   --  | Man page curs_initscr.3x
   --  |=====================================================================
   --  | Not implemented: newterm, set_term, delscreen, curscr

   --  |
   function Standard_Window return Window;
   --  AKA: stdscr
   pragma Inline (Standard_Window);

   --  |
   procedure Init_Screen;

   --  |
   procedure Init_Windows renames Init_Screen;
   --  AKA: initscr()
   pragma Inline (Init_Screen);
   --  pragma Inline (Init_Windows);

   --  |
   procedure End_Windows;
   --  AKA: endwin()
   procedure End_Screen renames End_Windows;
   pragma Inline (End_Windows);
   --  pragma Inline (End_Screen);

   --  |
   function Is_End_Window return Boolean;
   --  AKA: isendwin()
   pragma Inline (Is_End_Window);

   --  |=====================================================================
   --  | Man page curs_move.3x
   --  |=====================================================================

   --  |
   procedure Move_Cursor (Win    : in Window := Standard_Window;
                          Line   : in Line_Position;
                          Column : in Column_Position);
   --  AKA: wmove()
   --  AKA: move()
   pragma Inline (Move_Cursor);

   --  |=====================================================================
   --  | Man page curs_addch.3x
   --  |=====================================================================

   --  |
   procedure Add (Win :  in Window := Standard_Window;
                  Ch  :  in Attributed_Character);
   --  AKA: waddch()
   --  AKA: addch()

   procedure Add (Win :  in Window := Standard_Window;
                  Ch  :  in Character);
   --  Add a single character at the current logical cursor position to
   --  the window. Use the current windows attributes.

   --  |
   procedure Add
     (Win    : in Window := Standard_Window;
      Line   : in Line_Position;
      Column : in Column_Position;
      Ch     : in Attributed_Character);
   --  AKA: mvwaddch()
   --  AKA: mvaddch()

   procedure Add
     (Win    : in Window := Standard_Window;
      Line   : in Line_Position;
      Column : in Column_Position;
      Ch     : in Character);
   --  Move to the position and add a single character into the window
   --  There are more Add routines, so the Inline pragma follows later

   --  |
   procedure Add_With_Immediate_Echo
     (Win : in Window := Standard_Window;
      Ch  : in Attributed_Character);
   --  AKA: wechochar()
   --  AKA: echochar()

   procedure Add_With_Immediate_Echo
     (Win : in Window := Standard_Window;
      Ch  : in Character);
   --  Add a character and do an immediate refresh of the screen.
   pragma Inline (Add_With_Immediate_Echo);

   --  |=====================================================================
   --  | Man page curs_window.3x
   --  |=====================================================================
   --  Not Implemented: wcursyncup

   --  |
   function Create
     (Number_Of_Lines       : Line_Count;
      Number_Of_Columns     : Column_Count;
      First_Line_Position   : Line_Position;
      First_Column_Position : Column_Position) return Window;
   --  Not Implemented: Default Number_Of_Lines, Number_Of_Columns
   --  the C version lets them be 0, see the man page.
   --  AKA: newwin()
   pragma Inline (Create);

   function New_Window
     (Number_Of_Lines       : Line_Count;
      Number_Of_Columns     : Column_Count;
      First_Line_Position   : Line_Position;
      First_Column_Position : Column_Position) return Window
     renames Create;
   --  pragma Inline (New_Window);

   --  |
   procedure Delete (Win : in out Window);
   --  AKA: delwin()
   --  Reset Win to Null_Window
   pragma Inline (Delete);

   --  |
   function Sub_Window
     (Win                   : Window := Standard_Window;
      Number_Of_Lines       : Line_Count;
      Number_Of_Columns     : Column_Count;
      First_Line_Position   : Line_Position;
      First_Column_Position : Column_Position) return Window;
   --  AKA: subwin()
   pragma Inline (Sub_Window);

   --  |
   function Derived_Window
     (Win                   : Window := Standard_Window;
      Number_Of_Lines       : Line_Count;
      Number_Of_Columns     : Column_Count;
      First_Line_Position   : Line_Position;
      First_Column_Position : Column_Position) return Window;
   --  AKA: derwin()
   pragma Inline (Derived_Window);

   --  |
   function Duplicate (Win : Window) return Window;
   --  AKA: dupwin()
   pragma Inline (Duplicate);

   --  |
   procedure Move_Window (Win    : in Window;
                          Line   : in Line_Position;
                          Column : in Column_Position);
   --  AKA: mvwin()
   pragma Inline (Move_Window);

   --  |
   procedure Move_Derived_Window (Win    : in Window;
                                  Line   : in Line_Position;
                                  Column : in Column_Position);
   --  AKA: mvderwin()
   pragma Inline (Move_Derived_Window);

   --  |
   procedure Synchronize_Upwards (Win : in Window);
   --  AKA: wsyncup()
   pragma Import (C, Synchronize_Upwards, "wsyncup");

   --  |
   procedure Synchronize_Downwards (Win : in Window);
   --  AKA: wsyncdown()
   pragma Import (C, Synchronize_Downwards, "wsyncdown");

   --  |
   procedure Set_Synch_Mode (Win  : in Window := Standard_Window;
                             Mode : in Boolean := False);
   --  AKA: syncok()
   pragma Inline (Set_Synch_Mode);

   --  |=====================================================================
   --  | Man page curs_addstr.3x
   --  |=====================================================================

   --  |
   procedure Add (Win : in Window := Standard_Window;
                  Str : in String;
                  Len : in Integer := -1);
   --  AKA: waddnstr()
   --  AKA: waddstr()
   --  AKA: addnstr()
   --  AKA: addstr()

   --  |
   procedure Add (Win    : in Window := Standard_Window;
                  Line   : in Line_Position;
                  Column : in Column_Position;
                  Str    : in String;
                  Len    : in Integer := -1);
   --  AKA: mvwaddnstr()
   --  AKA: mvwaddstr()
   --  AKA: mvaddnstr()
   --  AKA: mvaddstr()

   --  |=====================================================================
   --  | Man page curs_addchstr.3x
   --  |=====================================================================

   --  |
   procedure Add (Win : in Window := Standard_Window;
                  Str : in Attributed_String;
                  Len : in Integer := -1);
   --  AKA: waddchnstr()
   --  AKA: waddchstr()
   --  AKA: addchnstr()
   --  AKA: addchstr()

   --  |
   procedure Add (Win    : in Window := Standard_Window;
                  Line   : in Line_Position;
                  Column : in Column_Position;
                  Str    : in Attributed_String;
                  Len    : in Integer := -1);
   --  AKA: mvwaddchnstr()
   --  AKA: mvwaddchstr()
   --  AKA: mvaddchnstr()
   --  AKA: mvaddchstr()
   pragma Inline (Add);

   --  |=====================================================================
   --  | Man page curs_border.3x
   --  |=====================================================================
   --  | Not implemented: mvhline,  mvwhline, mvvline, mvwvline
   --  | use Move_Cursor then Horizontal_Line or Vertical_Line

   --  |
   procedure Border
     (Win                       : in Window := Standard_Window;
      Left_Side_Symbol          : in Attributed_Character := Default_Character;
      Right_Side_Symbol         : in Attributed_Character := Default_Character;
      Top_Side_Symbol           : in Attributed_Character := Default_Character;
      Bottom_Side_Symbol        : in Attributed_Character := Default_Character;
      Upper_Left_Corner_Symbol  : in Attributed_Character := Default_Character;
      Upper_Right_Corner_Symbol : in Attributed_Character := Default_Character;
      Lower_Left_Corner_Symbol  : in Attributed_Character := Default_Character;
      Lower_Right_Corner_Symbol : in Attributed_Character := Default_Character
     );
   --  AKA: wborder()
   --  AKA: border()
   pragma Inline (Border);

   --  |
   procedure Box
     (Win               : in Window := Standard_Window;
      Vertical_Symbol   : in Attributed_Character := Default_Character;
      Horizontal_Symbol : in Attributed_Character := Default_Character);
   --  AKA: box()
   pragma Inline (Box);

   --  |
   procedure Horizontal_Line
     (Win         : in Window := Standard_Window;
      Line_Size   : in Natural;
      Line_Symbol : in Attributed_Character := Default_Character);
   --  AKA: whline()
   --  AKA: hline()
   pragma Inline (Horizontal_Line);

   --  |
   procedure Vertical_Line
     (Win         : in Window := Standard_Window;
      Line_Size   : in Natural;
      Line_Symbol : in Attributed_Character := Default_Character);
   --  AKA: wvline()
   --  AKA: vline()
   pragma Inline (Vertical_Line);

   --  |=====================================================================
   --  | Man page curs_getch.3x
   --  |=====================================================================
   --  Not implemented: mvgetch, mvwgetch

   --  |
   function Get_Keystroke (Win : Window := Standard_Window)
                           return Real_Key_Code;
   --  AKA: wgetch()
   --  AKA: getch()
   --  Get a character from the keyboard and echo it - if enabled - to the
   --  window.
   --  If for any reason (i.e. a timeout) we couldn't get a character the
   --  returned keycode is Key_None.
   pragma Inline (Get_Keystroke);

   --  |
   procedure Undo_Keystroke (Key : in Real_Key_Code);
   --  AKA: ungetch()
   pragma Inline (Undo_Keystroke);

   --  |
   function Has_Key (Key : Special_Key_Code) return Boolean;
   --  AKA: has_key()
   pragma Inline (Has_Key);

   --  |
   --  | Some helper functions
   --  |
   function Is_Function_Key (Key : Special_Key_Code) return Boolean;
   --  Return True if the Key is a function key (i.e. one of F0 .. F63)
   pragma Inline (Is_Function_Key);

   subtype Function_Key_Number is Integer range 0 .. 63;
   --  (n)curses allows for 64 function keys.

   function Function_Key (Key : Real_Key_Code) return Function_Key_Number;
   --  Return the number of the function key. If the code is not a
   --  function key, a CONSTRAINT_ERROR will be raised.
   pragma Inline (Function_Key);

   function Function_Key_Code (Key : Function_Key_Number) return Real_Key_Code;
   --  Return the key code for a given function-key number.
   pragma Inline (Function_Key_Code);

   --  |=====================================================================
   --  | Man page curs_attr.3x
   --  |=====================================================================
   --  | Not implemented attr_off,  wattr_off,
   --  |  attr_on, wattr_on, attr_set, wattr_set

   --  PAIR_NUMBER
   --  PAIR_NUMBER(c) is the same as c.Color

   --  |
   procedure Standout (Win : Window  := Standard_Window;
                       On  : Boolean := True);
   --  AKA: wstandout()
   --  AKA: wstandend()

   --  |
   procedure Switch_Character_Attribute
     (Win  : in Window := Standard_Window;
      Attr : in Character_Attribute_Set := Normal_Video;
      On   : in Boolean := True); --  if False we switch Off.
   --  Switches those Attributes set to true in the list.
   --  AKA: wattron()
   --  AKA: wattroff()
   --  AKA: attron()
   --  AKA: attroff()

   --  |
   procedure Set_Character_Attributes
     (Win   : in Window := Standard_Window;
      Attr  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: wattrset()
   --  AKA: attrset()
   pragma Inline (Set_Character_Attributes);

   --  |
   function Get_Character_Attribute
     (Win : in Window := Standard_Window) return Character_Attribute_Set;
   --  AKA: wattr_get()
   --  AKA: attr_get()

   --  |
   function Get_Character_Attribute
     (Win : in Window := Standard_Window) return Color_Pair;
   --  AKA: wattr_get()
   pragma Inline (Get_Character_Attribute);

   --  |
   procedure Set_Color (Win  : in Window := Standard_Window;
                        Pair : in Color_Pair);
   --  AKA: wcolor_set()
   --  AKA: color_set()
   pragma Inline (Set_Color);

   --  |
   procedure Change_Attributes
     (Win   : in Window := Standard_Window;
      Count : in Integer := -1;
      Attr  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: wchgat()
   --  AKA: chgat()

   --  |
   procedure Change_Attributes
     (Win    : in Window := Standard_Window;
      Line   : in Line_Position := Line_Position'First;
      Column : in Column_Position := Column_Position'First;
      Count  : in Integer := -1;
      Attr   : in Character_Attribute_Set := Normal_Video;
      Color  : in Color_Pair := Color_Pair'First);
   --  AKA: mvwchgat()
   --  AKA: mvchgat()
   pragma Inline (Change_Attributes);

   --  |=====================================================================
   --  | Man page curs_beep.3x
   --  |=====================================================================

   --  |
   procedure Beep;
   --  AKA: beep()
   pragma Inline (Beep);

   --  |
   procedure Flash_Screen;
   --  AKA: flash()
   pragma Inline (Flash_Screen);

   --  |=====================================================================
   --  | Man page curs_inopts.3x
   --  |=====================================================================

   --  | Not implemented : typeahead
   --
   --  |
   procedure Set_Cbreak_Mode (SwitchOn : in Boolean := True);
   --  AKA: cbreak()
   --  AKA: nocbreak()
   pragma Inline (Set_Cbreak_Mode);

   --  |
   procedure Set_Raw_Mode (SwitchOn : in Boolean := True);
   --  AKA: raw()
   --  AKA: noraw()
   pragma Inline (Set_Raw_Mode);

   --  |
   procedure Set_Echo_Mode (SwitchOn : in Boolean := True);
   --  AKA: echo()
   --  AKA: noecho()
   pragma Inline (Set_Echo_Mode);

   --  |
   procedure Set_Meta_Mode (Win      : in Window := Standard_Window;
                            SwitchOn : in Boolean := True);
   --  AKA: meta()
   pragma Inline (Set_Meta_Mode);

   --  |
   procedure Set_KeyPad_Mode (Win      : in Window := Standard_Window;
                              SwitchOn : in Boolean := True);
   --  AKA: keypad()
   pragma Inline (Set_KeyPad_Mode);

   function Get_KeyPad_Mode (Win : in Window := Standard_Window)
                             return Boolean;
   --  This has no pendant in C. There you've to look into the WINDOWS
   --  structure to get the value. Bad practice, not repeated in Ada.

   type Half_Delay_Amount is range 1 .. 255;

   --  |
   procedure Half_Delay (Amount : in Half_Delay_Amount);
   --  AKA: halfdelay()
   pragma Inline (Half_Delay);

   --  |
   procedure Set_Flush_On_Interrupt_Mode
     (Win  : in Window := Standard_Window;
      Mode : in Boolean := True);
   --  AKA: intrflush()
   pragma Inline (Set_Flush_On_Interrupt_Mode);

   --  |
   procedure Set_Queue_Interrupt_Mode
     (Win   : in Window := Standard_Window;
      Flush : in Boolean := True);
   --  AKA: qiflush()
   --  AKA: noqiflush()
   pragma Inline (Set_Queue_Interrupt_Mode);

   --  |
   procedure Set_NoDelay_Mode
     (Win  : in Window := Standard_Window;
      Mode : in Boolean := False);
   --  AKA: nodelay()
   pragma Inline (Set_NoDelay_Mode);

   type Timeout_Mode is (Blocking, Non_Blocking, Delayed);

   --  |
   procedure Set_Timeout_Mode (Win    : in Window := Standard_Window;
                               Mode   : in Timeout_Mode;
                               Amount : in Natural); --  in Milliseconds
   --  AKA: wtimeout()
   --  AKA: timeout()
   --  Instead of overloading the semantic of the sign of amount, we
   --  introduce the Timeout_Mode parameter. This should improve
   --  readability. For Blocking and Non_Blocking, the Amount is not
   --  evaluated.
   --  We don't inline this procedure.

   --  |
   procedure Set_Escape_Timer_Mode
     (Win       : in Window := Standard_Window;
      Timer_Off : in Boolean := False);
   --  AKA: notimeout()
   pragma Inline (Set_Escape_Timer_Mode);

   --  |=====================================================================
   --  | Man page curs_outopts.3x
   --  |=====================================================================

   --  |
   procedure Set_NL_Mode (SwitchOn : in Boolean := True);
   --  AKA: nl()
   --  AKA: nonl()
   pragma Inline (Set_NL_Mode);

   --  |
   procedure Clear_On_Next_Update
     (Win      : in Window := Standard_Window;
      Do_Clear : in Boolean := True);
   --  AKA: clearok()
   pragma Inline (Clear_On_Next_Update);

   --  |
   procedure Use_Insert_Delete_Line
     (Win    : in Window := Standard_Window;
      Do_Idl : in Boolean := True);
   --  AKA: idlok()
   pragma Inline (Use_Insert_Delete_Line);

   --  |
   procedure Use_Insert_Delete_Character
     (Win    : in Window := Standard_Window;
      Do_Idc : in Boolean := True);
   --  AKA: idcok()
   pragma Inline (Use_Insert_Delete_Character);

   --  |
   procedure Leave_Cursor_After_Update
     (Win      : in Window := Standard_Window;
      Do_Leave : in Boolean := True);
   --  AKA: leaveok()
   pragma Inline (Leave_Cursor_After_Update);

   --  |
   procedure Immediate_Update_Mode
     (Win  : in Window := Standard_Window;
      Mode : in Boolean := False);
   --  AKA: immedok()
   pragma Inline (Immediate_Update_Mode);

   --  |
   procedure Allow_Scrolling
     (Win  : in Window := Standard_Window;
      Mode : in Boolean := False);
   --  AKA: scrollok()
   pragma Inline (Allow_Scrolling);

   function Scrolling_Allowed (Win : Window := Standard_Window) return Boolean;
   --  There is no such function in the C interface.
   pragma Inline (Scrolling_Allowed);

   --  |
   procedure Set_Scroll_Region
     (Win         : in Window := Standard_Window;
      Top_Line    : in Line_Position;
      Bottom_Line : in Line_Position);
   --  AKA: wsetscrreg()
   --  AKA: setscrreg()
   pragma Inline (Set_Scroll_Region);

   --  |=====================================================================
   --  | Man page curs_refresh.3x
   --  |=====================================================================

   --  |
   procedure Update_Screen;
   --  AKA: doupdate()
   pragma Inline (Update_Screen);

   --  |
   procedure Refresh (Win : in Window := Standard_Window);
   --  AKA: wrefresh()
   --  There is an overloaded Refresh for Pads.
   --  The Inline pragma appears there
   --  AKA: refresh()

   --  |
   procedure Refresh_Without_Update
     (Win : in Window := Standard_Window);
   --  AKA: wnoutrefresh()
   --  There is an overloaded Refresh_Without_Update for Pads.
   --  The Inline pragma appears there

   --  |
   procedure Redraw (Win : in Window := Standard_Window);
   --  AKA: redrawwin()

   --  |
   procedure Redraw (Win        : in Window := Standard_Window;
                     Begin_Line : in Line_Position;
                     Line_Count : in Positive);
   --  AKA: wredrawln()
   pragma Inline (Redraw);

   --  |=====================================================================
   --  | Man page curs_clear.3x
   --  |=====================================================================

   --  |
   procedure Erase (Win : in Window := Standard_Window);
   --  AKA: werase()
   --  AKA: erase()
   pragma Inline (Erase);

   --  |
   procedure Clear
     (Win : in Window := Standard_Window);
   --  AKA: wclear()
   --  AKA: clear()
   pragma Inline (Clear);

   --  |
   procedure Clear_To_End_Of_Screen
     (Win : in Window := Standard_Window);
   --  AKA: wclrtobot()
   --  AKA: clrtobot()
   pragma Inline (Clear_To_End_Of_Screen);

   --  |
   procedure Clear_To_End_Of_Line
     (Win : in Window := Standard_Window);
   --  AKA: wclrtoeol()
   --  AKA: clrtoeol()
   pragma Inline (Clear_To_End_Of_Line);

   --  |=====================================================================
   --  | Man page curs_bkgd.3x
   --  |=====================================================================

   --  |
   --  TODO: we could have Set_Background(Window; Character_Attribute_Set)
   --  because in C it is common to see bkgdset(A_BOLD) or
   --  bkgdset(COLOR_PAIR(n))
   procedure Set_Background
     (Win : in Window := Standard_Window;
      Ch  : in Attributed_Character);
   --  AKA: wbkgdset()
   --  AKA: bkgdset()
   pragma Inline (Set_Background);

   --  |
   procedure Change_Background
     (Win : in Window := Standard_Window;
      Ch  : in Attributed_Character);
   --  AKA: wbkgd()
   --  AKA: bkgd()
   pragma Inline (Change_Background);

   --  |
   --  ? wbkgdget is not listed in curs_bkgd, getbkgd is thpough.
   function Get_Background (Win : Window := Standard_Window)
     return Attributed_Character;
   --  AKA: wbkgdget()
   --  AKA: bkgdget()
   pragma Inline (Get_Background);

   --  |=====================================================================
   --  | Man page curs_touch.3x
   --  |=====================================================================

   --  |
   procedure Untouch (Win : in Window := Standard_Window);
   --  AKA: untouchwin()
   pragma Inline (Untouch);

   --  |
   procedure Touch (Win : in Window := Standard_Window);
   --  AKA: touchwin()

   --  |
   procedure Touch (Win   : in Window := Standard_Window;
                    Start : in Line_Position;
                    Count : in Positive);
   --  AKA: touchline()
   pragma Inline (Touch);

   --  |
   procedure Change_Lines_Status (Win   : in Window := Standard_Window;
                                  Start : in Line_Position;
                                  Count : in Positive;
                                  State : in Boolean);
   --  AKA: wtouchln()
   pragma Inline (Change_Lines_Status);

   --  |
   function Is_Touched (Win  : Window := Standard_Window;
                        Line : Line_Position) return Boolean;
   --  AKA: is_linetouched()

   --  |
   function Is_Touched (Win : Window := Standard_Window) return Boolean;
   --  AKA: is_wintouched()
   pragma Inline (Is_Touched);

   --  |=====================================================================
   --  | Man page curs_overlay.3x
   --  |=====================================================================

   --  |
   procedure Copy
     (Source_Window            : in Window;
      Destination_Window       : in Window;
      Source_Top_Row           : in Line_Position;
      Source_Left_Column       : in Column_Position;
      Destination_Top_Row      : in Line_Position;
      Destination_Left_Column  : in Column_Position;
      Destination_Bottom_Row   : in Line_Position;
      Destination_Right_Column : in Column_Position;
      Non_Destructive_Mode     : in Boolean := True);
   --  AKA: copywin()
   pragma Inline (Copy);

   --  |
   procedure Overwrite (Source_Window      : in Window;
                        Destination_Window : in Window);
   --  AKA: overwrite()
   pragma Inline (Overwrite);

   --  |
   procedure Overlay (Source_Window      : in Window;
                      Destination_Window : in Window);
   --  AKA: overlay()
   pragma Inline (Overlay);

   --  |=====================================================================
   --  | Man page curs_deleteln.3x
   --  |=====================================================================

   --  |
   procedure Insert_Delete_Lines
     (Win   : in Window  := Standard_Window;
      Lines : in Integer := 1); --  default is to insert one line above
   --  AKA: winsdelln()
   --  AKA: insdelln()
   pragma Inline (Insert_Delete_Lines);

   --  |
   procedure Delete_Line (Win : in Window := Standard_Window);
   --  AKA: wdeleteln()
   --  AKA: deleteln()
   pragma Inline (Delete_Line);

   --  |
   procedure Insert_Line (Win : in Window := Standard_Window);
   --  AKA: winsertln()
   --  AKA: insertln()
   pragma Inline (Insert_Line);

   --  |=====================================================================
   --  | Man page curs_getyx.3x
   --  |=====================================================================

   --  |
   procedure Get_Size
     (Win               : in Window := Standard_Window;
      Number_Of_Lines   : out Line_Count;
      Number_Of_Columns : out Column_Count);
   --  AKA: getmaxyx()
   pragma Inline (Get_Size);

   --  |
   procedure Get_Window_Position
     (Win             : in Window := Standard_Window;
      Top_Left_Line   : out Line_Position;
      Top_Left_Column : out Column_Position);
   --  AKA: getbegyx()
   pragma Inline (Get_Window_Position);

   --  |
   procedure Get_Cursor_Position
     (Win    : in  Window := Standard_Window;
      Line   : out Line_Position;
      Column : out Column_Position);
   --  AKA: getyx()
   pragma Inline (Get_Cursor_Position);

   --  |
   procedure Get_Origin_Relative_To_Parent
     (Win                : in  Window;
      Top_Left_Line      : out Line_Position;
      Top_Left_Column    : out Column_Position;
      Is_Not_A_Subwindow : out Boolean);
   --  AKA: getparyx()
   --  Instead of placing -1 in the coordinates as return, we use a boolean
   --  to return the info that the window has no parent.
   pragma Inline (Get_Origin_Relative_To_Parent);

   --  |=====================================================================
   --  | Man page curs_pad.3x
   --  |=====================================================================

   --  |
   function New_Pad (Lines   : Line_Count;
                     Columns : Column_Count) return Window;
   --  AKA: newpad()
   pragma Inline (New_Pad);

   --  |
   function Sub_Pad
     (Pad                   : Window;
      Number_Of_Lines       : Line_Count;
      Number_Of_Columns     : Column_Count;
      First_Line_Position   : Line_Position;
      First_Column_Position : Column_Position) return Window;
   --  AKA: subpad()
   pragma Inline (Sub_Pad);

   --  |
   procedure Refresh
     (Pad                      : in Window;
      Source_Top_Row           : in Line_Position;
      Source_Left_Column       : in Column_Position;
      Destination_Top_Row      : in Line_Position;
      Destination_Left_Column  : in Column_Position;
      Destination_Bottom_Row   : in Line_Position;
      Destination_Right_Column : in Column_Position);
   --  AKA: prefresh()
   pragma Inline (Refresh);

   --  |
   procedure Refresh_Without_Update
     (Pad                      : in Window;
      Source_Top_Row           : in Line_Position;
      Source_Left_Column       : in Column_Position;
      Destination_Top_Row      : in Line_Position;
      Destination_Left_Column  : in Column_Position;
      Destination_Bottom_Row   : in Line_Position;
      Destination_Right_Column : in Column_Position);
   --  AKA: pnoutrefresh()
   pragma Inline (Refresh_Without_Update);

   --  |
   procedure Add_Character_To_Pad_And_Echo_It
     (Pad : in Window;
      Ch  : in Attributed_Character);
   --  AKA: pechochar()

   procedure Add_Character_To_Pad_And_Echo_It
     (Pad : in Window;
      Ch  : in Character);
   pragma Inline (Add_Character_To_Pad_And_Echo_It);

   --  |=====================================================================
   --  | Man page curs_scroll.3x
   --  |=====================================================================

   --  |
   procedure Scroll (Win    : in Window  := Standard_Window;
                     Amount : in Integer := 1);
   --  AKA: wscrl()
   --  AKA: scroll()
   --  AKA: scrl()
   pragma Inline (Scroll);

   --  |=====================================================================
   --  | Man page curs_delch.3x
   --  |=====================================================================

   --  |
   procedure Delete_Character (Win : in Window := Standard_Window);
   --  AKA: wdelch()
   --  AKA: delch()

   --  |
   procedure Delete_Character
     (Win    : in Window := Standard_Window;
      Line   : in Line_Position;
      Column : in Column_Position);
   --  AKA: mvwdelch()
   --  AKA: mvdelch()
   pragma Inline (Delete_Character);

   --  |=====================================================================
   --  | Man page curs_inch.3x
   --  |=====================================================================

   --  |
   function Peek (Win : Window := Standard_Window)
     return Attributed_Character;
   --  AKA: inch()
   --  AKA: winch()

   --  |
   function Peek
     (Win    : Window := Standard_Window;
      Line   : Line_Position;
      Column : Column_Position) return Attributed_Character;
   --  AKA: mvwinch()
   --  AKA: mvinch()
   --  More Peek's follow, pragma Inline appears later.

   --  |=====================================================================
   --  | Man page curs_insch.3x
   --  |=====================================================================

   --  |
   procedure Insert (Win : in Window := Standard_Window;
                     Ch  : in Attributed_Character);
   --  AKA: winsch()
   --  AKA: insch()

   --  |
   procedure Insert (Win    : in Window := Standard_Window;
                     Line   : in Line_Position;
                     Column : in Column_Position;
                     Ch     : in Attributed_Character);
   --  AKA: mvwinsch()
   --  AKA: mvinsch()

   --  |=====================================================================
   --  | Man page curs_insstr.3x
   --  |=====================================================================

   --  |
   procedure Insert (Win : in Window := Standard_Window;
                     Str : in String;
                     Len : in Integer := -1);
   --  AKA: winsnstr()
   --  AKA: winsstr()
   --  AKA: insnstr()
   --  AKA: insstr()

   --  |
   procedure Insert (Win    : in Window := Standard_Window;
                     Line   : in Line_Position;
                     Column : in Column_Position;
                     Str    : in String;
                     Len    : in Integer := -1);
   --  AKA: mvwinsnstr()
   --  AKA: mvwinsstr()
   --  AKA: mvinsnstr()
   --  AKA: mvinsstr()
   pragma Inline (Insert);

   --  |=====================================================================
   --  | Man page curs_instr.3x
   --  |=====================================================================

   --  |
   procedure Peek (Win : in  Window := Standard_Window;
                   Str : out String;
                   Len : in  Integer := -1);
   --  AKA: winnstr()
   --  AKA: winstr()
   --  AKA: innstr()
   --  AKA: instr()

   --  |
   procedure Peek (Win    : in  Window := Standard_Window;
                   Line   : in  Line_Position;
                   Column : in  Column_Position;
                   Str    : out String;
                   Len    : in  Integer := -1);
   --  AKA: mvwinnstr()
   --  AKA: mvwinstr()
   --  AKA: mvinnstr()
   --  AKA: mvinstr()

   --  |=====================================================================
   --  | Man page curs_inchstr.3x
   --  |=====================================================================

   --  |
   procedure Peek (Win : in  Window := Standard_Window;
                   Str : out Attributed_String;
                   Len : in  Integer := -1);
   --  AKA: winchnstr()
   --  AKA: winchstr()
   --  AKA: inchnstr()
   --  AKA: inchstr()

   --  |
   procedure Peek (Win    : in  Window := Standard_Window;
                   Line   : in  Line_Position;
                   Column : in  Column_Position;
                   Str    : out Attributed_String;
                   Len    : in  Integer := -1);
   --  AKA: mvwinchnstr()
   --  AKA: mvwinchstr()
   --  AKA: mvinchnstr()
   --  AKA: mvinchstr()
   --  We don't inline the Peek procedures

   --  |=====================================================================
   --  | Man page curs_getstr.3x
   --  |=====================================================================

   --  |
   procedure Get (Win : in  Window := Standard_Window;
                  Str : out String;
                  Len : in  Integer := -1);
   --  AKA: wgetnstr()
   --  AKA: wgetstr()
   --  AKA: getnstr()
   --  AKA: getstr()
   --  actually getstr is not supported because that results in buffer
   --  overflows.

   --  |
   procedure Get (Win    : in  Window := Standard_Window;
                  Line   : in  Line_Position;
                  Column : in  Column_Position;
                  Str    : out String;
                  Len    : in  Integer := -1);
   --  AKA: mvwgetnstr()
   --  AKA: mvwgetstr()
   --  AKA: mvgetnstr()
   --  AKA: mvgetstr()
   --  Get is not inlined

   --  |=====================================================================
   --  | Man page curs_slk.3x
   --  |=====================================================================

   --  Not Implemented: slk_attr_on, slk_attr_off, slk_attr_set

   type Soft_Label_Key_Format is (Three_Two_Three,
                                  Four_Four,
                                  PC_Style,              --  ncurses specific
                                  PC_Style_With_Index);  --  "
   type Label_Number is new Positive range 1 .. 12;
   type Label_Justification is (Left, Centered, Right);

   --  |
   procedure Init_Soft_Label_Keys
     (Format : in Soft_Label_Key_Format := Three_Two_Three);
   --  AKA: slk_init()
   pragma Inline (Init_Soft_Label_Keys);

   --  |
   procedure Set_Soft_Label_Key (Label : in Label_Number;
                                 Text  : in String;
                                 Fmt   : in Label_Justification := Left);
   --  AKA: slk_set()
   --  We don't inline this procedure

   --  |
   procedure Refresh_Soft_Label_Keys;
   --  AKA: slk_refresh()
   pragma Inline (Refresh_Soft_Label_Keys);

   --  |
   procedure Refresh_Soft_Label_Keys_Without_Update;
   --  AKA: slk_noutrefresh()
   pragma Inline (Refresh_Soft_Label_Keys_Without_Update);

   --  |
   procedure Get_Soft_Label_Key (Label : in Label_Number;
                                 Text  : out String);
   --  AKA: slk_label()

   --  |
   function Get_Soft_Label_Key (Label : in Label_Number) return String;
   --  AKA: slk_label()
   --  Same as function
   pragma Inline (Get_Soft_Label_Key);

   --  |
   procedure Clear_Soft_Label_Keys;
   --  AKA: slk_clear()
   pragma Inline (Clear_Soft_Label_Keys);

   --  |
   procedure Restore_Soft_Label_Keys;
   --  AKA: slk_restore()
   pragma Inline (Restore_Soft_Label_Keys);

   --  |
   procedure Touch_Soft_Label_Keys;
   --  AKA: slk_touch()
   pragma Inline (Touch_Soft_Label_Keys);

   --  |
   procedure Switch_Soft_Label_Key_Attributes
     (Attr : in Character_Attribute_Set;
      On   : in Boolean := True);
   --  AKA: slk_attron()
   --  AKA: slk_attroff()
   pragma Inline (Switch_Soft_Label_Key_Attributes);

   --  |
   procedure Set_Soft_Label_Key_Attributes
     (Attr  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: slk_attrset()
   pragma Inline (Set_Soft_Label_Key_Attributes);

   --  |
   function Get_Soft_Label_Key_Attributes return Character_Attribute_Set;
   --  AKA: slk_attr()

   --  |
   function Get_Soft_Label_Key_Attributes return Color_Pair;
   --  AKA: slk_attr()
   pragma Inline (Get_Soft_Label_Key_Attributes);

   --  |
   procedure Set_Soft_Label_Key_Color (Pair : in Color_Pair);
   --  AKA: slk_color()
   pragma Inline (Set_Soft_Label_Key_Color);

   --  |=====================================================================
   --  | Man page keybound.3x
   --  |=====================================================================
   --  Not Implemented: keybound

   --  |=====================================================================
   --  | Man page keyok.3x
   --  |=====================================================================

   --  |
   procedure Enable_Key (Key    : in Special_Key_Code;
                         Enable : in Boolean := True);
   --  AKA: keyok()
   pragma Inline (Enable_Key);

   --  |=====================================================================
   --  | Man page define_key.3x
   --  |=====================================================================

   --  |
   procedure Define_Key (Definition : in String;
                         Key        : in Special_Key_Code);
   --  AKA: define_key()
   pragma Inline (Define_Key);

   --  |=====================================================================
   --  | Man page curs_util.3x
   --  |=====================================================================

   --  | Not implemented : filter, use_env
   --  | putwin, getwin are in the child package PutWin
   --

   --  |
   procedure Key_Name (Key  : in  Real_Key_Code;
                       Name : out String);
   --  AKA: keyname()
   --  The external name for a real keystroke.

   --  |
   function Key_Name (Key  : in  Real_Key_Code) return String;
   --  AKA: keyname()
   --  Same as function
   --  We don't inline this routine

   --  |
   procedure Un_Control (Ch  : in Attributed_Character;
                         Str : out String);
   --  AKA: unctrl()

   --  |
   function Un_Control (Ch  : in Attributed_Character) return String;
   --  AKA: unctrl()
   --  Same as function
   pragma Inline (Un_Control);

   --  |
   procedure Delay_Output (Msecs : in Natural);
   --  AKA: delay_output()
   pragma Inline (Delay_Output);

   --  |
   procedure Flush_Input;
   --  AKA: flushinp()
   pragma Inline (Flush_Input);

   --  |=====================================================================
   --  | Man page curs_termattrs.3x
   --  |=====================================================================

   --  |
   function Baudrate return Natural;
   --  AKA: baudrate()
   pragma Inline (Baudrate);

   --  |
   function Erase_Character return Character;
   --  AKA: erasechar()
   pragma Inline (Erase_Character);

   --  |
   function Kill_Character return Character;
   --  AKA: killchar()
   pragma Inline (Kill_Character);

   --  |
   function Has_Insert_Character return Boolean;
   --  AKA: has_ic()
   pragma Inline (Has_Insert_Character);

   --  |
   function Has_Insert_Line return Boolean;
   --  AKA: has_il()
   pragma Inline (Has_Insert_Line);

   --  |
   function Supported_Attributes return Character_Attribute_Set;
   --  AKA: termattrs()
   pragma Inline (Supported_Attributes);

   --  |
   procedure Long_Name (Name : out String);
   --  AKA: longname()

   --  |
   function Long_Name return String;
   --  AKA: longname()
   --  Same as function
   pragma Inline (Long_Name);

   --  |
   procedure Terminal_Name (Name : out String);
   --  AKA: termname()

   --  |
   function Terminal_Name return String;
   --  AKA: termname()
   --  Same as function
   pragma Inline (Terminal_Name);

   --  |=====================================================================
   --  | Man page curs_color.3x
   --  |=====================================================================

   --  COLOR_PAIR
   --  COLOR_PAIR(n) in C is the same as
   --  Attributed_Character(Ch => Nul, Color => n, Attr => Normal_Video)
   --  In C you often see something like c = c | COLOR_PAIR(n);
   --  This is equivalent to c.Color := n;

   --  |
   procedure Start_Color;
   --  AKA: start_color()
   pragma Import (C, Start_Color, "start_color");

   --  |
   procedure Init_Pair (Pair : in Redefinable_Color_Pair;
                        Fore : in Color_Number;
                        Back : in Color_Number);
   --  AKA: init_pair()
   pragma Inline (Init_Pair);

   --  |
   procedure Pair_Content (Pair : in Color_Pair;
                           Fore : out Color_Number;
                           Back : out Color_Number);
   --  AKA: pair_content()
   pragma Inline (Pair_Content);

   --  |
   function Has_Colors return Boolean;
   --  AKA: has_colors()
   pragma Inline (Has_Colors);

   --  |
   procedure Init_Color (Color : in Color_Number;
                         Red   : in RGB_Value;
                         Green : in RGB_Value;
                         Blue  : in RGB_Value);
   --  AKA: init_color()
   pragma Inline (Init_Color);

   --  |
   function Can_Change_Color return Boolean;
   --  AKA: can_change_color()
   pragma Inline (Can_Change_Color);

   --  |
   procedure Color_Content (Color : in  Color_Number;
                            Red   : out RGB_Value;
                            Green : out RGB_Value;
                            Blue  : out RGB_Value);
   --  AKA: color_content()
   pragma Inline (Color_Content);

   --  |=====================================================================
   --  | Man page curs_kernel.3x
   --  |=====================================================================
   --  | Not implemented: getsyx, setsyx
   --
   type Curses_Mode is (Curses, Shell);

   --  |
   procedure Save_Curses_Mode (Mode : in Curses_Mode);
   --  AKA: def_prog_mode()
   --  AKA: def_shell_mode()
   pragma Inline (Save_Curses_Mode);

   --  |
   procedure Reset_Curses_Mode (Mode : in Curses_Mode);
   --  AKA: reset_prog_mode()
   --  AKA: reset_shell_mode()
   pragma Inline (Reset_Curses_Mode);

   --  |
   procedure Save_Terminal_State;
   --  AKA: savetty()
   pragma Inline (Save_Terminal_State);

   --  |
   procedure Reset_Terminal_State;
   --  AKA: resetty();
   pragma Inline (Reset_Terminal_State);

   type Stdscr_Init_Proc is access
      function (Win     : Window;
                Columns : Column_Count) return Integer;
   pragma Convention (C, Stdscr_Init_Proc);
   --  N.B.: the return value is actually ignored, but it seems to be
   --        a good practice to return 0 if you think all went fine
   --        and -1 otherwise.

   --  |
   procedure Rip_Off_Lines (Lines : in Integer;
                            Proc  : in Stdscr_Init_Proc);
   --  AKA: ripoffline()
   --  N.B.: to be more precise, this uses a ncurses specific enhancement of
   --        ripoffline(), in which the Lines argument absolute value is the
   --        number of lines to be ripped of. The official ripoffline() only
   --        uses the sign of Lines to rip of a single line from bottom or top.
   pragma Inline (Rip_Off_Lines);

   type Cursor_Visibility is (Invisible, Normal, Very_Visible);

   --  |
   procedure Set_Cursor_Visibility (Visibility : in out Cursor_Visibility);
   --  AKA: curs_set()
   pragma Inline (Set_Cursor_Visibility);

   --  |
   procedure Nap_Milli_Seconds (Ms : in Natural);
   --  AKA: napms()
   pragma Inline (Nap_Milli_Seconds);

   --  |=====================================================================
   --  | Some useful helpers.
   --  |=====================================================================
   type Transform_Direction is (From_Screen, To_Screen);
   procedure Transform_Coordinates
     (W      : in Window := Standard_Window;
      Line   : in out Line_Position;
      Column : in out Column_Position;
      Dir    : in Transform_Direction := From_Screen);
   --  This procedure transforms screen coordinates into coordinates relative
   --  to the window and vice versa, depending on the Dir parameter.
   --  Screen coordinates are the position informations on the physical device.
   --  An Curses_Exception will be raised if Line and Column are not in the
   --  Window or if you pass the Null_Window as argument.
   --  We don't inline this procedure

   --  |=====================================================================
   --  | Man page dft_fgbg.3x
   --  |=====================================================================

   --  |
   procedure Use_Default_Colors;
   --  AKA: use_default_colors()
   pragma Inline (Use_Default_Colors);

   --  |
   procedure Assume_Default_Colors (Fore : Color_Number := Default_Color;
                                    Back : Color_Number := Default_Color);
   --  AKA: assume_default_colors()
   pragma Inline (Assume_Default_Colors);

   --  |=====================================================================
   --  | Man page curs_extend.3x
   --  |=====================================================================

   --  |
   function Curses_Version return String;
   --  AKA: curses_version()

   --  |
   --  The returnvalue is the previous setting of the flag
   function Use_Extended_Names (Enable : Boolean) return Boolean;
   --  AKA: use_extended_names()

   --  |=====================================================================
   --  | Man page curs_scr_dump.3x
   --  |=====================================================================

   --  |
   procedure Screen_Dump_To_File (Filename : in String);
   --  AKA: scr_dump()

   --  |
   procedure Screen_Restore_From_File (Filename : in String);
   --  AKA: scr_restore()

   --  |
   procedure Screen_Init_From_File (Filename : in String);
   --  AKA: scr_init()

   --  |
   procedure Screen_Set_File (Filename : in String);
   --  AKA: scr_set()

   --  |=====================================================================
   --  | Man page curs_print.3x
   --  |=====================================================================
   --  Not implemented:  mcprint

   --  |=====================================================================
   --  | Man page curs_printw.3x
   --  |=====================================================================
   --  Not implemented: printw,  wprintw, mvprintw, mvwprintw, vwprintw,
   --                   vw_printw
   --  Please use the Ada style Text_IO child packages for formatted
   --  printing. It doesn't make a lot of sense to map the printf style
   --  C functions to Ada.

   --  |=====================================================================
   --  | Man page curs_scanw.3x
   --  |=====================================================================
   --  Not implemented: scanw, wscanw, mvscanw, mvwscanw, vwscanw, vw_scanw

   --  |=====================================================================
   --  | Man page resizeterm.3x
   --  |=====================================================================
   --  Not Implemented: resizeterm

   --  |=====================================================================
   --  | Man page wresize.3x
   --  |=====================================================================

   --  |
   procedure Resize (Win               : Window := Standard_Window;
                     Number_Of_Lines   : Line_Count;
                     Number_Of_Columns : Column_Count);
   --  AKA: wresize()

private
   type Window is new System.Storage_Elements.Integer_Address;
   Null_Window : constant Window := 0;

   --  The next constants are generated and may be different on your
   --  architecture.
   --
   Offset_maxy        : constant Natural :=  2; --  short
   Offset_maxx        : constant Natural :=  3; --  short
   Offset_begy        : constant Natural :=  4; --  short
   Offset_begx        : constant Natural :=  5; --  short
   Offset_cury        : constant Natural :=  0; --  short
   Offset_curx        : constant Natural :=  1; --  short
   Offset_yoffset     : constant Natural := 36; --  short
   Offset_pary        : constant Natural := 13; --  int
   Offset_parx        : constant Natural := 12; --  int
   Offset_notimeout   : constant Natural := 24; --  char
   Offset_clear       : constant Natural := 25; --  char
   Offset_leaveok     : constant Natural := 26; --  char
   Offset_scroll      : constant Natural := 27; --  char
   Offset_idlok       : constant Natural := 28; --  char
   Offset_idcok       : constant Natural := 29; --  char
   Offset_immed       : constant Natural := 30; --  char
   Offset_sync        : constant Natural := 31; --  char
   Offset_use_keypad  : constant Natural := 32; --  char
   Sizeof_bool        : constant Natural :=  1; --  bool
   Offset_XY          : constant Natural :=  1; --  int

   type Curses_Bool is mod 2 ** Interfaces.C.char'Size;
   Curses_Bool_False : constant Curses_Bool := 0;

end Terminal_Interface.Curses;
