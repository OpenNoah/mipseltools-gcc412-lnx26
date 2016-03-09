------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                      Terminal_Interface.Curses.Mouse                     --
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
--  $Revision: 1.27 $
--  $Date: 2006/06/25 14:30:22 $
--  Binding Version 01.00
------------------------------------------------------------------------------
--  mouse binding.
--  This module is generated. Please don't change it manually!
--  Run the generator instead.
--  |
with System;

package Terminal_Interface.Curses.Mouse is
   pragma Preelaborate (Terminal_Interface.Curses.Mouse);

   --  |=====================================================================
   --  | Man page curs_mouse.3x
   --  |=====================================================================
   --  Please note, that in ncurses-1.9.9e documentation mouse support
   --  is still marked as experimental. So also this binding will change
   --  if the ncurses methods change.
   --
   --  mouse_trafo, wmouse_trafo are implemented as Transform_Coordinates
   --  in the parent package.
   --
   --  Not implemented:
   --  REPORT_MOUSE_POSITION (i.e. as a parameter to Register_Reportable_Event
   --  or Start_Mouse)
   type Event_Mask is private;
   No_Events  : constant Event_Mask;
   All_Events : constant Event_Mask;

   type Mouse_Button is (Left,     -- aka: Button 1
                         Middle,   -- aka: Button 2
                         Right,    -- aka: Button 3
                         Button4,  -- aka: Button 4
                         Control,  -- Control Key
                         Shift,    -- Shift Key
                         Alt);     -- ALT Key

   subtype Real_Buttons  is Mouse_Button range Left .. Button4;
   subtype Modifier_Keys is Mouse_Button range Control .. Alt;

   type Button_State is (Released,
                         Pressed,
                         Clicked,
                         Double_Clicked,
                         Triple_Clicked);

   type Button_States is array (Button_State) of Boolean;
   pragma Pack (Button_States);

   All_Clicks : constant Button_States := (Clicked .. Triple_Clicked => True,
                                           others => False);
   All_States : constant Button_States := (others => True);

   type Mouse_Event is private;

   --  |=====================================================================
   --  | Man page curs_mouse.3x
   --  |=====================================================================

   function Has_Mouse return Boolean;
   --  Return true if a mouse device is supported, false otherwise.

   procedure Register_Reportable_Event
     (Button : in Mouse_Button;
      State  : in Button_State;
      Mask   : in out Event_Mask);
   --  Stores the event described by the button and the state in the mask.
   --  Before you call this the first time, you should init the mask
   --  with the Empty_Mask constant
   pragma Inline (Register_Reportable_Event);

   procedure Register_Reportable_Events
     (Button : in Mouse_Button;
      State  : in Button_States;
      Mask   : in out Event_Mask);
   --  Register all events described by the Button and the State bitmap.
   --  Before you call this the first time, you should init the mask
   --  with the Empty_Mask constant

   --  |
   --  There is one difference to mousmask(): we return the value of the
   --  old mask, that means the event mask value before this call.
   --  Not Implemented: The library version
   --  returns a Mouse_Mask that tells which events are reported.
   function Start_Mouse (Mask : Event_Mask := All_Events)
                         return Event_Mask;
   --  AKA: mousemask()
   pragma Inline (Start_Mouse);

   procedure End_Mouse (Mask : in Event_Mask := No_Events);
   --  Terminates the mouse, restores the specified event mask
   pragma Inline (End_Mouse);

   --  |
   function Get_Mouse return Mouse_Event;
   --  AKA: getmouse()
   pragma Inline (Get_Mouse);

   procedure Get_Event (Event  : in  Mouse_Event;
                        Y      : out Line_Position;
                        X      : out Column_Position;
                        Button : out Mouse_Button;
                        State  : out Button_State);
   --  !!! Warning: X and Y are screen coordinates. Due to ripped of lines they
   --  may not be identical to window coordinates.
   --  Not Implemented: Get_Event only reports one event, the C library
   --  version supports multiple events, e.g. {click-1, click-3}
   pragma Inline (Get_Event);

   --  |
   procedure Unget_Mouse (Event : in Mouse_Event);
   --  AKA: ungetmouse()
   pragma Inline (Unget_Mouse);

   --  |
   function Enclosed_In_Window (Win    : Window := Standard_Window;
                                Event  : Mouse_Event) return Boolean;
   --  AKA: wenclose()
   --  But : use event instead of screen coordinates.
   pragma Inline (Enclosed_In_Window);

   --  |
   function Mouse_Interval (Msec : Natural := 200) return Natural;
   --  AKA: mouseinterval()
   pragma Inline (Mouse_Interval);

private
   type Event_Mask is new Interfaces.C.unsigned_long;

   type Mouse_Event is
      record
         Id      : Integer range Integer (Interfaces.C.short'First) ..
                                 Integer (Interfaces.C.short'Last);
         X, Y, Z : Integer range Integer (Interfaces.C.int'First) ..
                                 Integer (Interfaces.C.int'Last);
         Bstate  : Event_Mask;
      end record;
   pragma Convention (C, Mouse_Event);

   for Mouse_Event use
      record
         Id      at 0 range   0 ..  15;
         X       at 0 range  32 ..  63;
         Y       at 0 range  64 ..  95;
         Z       at 0 range  96 .. 127;
         Bstate  at 0 range 128 .. 159;
      end record;
      --  Please note: this rep. clause is generated and may be
      --               different on your system.

   Generation_Bit_Order : constant System.Bit_Order := System.Low_Order_First;
   --  This constant may be different on your system.

   BUTTON1_RELEASED          : constant Event_Mask := 8#00000000001#;
   BUTTON1_PRESSED           : constant Event_Mask := 8#00000000002#;
   BUTTON1_CLICKED           : constant Event_Mask := 8#00000000004#;
   BUTTON1_DOUBLE_CLICKED    : constant Event_Mask := 8#00000000010#;
   BUTTON1_TRIPLE_CLICKED    : constant Event_Mask := 8#00000000020#;
   BUTTON1_RESERVED_EVENT    : constant Event_Mask := 8#00000000040#;
   BUTTON2_RELEASED          : constant Event_Mask := 8#00000000100#;
   BUTTON2_PRESSED           : constant Event_Mask := 8#00000000200#;
   BUTTON2_CLICKED           : constant Event_Mask := 8#00000000400#;
   BUTTON2_DOUBLE_CLICKED    : constant Event_Mask := 8#00000001000#;
   BUTTON2_TRIPLE_CLICKED    : constant Event_Mask := 8#00000002000#;
   BUTTON2_RESERVED_EVENT    : constant Event_Mask := 8#00000004000#;
   BUTTON3_RELEASED          : constant Event_Mask := 8#00000010000#;
   BUTTON3_PRESSED           : constant Event_Mask := 8#00000020000#;
   BUTTON3_CLICKED           : constant Event_Mask := 8#00000040000#;
   BUTTON3_DOUBLE_CLICKED    : constant Event_Mask := 8#00000100000#;
   BUTTON3_TRIPLE_CLICKED    : constant Event_Mask := 8#00000200000#;
   BUTTON3_RESERVED_EVENT    : constant Event_Mask := 8#00000400000#;
   BUTTON4_RELEASED          : constant Event_Mask := 8#00001000000#;
   BUTTON4_PRESSED           : constant Event_Mask := 8#00002000000#;
   BUTTON4_CLICKED           : constant Event_Mask := 8#00004000000#;
   BUTTON4_DOUBLE_CLICKED    : constant Event_Mask := 8#00010000000#;
   BUTTON4_TRIPLE_CLICKED    : constant Event_Mask := 8#00020000000#;
   BUTTON4_RESERVED_EVENT    : constant Event_Mask := 8#00040000000#;
   BUTTON_CTRL               : constant Event_Mask := 8#00100000000#;
   BUTTON_SHIFT              : constant Event_Mask := 8#00200000000#;
   BUTTON_ALT                : constant Event_Mask := 8#00400000000#;
   REPORT_MOUSE_POSITION     : constant Event_Mask := 8#01000000000#;
   ALL_MOUSE_EVENTS          : constant Event_Mask := 8#00777777777#;
   BUTTON1_EVENTS            : constant Event_Mask := 8#00000000077#;
   BUTTON2_EVENTS            : constant Event_Mask := 8#00000007700#;
   BUTTON3_EVENTS            : constant Event_Mask := 8#00000770000#;
   BUTTON4_EVENTS            : constant Event_Mask := 8#00077000000#;

   No_Events  : constant Event_Mask := 0;
   All_Events : constant Event_Mask := ALL_MOUSE_EVENTS;

end Terminal_Interface.Curses.Mouse;
