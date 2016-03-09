------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                      Terminal_Interface.Curses.Panels                    --
--                                                                          --
--                                 S P E C                                  --
--                                                                          --
------------------------------------------------------------------------------
-- Copyright (c) 1998,2006 Free Software Foundation, Inc.                   --
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
--  $Revision: 1.19 $
--  $Date: 2006/06/25 14:30:22 $
--  Binding Version 01.00
------------------------------------------------------------------------------
with System;

package Terminal_Interface.Curses.Panels is
   pragma Preelaborate (Terminal_Interface.Curses.Panels);
   pragma Linker_Options ("-lpanel");
   pragma Linker_Options ("-lncurses");

   type Panel is private;

   ---------------------------
   --  Interface constants  --
   ---------------------------
   Null_Panel : constant Panel;

   -------------------
   --  Exceptions   --
   -------------------

   Panel_Exception : exception;

   --  |=====================================================================
   --  | Man page panel.3x
   --  |=====================================================================

   --  |
   function Create (Win : Window) return Panel;
   --  AKA: new_panel()
   pragma Inline (Create);

   --  |
   function New_Panel (Win : Window) return Panel renames Create;
   --  AKA: new_panel()
   --  pragma Inline (New_Panel);

   --  |
   procedure Bottom (Pan : in Panel);
   --  AKA: bottom_panel()
   pragma Inline (Bottom);

   --  |
   procedure Top (Pan : in Panel);
   --  AKA: top_panel()
   pragma Inline (Top);

   --  |
   procedure Show (Pan : in Panel);
   --  AKA: show_panel()
   pragma Inline (Show);

   --  |
   procedure Update_Panels;
   --  AKA: update_panels()
   pragma Import (C, Update_Panels, "update_panels");

   --  |
   procedure Hide (Pan : in Panel);
   --  AKA: hide_panel()
   pragma Inline (Hide);

   --  |
   function Get_Window (Pan : Panel) return Window;
   --  AKA: panel_window()
   pragma Inline (Get_Window);

   --  |
   function Panel_Window (Pan : Panel) return Window renames Get_Window;
   --  pragma Inline (Panel_Window);

   --  |
   procedure Replace (Pan : in Panel;
                      Win : in Window);
   --  AKA: replace_panel()
   pragma Inline (Replace);

   --  |
   procedure Move (Pan    : in Panel;
                   Line   : in Line_Position;
                   Column : in Column_Position);
   --  AKA: move_panel()
   pragma Inline (Move);

   --  |
   function Is_Hidden (Pan : Panel) return Boolean;
   --  AKA: panel_hidden()
   pragma Inline (Is_Hidden);

   --  |
   function Above (Pan : Panel) return Panel;
   --  AKA: panel_above()
   pragma Import (C, Above, "panel_above");

   --  |
   function Below (Pan : Panel) return Panel;
   --  AKA: panel_below()
   pragma Import (C, Below, "panel_below");

   --  |
   procedure Delete (Pan : in out Panel);
   --  AKA: del_panel()
   pragma Inline (Delete);

private
      type Panel is new System.Storage_Elements.Integer_Address;
      Null_Panel : constant Panel := 0;

end Terminal_Interface.Curses.Panels;
