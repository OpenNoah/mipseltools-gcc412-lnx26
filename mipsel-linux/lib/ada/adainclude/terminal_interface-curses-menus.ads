------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                      Terminal_Interface.Curses.Menu                      --
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
--  $Revision: 1.26 $
--  $Date: 2006/06/25 14:30:22 $
--  Binding Version 01.00
------------------------------------------------------------------------------
--  menu binding.
--  This module is generated. Please don't change it manually!
--  Run the generator instead.
--  |
with System;
with Ada.Characters.Latin_1;

package Terminal_Interface.Curses.Menus is
   pragma Preelaborate (Terminal_Interface.Curses.Menus);
   pragma Linker_Options ("-lmenu");
   pragma Linker_Options ("-lncurses");

   Space : Character renames Ada.Characters.Latin_1.Space;

   type Item is private;
   type Menu is private;

   ---------------------------
   --  Interface constants  --
   ---------------------------
   Null_Item : constant Item;
   Null_Menu : constant Menu;

   subtype Menu_Request_Code is Key_Code
     range (Key_Max + 1) .. (Key_Max + 17);

   --  The prefix M_ stands for "Menu Request"
   M_Left_Item       : constant Menu_Request_Code := Key_Max + 1;
   M_Right_Item      : constant Menu_Request_Code := Key_Max + 2;
   M_Up_Item         : constant Menu_Request_Code := Key_Max + 3;
   M_Down_Item       : constant Menu_Request_Code := Key_Max + 4;
   M_ScrollUp_Line   : constant Menu_Request_Code := Key_Max + 5;
   M_ScrollDown_Line : constant Menu_Request_Code := Key_Max + 6;
   M_ScrollDown_Page : constant Menu_Request_Code := Key_Max + 7;
   M_ScrollUp_Page   : constant Menu_Request_Code := Key_Max + 8;
   M_First_Item      : constant Menu_Request_Code := Key_Max + 9;
   M_Last_Item       : constant Menu_Request_Code := Key_Max + 10;
   M_Next_Item       : constant Menu_Request_Code := Key_Max + 11;
   M_Previous_Item   : constant Menu_Request_Code := Key_Max + 12;
   M_Toggle_Item     : constant Menu_Request_Code := Key_Max + 13;
   M_Clear_Pattern   : constant Menu_Request_Code := Key_Max + 14;
   M_Back_Pattern    : constant Menu_Request_Code := Key_Max + 15;
   M_Next_Match      : constant Menu_Request_Code := Key_Max + 16;
   M_Previous_Match  : constant Menu_Request_Code := Key_Max + 17;

   --  For those who like the old 'C' names for the request codes
   REQ_LEFT_ITEM     : Menu_Request_Code renames M_Left_Item;
   REQ_RIGHT_ITEM    : Menu_Request_Code renames M_Right_Item;
   REQ_UP_ITEM       : Menu_Request_Code renames M_Up_Item;
   REQ_DOWN_ITEM     : Menu_Request_Code renames M_Down_Item;
   REQ_SCR_ULINE     : Menu_Request_Code renames M_ScrollUp_Line;
   REQ_SCR_DLINE     : Menu_Request_Code renames M_ScrollDown_Line;
   REQ_SCR_DPAGE     : Menu_Request_Code renames M_ScrollDown_Page;
   REQ_SCR_UPAGE     : Menu_Request_Code renames M_ScrollUp_Page;
   REQ_FIRST_ITEM    : Menu_Request_Code renames M_First_Item;
   REQ_LAST_ITEM     : Menu_Request_Code renames M_Last_Item;
   REQ_NEXT_ITEM     : Menu_Request_Code renames M_Next_Item;
   REQ_PREV_ITEM     : Menu_Request_Code renames M_Previous_Item;
   REQ_TOGGLE_ITEM   : Menu_Request_Code renames M_Toggle_Item;
   REQ_CLEAR_PATTERN : Menu_Request_Code renames M_Clear_Pattern;
   REQ_BACK_PATTERN  : Menu_Request_Code renames M_Back_Pattern;
   REQ_NEXT_MATCH    : Menu_Request_Code renames M_Next_Match;
   REQ_PREV_MATCH    : Menu_Request_Code renames M_Previous_Match;

   procedure Request_Name (Key  : in Menu_Request_Code;
                           Name : out String);

   function  Request_Name (Key : Menu_Request_Code) return String;
   --  Same as function

   ------------------
   --  Exceptions  --
   ------------------

   Menu_Exception : exception;
   --
   --  Menu options
   --
   pragma Warnings (Off);
   type Menu_Option_Set is
      record
         One_Valued        : Boolean;
         Show_Descriptions : Boolean;
         Row_Major_Order   : Boolean;
         Ignore_Case       : Boolean;
         Show_Matches      : Boolean;
         Non_Cyclic        : Boolean;
      end record;
   pragma Convention (C, Menu_Option_Set);

   for Menu_Option_Set use
      record
         One_Valued        at 0 range  0 ..  0;
         Show_Descriptions at 0 range  1 ..  1;
         Row_Major_Order   at 0 range  2 ..  2;
         Ignore_Case       at 0 range  3 ..  3;
         Show_Matches      at 0 range  4 ..  4;
         Non_Cyclic        at 0 range  5 ..  5;
      end record;
   for Menu_Option_Set'Size use 32;
   --  Please note: this rep. clause is generated and may be
   --               different on your system.
   pragma Warnings (On);

   function Default_Menu_Options return Menu_Option_Set;
   --  Initial default options for a menu.
   pragma Inline (Default_Menu_Options);
   --
   --  Item options
   --
   pragma Warnings (Off);
   type Item_Option_Set is
      record
         Selectable  : Boolean;
      end record;
   pragma Convention (C, Item_Option_Set);

   for Item_Option_Set use
      record
         Selectable  at 0 range  0 ..  0;
      end record;
   for Item_Option_Set'Size use 32;
   --  Please note: this rep. clause is generated and may be
   --               different on your system.
   pragma Warnings (On);

   function Default_Item_Options return Item_Option_Set;
   --  Initial default options for an item.
   pragma Inline (Default_Item_Options);

   --
   --  Item Array
   --
   type Item_Array is array (Positive range <>) of aliased Item;
   pragma Convention (C, Item_Array);

   type Item_Array_Access is access Item_Array;

   procedure Free (IA         : in out Item_Array_Access;
                   Free_Items : Boolean := False);
   --  Release the memory for an allocated item array
   --  If Free_Items is True, call Delete() for all the items in
   --  the array.

   --  |=====================================================================
   --  | Man page mitem_new.3x
   --  |=====================================================================

   --  |
   function Create (Name        : String;
                    Description : String := "") return Item;
   --  AKA: new_item()
   --  Not inlined.

   --  |
   function New_Item (Name        : String;
                      Description : String := "") return Item
     renames Create;
   --  AKA: new_item()

   --  |
   procedure Delete (Itm : in out Item);
   --  AKA: free_item()
   --  Resets Itm to Null_Item

   --  |=====================================================================
   --  | Man page mitem_value.3x
   --  |=====================================================================

   --  |
   procedure Set_Value (Itm   : in Item;
                        Value : in Boolean := True);
   --  AKA: set_item_value()
   pragma Inline (Set_Value);

   --  |
   function Value (Itm : Item) return Boolean;
   --  AKA: item_value()
   pragma Inline (Value);

   --  |=====================================================================
   --  | Man page mitem_visible.3x
   --  |=====================================================================

   --  |
   function Visible (Itm : Item) return Boolean;
   --  AKA: item_visible()
   pragma Inline (Visible);

   --  |=====================================================================
   --  | Man page mitem_opts.3x
   --  |=====================================================================

   --  |
   procedure Set_Options (Itm     : in Item;
                          Options : in Item_Option_Set);
   --  AKA: set_item_opts()
   --  An overloaded Set_Options is defined later. Pragma Inline appears there

   --  |
   procedure Switch_Options (Itm     : in Item;
                             Options : in Item_Option_Set;
                             On      : Boolean := True);
   --  AKA: item_opts_on()
   --  AKA: item_opts_off()
   --  An overloaded Switch_Options is defined later.
   --  Pragma Inline appears there

   --  |
   procedure Get_Options (Itm     : in  Item;
                          Options : out Item_Option_Set);
   --  AKA: item_opts()

   --  |
   function Get_Options (Itm : Item := Null_Item) return Item_Option_Set;
   --  AKA: item_opts()
   --  An overloaded Get_Options is defined later. Pragma Inline appears there

   --  |=====================================================================
   --  | Man page mitem_name.3x
   --  |=====================================================================

   --  |
   procedure Name (Itm  : in Item;
                   Name : out String);
   --  AKA: item_name()
   function  Name (Itm : Item) return String;
   --  AKA: item_name()
   --  Implemented as function
   pragma Inline (Name);

   --  |
   procedure Description (Itm         : in Item;
                          Description : out String);
   --  AKA: item_description();

   function  Description (Itm : Item) return String;
   --  AKA: item_description();
   --  Implemented as function
   pragma Inline (Description);

   --  |=====================================================================
   --  | Man page mitem_current.3x
   --  |=====================================================================

   --  |
   procedure Set_Current (Men : in Menu;
                          Itm : in Item);
   --  AKA: set_current_item()
   pragma Inline (Set_Current);

   --  |
   function Current (Men : Menu) return Item;
   --  AKA: current_item()
   pragma Inline (Current);

   --  |
   procedure Set_Top_Row (Men  : in Menu;
                          Line : in Line_Position);
   --  AKA: set_top_row()
   pragma Inline (Set_Top_Row);

   --  |
   function Top_Row (Men : Menu) return Line_Position;
   --  AKA: top_row()
   pragma Inline (Top_Row);

   --  |
   function Get_Index (Itm : Item) return Positive;
   --  AKA: item_index()
   --  Please note that in this binding we start the numbering of items
   --  with 1. So this is number is one more than you get from the low
   --  level call.
   pragma Inline (Get_Index);

   --  |=====================================================================
   --  | Man page menu_post.3x
   --  |=====================================================================

   --  |
   procedure Post (Men  : in Menu;
                   Post : in Boolean := True);
   --  AKA: post_menu()
   --  AKA: unpost_menu()
   pragma Inline (Post);

   --  |=====================================================================
   --  | Man page menu_opts.3x
   --  |=====================================================================

   --  |
   procedure Set_Options (Men     : in Menu;
                          Options : in Menu_Option_Set);
   --  AKA: set_menu_opts()
   pragma Inline (Set_Options);

   --  |
   procedure Switch_Options (Men     : in Menu;
                             Options : in Menu_Option_Set;
                             On      : Boolean := True);
   --  AKA: menu_opts_on()
   --  AKA: menu_opts_off()
   pragma Inline (Switch_Options);

   --  |
   procedure Get_Options (Men     : in  Menu;
                          Options : out Menu_Option_Set);
   --  AKA: menu_opts()

   --  |
   function Get_Options (Men : Menu := Null_Menu) return Menu_Option_Set;
   --  AKA: menu_opts()
   pragma Inline (Get_Options);

   --  |=====================================================================
   --  | Man page menu_win.3x
   --  |=====================================================================

   --  |
   procedure Set_Window (Men : in Menu;
                         Win : in Window);
   --  AKA: set_menu_win()
   pragma Inline (Set_Window);

   --  |
   function Get_Window (Men : Menu) return Window;
   --  AKA: menu_win()
   pragma Inline (Get_Window);

   --  |
   procedure Set_Sub_Window (Men : in Menu;
                             Win : in Window);
   --  AKA: set_menu_sub()
   pragma Inline (Set_Sub_Window);

   --  |
   function Get_Sub_Window (Men : Menu) return Window;
   --  AKA: menu_sub()
   pragma Inline (Get_Sub_Window);

   --  |
   procedure Scale (Men     : in Menu;
                    Lines   : out Line_Count;
                    Columns : out Column_Count);
   --  AKA: scale_menu()
   pragma Inline (Scale);

   --  |=====================================================================
   --  | Man page menu_cursor.3x
   --  |=====================================================================

   --  |
   procedure Position_Cursor (Men : Menu);
   --  AKA: pos_menu_cursor()
   pragma Inline (Position_Cursor);

   --  |=====================================================================
   --  | Man page menu_mark.3x
   --  |=====================================================================

   --  |
   procedure Set_Mark (Men  : in Menu;
                       Mark : in String);
   --  AKA: set_menu_mark()
   pragma Inline (Set_Mark);

   --  |
   procedure Mark (Men  : in  Menu;
                   Mark : out String);
   --  AKA: menu_mark()

   function  Mark (Men : Menu) return String;
   --  AKA: menu_mark()
   --  Implemented as function
   pragma Inline (Mark);

   --  |=====================================================================
   --  | Man page menu_attribs.3x
   --  |=====================================================================

   --  |
   procedure Set_Foreground
     (Men   : in Menu;
      Fore  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: set_menu_fore()
   pragma Inline (Set_Foreground);

   --  |
   procedure Foreground (Men   : in  Menu;
                         Fore  : out Character_Attribute_Set);
   --  AKA: menu_fore()

   --  |
   procedure Foreground (Men   : in  Menu;
                         Fore  : out Character_Attribute_Set;
                         Color : out Color_Pair);
   --  AKA: menu_fore()
   pragma Inline (Foreground);

   --  |
   procedure Set_Background
     (Men   : in Menu;
      Back  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: set_menu_back()
   pragma Inline (Set_Background);

   --  |
   procedure Background (Men  : in  Menu;
                         Back : out Character_Attribute_Set);
   --  AKA: menu_back()
   --  |

   procedure Background (Men   : in  Menu;
                         Back  : out Character_Attribute_Set;
                         Color : out Color_Pair);
   --  AKA: menu_back()
   pragma Inline (Background);

   --  |
   procedure Set_Grey
     (Men   : in Menu;
      Grey  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: set_menu_grey()
   pragma Inline (Set_Grey);

   --  |
   procedure Grey (Men  : in  Menu;
                   Grey : out Character_Attribute_Set);
   --  AKA: menu_grey()

   --  |
   procedure Grey
     (Men   : in  Menu;
      Grey  : out Character_Attribute_Set;
      Color : out Color_Pair);
   --  AKA: menu_grey()
   pragma Inline (Grey);

   --  |
   procedure Set_Pad_Character (Men : in Menu;
                                Pad : in Character := Space);
   --  AKA: set_menu_pad()
   pragma Inline (Set_Pad_Character);

   --  |
   procedure Pad_Character (Men : in  Menu;
                            Pad : out Character);
   --  AKA: menu_pad()
   pragma Inline (Pad_Character);

   --  |=====================================================================
   --  | Man page menu_spacing.3x
   --  |=====================================================================

   --  |
   procedure Set_Spacing (Men   : in Menu;
                          Descr : in Column_Position := 0;
                          Row   : in Line_Position   := 0;
                          Col   : in Column_Position := 0);
   --  AKA: set_menu_spacing()
   pragma Inline (Set_Spacing);

   --  |
   procedure Spacing (Men   : in Menu;
                      Descr : out Column_Position;
                      Row   : out Line_Position;
                      Col   : out Column_Position);
   --  AKA: menu_spacing()
   pragma Inline (Spacing);

   --  |=====================================================================
   --  | Man page menu_pattern.3x
   --  |=====================================================================

   --  |
   function Set_Pattern (Men  : Menu;
                         Text : String) return Boolean;
   --  AKA: set_menu_pattern()
   --  Return TRUE if the pattern matches, FALSE otherwise
   pragma Inline (Set_Pattern);

   --  |
   procedure Pattern (Men  : in  Menu;
                      Text : out String);
   --  AKA: menu_pattern()
   pragma Inline (Pattern);

   --  |=====================================================================
   --  | Man page menu_format.3x
   --  |=====================================================================

   --  |
   procedure Set_Format (Men     : in Menu;
                         Lines   : in Line_Count;
                         Columns : in Column_Count);
   --  Not implemented: 0 argument for Lines or Columns;
   --  instead use Format to get the current sizes
   --      The  default  format  is  16  rows,  1  column.    Calling
   --      set_menu_format  with a null menu pointer will change this
   --      default.  A zero row or column argument to set_menu_format
   --      is  interpreted  as  a  request  not to change the current
   --      value.
   --  AKA: set_menu_format()
   pragma Inline (Set_Format);

   --  |
   procedure Format (Men     : in  Menu;
                     Lines   : out Line_Count;
                     Columns : out Column_Count);
   --  AKA: menu_format()
   pragma Inline (Format);

   --  |=====================================================================
   --  | Man page menu_hook.3x
   --  |=====================================================================

   type Menu_Hook_Function is access procedure (Men : in Menu);
   pragma Convention (C, Menu_Hook_Function);

   --  |
   procedure Set_Item_Init_Hook (Men  : in Menu;
                                 Proc : in Menu_Hook_Function);
   --  AKA: set_item_init()
   pragma Inline (Set_Item_Init_Hook);

   --  |
   procedure Set_Item_Term_Hook (Men  : in Menu;
                                 Proc : in Menu_Hook_Function);
   --  AKA: set_item_term()
   pragma Inline (Set_Item_Term_Hook);

   --  |
   procedure Set_Menu_Init_Hook (Men  : in Menu;
                                 Proc : in Menu_Hook_Function);
   --  AKA: set_menu_init()
   pragma Inline (Set_Menu_Init_Hook);

   --  |
   procedure Set_Menu_Term_Hook (Men  : in Menu;
                                 Proc : in Menu_Hook_Function);
   --  AKA: set_menu_term()
   pragma Inline (Set_Menu_Term_Hook);

   --  |
   function Get_Item_Init_Hook (Men : Menu) return Menu_Hook_Function;
   --  AKA: item_init()
   pragma Inline (Get_Item_Init_Hook);

   --  |
   function Get_Item_Term_Hook (Men : Menu) return Menu_Hook_Function;
   --  AKA: item_term()
   pragma Inline (Get_Item_Term_Hook);

   --  |
   function Get_Menu_Init_Hook (Men : Menu) return Menu_Hook_Function;
   --  AKA: menu_init()
   pragma Inline (Get_Menu_Init_Hook);

   --  |
   function Get_Menu_Term_Hook (Men : Menu) return Menu_Hook_Function;
   --  AKA: menu_term()
   pragma Inline (Get_Menu_Term_Hook);

   --  |=====================================================================
   --  | Man page menu_items.3x
   --  |=====================================================================

   --  |
   procedure Redefine (Men   : in Menu;
                       Items : in Item_Array_Access);
   --  AKA: set_menu_items()
   pragma Inline (Redefine);

   procedure Set_Items (Men   : in Menu;
                        Items : in Item_Array_Access) renames Redefine;
   --  pragma Inline (Set_Items);

   --  |
   function Items (Men   : Menu;
                   Index : Positive) return Item;
   --  AKA: menu_items()
   pragma Inline (Items);

   --  |
   function Item_Count (Men : Menu) return Natural;
   --  AKA: item_count()
   pragma Inline (Item_Count);

   --  |=====================================================================
   --  | Man page menu_new.3x
   --  |=====================================================================

   --  |
   function Create (Items : Item_Array_Access) return Menu;
   --  AKA: new_menu()
   --  Not inlined

   function New_Menu (Items : Item_Array_Access) return Menu renames Create;

   --  |
   procedure Delete (Men : in out Menu);
   --  AKA: free_menu()
   --  Reset Men to Null_Menu
   --  Not inlined

   --  |=====================================================================
   --  | Man page menu_driver.3x
   --  |=====================================================================

   type Driver_Result is (Menu_Ok,
                          Request_Denied,
                          Unknown_Request,
                          No_Match);

   --  |
   function Driver (Men : Menu;
                    Key : Key_Code) return Driver_Result;
   --  AKA: menu_driver()
   --  Driver is not inlined

   --  |
   --  Not Implemented: menu_request_name, menu_request_by_name
-------------------------------------------------------------------------------
private
   type Item   is new System.Storage_Elements.Integer_Address;
   type Menu   is new System.Storage_Elements.Integer_Address;

   Null_Item : constant Item := 0;
   Null_Menu : constant Menu := 0;

end Terminal_Interface.Curses.Menus;
