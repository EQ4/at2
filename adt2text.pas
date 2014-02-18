unit AdT2text;
interface

const
{__AT2REV__}at2rev  = '051';
{__AT2VER__}at2ver  = '2.4.11';
{__AT2DAT__}at2date = '02-18-2014';
{__AT2LNK__}at2link = '10:37am';

const
  ascii_line_01 = '�-�������������������������������--��               ��-�';
  ascii_line_02 = '�             ~�~`�`�         ~�~`�`� ~���������~`�`�  ~������~`�`�    �';
  ascii_line_03 = '�             ~�~`�`�         ~�~`�`�     ~�~`�`�     ~�~`�`�    ~�~`�`�   �';
  ascii_line_04 = '�        ~�~`�`�  ~�~`�`�         ~�~`�`�     ~�~`�`�    ~�~`�`�      ~�~`�`�  �';
  ascii_line_05 = '�       ~�~`�`�   ~�~`�`�         ~�~`�`�     ~�~`�`�     ~�~`�`�     ~�~`�`�  �';
  ascii_line_06 = '       ~�~`�`�    ~�~`�`�   ~�������~`�`�     ~�~`�`�           ~��~`�`�   �';
  ascii_line_07 = '      ~�~`�`�  ~����~`�`�  ~�~`�`�    ~�~`�`�     ~�~`�`�          ~�~`�`�     �';
  ascii_line_08 = '     ~�~`�`�      ~�~`�`� ~�~`�`�     ~�~`�`�     ~�~`�`�        ~�~`�`�       �';
  ascii_line_09 = '    ~�~`�`�       ~�~`�`� ~�~`�`�     ~�~`�`�     ~�~`�`�      ~�~`�`�         �';
  ascii_line_10 = '�  ~�~`�`�        ~�~`�`� ~�~`�`�     ~�~`�`�     ~�~`�`�     ~�~`�`�     ~�~`�`�  �';
  ascii_line_11 = '�             ~�~`�`�  ~��������~`�`�     ~�~`�`�    ~����������~`�`�  �';
  ascii_line_12 = '�-�����������������--��    ��-�����������-���  ��-����-�';
  ascii_line_13 = '         .:: ~THE ULTiMATE FM-TRACKiNG TOOL~ ::.          ';
  ascii_line_14 = '�-�--�� ��-�����������������--��  ��-�����������������-�';
  ascii_line_15 = '� `code:`                               ~���       ��~     �';
  ascii_line_16 = '� ~subz3ro/Altair~                 ~/�DLiB�R/�CK3R �� SDL~ �';
  ascii_line_17 = '� `SDL portation support:`          ~�       �     ��~      ';
  ascii_line_18 = '� ~Dmitry Smagin~                             ~'+at2ver+'~      ';
  ascii_line_19 = '� `additional ideas:`                                    �';
  ascii_line_20 = '� ~Malfunction/Altair~                                   �';
  ascii_line_21 = '� `special thanks:`                                      �';
  ascii_line_22 = '� ~encore~                HOMEPAGE  www.adlibtracker.net �';
  ascii_line_23 = '� ~insane/Altair~         EMAiL     subz3ro@hotmail.com  �';
  ascii_line_24 = '�-����������--��    ��-�������������������������������-�';

procedure HELP(topic: String);
procedure C3WriteLn(posX,PosY: Byte; str: String; atr1,atr2,atr3: Byte);
procedure ShowStartMessage;

implementation

uses
    AdT2vscr,AdT2unit,AdT2keyb,
    StringIO,DialogIO,TxtScrIO;

const
  LINES = 891;
  help_data: array[1..LINES] of String[128] = (
    '@topic:general',
    '���������������������������',
    ' � `GENERAL KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~F1~                       Help',
    '~F2 (^S)~                  Save file',
    '~F3 (^L)~                  Load file',
    '~F4 (^A)~                  Toggle Nuke''m dialog',
    '~F5~                       Play',
    '~F6~                       Pause',
    '~F7~                       Stop',
    '~F8~                       Play song from current pattern or order',
    '~F9~                       Play current pattern or order only',
    '~[Ctrl] F8~                @F8 from current line � ',
    '~[Ctrl] F9~                @F9 from current line � (Pattern Editor window)',
    '~[Alt] F6~                 Single-play pattern   � (~Shift~ toggles trace)',
    '~[Alt] F5~                 @F5 �',
    '@input:alt_f8',
    '~[Alt] F9~                 @F9 �',
    '@input:shift_f5',
    '~[Shift] F6~               Toggle Debug mode from position at cursor',
    '@input:shift_f8',
    '@input:shift_f9',
    '~[Shift] Space~            Toggle MidiBoard mode ON/OFF',
    '~[Shift] +,-~              Skip to next/previous pattern while Tracing',
    '~+,-~                      Same as above; play pattern from start',
    '~^Enter~                   Play next pattern according to order',
    '~^Left  (Up)~              Rewind current pattern (with Trace)',
    '~^Right (Down)~            Fast-Forward (with Trace)',
    '~^E~                       Toggle Arpeggio/Vibrato Macro Editor window',
    '~^F~                       Toggle Song Variables window',
    '~^H~                       Toggle Replace window',
    '~^I~                       Toggle Instrument Control panel',
    '~^O~                       Toggle Octave Control panel',
    '~^P~                       Toggle Pattern List',
    '~^Q~                       Toggle Macro Editor window (quick access)',
    '~^R~                       Toggle Remap Instrument window',
    '~^T~                       Toggle Transpose window',
    '~^1..^8~                   Quick-set octave',
    '~[Ctrl][Alt] <hold down>~  Toggle Debug Info window (~Shift~ toggles details)',
    '~[Alt] +,-~                Adjust overall volume',
    '~[Alt] C~                  Copy object to clipboard (with selection)',
    '~[Alt] P~                  Paste object from clipboard',
    '~[Alt] M~                  Toggle marking lines ON/OFF',
    '~[Alt] L~                  Toggle Line Marking Setup window',
    '~[Alt] 1..9,0~             Toggle corresponding track ON/OFF',
    '~[Alt] S~                  Set all OFF except current track (solo)',
    '~[Alt] R~                  Reset flags on all tracks',
    '~Asterisk~                 Reverse ON/OFF on all tracks',
    '~F10~                      Toggle Quit Program dialog',
    '~[Shift] F11~              Toggle default (AdT2) behavior mode (optional)',
    '~F11~                      Toggle FastTracker behavior mode (optional)',
    '~F12~                      Toggle Scream Tracker behavior mode (optional)',
    '~[Alt]{Shift} F11~         Toggle ON recording to WAV file  ~(*)~',
    '~[Alt]{Shift} F12~         Toggle OFF recording to WAV file ~(*)~',
    '~(*)  [Shift]~             Toggle recording to WAV with Fade in / Fade out',
    '~[Ctrl][Tab] Up/Down~      Scroll Volume Analyzer section (if necessary)',
    '',
    '@topic:pattern_order',
    '����������������������������������������',
    ' � `PATTERN ORDER WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right~       Cursor navigation',
    '~PgUp,PgDn~                Move up/down 32 patterns',
    '~Home,End~                 Move to the top/end of pattern order',
    '~Tab,[Shift] Tab~          Move to next/previous entry',
    '~Insert~                   Insert entry',
    '~Delete~                   Delete entry',
    '~BackSpace~                Clear entry',
    '~^Space~                   Enter skip mark',
    '~^C~                       Copy entry to clipboard',
    '~^V~                       Paste entry from clipboard',
    '~+,-~                      Adjust entry',
    '~^F2~                      Save module in tiny format',
    '~Enter~                    Toggle Pattern Order and Pattern Editor',
    '',
    'ORDER ENTRiES: 0-7F',
    ' 80-FF = jump to pattern order 0-7F',
    '  syntax: order_number[hex](+80h); e.g. "9A" jumps to order 1A',
    '',
    '@topic:pattern_editor',
    '�����������������������������������������',
    ' � `PATTERN EDiTOR WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right~       Cursor navigation',
    '~PgUp,PgDn~                Move up/down 16 lines',
    '~Home,End~                 Move to the top/end of current pattern',
    '~Tab,[Shift] Tab~          Move to next/previous track',
    '~[Shift] PgDn,PgUp (+,-)~  Move to next/previous pattern',
    '~[Shift] Home,End~         Move fwd./bckw. to the first/last pattern',
    '~^Home,^End~               Move to the end/top of previous/next pattern',
    '~^PgUp,^PgDn~              Transpose note or block halftone up/down',
    '~Backspace~                Remove note or clear attributes',
    '~Insert~                   Insert new track-line',
    '~Delete~                   Delete track-line',
    '~[Shift] Insert~           Insert new pattern-line',
    '~[Shift] Delete~           Delete pattern-line',
    '~[Shift] Enter~            Toggle fixed and regular note',
    '~^K~                       Insert Key-Off',
    '~^C~                       Copy object at cursor to clipboard',
    '~^V~                       Paste object from clipboard',
    '~[Ctrl][Tab] V~            Multiple paste object from clipboard',
    '~{Ctrl} "[","]"~           Change current instrument',
    '~Space~                    Advance to next row',
    '~[Alt] F2~                 Save current pattern to file',
    '~^F2~                      Save module in tiny format',
    '~[Shift] F3~               Quick load recent pattern data',
    '~Enter~                    Toggle Pattern Order and Pattern Editor',
    '',
    'NOTE SYSTEM: C,C#,D,D#,E,F,F#,G,G#,A,A#,B(H)',
    'VALiD NOTE ENTRiES: C,C-,C#,C1,C-1,C#1...',
    '',
    '������������������������������������������������������������������Ŀ',
    '� BLOCK OPERATiONS iN PATTERN EDiTOR WiNDOW                        �',
    '������������������������������������������������������������������Ĵ',
    '� Starting to mark a block: ~[Shift] Up,Down,Left,Right~             �',
    '� When at least one row in one track is marked, you can continue   �',
    '� marking also with ~PgUp,PgDn,Home,End~ (~Shift~ is still held down!) �',
    '� Quick mark: ~[Alt] Q~ (1x-2x-3x) track � pattern � discard       �',
    '� Toggle last marked block: ~[Alt] B~                                �',
    '������������������������������������������������������������������Ĵ',
    '� ~^B~ � Blank block  � Insert blank block to pattern                �',
    '� ~^C~ � Copy block   � Copy block to clipboard                      �',
    '� ~^D~ � Delete block � Remove block from pattern                    �',
    '� ~^M~ � Mix block    � Paste block from clipboard to pattern        �',
    '�    �              � leaving edited fields intact                 �',
    '� ~^N~ � Nuke block   � Clear block contents                         �',
    '� ~^V~ � Paste block  � Paste block from clipbaord to pattern        �',
    '� ~^X~ � Cut block    � Combine both Copy and Delete operation       �',
    '������������������������������������������������������������������Ĵ',
    '� If "Paste" block operation is combined with pressing ~Shift~ key   �',
    '� first, you can paste a fraction of block in clipboard that is    �',
    '� corresponding to current cursor position (i.e. note, instrument, �',
    '� 1st effect or 2nd effect).                                       �',
    '��������������������������������������������������������������������',
    '',
    '@topic:pattern_list',
    '��������������������������������',
    ' � `PATTERN LiST KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down~                  Cursor navigation',
    '~PgUp,PgDn~                Move up/down 20 patterns',
    '~Home,End~                 Move to the top/end of pattern list',
    '~Space~                    Mark/Unmark pattern',
    '~^Space~                   Unmark all marked patterns',
    '~[Shift] ^Space~           Reverse marks on all patterns',
    '~[Alt] C (^C)~             Copy pattern to clipboard',
    '~[Alt] P (^V)~             Paste pattern from clipboard',
    '~[LShift] ^V~              Paste pattern data from clipboard',
    '~[RShift] ^V~              Paste pattern name from clipboard',
    '~^W~                       Swap marked patterns',
    '~[LShift] ^W~              Swap marked pattern data',
    '~[RShift] ^W~              Swap marked pattern names',
    '~[Shift] Insert~           Insert new pattern',
    '~[Shift] Delete~           Delete pattern',
    '~Enter~                    Rename pattern / Multiple paste',
    '~[Shift] F3~               Quick load recent pattern data',
    '~Esc~                      Return to Pattern Editor or Pattern Order',
    '',
    '@topic:instrument_control',
    '��������������������������������������������',
    ' � `iNSTRUMENT CONTROL PANEL KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down~                  Cursor navigation',
    '~PgUp,PgDn~                Move up/down 16 instruments',
    '~Home,End~                 Move to the top/end of instrument list',
    '~Space~                    Mark/Unmark instrument',
    '~MBoard keys <hold down>~  Preview instrument',
    '~Enter~                    Rename instrument',
    '~^C~                       Copy instrument to clipboard',
    '~[Shift] ^C~               Copy instrument also with macro-definitions',
    '~^V~                       Paste instrument(s) from clipboard',
    '~[LShift] ^V~              Paste instrument data from clipboard',
    '~[RShift] ^V~              Paste instrument name(s) from clipboard',
    '~^W~                       Swap marked instruments',
    '~[LShift] ^W~              Swap marked instrument data',
    '~[RShift] ^W~              Swap marked instrument names',
    '~Tab~                      Toggle Instrument Editor window',
    '~[Shift] Tab~              Toggle Macro Editor window',
    '~[Shift] M,B,S,T,C,H~      Toggle ~m~elodic and percussion (~B~D,~S~D,~T~T,T~C~,~H~H)',
    '~[Shift] F2~               Save instrument w/ fm-register macro to file',
    '~[Alt] F2~                 Save instrument bank to file',
    '~^F2~                      Save instrument bank w/ all macros to file',
    '~[Shift] F3~               Quick load recent instrument data',
    '~Esc~                      Return to Pattern Editor or Pattern Order',
    '',
    '@topic:instrument_editor',
    '��������������������������������������������',
    ' � `iNSTRUMENT EDiTOR WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right,~',
    '~Home,End~                 Cursor navigation',
    '~Tab~                      Jump to next setting',
    '~[Shift] Tab~              Jump to previous setting',
    '~PgUp,PgDn (+,-)~          Adjust value',
    '~Space~                    Select item',
    '~[Ctrl] "[","]"~           Change current instrument',
    '~MBoard keys <hold down>~  Preview instrument',
    '~Enter~                    Toggle carrier and modulator slot settings',
    '~[Ctrl] LShift/RShift~     Toggle ADSR preview OFF/ON',
    '~[Shift] M,B,S,T,C,H~      Toggle ~m~elodic and percussion (~B~D,~S~D,~T~T,T~C~,~H~H)',
    '~[Shift] F2~               Save instrument w/ fm-register macro to file',
    '~Esc~                      Return to Instrument Control panel',
    '',
    '@topic:macro_editor',
    '���������������������������������������',
    ' � `MACRO EDiTOR WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right~',
    '~Home,End~                 Cursor navigation',
    '~PgUp,PgDown~              Move up/down 16 lines',
    '~Tab (Enter)~              Jump to next field in order',
    '~[Shift] Tab~              Jump to previous field in order',
    '~[Shift] Up,Down~          Synchronous navigation within tables',
    '~[Shift] Home,End~         Move to the start/end of current line in table',
    '~^Left,^Right~             Move around tables',
    '~^PgUp,^PgDown~            Change within arpeggio/vibrato table',
    '~[Ctrl] "[","]"~           Change current instrument',
    '~^C~                       Copy line in table (whole table respectively)',
    '~[Shift] ^C~               Copy column in table',
    '~^V~                       Paste object from clipboard',
    '~^Enter~                   Paste data from instrument registers',
    '~[Shift] Enter~            Paste data to instrument registers',
    '~[Shift] ^Enter~           Paste data from instrument registers w/ selection',
    '~Backspace~                Clear current item in table',
    '~[Shift] Backspace~        Clear line in table',
    '~[Shift] +,-~              Adjust value at cursor / current item in table',
    '~^Home,^End~               Quick-adjust table length',
    '~[Shift] ^Home,^End~       Quick-adjust loop begin position',
    '~[Shift] ^PgUp,^PgDown~    Quick-adjust loop length',
    '~Insert~                   Insert new line in table',
    '~Delete~                   Delete line in table',
    '~^N~                       Toggle note retrigger ON/OFF       �',
    '~[Alt] ^N~                 Reset flags on all rows            �',
    '~^Backspace~               Toggle corresponding column ON/OFF � FM-register',
    '~[Alt] S~                  Set all OFF except current column  � table',
    '~[Alt] R~                  Reset flags on all columns         �',
    '~Asterisk~                 Reverse ON/OFF on all columns      �',
    '~\~                        Toggle current item (switch types only)',
    '~Space~                    Toggle macro-preview mode',
    '~^Space~                   Toggle Key-Off loop within macro-preview mode',
    '~^F2~                      Save instrument bank w/ all macros to file',
    '~^F3~                      Load arpeggio/vibrato macro table data from file',
    '~Esc~                      Return to Instrument Control panel',
    '',
    '@topic:macro_editor_(av)',
    '����������������������������������������������������������',
    ' � `MACRO EDiTOR (APREGGiO/ViBRATO) WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right~',
    '~Home,End~                 Cursor navigation',
    '~PgUp,PgDown~              Move up/down 16 lines',
    '~Tab (Enter)~              Jump to next field in order',
    '~[Shift] Tab~              Jump to previous field in order',
    '~[Shift] Up,Down~          Synchronous navigation within tables',
    '~^Left,^Right~             Move around tables',
    '~^PgUp,^PgDown~            Change within arpeggio/vibrato table',
    '~[Ctrl] "[","]"~           Change current instrument',
    '~^C~                       Copy line in table (whole table respectively)',
    '~[Shift] ^C~               Copy column in table',
    '~^V~                       Paste object from clipboard',
    '~Backspace~                Clear current item in table',
    '~[Shift] Backspace~        Clear line in table',
    '~[Shift] +,-~              Adjust value at cursor / current item in table',
    '~^Home,^End~               Quick-adjust table length',
    '~[Shift] ^Home,^End~       Quick-adjust loop begin position',
    '~[Shift] ^PgUp,^PgDown~    Quick-adjust loop length',
    '~Space~                    Toggle macro-preview mode',
    '~^Space~                   Toggle Key-Off loop within macro-preview mode',
    '~Esc~                      Leave this window and return to previous one',
    '',
    '@topic:remap_dialog',
    '�������������������������������������������',
    ' � `REMAP iNSTRUMENT WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right,~',
    '~Home,End~                 Cursor navigation',
    '~PgUp,PgDown~              Move up/down 16 instruments',
    '~Tab~                      Jump to next selection',
    '~[Shift] Tab~              Jump to previous selection',
    '~MBoard keys <hold down>~  Preview instrument',
    '~Enter~                    Remap',
    '~Esc~                      Return to Pattern Editor or Pattern Order',
    '',
    '@topic:replace_dialog',
    '����������������������������������',
    ' � `REPLACE WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right,~',
    '~Home,End~                 Cursor navigation',
    '~Tab~                      Jump to next selection',
    '~[Shift] Tab~              Jump to previous selection',
    '~^K~                       Insert Key-Off in note column',
    '~^N~                       Mark "new" field to clear found item',
    '~Delete,Backspace~         Delete current/previous character',
    '~^Backspace~               Delete whole "to find" or "replace" mask',
    '~Space~                    Toggle prompt on replace',
    '~Enter~                    Replace',
    '~Esc~                      Return to Pattern Editor or Pattern Order',
    '',
    '@topic:song_variables',
    '�����������������������������������������',
    ' � `SONG VARiABLES WiNDOW KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '~Up,Down,Left,Right~       Cursor navigation',
    '~Tab (Enter)~              Jump to next variable field',
    '~[Shift] Tab~              Jump to previous variable field',
    '~Space~                    Select item',
    '~Esc~                      Return to Pattern Editor or Pattern Order',
    '',
    '@topic:input_field',
    '�������������������������������',
    ' � `iNPUT FiELD KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '',
    '~Left,Right~               Move left/right',
    '~Home,End~                 Move to the begin/end',
    '~^Left,^Right~             Move word left/right',
    '~Backspace,Delete~         Delete character left/right',
    '~^Backspace,^T~            Delete word left/right',
    '~^Y~                       Delete string',
    '~Insert~                   Toggle input and overwrite mode',
    '',
    '@topic:midiboard',
    '�����������������������������',
    ' � `MiDiBOARD KEY REFERENCE` �',
    '��������������������������������������������������������������������������',
    '',
    '     C#  D#      F#  G#  A#      C#  D#      F#  G#  A#      C#  D#',
    '',
    '  ���  ��  ������  ��  ��  ������  ��  ������  ��  ��  ������  ��  ���',
    '  ���  ��  ������  ��  ��  ������  ��  ������  ��  ��  ������  ��  ���',
    '  ��� ~S~�� ~D~������ ~G~�� ~H~�� ~J~������ ~2~�� ~3~������ ~5~�� ~6~�� ~7~������ ~9~�� ~0~���',
    '  ���  ��  ������  ��  ��  ������  ��  ������  ��  ��  ������  ��  ���',
    '  ���  ��  ������  ��  ��  ������  ��  ������  ��  ��  ������  ��  ���',
    '  ��������������������������������������������������������������������',
    '  ��������������������������������������������������������������������',
    '  ��~Z~���~X~���~C~���~V~���~B~���~N~���~M~���~Q~���~W~���~E~���~R~���~T~���~Y~���~U~���~I~���~O~���~P~�',
    '  ��������������������������������������������������������������������',
    '  ��������������������������������������������������������������������',
    '',
    '    C   D   E   F   G   A   B   C   D   E   F   G   A   B   C   D   E',
    '',
    '�����������������������������������������������������������������������Ŀ',
    '� WHiLE TRACKER iS iN MBOARD MODE                                       �',
    '�����������������������������������������������������������������������Ĵ',
    '� ~MBoard key~ copies note in note field, plays it, and advances song     �',
    '� to next row. If used with ~Left-Shift~ key and line marking toggled ON, �',
    '� it advances song to next highlighted row.                             �',
    '� If used with ~Right-Shift~ key, it makes a fixed note.                  �',
    '� ~Space~ plays row and advances song by one row.                         �',
    '@@`� ~`~ inserts Key-Off, releases playing note and advances to next row.    �',
    '�������������������������������������������������������������������������',
    '',
    '@topic:instrument_registers',
    '��������������������������',
    ' � `iNSTRUMENT REGiSTERS` �',
    '��������������������������������������������������������������������������',
    '~Attack rate~',
    'Indicates how fast the sound volume goes to maximum.',
    '1=slow, 15=fast. 0 means no attack phase.',
    '',
    '~Decay rate~',
    'Indicates how fast the sound goes from maximum level to sustain level.',
    '1=slow, 15=fast. 0 means no decay phase.',
    '',
    '~Sustain level~',
    'Indicates the sustain level.',
    '1=loudest, 15=softest. 0 means no sustain phase.',
    '',
    '~Release rate~',
    'Indicates how fast the sound goes from sustain level to zero level.',
    '1=slow, 15=fast. 0 means no release phase.',
    '',
    '~Output level~',
    'Ranges from 0 to 63, indicates the attenuation according to the',
    'envelope generator output. In Additive synthesis, varying',
    'the output level of any operator varies the volume of its corresponding',
    'channel. In FM synthesis, varying the output level of carrier varies',
    'the volume of its corresponding channel, but varying the output of',
    'the modulator will change the frequency spectrum produced by the carrier.',
    '',
    '~Waveform select~',
    'Specifies the output waveform type.',
    'The first is closest to pure sine wave, the last is most distorted.',
    '',
    '`[0] SiNE`',
    '',
    '     ',
    '     �',
    '     �     __                      __',
    '     �   /    \                  /    \',
    '     � /        \              /        \',
    '    �����������������������������������������������������',
    '     �             \        /              \        /',
    '     �               \    /                  \    /',
    '     �                                       ',
    '     �          /2                    3/2         2',
    '',
    '',
    '`[1] HALF-SiNE`',
    '',
    '     ',
    '     �',
    '     �     __                      __',
    '     �   /    \                  /    \',
    '     � /        \              /        \',
    '    �����������������������������������������������������',
    '     �',
    '     �          /2                    3/2         2',
    '     �',
    '     �',
    '',
    '',
    '`[2] ABS-SiNE`',
    '',
    '     ',
    '     �',
    '     �     __         __           __         __',
    '     �   /    \     /    \       /    \     /    \',
    '     � /        \ /        \   /        \ /        \',
    '    �����������������������������������������������������',
    '     �',
    '     �          /2                     3/2        2',
    '     �',
    '     �',
    '',
    '',
    '`[3] PULSE-SiNE`',
    '',
    '     ',
    '     �',
    '     �    _           _           _           _',
    '     �  /  |        /  |        /  |        /  |',
    '     �/    |      /    |      /    |      /    |',
    '    �����������������������������������������������������',
    '     �',
    '     �    /4   /2   3/4       5/4  3/2  7/4   2',
    '     �',
    '     �',
    '',
    '',
    '`[4] SiNE, EVEN PERiODS ONLY (EPO)`',
    '',
    '     ',
    '     �',
    '     �',
    '     � /\                     /\',
    '     �/   \                   /   \',
    '    �����������������������������������������������������',
    '     �      \   /                   \   /',
    '     �       \_/                     \_/',
    '     �',
    '     �    /4   /2   3/4       5/4  3/2  7/4   2',
    '',
    '',
    '`[5] ABS-SiNE, EVEN PERiODS ONLY (EPO)`',
    '',
    '     ',
    '     �',
    '     �',
    '     � /\   /\               /\   /\',
    '     �/   \ /   \             /   \ /   \',
    '    �����������������������������������������������������',
    '     �',
    '     �    /4   /2   3/4       5/4  3/2  7/4   2',
    '     �',
    '     �',
    '',
    '',
    '`[6] SQUARE`',
    '',
    '     ',
    '     �',
    '     �',
    '     �-----------�           �-----------�',
    '     |           |           |           |',
    '    �����������������������������������������������������',
    '     �           |           |           |           |',
    '     �           �-----------�           �-----------�',
    '     �',
    '     �          /2                    3/2         2',
    '',
    '',
    '`[7] DERiVED SQUARE`',
    '',
    '     ',
    '     �',
    '     |\                      |\',
    '     | __                  | __',
    '     |     ��__            |     ��__',
    '    �����������������������������������������������������',
    '     �            ��__     |            ��__     |',
    '     �                  __ |                  __ |',
    '     �                      \|                      \|',
    '     �          /2                    3/2         2',
    '',
    '',
    '~Key scaling level (KSL)~',
    'When set, makes the sound softer at higher frequencies.',
    'With musical instruments, volume decreases as pitch increases.',
    'Level key scaling values are used to simulate this effect.',
    'If any (not zero), the diminishing factor can be 1.5 dB/octave,',
    '3.0 dB/octave, or 6.0 dB/octave.',
    '',
    '~Panning~',
    'Gives you ability of controlling output, going to left or right channel,',
    'standing in the middle respectively.',
    'The parameter corresponds either with carrier and modulator, therefore',
    'it is listed only once (within the carrier slot).',
    '',
    '~Fine-tune~',
    'This is not a hardware parameter.',
    'Ranges from -127 to 127, it indicates the number of frequency units',
    'shifted up or down for any note playing with the corresponding instrument.',
    'The parameter corresponds either with carrier and modulator, therefore',
    'it is listed only once (within the carrier slot).',
    '',
    '~Feedback strength~',
    'Ranges from 0 to 7, it indicates the modulation depth',
    'for the modulator slot FM feedback.',
    '',
    '������������������������������������������������������������Ŀ',
    '� Feedback   �  0  �  1  �  2  �  3  �  4  �  5  �  6  �  7  �',
    '������������������������������������������������������������Ĵ',
    '� Modulation �  0  �/16 � /8 � /4 � /2 �    � 2  � 4  �',
    '��������������������������������������������������������������',
    '',
    'The parameter corresponds either with carrier and modulator, therefore',
    'it is listed only once (within the carrier slot).',
    '',
    '~Connection type~',
    'Frequency modulation means that the modulator slot modulates the carrier.',
    'Additive synthesis means that both slots produce sound on their own.',
    '',
    '`[FREQUENCY MODULATiON]`',
    '`[FM]`',
    '',
    '        ������������Ŀ',
    '        �            �',
    '            ����ͻ  �         ����ͻ',
    ' P1 ��(+)��� MO ������(+)��� CA ��� OUT',
    '             ����ͼ           ����ͼ',
    '                          �',
    '',
    '                          P2',
    '',
    '`[ADDiTiVE SYNTHESiS]`',
    '`[AM]`',
    '',
    '        ������������Ŀ',
    '        �            �',
    '            ����ͻ  �',
    ' P1 ��(+)��� MO �������Ŀ',
    '             ����ͼ       �',
    '                          ',
    '                         (+)�� OUT',
    '                          ',
    '             ����ͻ       �',
    ' P2 ��������� CA ���������',
    '             ����ͼ',
    '',
    'The parameter corresponds either with carrier and modulator, therefore',
    'it is listed only once (within the carrier slot).',
    'This parameter is also very important when making 4-op instruments,',
    'because the combination of two instrument connections specifies',
    'the connection of the 4-op instrument as shown below:',
    '',
    '`[FM/FM]`',
    '',
    '        ������������Ŀ',
    '        �            �',
    '            ����ͻ  �         ����ͻ         ����ͻ         ����ͻ',
    ' P1 ��(+)��� M1 ������(+)��� C1 ���(+)��� M2 ���(+)��� C2 ��� OUT',
    '             ����ͼ           ����ͼ        ����ͼ        ����ͼ',
    '                          �              �              �',
    '',
    '                          P2             P3             P4',
    '',
    '`[FM/AM]`',
    '',
    '        ������������Ŀ',
    '        �            �',
    '            ����ͻ  �         ����ͻ',
    ' P1 ��(+)��� M1 ������(+)��� C1 ����Ŀ',
    '             ����ͼ           ����ͼ    �',
    '                          �              �',
    '                                         ',
    '                          P2            (+)�� OUT',
    '                                         ',
    '                                         �',
    '             ����ͻ            ����ͻ    �',
    ' P3 ��������� M2 ������(+)��� C2 ������',
    '             ����ͼ           ����ͼ',
    '                          �',
    '',
    '                          P4',
    '',
    '`[AM/FM]`',
    '',
    '        ������������Ŀ',
    '        �            �',
    '            ����ͻ  �',
    ' P1 ��(+)��� M1 �������������������������������������Ŀ',
    '             ����ͼ                                     �',
    '                                                        �',
    '                                                        �',
    '                                                        �',
    '             ����ͻ            ����ͻ         ����ͻ    ',
    ' P2 ��������� C1 ������(+)��� M2 ���(+)��� C2 ���(+)�� OUT',
    '             ����ͼ           ����ͼ        ����ͼ',
    '                          �              �',
    '',
    '                          P3             P4',
    '',
    '`[AM/AM]`',
    '',
    '        ������������Ŀ',
    '        �            �',
    '            ����ͻ  �',
    ' P1 ��(+)��� M1 ����������������������Ŀ',
    '             ����ͼ                      �',
    '                                         �',
    '                                         �',
    '                                         �',
    '             ����ͻ            ����ͻ    ',
    ' P2 ��������ĺ C1 ������(+)��� M2 ���(+)�� OUT',
    '             ����ͼ           ����ͼ    ',
    '                          �              �',
    '                                         �',
    '                          P3             �',
    '             ����ͻ                      �',
    ' P4 ��������� C2 ������������������������',
    '             ����ͼ',
    '',
    '~Tremolo (Amplitude modulation)~',
    'When set, turns tremolo (volume vibrato) ON for the corresponding slot.',
    'The repetition rate is 3.7, the depth is optional (1dB/4.8dB).',
    '',
    '~Vibrato~',
    'When set, turns frequency vibrato ON for the corresponding slot.',
    'The repetition rate is 6.1, the depth is optional (7%/14%).',
    '',
    '~Key scale rate (KSR)~',
    'When set, makes the sound shorter at higher frequencies.',
    'With normal musical instruments, the attack and decay rate becomes faster',
    'as the pitch increases. The key scale rate controls simulation of',
    'this effect. An offset (rof) is added to the individual attack, decay,',
    'and release rates depending on the following formula:',
    '',
    'actual_rate = (rate  4) + rof',
    '',
    'The "rof" values for corresponding "rate" value and KSR state are shown',
    'in the following table:',
    '',
    '������������������������������������������������������������������������Ŀ',
    '� %rate% � 0 � 1 � 2 � 3 � 4 � 5 � 6 � 7 � 8 � 9 � A � B � C � D � E � F �',
    '������������������������������������������������������������������������͵',
    '� OFF    � 0 � 0 � 0 � 0 � 1 � 1 � 1 � 1 � 2 � 2 � 2 � 2 � 3 � 3 � 3 � 3 �',
    '������������������������������������������������������������������������Ĵ',
    '� ON     � 0 � 1 � 2 � 3 � 4 � 5 � 6 � 7 � 8 � 9 � A � B � C � D � E � F �',
    '��������������������������������������������������������������������������',
    '',
    '~Sustain (Envelope generator type)~',
    'When set, the sustain level of the voice is maintained until released.',
    'When clear, the sound begins to decay immediately after hitting',
    'the sustain phase.',
    '',
    '`[OFF]`                /\  DR',
    '                   /    \',
    '                 /     ...\...SL',
    '           AR  /            \',
    '             /                \  RR',
    '           /                    \',
    '      _ _/                        \_ _ _',
    '         .',
    '         :',
    '         �����������������������������������������',
    '      ����     KEY ON',
    '',
    '',
    '`[ON]`                 /\  DR',
    '                   /    \      SL',
    '                 /        \ _ _ _ _ _',
    '           AR  /                      \',
    '             /                       :  \  RR',
    '           /                         :    \',
    '      _ _/                           :      \_ _ _',
    '         .                           :',
    '         :                           :',
    '         ���������������������������Ŀ  KEY OFF',
    '      ����     KEY ON                �������������',
    '',
    '',
    '~Frequency data multiplier~',
    'Sets the multiplier for the frequency data specified by block and',
    'F-number. This multiplier is applied to the FM carrier or modulation',
    'frequencies. The multiplication factor and corresonding harmonic types are',
    'shown in the following table:',
    '',
    '��������������������������������������������������Ŀ',
    '� Mult. �    � Harmonic                           �',
    '��������������������������������������������������͵',
    '�   0   � 0.5 � 1 octave below                     �',
    '�   1   �  1  � at the voice''s specified frequency �',
    '�   2   �  2  � 1 octave above                     �',
    '�   3   �  3  � 1 octave and a 5th above           �',
    '�   4   �  4  � 2 octaves above                    �',
    '�   5   �  5  � 2 octaves and a Major 3rd above    �',
    '�   6   �  6  � 2 octaves and a 5th above          �',
    '�   7   �  7  � 2 octaves and a Minor 7th above    �',
    '�   8   �  8  � 3 octaves above                    �',
    '�   9   �  9  � 3 octaves and a Major 2nd above    �',
    '�   A   � 10  � 3 octaves and a Major 3rd above    �',
    '�   B   � 11  � " "       "   " "     "   "        �',
    '�   C   � 12  � 3 octaves and a 5th above          �',
    '�   D   � 13  � " "       "   "     "              �',
    '�   E   � 14  � 3 octaves and a Major 7th above    �',
    '�   F   � 15  � " "       "   " "     "   "        �',
    '����������������������������������������������������',
    '',
    '@topic:effects',
    '�����������������������',
    ' � `SUPPORTED EFFECTS` �',
    '��������������������������������������������������������������������������',
    '0xy �� ARPEGGiO                   xy=1st_�tone|2nd_�tone  [1-F]',
    '1xx �� FREQUENCY SLiDE UP         xx=speed_of_slide       [1-FF]',
    '2xx �� FREQUENCY SLiDE DOWN       xx=speed_of_slide       [1-FF]',
    '3xx �� TONE PORTAMENTO            xx=speed_of_slide       [1-FF] ~C~',
    '4xy �� ViBRATO                    xy=speed|depth          [1-F]  ~C~',
    '5xy �� ~3xx~ & VOLUME SLiDE         xy=up_speed|down_speed  [1-F]  ~C~',
    '6xy �� ~4xy~ & VOLUME SLiDE         xy=up_speed|down_speed  [1-F]  ~C~',
    '7xx �� FiNE FREQUENCY SLiDE UP    xx=speed_of_slide       [1-FF]',
    '8xx �� FiNE FREQUENCY SLiDE DOWN  xx=speed_of_slide       [1-FF]',
    '9xx �� SET MODULATOR VOLUME       xx=volume_level         [0-3F]',
    'Axy �� VOLUME SLiDE               xy=up_speed|down_speed  [1-F]',
    'Bxx �� POSiTiON JUMP              xx=position_in_order    [0-7F]',
    'Cxx �� SET iNSTRUMENT VOLUME      xx=volume_level         [0-3F]',
    'Dxx �� PATTERN BREAK              xx=line_in_next_pattern [0-FF]',
    'Exx �� SET TEMPO                  xx=bpm_in_             [1-FF]',
    'Fxx �� SET SPEED                  xx=frames_per_row       [1-FF]',
    'Gxy �� ~3xx~ & FiNE VOLUME SLiDE    xy=up_speed|down_speed  [1-F]  ~C~',
    'Hxy �� ~4xy~ & FiNE VOLUME SLiDE    xy=up_speed|down_speed  [1-F]  ~C~',
    'Ixx �� SET CARRiER VOLUME         xx=volume_level         [0-3F]',
    'Jxy �� SET WAVEFORM               xy=carrier|modulator    [0-7,F=NiL]',
    'Kxy �� FiNE VOLUME SLiDE          xy=up_speed|down_speed  [1-F]',
    'Lxx �� RETRiG NOTE                xx=interval             [1-FF]',
    'Mxy �� TREMOLO                    xy=speed|depth          [1-F]  ~C~',
    'Nxy �� TREMOR                     xy=on_time|off_time     [1-F]',
    'Oxy �� ~0xy~ & VOLUME SLiDE         xy=up_speed|down_speed  [1-F]  ~C~',
    'Pxy �� ~0xy~ & FiNE VOLUME SLiDE    xy=up_speed|down_speed  [1-F]  ~C~',
    'Qxy �� MULTi RETRiG NOTE          xy=interval|vol_change  [1-F]',
    '',
    'Qx?  0 = None         8 = Unused',
    '     1 = -1           9 = +1',
    '     2 = -2           A = +2',
    '     3 = -4           B = +4',
    '     4 = -8           C = +8',
    '     5 = -16          D = +16',
    '     6 = 2/3         E = 3/2',
    '     7 = 1/2         F = 2',
    '',
    'Rxy �� ~1xx~ �                   �',
    'Sxy �� ~2xx~ � &                 �',
    'Txy �� ~7xx~ � VOLUME SLiDE      �',
    'Uxy �� ~8xx~ �                   �',
    'Vxy �� ~1xx~ �                   �  xy=up_speed|down_speed  [1-F]  ~C~',
    'Wxy �� ~2xx~ � &                 �',
    'Xxy �� ~7xx~ � FiNE VOLUME SLiDE �',
    'Yxy �� ~8xx~ �                   �',
    '',
    'Z?? 0x SET TREMOLO DEPTH          x=1dB/4.8dB             [0-1]',
    '    1x SET ViBRATO DEPTH          x=7%/14%                [0-1]',
    '    2x SET ATTACK RATE   �        x=attack_rate           [0-F]',
    '    3x SET DECAY RATE    � MOD.   x=decay_rate            [0-F]',
    '    4x SET SUSTAiN LEVEL �        x=sustain_level         [0-F]',
    '    5x SET RELEASE RATE  �        x=release_rate          [0-F]',
    '    6x SET ATTACK RATE   �        x=attack_rate           [0-F]',
    '    7x SET DECAY RATE    � CAR.   x=decay_rate            [0-F]',
    '    8x SET SUSTAiN LEVEL �        x=sustain_level         [0-F]',
    '    9x SET RELEASE RATE  �        x=release_rate          [0-F]',
    '    Ax SET FEEDBACK STRENGTH      x=feedback_strength     [0-7]',
    '    Bx SET PANNiNG POSiTiON       x=panning_position      [0-2]',
    '    Cx PATTERN LOOP               x=parameter             [0-F]',
    '    Dx RECURSiVE PATTERN LOOP     x=parameter             [0-F]',
    '    Ex MACRO KEY-OFF LOOP         x=off/on                [0-1]',
    '',
    'ZB?  0 = Center',
    '     1 = Left',
    '     2 = Right',
    'ZC?',
    'ZD?  0 = Set loopback point',
    '     x = Loop ~x~ times',
    '',
    'ZF?  0 RELEASE SUSTAiNiNG SOUND',
    '     1 RESET iNSTRUMENT VOLUME',
    '     2 LOCK TRACK VOLUME',
    '     3 UNLOCK TRACK VOLUME ',
    '     4 LOCK VOLUME PEAK',
    '     5 UNLOCK VOLUME PEAK',
    '     6 TOGGLE MODULATOR VOLUME SLiDES',
    '     7 TOGGLE CARRiER VOLUME SLiDES',
    '     8 TOGGLE DEFAULT VOLUME SLiDES',
    '     9 LOCK TRACK PANNiNG',
    '     A UNLOCK TRACK PANNiNG',
    '     B ViBRATO OFF',
    '     C TREMOLO OFF',
    '     D FORCE FiNE ViBRATO',
    '     E FORCE FiNE TREMOLO',
    '     F FORCE NO RESTART FOR MACRO TABLES',
    '',
    '!xx �� SWAP ARPEGGiO TABLE        xx=table_number         [0-FF]',
    '@xx �� SWAP ViBRATO TABLE         xx=table_number         [0-FF]',
    '=xx �� FORCE iNSTRUMENT VOLUME    xx=volume_level         [0-3F]',
    '%xx �� SET GLOBAL VOLUME          xx=volume_level         [0-3F]',
    '',
    '#?? 0x SET CONNECTiON TYPE        x=FM/AM                 [0-1]',
    '    1x SET MULTiPLiER �           x=multiplier            [0-F]',
    '    2x SET KSL        �           x=scaling_level         [0-3]',
    '    3x SET TREMOLO    � MOD.      x=off/on                [0-1]',
    '    4x SET ViBRATO    �           x=off/on                [0-1]',
    '    5x SET KSR        �           x=off/on                [0-1]',
    '    6x SET SUSTAiN    �           x=off/on                [0-1]',
    '    7x SET MULTiPLiER �           x=multiplier            [0-F]',
    '    8x SET KSL        �           x=scaling_level         [0-3]',
    '    9x SET TREMOLO    � CAR.      x=off/on                [0-1]',
    '    Ax SET ViBRATO    �           x=off/on                [0-1]',
    '    Bx SET KSR        �           x=off/on                [0-1]',
    '    Cx SET SUSTAiN    �           x=off/on                [0-1]',
    '',
    '&?? 0x PATTERN DELAY (FRAMES)     x=interval              [1-F]',
    '    1x PATTERN DELAY (ROWS)       x=interval              [1-F]',
    '    2x NOTE DELAY                 x=interval              [1-F]',
    '    3x NOTE CUT                   x=interval              [1-F]',
    '    4x FiNE-TUNE UP               x=freq_shift            [1-F]',
    '    5x FiNE-TUNE DOWN             x=freq_shift            [1-F]',
    '    6x GLOBAL VOLUME SLiDE UP     x=speed_of_slide        [1-F]',
    '    7x GLOBAL VOLUME SLiDE DOWN   x=speed_of_slide        [1-F]',
    '    8x FiNE ~&6x~                   x=speed_of_slide        [1-F]',
    '    9x FiNE ~&7x~                   x=speed_of_slide        [1-F]',
    '    Ax EXTRA FiNE ~&6x~             x=speed_of_slide        [1-F]',
    '    Bx EXTRA FiNE ~&7x~             x=speed_of_slide        [1-F]',
    '    Cx EXTRA FiNE VSLiDE UP       x=speed_of_slide        [1-F]',
    '    Dx EXTRA FiNE VSLiDE DOWN     x=speed_of_slide        [1-F]',
    '    Ex EXTRA FiNE FSLiDE UP       x=speed_of_slide        [1-F]',
    '    Fx EXTRA FiNE FSLiDE DOWN     x=speed_of_slide        [1-F]',
    '',
    '$xy �� EXTRA FiNE ARPEGGiO        xy=1st_�tone|2nd_�tone  [1-F]',
    '@@~~xy �� EXTRA FiNE ViBRATO         xy=speed|depth          [1-F]  `C`',
    '^xy �� EXTRA FiNE TREMOLO         xy=speed|depth          [1-F]  ~C~',
    '',
    'Note that effects marked as ~C~ can be continued',
    'in subsequent lines by setting the parameter to value 0.',
    '',
    'For detailed information on effect commands, see the ~adtrack2.doc~ file.',
    '',
    '',
    '                                ���       ��',
    '                           /�DLiB�R/�CK3R �� SDL',
    '                            �       �     ��',
    '                                      '+at2ver+'',
    '',
    '`Get the latest version from:`',
    'http://www.adlibtracker.net',
    '',
    '`Get the recent source code from:`',
    'https://at2.googlecode.com/',
    '',
    '`Contact information:`',
    'E-MAiL subz3ro@hotmail.com',
    'iCQ#   58622796',
    '',
    '`Credits:`',
    'Joergen Ibsen [aPLib 0.26b]',
    'Vitaly Evseenko, MATCODE Software [MPRESS 2.19]',
    'Florian Klaempfl and others [Free Pascal Compiler 2.6.2]',
    'Japheth [JWasm v2.11]',
    'Jarek Burczynski and MAME Development Team [ymf262.c version 0.2]',
    'Simple DirectMedia Layer [SDL 1.2]',
    'Daniel F. Moisset [SDL4Freepascal-1.2.0.0]',
    '',
    '`subz3ro thanks to:`',
    'Slawomir Bubel (Malfunction/Altair), Daniel Illgen (insane/Altair),',
    'Mikkel Hastrup (encore), Dmitry Smagin, Cecill Etheredge (ijsf),',
    'Florian Jung (Windfisch), Sven Renner (NeuralNET),',
    'Tyler Montbriand (Corona688), and Mr. Maan M. Hamze :-)',
    '',
    '`Greetz fly to the following people:`',
    'Dragan Espenschied (drx/Bodenstandig 2000), Carl Peczynski (OxygenStar),',
    'Hubert Lamontagne (Madbrain), Diode Milliampere, Matej Hudak,',
    'and all others whom I forgot in this list :-)');

const
  key_comment_B =
    '  C   D   E   F   G   A   B   C   D   E   F   G   A   B   C   D   E';
  key_comment_H =
    '  C   D   E   F   G   A   H   C   D   E   F   G   A   H   C   D   E';

const
  shift_f5_1 = '~[Shift] F5~               @F5 with Trace';
  shift_f8_1 = '~[Shift] F8~               @F8 with Trace';
  shift_f9_1 = '~[Shift] F9~               @F9 with Trace';
  alt_f8_1   = '~[Alt] F8~                 @F8 � without synchronization';

const
  shift_f5_2 = '~[Shift] F5~               @F5 with no Trace';
  shift_f8_2 = '~[Shift] F8~               @F8 with no Trace';
  shift_f9_2 = '~[Shift] F9~               @F9 with no Trace';
  alt_f8_2   = '~[Alt] F8~                 @F8 � with synchronization';

procedure HELP(topic: String);

var
  temps: String;
  page,temp,fkey: Word;
  xstart,ystart,ypos: Byte;

procedure ListCStr(var dest; x,y: Byte;
                             str: String; atr1,atr2,atr3: Byte);
begin
  If (Copy(str,1,3) = '@@~') then
    begin
      Delete(str,1,3);
      ShowCStr2(dest,x,y,
                ExpStrR(str,74+Length(str)-CStr2Len(str),' '),
                atr1,atr2);
     end
  else If (Copy(str,1,3) = '@@`') then
         begin
           Delete(str,1,3);
           ShowCStr(dest,x,y,
                    ExpStrR(str,74+Length(str)-CStrLen(str),' '),
                    atr1,atr2);
         end
       else ShowC3Str(dest,x,y,
                      ExpStrR(str,74+Length(str)-C3StrLen(str),' '),
                      atr1,atr2,atr3);
end;
begin
  Move(v_ofs^,backup.screen,SizeOf(backup.screen));
  backup.cursor := GetCursor;
  backup.oldx   := WhereX;
  backup.oldy   := WhereY;

  HideCursor;
  centered_frame(xstart,ystart,77,MAX_PATTERN_ROWS+8,' HELP ',
                 help_background+help_border,
                 help_background+help_title,
                 double);
  page := 1;
  While (page <= LINES-24) and ((Copy(help_data[page],1,6) <> '@topic') or
        (Copy(help_data[page],8,Length(help_data[page])-7) <> topic)) do
    Inc(page);

  If page < 1 then page := 1;
  If page > LINES-(MAX_PATTERN_ROWS+6) then page := LINES-24;

  Repeat
    keyboard_poll_input;
    If page > 1  then temps := '' else temps := '-';
    If page < LINES-(MAX_PATTERN_ROWS+6) then temps := temps+'' else temps := temps+'-';
    ShowCStr(v_ofs^,xstart+1+74-Length(temps),ystart+MAX_PATTERN_ROWS+8,
                               '[~'+temps+'~]',
                               help_background+help_border,
                               help_background+help_indicators);
    ypos := ystart+1;
    temp := page;
    While (ypos <= ystart+(MAX_PATTERN_ROWS+6)+1) and (temp <= LINES) do
      begin
        If (Copy(help_data[temp],1,6) <> '@topic') and
           (Copy(help_data[temp],1,6) <> '@input') then
          begin
            If (Copy(help_data[temp],1,3) <> ' � ') then
              ListCStr(v_ofs^,xstart+2,ypos,
                                     help_data[temp],
                                     help_background+help_text,
                                     help_background+help_keys,
                                     help_background+help_hi_text)
            else
              ListCStr(v_ofs^,xstart+2,ypos,
                                     help_data[temp],
                                     help_background+help_text,
                                     help_background+help_keys,
                                     help_background+help_topic);
            Inc(ypos);
          end
        else If (Copy(help_data[temp],8,
                 Length(help_data[temp])-7) = 'key_comment') then
            begin
              If NOT use_H_for_B then
                ListCStr(v_ofs^,xstart+2,ypos,
                                  key_comment_B,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic)
              else
                ListCStr(v_ofs^,xstart+2,ypos,
                                  key_comment_H,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic);
              Inc(ypos);
            end
          else If (Copy(help_data[temp],8,
                   Length(help_data[temp])-7) = 'shift_f5') then
            begin
              If NOT trace_by_default then
                ListCStr(v_ofs^,xstart+2,ypos,
                                  shift_f5_1,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic)
              else
                ListCStr(v_ofs^,xstart+2,ypos,
                                  shift_f5_2,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic);
              Inc(ypos);
            end
          else If (Copy(help_data[temp],8,
                  Length(help_data[temp])-7) = 'shift_f8') then
            begin
              If NOT trace_by_default then
                ListCStr(v_ofs^,xstart+2,ypos,
                                  shift_f8_1,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic)
              else
                ListCStr(v_ofs^,xstart+2,ypos,
                                  shift_f8_2,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic);
              Inc(ypos);
            end
          else If (Copy(help_data[temp],8,
                   Length(help_data[temp])-7) = 'shift_f9') then
            begin
              If NOT trace_by_default then
                ListCStr(v_ofs^,xstart+2,ypos,
                                  shift_f9_1,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic)
              else
                ListCStr(v_ofs^,xstart+2,ypos,
                                  shift_f9_2,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic);
              Inc(ypos);
            end
          else If (Copy(help_data[temp],8,
                   Length(help_data[temp])-7) = 'alt_f8') then
            begin
              If NOT nosync_by_default then
                ListCStr(v_ofs^,xstart+2,ypos,
                                  alt_f8_1,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic)
              else
                ListCStr(v_ofs^,xstart+2,ypos,
                                  alt_f8_2,
                                  help_background+help_text,
                                  help_background+help_keys,
                                  help_background+help_topic);
              Inc(ypos);
            end;

        Inc(temp);
      end;

    fkey := getkey;
    Case fkey of
      kUP:     begin
                 If page > 1 then Dec(page);
                 If (Copy(help_data[page-1],1,6) = '@topic') and
                    (page > 1) then Dec(page);
               end;

      kDOWN:   begin
                 If (Copy(help_data[page],1,6) = '@topic') and
                    (page < LINES-(MAX_PATTERN_ROWS+6)) then Inc(page);
                 If page < LINES-(MAX_PATTERN_ROWS+6) then Inc(page);
               end;

      kPgUP:   begin
                 If page > 24 then Dec(page,(MAX_PATTERN_ROWS+6)) else page := 1;
                 If (Copy(help_data[page-1],1,6) = '@topic') and
                    (page > 1) then Dec(page);
               end;

      kPgDOWN: begin
                 If (Copy(help_data[page],1,6) = '@topic') and
                    (page < LINES-(MAX_PATTERN_ROWS+6)) then Inc(page);
                 If page+(MAX_PATTERN_ROWS+6) < LINES-(MAX_PATTERN_ROWS+6) then Inc(page,(MAX_PATTERN_ROWS+6)) else
                 page := LINES-(MAX_PATTERN_ROWS+6);
               end;

      kHOME:   page := 1;
      kEND:    page := LINES-(MAX_PATTERN_ROWS+6);
    end;
    emulate_screen;
  until (fkey = kENTER) or (fkey = kESC) or _force_program_quit;

  move_to_screen_data := Addr(backup.screen);
  move_to_screen_area[1] := xstart;
  move_to_screen_area[2] := ystart;
  move_to_screen_area[3] := xstart+77+2;
  move_to_screen_area[4] := ystart+(MAX_PATTERN_ROWS+8)+1;

  move2screen;
//  SetCursor(backup.cursor);
//  GotoXY(backup.oldx,backup.oldy);
end;

procedure C3WriteLn(posX,posY: Byte; str: String; atr1,atr2,atr3: Byte);
begin
  ShowC3Str(v_ofs^,posX,posY,
            str,
            atr1,atr2,atr3);
end;

procedure ShowStartMessage;

var
   i: longint;

begin
    For i := 0 to 18 do
      adt2_title[i] := RotStrL('/�DLiB TR/�CK3R ][', ' - REViSiON '+at2rev+' - ',i);

    adt2_title[18] := '-+ REViSiON '+at2rev+' +-';

    For i := 19 to 36 do
       adt2_title[i] := RotStrL(' - REViSiON '+at2rev+' - ', '/�DLiB TR/�CK3R ][',i-18);

    WriteLn;
    WriteLn('/�DLiB TR/�CK3R ][ SDL (win32)');
    WriteLn('coded by subz3ro/Altair, SDL portation support by Dmitry Smagin');
    WriteLn('version ',at2ver,' built on ',at2date,' ',at2link);
    WriteLn;
end;

end.