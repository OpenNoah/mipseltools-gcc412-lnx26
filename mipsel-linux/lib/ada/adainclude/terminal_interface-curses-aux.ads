------------------------------------------------------------------------------
--                                                                          --
--                           GNAT ncurses Binding                           --
--                                                                          --
--                       Terminal_Interface.Curses.Aux                      --
--                                                                          --
--                                 S P E C                                  --
--                                                                          --
------------------------------------------------------------------------------
-- Copyright (c) 1998 Free Software Foundation, Inc.                        --
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
--  $Revision: 1.15 $
--  Binding Version 01.00
------------------------------------------------------------------------------
--  curses binding.
--  This module is generated. Please don't change it manually!
--  Run the generator instead.
--  |
with System;
with Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Unchecked_Conversion;

package Terminal_Interface.Curses.Aux is
   pragma Preelaborate (Terminal_Interface.Curses.Aux);

   use type Interfaces.C.int;

   subtype C_Int      is Interfaces.C.int;
   subtype C_Short    is Interfaces.C.short;
   subtype C_Long_Int is Interfaces.C.long;
   subtype C_Size_T   is Interfaces.C.size_t;
   subtype C_UInt     is Interfaces.C.unsigned;
   subtype C_ULong    is Interfaces.C.unsigned_long;
   subtype C_Char_Ptr is Interfaces.C.Strings.chars_ptr;
   type    C_Void_Ptr is new System.Address;
   type    C_Chtype   is new C_ULong;
   type    C_AttrType is new C_ULong;

   --  This is how those constants are defined in ncurses. I see them also
   --  exactly like this in all ETI implementations I ever tested. So it
   --  could be that this is quite general, but please check with your curses.
   --  This is critical, because curses sometime mixes boolean returns with
   --  returning an error status.
   Curses_Ok    : constant C_Int := 0;
   Curses_Err   : constant C_Int := -1;

   Curses_True  : constant C_Int := 1;
   Curses_False : constant C_Int := 0;

   --  Eti_Error: type for error codes returned by the menu and form subsystem
   subtype Eti_Error is C_Int range -14 .. 0;

   E_Ok               : constant Eti_Error := 0;
   E_System_Error     : constant Eti_Error := -1;
   E_Bad_Argument     : constant Eti_Error := -2;
   E_Posted           : constant Eti_Error := -3;
   E_Connected        : constant Eti_Error := -4;
   E_Bad_State        : constant Eti_Error := -5;
   E_No_Room          : constant Eti_Error := -6;
   E_Not_Posted       : constant Eti_Error := -7;
   E_Unknown_Command  : constant Eti_Error := -8;
   E_No_Match         : constant Eti_Error := -9;
   E_Not_Selectable   : constant Eti_Error := -10;
   E_Not_Connected    : constant Eti_Error := -11;
   E_Request_Denied   : constant Eti_Error := -12;
   E_Invalid_Field    : constant Eti_Error := -13;
   E_Current          : constant Eti_Error := -14;

   procedure Eti_Exception (Code : Eti_Error);
   --  Dispatch the error code and raise the appropriate exception
   --
   --
   --  Some helpers
   function Chtype_To_AttrChar is new
     Unchecked_Conversion (Source => C_Chtype,
                           Target => Attributed_Character);
   function AttrChar_To_Chtype is new
     Unchecked_Conversion (Source => Attributed_Character,
                           Target => C_Chtype);

   function AttrChar_To_AttrType is new
     Unchecked_Conversion (Source => Attributed_Character,
                           Target => C_AttrType);

   function AttrType_To_AttrChar is new
     Unchecked_Conversion (Source => C_AttrType,
                           Target => Attributed_Character);

   procedure Fill_String (Cp  : in  chars_ptr;
                          Str : out String);
   --  Fill the Str parameter with the string denoted by the chars_ptr
   --  C-Style string.

   function Fill_String (Cp : chars_ptr) return String;
   --  Same but as function.

end Terminal_Interface.Curses.Aux;
