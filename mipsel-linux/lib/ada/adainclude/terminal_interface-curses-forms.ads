------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                      Terminal_Interface.Curses.Form                      --
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
--  $Revision: 1.29 $
--  $Date: 2006/06/25 14:30:21 $
--  Binding Version 01.00
------------------------------------------------------------------------------
--  form binding.
--  This module is generated. Please don't change it manually!
--  Run the generator instead.
--  |
with System;
with Ada.Characters.Latin_1;

package Terminal_Interface.Curses.Forms is
   pragma Preelaborate (Terminal_Interface.Curses.Forms);
   pragma Linker_Options ("-lform");
   pragma Linker_Options ("-lncurses");

   Space : Character renames Ada.Characters.Latin_1.Space;

   type Field        is private;
   type Form         is private;

   Null_Field        : constant Field;
   Null_Form         : constant Form;

   type Field_Justification is (None,
                                Left,
                                Center,
                                Right);

   pragma Warnings (Off);
   type Field_Option_Set is
      record
         Visible     : Boolean;
         Active      : Boolean;
         Public      : Boolean;
         Edit        : Boolean;
         Wrap        : Boolean;
         Blank       : Boolean;
         Auto_Skip   : Boolean;
         Null_Ok     : Boolean;
         Pass_Ok     : Boolean;
         Static      : Boolean;
      end record;
   pragma Convention (C, Field_Option_Set);

   for Field_Option_Set use
      record
         Visible     at 0 range  0 ..  0;
         Active      at 0 range  1 ..  1;
         Public      at 0 range  2 ..  2;
         Edit        at 0 range  3 ..  3;
         Wrap        at 0 range  4 ..  4;
         Blank       at 0 range  5 ..  5;
         Auto_Skip   at 0 range  6 ..  6;
         Null_Ok     at 0 range  7 ..  7;
         Pass_Ok     at 0 range  8 ..  8;
         Static      at 0 range  9 ..  9;
      end record;
   for Field_Option_Set'Size use 32;
   --  Please note: this rep. clause is generated and may be
   --               different on your system.Dnl

   pragma Warnings (On);

   function Default_Field_Options return Field_Option_Set;
   --  The initial defaults for the field options.
   pragma Inline (Default_Field_Options);

   pragma Warnings (Off);
   type Form_Option_Set is
      record
         NL_Overload : Boolean;
         BS_Overload : Boolean;
      end record;
   pragma Convention (C, Form_Option_Set);

   for Form_Option_Set use
      record
         NL_Overload at 0 range  0 ..  0;
         BS_Overload at 0 range  1 ..  1;
      end record;
   for Form_Option_Set'Size use 32;
   --  Please note: this rep. clause is generated and may be
   --               different on your system.Dnl

   pragma Warnings (On);

   function Default_Form_Options return Form_Option_Set;
   --  The initial defaults for the form options.
   pragma Inline (Default_Form_Options);

   type Buffer_Number is new Natural;

   type Field_Array is array (Positive range <>) of aliased Field;
   pragma Convention (C, Field_Array);

   type Field_Array_Access is access Field_Array;

   procedure Free (FA          : in out Field_Array_Access;
                   Free_Fields : in Boolean := False);
   --  Release the memory for an allocated field array
   --  If Free_Fields is True, call Delete() for all the fields in
   --  the array.

   subtype Form_Request_Code is Key_Code range (Key_Max + 1) .. (Key_Max + 57);

   --  The prefix F_ stands for "Form Request"
   F_Next_Page                : constant Form_Request_Code := Key_Max + 1;
   F_Previous_Page            : constant Form_Request_Code := Key_Max + 2;
   F_First_Page               : constant Form_Request_Code := Key_Max + 3;
   F_Last_Page                : constant Form_Request_Code := Key_Max + 4;

   F_Next_Field               : constant Form_Request_Code := Key_Max + 5;
   F_Previous_Field           : constant Form_Request_Code := Key_Max + 6;
   F_First_Field              : constant Form_Request_Code := Key_Max + 7;
   F_Last_Field               : constant Form_Request_Code := Key_Max + 8;
   F_Sorted_Next_Field        : constant Form_Request_Code := Key_Max + 9;
   F_Sorted_Previous_Field    : constant Form_Request_Code := Key_Max + 10;
   F_Sorted_First_Field       : constant Form_Request_Code := Key_Max + 11;
   F_Sorted_Last_Field        : constant Form_Request_Code := Key_Max + 12;
   F_Left_Field               : constant Form_Request_Code := Key_Max + 13;
   F_Right_Field              : constant Form_Request_Code := Key_Max + 14;
   F_Up_Field                 : constant Form_Request_Code := Key_Max + 15;
   F_Down_Field               : constant Form_Request_Code := Key_Max + 16;

   F_Next_Char                : constant Form_Request_Code := Key_Max + 17;
   F_Previous_Char            : constant Form_Request_Code := Key_Max + 18;
   F_Next_Line                : constant Form_Request_Code := Key_Max + 19;
   F_Previous_Line            : constant Form_Request_Code := Key_Max + 20;
   F_Next_Word                : constant Form_Request_Code := Key_Max + 21;
   F_Previous_Word            : constant Form_Request_Code := Key_Max + 22;
   F_Begin_Field              : constant Form_Request_Code := Key_Max + 23;
   F_End_Field                : constant Form_Request_Code := Key_Max + 24;
   F_Begin_Line               : constant Form_Request_Code := Key_Max + 25;
   F_End_Line                 : constant Form_Request_Code := Key_Max + 26;
   F_Left_Char                : constant Form_Request_Code := Key_Max + 27;
   F_Right_Char               : constant Form_Request_Code := Key_Max + 28;
   F_Up_Char                  : constant Form_Request_Code := Key_Max + 29;
   F_Down_Char                : constant Form_Request_Code := Key_Max + 30;

   F_New_Line                 : constant Form_Request_Code := Key_Max + 31;
   F_Insert_Char              : constant Form_Request_Code := Key_Max + 32;
   F_Insert_Line              : constant Form_Request_Code := Key_Max + 33;
   F_Delete_Char              : constant Form_Request_Code := Key_Max + 34;
   F_Delete_Previous          : constant Form_Request_Code := Key_Max + 35;
   F_Delete_Line              : constant Form_Request_Code := Key_Max + 36;
   F_Delete_Word              : constant Form_Request_Code := Key_Max + 37;
   F_Clear_EOL                : constant Form_Request_Code := Key_Max + 38;
   F_Clear_EOF                : constant Form_Request_Code := Key_Max + 39;
   F_Clear_Field              : constant Form_Request_Code := Key_Max + 40;
   F_Overlay_Mode             : constant Form_Request_Code := Key_Max + 41;
   F_Insert_Mode              : constant Form_Request_Code := Key_Max + 42;

   --  Vertical Scrolling
   F_ScrollForward_Line       : constant Form_Request_Code := Key_Max + 43;
   F_ScrollBackward_Line      : constant Form_Request_Code := Key_Max + 44;
   F_ScrollForward_Page       : constant Form_Request_Code := Key_Max + 45;
   F_ScrollBackward_Page      : constant Form_Request_Code := Key_Max + 46;
   F_ScrollForward_HalfPage   : constant Form_Request_Code := Key_Max + 47;
   F_ScrollBackward_HalfPage  : constant Form_Request_Code := Key_Max + 48;

   --  Horizontal Scrolling
   F_HScrollForward_Char      : constant Form_Request_Code := Key_Max + 49;
   F_HScrollBackward_Char     : constant Form_Request_Code := Key_Max + 50;
   F_HScrollForward_Line      : constant Form_Request_Code := Key_Max + 51;
   F_HScrollBackward_Line     : constant Form_Request_Code := Key_Max + 52;
   F_HScrollForward_HalfLine  : constant Form_Request_Code := Key_Max + 53;
   F_HScrollBackward_HalfLine : constant Form_Request_Code := Key_Max + 54;

   F_Validate_Field           : constant Form_Request_Code := Key_Max + 55;
   F_Next_Choice              : constant Form_Request_Code := Key_Max + 56;
   F_Previous_Choice          : constant Form_Request_Code := Key_Max + 57;

   --  For those who like the old 'C' style request names
   REQ_NEXT_PAGE    : Form_Request_Code renames F_Next_Page;
   REQ_PREV_PAGE    : Form_Request_Code renames F_Previous_Page;
   REQ_FIRST_PAGE   : Form_Request_Code renames F_First_Page;
   REQ_LAST_PAGE    : Form_Request_Code renames F_Last_Page;

   REQ_NEXT_FIELD   : Form_Request_Code renames F_Next_Field;
   REQ_PREV_FIELD   : Form_Request_Code renames F_Previous_Field;
   REQ_FIRST_FIELD  : Form_Request_Code renames F_First_Field;
   REQ_LAST_FIELD   : Form_Request_Code renames F_Last_Field;
   REQ_SNEXT_FIELD  : Form_Request_Code renames F_Sorted_Next_Field;
   REQ_SPREV_FIELD  : Form_Request_Code renames F_Sorted_Previous_Field;
   REQ_SFIRST_FIELD : Form_Request_Code renames F_Sorted_First_Field;
   REQ_SLAST_FIELD  : Form_Request_Code renames F_Sorted_Last_Field;
   REQ_LEFT_FIELD   : Form_Request_Code renames F_Left_Field;
   REQ_RIGHT_FIELD  : Form_Request_Code renames F_Right_Field;
   REQ_UP_FIELD     : Form_Request_Code renames F_Up_Field;
   REQ_DOWN_FIELD   : Form_Request_Code renames F_Down_Field;

   REQ_NEXT_CHAR    : Form_Request_Code renames F_Next_Char;
   REQ_PREV_CHAR    : Form_Request_Code renames F_Previous_Char;
   REQ_NEXT_LINE    : Form_Request_Code renames F_Next_Line;
   REQ_PREV_LINE    : Form_Request_Code renames F_Previous_Line;
   REQ_NEXT_WORD    : Form_Request_Code renames F_Next_Word;
   REQ_PREV_WORD    : Form_Request_Code renames F_Previous_Word;
   REQ_BEG_FIELD    : Form_Request_Code renames F_Begin_Field;
   REQ_END_FIELD    : Form_Request_Code renames F_End_Field;
   REQ_BEG_LINE     : Form_Request_Code renames F_Begin_Line;
   REQ_END_LINE     : Form_Request_Code renames F_End_Line;
   REQ_LEFT_CHAR    : Form_Request_Code renames F_Left_Char;
   REQ_RIGHT_CHAR   : Form_Request_Code renames F_Right_Char;
   REQ_UP_CHAR      : Form_Request_Code renames F_Up_Char;
   REQ_DOWN_CHAR    : Form_Request_Code renames F_Down_Char;

   REQ_NEW_LINE     : Form_Request_Code renames F_New_Line;
   REQ_INS_CHAR     : Form_Request_Code renames F_Insert_Char;
   REQ_INS_LINE     : Form_Request_Code renames F_Insert_Line;
   REQ_DEL_CHAR     : Form_Request_Code renames F_Delete_Char;
   REQ_DEL_PREV     : Form_Request_Code renames F_Delete_Previous;
   REQ_DEL_LINE     : Form_Request_Code renames F_Delete_Line;
   REQ_DEL_WORD     : Form_Request_Code renames F_Delete_Word;
   REQ_CLR_EOL      : Form_Request_Code renames F_Clear_EOL;
   REQ_CLR_EOF      : Form_Request_Code renames F_Clear_EOF;
   REQ_CLR_FIELD    : Form_Request_Code renames F_Clear_Field;
   REQ_OVL_MODE     : Form_Request_Code renames F_Overlay_Mode;
   REQ_INS_MODE     : Form_Request_Code renames F_Insert_Mode;

   REQ_SCR_FLINE    : Form_Request_Code renames F_ScrollForward_Line;
   REQ_SCR_BLINE    : Form_Request_Code renames F_ScrollBackward_Line;
   REQ_SCR_FPAGE    : Form_Request_Code renames F_ScrollForward_Page;
   REQ_SCR_BPAGE    : Form_Request_Code renames F_ScrollBackward_Page;
   REQ_SCR_FHPAGE   : Form_Request_Code renames F_ScrollForward_HalfPage;
   REQ_SCR_BHPAGE   : Form_Request_Code renames F_ScrollBackward_HalfPage;

   REQ_SCR_FCHAR    : Form_Request_Code renames F_HScrollForward_Char;
   REQ_SCR_BCHAR    : Form_Request_Code renames F_HScrollBackward_Char;
   REQ_SCR_HFLINE   : Form_Request_Code renames F_HScrollForward_Line;
   REQ_SCR_HBLINE   : Form_Request_Code renames F_HScrollBackward_Line;
   REQ_SCR_HFHALF   : Form_Request_Code renames F_HScrollForward_HalfLine;
   REQ_SCR_HBHALF   : Form_Request_Code renames F_HScrollBackward_HalfLine;

   REQ_VALIDATION   : Form_Request_Code renames F_Validate_Field;
   REQ_NEXT_CHOICE  : Form_Request_Code renames F_Next_Choice;
   REQ_PREV_CHOICE  : Form_Request_Code renames F_Previous_Choice;

   procedure Request_Name (Key  : in Form_Request_Code;
                           Name : out String);

   function  Request_Name (Key : Form_Request_Code) return String;
   --  Same as function
   pragma Inline (Request_Name);

   ------------------
   --  Exceptions  --
   ------------------
   Form_Exception : exception;

   --  |=====================================================================
   --  | Man page form_field_new.3x
   --  |=====================================================================

   --  |
   function Create (Height       : Line_Count;
                    Width        : Column_Count;
                    Top          : Line_Position;
                    Left         : Column_Position;
                    Off_Screen   : Natural := 0;
                    More_Buffers : Buffer_Number := Buffer_Number'First)
                    return Field;
   --  AKA: new_field()
   --  An overloaded Create is defined later. Pragma Inline appears there.

   --  |
   function New_Field (Height       : Line_Count;
                       Width        : Column_Count;
                       Top          : Line_Position;
                       Left         : Column_Position;
                       Off_Screen   : Natural := 0;
                       More_Buffers : Buffer_Number := Buffer_Number'First)
                       return Field renames Create;
   --  AKA: new_field()
   pragma Inline (New_Field);

   --  |
   procedure Delete (Fld : in out Field);
   --  AKA: free_field()
   --  Reset Fld to Null_Field
   --  An overloaded Delete is defined later. Pragma Inline appears there.

   --  |
   function Duplicate (Fld  : Field;
                       Top  : Line_Position;
                       Left : Column_Position) return Field;
   --  AKA: dup_field()
   pragma Inline (Duplicate);

   --  |
   function Link (Fld  : Field;
                  Top  : Line_Position;
                  Left : Column_Position) return Field;
   --  AKA: link_field()
   pragma Inline (Link);

   --  |=====================================================================
   --  | Man page form_field_just.3x
   --  |=====================================================================

   --  |
   procedure Set_Justification (Fld  : in Field;
                                Just : in Field_Justification := None);
   --  AKA: set_field_just()
   pragma Inline (Set_Justification);

   --  |
   function Get_Justification (Fld : Field) return Field_Justification;
   --  AKA: field_just()
   pragma Inline (Get_Justification);

   --  |=====================================================================
   --  | Man page form_field_buffer.3x
   --  |=====================================================================

   --  |
   procedure Set_Buffer
     (Fld    : in Field;
      Buffer : in Buffer_Number := Buffer_Number'First;
      Str    : in String);
   --  AKA: set_field_buffer()
   --  Not inlined

   --  |
   procedure Get_Buffer
     (Fld    : in Field;
      Buffer : in Buffer_Number := Buffer_Number'First;
      Str    : out String);
   --  AKA: field_buffer()

   function Get_Buffer
     (Fld    : in Field;
      Buffer : in Buffer_Number := Buffer_Number'First) return String;
   --  AKA: field_buffer()
   --  Same but as function
   pragma Inline (Get_Buffer);

   --  |
   procedure Set_Status (Fld    : in Field;
                         Status : in Boolean := True);
   --  AKA: set_field_status()
   pragma Inline (Set_Status);

   --  |
   function Changed (Fld : Field) return Boolean;
   --  AKA: field_status()
   pragma Inline (Changed);

   --  |
   procedure Set_Maximum_Size (Fld : in Field;
                               Max : in Natural := 0);
   --  AKA: set_field_max()
   pragma Inline (Set_Maximum_Size);

   --  |=====================================================================
   --  | Man page form_field_opts.3x
   --  |=====================================================================

   --  |
   procedure Set_Options (Fld     : in Field;
                          Options : in Field_Option_Set);
   --  AKA: set_field_opts()
   --  An overloaded version is defined later. Pragma Inline appears there

   --  |
   procedure Switch_Options (Fld     : in Field;
                             Options : in Field_Option_Set;
                             On      : Boolean := True);
   --  AKA: field_opts_on()
   --  AKA: field_opts_off()
   --  An overloaded version is defined later. Pragma Inline appears there

   --  |
   procedure Get_Options (Fld     : in  Field;
                          Options : out Field_Option_Set);
   --  AKA: field_opts()

   --  |
   function Get_Options (Fld : Field := Null_Field)
                         return Field_Option_Set;
   --  AKA: field_opts()
   --  An overloaded version is defined later. Pragma Inline appears there

   --  |=====================================================================
   --  | Man page form_field_attributes.3x
   --  |=====================================================================

   --  |
   procedure Set_Foreground
     (Fld   : in Field;
      Fore  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: set_field_fore()
   pragma Inline (Set_Foreground);

   --  |
   procedure Foreground (Fld  : in  Field;
                         Fore : out Character_Attribute_Set);
   --  AKA: field_fore()

   --  |
   procedure Foreground (Fld   : in  Field;
                         Fore  : out Character_Attribute_Set;
                         Color : out Color_Pair);
   --  AKA: field_fore()
   pragma Inline (Foreground);

   --  |
   procedure Set_Background
     (Fld   : in Field;
      Back  : in Character_Attribute_Set := Normal_Video;
      Color : in Color_Pair := Color_Pair'First);
   --  AKA: set_field_back()
   pragma Inline (Set_Background);

   --  |
   procedure Background (Fld  : in  Field;
                         Back : out Character_Attribute_Set);
   --  AKA: field_back()

   --  |
   procedure Background (Fld   : in  Field;
                         Back  : out Character_Attribute_Set;
                         Color : out Color_Pair);
   --  AKA: field_back()
   pragma Inline (Background);

   --  |
   procedure Set_Pad_Character (Fld : in Field;
                                Pad : in Character := Space);
   --  AKA: set_field_pad()
   pragma Inline (Set_Pad_Character);

   --  |
   procedure Pad_Character (Fld : in  Field;
                            Pad : out Character);
   --  AKA: field_pad()
   pragma Inline (Pad_Character);

   --  |=====================================================================
   --  | Man page form_field_info.3x
   --  |=====================================================================

   --  |
   procedure Info (Fld                : in  Field;
                   Lines              : out Line_Count;
                   Columns            : out Column_Count;
                   First_Row          : out Line_Position;
                   First_Column       : out Column_Position;
                   Off_Screen         : out Natural;
                   Additional_Buffers : out Buffer_Number);
   --  AKA: field_info()
   pragma Inline (Info);

   --  |
   procedure Dynamic_Info (Fld     : in Field;
                           Lines   : out Line_Count;
                           Columns : out Column_Count;
                           Max     : out Natural);
   --  AKA: dynamic_field_info()
   pragma Inline (Dynamic_Info);

   --  |=====================================================================
   --  | Man page form_win.3x
   --  |=====================================================================

   --  |
   procedure Set_Window (Frm : in Form;
                         Win : in Window);
   --  AKA: set_form_win()
   pragma Inline (Set_Window);

   --  |
   function Get_Window (Frm : Form) return Window;
   --  AKA: form_win()
   pragma Inline (Get_Window);

   --  |
   procedure Set_Sub_Window (Frm : in Form;
                             Win : in Window);
   --  AKA: set_form_sub()
   pragma Inline (Set_Sub_Window);

   --  |
   function Get_Sub_Window (Frm : Form) return Window;
   --  AKA: form_sub()
   pragma Inline (Get_Sub_Window);

   --  |
   procedure Scale (Frm     : in Form;
                    Lines   : out Line_Count;
                    Columns : out Column_Count);
   --  AKA: scale_form()
   pragma Inline (Scale);

   --  |=====================================================================
   --  | Man page form_hook.3x
   --  |=====================================================================

   type Form_Hook_Function is access procedure (Frm : in Form);
   pragma Convention (C, Form_Hook_Function);

   --  |
   procedure Set_Field_Init_Hook (Frm  : in Form;
                                  Proc : in Form_Hook_Function);
   --  AKA: set_field_init()
   pragma Inline (Set_Field_Init_Hook);

   --  |
   procedure Set_Field_Term_Hook (Frm  : in Form;
                                  Proc : in Form_Hook_Function);
   --  AKA: set_field_term()
   pragma Inline (Set_Field_Term_Hook);

   --  |
   procedure Set_Form_Init_Hook (Frm  : in Form;
                                 Proc : in Form_Hook_Function);
   --  AKA: set_form_init()
   pragma Inline (Set_Form_Init_Hook);

   --  |
   procedure Set_Form_Term_Hook (Frm  : in Form;
                                 Proc : in Form_Hook_Function);
   --  AKA: set_form_term()
   pragma Inline (Set_Form_Term_Hook);

   --  |
   function Get_Field_Init_Hook (Frm : Form) return Form_Hook_Function;
   --  AKA: field_init()
   pragma Import (C, Get_Field_Init_Hook, "field_init");

   --  |
   function Get_Field_Term_Hook (Frm : Form) return Form_Hook_Function;
   --  AKA: field_term()
   pragma Import (C, Get_Field_Term_Hook, "field_term");

   --  |
   function Get_Form_Init_Hook (Frm : Form) return Form_Hook_Function;
   --  AKA: form_init()
   pragma Import (C, Get_Form_Init_Hook, "form_init");

   --  |
   function Get_Form_Term_Hook (Frm : Form) return Form_Hook_Function;
   --  AKA: form_term()
   pragma Import (C, Get_Form_Term_Hook, "form_term");

   --  |=====================================================================
   --  | Man page form_field.3x
   --  |=====================================================================

   --  |
   procedure Redefine (Frm  : in Form;
                       Flds : in Field_Array_Access);
   --  AKA: set_form_fields()
   pragma Inline (Redefine);

   --  |
   procedure Set_Fields (Frm  : in Form;
                         Flds : in Field_Array_Access) renames Redefine;
   --  AKA: set_form_fields()
   --  pragma Inline (Set_Fields);

   --  |
   function Fields (Frm   : Form;
                    Index : Positive) return Field;
   --  AKA: form_fields()
   pragma Inline (Fields);

   --  |
   function Field_Count (Frm : Form) return Natural;
   --  AKA: field_count()
   pragma Inline (Field_Count);

   --  |
   procedure Move (Fld    : in Field;
                   Line   : in Line_Position;
                   Column : in Column_Position);
   --  AKA: move_field()
   pragma Inline (Move);

   --  |=====================================================================
   --  | Man page form_new.3x
   --  |=====================================================================

   --  |
   function Create (Fields : Field_Array_Access) return Form;
   --  AKA: new_form()
   pragma Inline (Create);

   --  |
   function New_Form (Fields : Field_Array_Access) return Form
     renames Create;
   --  AKA: new_form()
   --  pragma Inline (New_Form);

   --  |
   procedure Delete (Frm : in out Form);
   --  AKA: free_form()
   --  Reset Frm to Null_Form
   pragma Inline (Delete);

   --  |=====================================================================
   --  | Man page form_opts.3x
   --  |=====================================================================

   --  |
   procedure Set_Options (Frm     : in Form;
                          Options : in Form_Option_Set);
   --  AKA: set_form_opts()
   pragma Inline (Set_Options);

   --  |
   procedure Switch_Options (Frm     : in Form;
                             Options : in Form_Option_Set;
                             On      : Boolean := True);
   --  AKA: form_opts_on()
   --  AKA: form_opts_off()
   pragma Inline (Switch_Options);

   --  |
   procedure Get_Options (Frm     : in  Form;
                          Options : out Form_Option_Set);
   --  AKA: form_opts()

   --  |
   function Get_Options (Frm : Form := Null_Form) return Form_Option_Set;
   --  AKA: form_opts()
   pragma Inline (Get_Options);

   --  |=====================================================================
   --  | Man page form_post.3x
   --  |=====================================================================

   --  |
   procedure Post (Frm  : in Form;
                   Post : in Boolean := True);
   --  AKA: post_form()
   --  AKA: unpost_form()
   pragma Inline (Post);

   --  |=====================================================================
   --  | Man page form_cursor.3x
   --  |=====================================================================

   --  |
   procedure Position_Cursor (Frm : Form);
   --  AKA: pos_form_cursor()
   pragma Inline (Position_Cursor);

   --  |=====================================================================
   --  | Man page form_data.3x
   --  |=====================================================================

   --  |
   function Data_Ahead (Frm : Form) return Boolean;
   --  AKA: data_ahead()
   pragma Inline (Data_Ahead);

   --  |
   function Data_Behind (Frm : Form) return Boolean;
   --  AKA: data_behind()
   pragma Inline (Data_Behind);

   --  |=====================================================================
   --  | Man page form_driver.3x
   --  |=====================================================================

   type Driver_Result is (Form_Ok,
                          Request_Denied,
                          Unknown_Request,
                          Invalid_Field);

   --  |
   function Driver (Frm : Form;
                    Key : Key_Code) return Driver_Result;
   --  AKA: form_driver()
   --  Driver not inlined

   --  |=====================================================================
   --  | Man page form_page.3x
   --  |=====================================================================

   type Page_Number is new Natural;

   --  |
   procedure Set_Current (Frm : in Form;
                          Fld : in Field);
   --  AKA: set_current_field()
   pragma Inline (Set_Current);

   --  |
   function Current (Frm : in Form) return Field;
   --  AKA: current_field()
   pragma Inline (Current);

   --  |
   procedure Set_Page (Frm  : in Form;
                       Page : in Page_Number := Page_Number'First);
   --  AKA: set_form_page()
   pragma Inline (Set_Page);

   --  |
   function Page (Frm : Form) return Page_Number;
   --  AKA: form_page()
   pragma Inline (Page);

   --  |
   function Get_Index (Fld : Field) return Positive;
   --  AKA: field_index()
   --  Please note that in this binding we start the numbering of fields
   --  with 1. So this is number is one more than you get from the low
   --  level call.
   pragma Inline (Get_Index);

   --  |=====================================================================
   --  | Man page form_new_page.3x
   --  |=====================================================================

   --  |
   procedure Set_New_Page (Fld      : in Field;
                           New_Page : in Boolean := True);
   --  AKA: set_new_page()
   pragma Inline (Set_New_Page);

   --  |
   function Is_New_Page (Fld : Field) return Boolean;
   --  AKA: new_page()
   pragma Inline (Is_New_Page);

   --  |=====================================================================
   --  | Man page form_requestname.3x
   --  |=====================================================================
   --  Not Implemented: form_request_name, form_request_by_name

------------------------------------------------------------------------------
private
   type Field is new System.Storage_Elements.Integer_Address;
   type Form  is new System.Storage_Elements.Integer_Address;

   Null_Field : constant Field := 0;
   Null_Form  : constant Form  := 0;

end Terminal_Interface.Curses.Forms;
