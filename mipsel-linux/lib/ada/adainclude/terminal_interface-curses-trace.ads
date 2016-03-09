------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                      Terminal_Interface.Curses.Trace                     --
--                                                                          --
--                                 S P E C                                  --
--                                                                          --
------------------------------------------------------------------------------
-- Copyright (c) 2000 Free Software Foundation, Inc.                        --
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
--  Author: Eugene V. Melaragno <aldomel@ix.netcom.com> 2000
--  Version Control:
--  $Revision: 1.1 $
--  Binding Version 01.00
------------------------------------------------------------------------------

package Terminal_Interface.Curses.Trace is
   pragma Preelaborate (Terminal_Interface.Curses.Trace);

   pragma Warnings (Off);
   type Trace_Attribute_Set is
      record
         Times            : Boolean;
         Tputs            : Boolean;
         Update           : Boolean;
         Cursor_Move      : Boolean;
         Character_Output : Boolean;
         Calls            : Boolean;
         Virtual_Puts     : Boolean;
         Input_Events     : Boolean;
         TTY_State        : Boolean;
         Internal_Calls   : Boolean;
         Character_Calls  : Boolean;
         Termcap_TermInfo : Boolean;
      end record;
   pragma Convention (C, Trace_Attribute_Set);

   for Trace_Attribute_Set use
      record
         Times            at 0 range  0 ..  0;
         Tputs            at 0 range  1 ..  1;
         Update           at 0 range  2 ..  2;
         Cursor_Move      at 0 range  3 ..  3;
         Character_Output at 0 range  4 ..  4;
         Calls            at 0 range  5 ..  5;
         Virtual_Puts     at 0 range  6 ..  6;
         Input_Events     at 0 range  7 ..  7;
         TTY_State        at 0 range  8 ..  8;
         Internal_Calls   at 0 range  9 ..  9;
         Character_Calls  at 0 range 10 .. 10;
         Termcap_TermInfo at 0 range 11 .. 11;
      end record;
   for Trace_Attribute_Set'Size use 32;
   --  Please note: this rep. clause is generated and may be
   --               different on your system.

   pragma Warnings (On);

   Trace_Disable  : constant Trace_Attribute_Set := (others => False);

   Trace_Ordinary : constant Trace_Attribute_Set :=
     (Times            => True,
      Tputs            => True,
      Update           => True,
      Cursor_Move      => True,
      Character_Output => True,
      others           => False);
   Trace_Maximum : constant Trace_Attribute_Set := (others => True);

------------------------------------------------------------------------------

   --  |=====================================================================
   --  | Man page curs_trace.3x
   --  |=====================================================================

   --  |
   procedure Trace_On (x : Trace_Attribute_Set);
   --  The debugging library has trace.

   --  |
   procedure Trace_Put (str : String);
   --  AKA: _tracef()

   Current_Trace_Setting : Trace_Attribute_Set;
   pragma Import (C, Current_Trace_Setting, "_nc_tracing");

end Terminal_Interface.Curses.Trace;
