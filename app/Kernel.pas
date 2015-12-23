Unit Kernel;

Interface

Uses
  Windows;

Const
  // Major functions
  IRP_MJ_CREATE                   = $00;
  IRP_MJ_CREATE_NAMED_PIPE        = $01;
  IRP_MJ_CLOSE                    = $02;
  IRP_MJ_READ                     = $03;
  IRP_MJ_WRITE                    = $04;
  IRP_MJ_QUERY_INFORMATION        = $05;
  IRP_MJ_SET_INFORMATION          = $06;
  IRP_MJ_QUERY_EA                 = $07;
  IRP_MJ_SET_EA                   = $08;
  IRP_MJ_FLUSH_BUFFERS            = $09;
  IRP_MJ_QUERY_VOLUME_INFORMATION = $0a;
  IRP_MJ_SET_VOLUME_INFORMATION   = $0b;
  IRP_MJ_DIRECTORY_CONTROL        = $0c;
  IRP_MJ_FILE_SYSTEM_CONTROL      = $0d;
  IRP_MJ_DEVICE_CONTROL           = $0e;
  IRP_MJ_INTERNAL_DEVICE_CONTROL  = $0f;
  IRP_MJ_SHUTDOWN                 = $10;
  IRP_MJ_LOCK_CONTROL             = $11;
  IRP_MJ_CLEANUP                  = $12;
  IRP_MJ_CREATE_MAILSLOT          = $13;
  IRP_MJ_QUERY_SECURITY           = $14;
  IRP_MJ_SET_SECURITY             = $15;
  IRP_MJ_POWER                    = $16;
  IRP_MJ_SYSTEM_CONTROL           = $17;
  IRP_MJ_DEVICE_CHANGE            = $18;
  IRP_MJ_QUERY_QUOTA              = $19;
  IRP_MJ_SET_QUOTA                = $1a;
  IRP_MJ_PNP                      = $1b;
  IRP_MJ_PNP_POWER                = IRP_MJ_PNP;      // Obsolete....
  IRP_MJ_MAXIMUM_FUNCTION         = $1b;

  // Device flags
  DO_VERIFY_VOLUME                   = $00000002;
  DO_BUFFERED_IO                     = $00000004;
  DO_EXCLUSIVE                       = $00000008;
  DO_DIRECT_IO                       = $00000010;
  DO_MAP_IO_BUFFER                   = $00000020;
  DO_DEVICE_HAS_NAME                 = $00000040;
  DO_DEVICE_INITIALIZING             = $00000080;
  DO_SYSTEM_BOOT_PARTITION           = $00000100;
  DO_LONG_TERM_REQUESTS              = $00000200;
  DO_NEVER_LAST_DEVICE               = $00000400;
  DO_SHUTDOWN_REGISTERED             = $00000800;
  DO_BUS_ENUMERATED_DEVICE           = $00001000;
  DO_POWER_PAGABLE                   = $00002000;
  DO_POWER_INRUSH                    = $00004000;
  DO_LOW_PRIORITY_FILESYSTEM         = $00010000;
  DO_SUPPORTS_TRANSACTIONS           = $00040000;
  DO_FORCE_NEITHER_IO                = $00080000;
  DO_VOLUME_DEVICE_OBJECT            = $00100000;
  DO_SYSTEM_SYSTEM_PARTITION         = $00200000;
  DO_SYSTEM_CRITICAL_PARTITION       = $00400000;
  DO_DISALLOW_EXECUTE                = $00800000;

  // Device characteristics
  FILE_REMOVABLE_MEDIA                   = $00000001;
  FILE_READ_ONLY_DEVICE                  = $00000002;
  FILE_FLOPPY_DISKETTE                   = $00000004;
  FILE_WRITE_ONCE_MEDIA                  = $00000008;
  FILE_REMOTE_DEVICE                     = $00000010;
  FILE_DEVICE_IS_MOUNTED                 = $00000020;
  FILE_VIRTUAL_VOLUME                    = $00000040;
  FILE_AUTOGENERATED_DEVICE_NAME         = $00000080;
  FILE_DEVICE_SECURE_OPEN                = $00000100;
  FILE_CHARACTERISTIC_PNP_DEVICE         = $00000800;
  FILE_CHARACTERISTIC_TS_DEVICE          = $00001000;
  FILE_CHARACTERISTIC_WEBDAV_DEVICE      = $00002000;

  // Driver flags
  DRVO_UNLOAD_INVOKED            = $00000001;
  DRVO_LEGACY_DRIVER             = $00000002;
  DRVO_BUILTIN_DRIVER            = $00000004;    // Driver objects for Hal, PnP Mgr
  DRVO_REINIT_REGISTERED         = $00000008;
  DRVO_INITIALIZED               = $00000010;
  DRVO_BOOTREINIT_REGISTERED     = $00000020;
  DRVO_LEGACY_RESOURCES          = $00000040;
  DRVO_BASE_FILESYSTEM_DRIVER    = $00000080;

  // Device types
  FILE_DEVICE_BEEP                = $00000001;
  FILE_DEVICE_CD_ROM              = $00000002;
  FILE_DEVICE_CD_ROM_FILE_SYSTEM  = $00000003;
  FILE_DEVICE_CONTROLLER          = $00000004;
  FILE_DEVICE_DATALINK            = $00000005;
  FILE_DEVICE_DFS                 = $00000006;
  FILE_DEVICE_DISK                = $00000007;
  FILE_DEVICE_DISK_FILE_SYSTEM    = $00000008;
  FILE_DEVICE_FILE_SYSTEM         = $00000009;
  FILE_DEVICE_INPORT_PORT         = $0000000a;
  FILE_DEVICE_KEYBOARD            = $0000000b;
  FILE_DEVICE_MAILSLOT            = $0000000c;
  FILE_DEVICE_MIDI_IN             = $0000000d;
  FILE_DEVICE_MIDI_OUT            = $0000000e;
  FILE_DEVICE_MOUSE               = $0000000f;
  FILE_DEVICE_MULTI_UNC_PROVIDER  = $00000010;
  FILE_DEVICE_NAMED_PIPE          = $00000011;
  FILE_DEVICE_NETWORK             = $00000012;
  FILE_DEVICE_NETWORK_BROWSER     = $00000013;
  FILE_DEVICE_NETWORK_FILE_SYSTEM = $00000014;
  FILE_DEVICE_NULL                = $00000015;
  FILE_DEVICE_PARALLEL_PORT       = $00000016;
  FILE_DEVICE_PHYSICAL_NETCARD    = $00000017;
  FILE_DEVICE_PRINTER             = $00000018;
  FILE_DEVICE_SCANNER             = $00000019;
  FILE_DEVICE_SERIAL_MOUSE_PORT   = $0000001a;
  FILE_DEVICE_SERIAL_PORT         = $0000001b;
  FILE_DEVICE_SCREEN              = $0000001c;
  FILE_DEVICE_SOUND               = $0000001d;
  FILE_DEVICE_STREAMS             = $0000001e;
  FILE_DEVICE_TAPE                = $0000001f;
  FILE_DEVICE_TAPE_FILE_SYSTEM    = $00000020;
  FILE_DEVICE_TRANSPORT           = $00000021;
  FILE_DEVICE_UNKNOWN             = $00000022;
  FILE_DEVICE_VIDEO               = $00000023;
  FILE_DEVICE_VIRTUAL_DISK        = $00000024;
  FILE_DEVICE_WAVE_IN             = $00000025;
  FILE_DEVICE_WAVE_OUT            = $00000026;
  FILE_DEVICE_8042_PORT           = $00000027;
  FILE_DEVICE_NETWORK_REDIRECTOR  = $00000028;
  FILE_DEVICE_BATTERY             = $00000029;
  FILE_DEVICE_BUS_EXTENDER        = $0000002a;
  FILE_DEVICE_MODEM               = $0000002b;
  FILE_DEVICE_VDM                 = $0000002c;
  FILE_DEVICE_MASS_STORAGE        = $0000002d;
  FILE_DEVICE_SMB                 = $0000002e;
  FILE_DEVICE_KS                  = $0000002f;
  FILE_DEVICE_CHANGER             = $00000030;
  FILE_DEVICE_SMARTCARD           = $00000031;
  FILE_DEVICE_ACPI                = $00000032;
  FILE_DEVICE_DVD                 = $00000033;
  FILE_DEVICE_FULLSCREEN_VIDEO    = $00000034;
  FILE_DEVICE_DFS_FILE_SYSTEM     = $00000035;
  FILE_DEVICE_DFS_VOLUME          = $00000036;
  FILE_DEVICE_SERENUM             = $00000037;
  FILE_DEVICE_TERMSRV             = $00000038;
  FILE_DEVICE_KSEC                = $00000039;
  FILE_DEVICE_FIPS                = $0000003A;
  FILE_DEVICE_INFINIBAND          = $0000003B;
  FILE_DEVICE_VMBUS               = $0000003E;
  FILE_DEVICE_CRYPT_PROVIDER      = $0000003F;
  FILE_DEVICE_WPD                 = $00000040;
  FILE_DEVICE_BLUETOOTH           = $00000041;
  FILE_DEVICE_MT_COMPOSITE        = $00000042;
  FILE_DEVICE_MT_TRANSPORT        = $00000043;
  FILE_DEVICE_BIOMETRIC	        	= $00000044;
  FILE_DEVICE_PMI                 = $00000045;

  // Volume Parameter Block
  VPB_MOUNTED               =      $00000001;
  VPB_LOCKED                =      $00000002;
  VPB_PERSISTENT            =      $00000004;
  VPB_REMOVE_PENDING        =      $00000008;
  VPB_RAW_MOUNT             =      $00000010;
  VPB_DIRECT_WRITES_ALLOWED =      $00000020;

  // Device object extension flags
  DOE_UNLOAD_PENDING             = $00000001;
  DOE_DELETE_PENDING             = $00000002;
  DOE_REMOVE_PENDING             = $00000004;
  DOE_REMOVE_PROCESSED           = $00000008;
  DOE_START_PENDING              = $00000010;
  DOE_STARTIO_REQUESTED          = $00000020;
  DOE_STARTIO_REQUESTED_BYKEY    = $00000040;
  DOE_STARTIO_CANCELABLE         = $00000080;
  DOE_STARTIO_DEFERRED           = $00000100;  // Use non-recursive startio
  DOE_STARTIO_NO_CANCEL          = $00000200;  // Pass non-cancelable IRP to startio


  // Device extension power flags


  // Device capabilities
  DEVCAP_DEVICE_D1              = $1;
  DEVCAP_DEVICE_D2              = $2;
  DEVCAP_LOCK_SUPPORTED         = $4;
  DEVCAP_EJECT_SUPPORTED        = $8;
  DEVCAP_REMOVABLE              = $10;
  DEVCAP_DOCK_DEVICE            = $20;
  DEVCAP_UNIQUE_ID              = $40;
  DEVCAP_SILENT_INSTALL         = $80;
  DEVCAP_RAW_DEVICE_OK          = $100;
  DEVCAP_SURPRISE_REMOVAL_OK    = $200;
  DEVCAP_WAKE_FROM_D0           = $400;
  DEVCAP_WAKE_FROM_D1           = $800;
  DEVCAP_WAKE_FROM_D2           = $1000;
  DEVCAP_WAKE_FROM_D3           = $2000;
  DEVCAP_HARDWARE_DISABLED      = $4000;
  DEVCAP_NON_DYNAMIC            = $8000;
  DEVCAP_WARM_EJECT_SUPPORTED   = $10000;
  DEVCAP_NO_DISPLAY_IN_UI       = $20000;



Function IrpMajorToStr(AMajor:ULONG):WideString;
Function DriverFlagsToStr(AFlags:Cardinal):WideString;
Function DriverFlagToStr(AFlag:Cardinal):WideString;
Function DeviceFlagsToStr(AFlags:Cardinal):WideString;
Function DeviceFlagToStr(AFlag:Cardinal):WideString;
Function DeviceCharacteristicToStr(AChar:Cardinal):WideString;
Function DeviceCharacteristicsToStr(AChars:Cardinal):WideString;
Function DeviceTypeToStr(ADeviceType:Cardinal):WideString;
Function DeviceExtensionFlagsToStr(AFlags:Cardinal):WideString;
Function DeviceExtensionFlagToStr(AFlag:Cardinal):WideString;
Function DeviceIDListToStr(AIDList : Array Of WideString):WideString;
Function DeviceRelationsToStr(AArray : Array Of Pointer):WideString;

Implementation

Uses
  SysUtils;

Type
  TFlagToStrFunction = Function (AFlag:Cardinal):WideString;

Function _FlagsToStr(AFlagArray: Array Of Cardinal; AFlags:Cardinal; AFunction:TFlagToStrFunction):WideString;
Var
  I : Integer;
  strFlag : WideString;
begin
For I := Low(AFlagArray) To High(AFlagArray) Do
  begin
  strFlag := AFunction(AFlags And AFlagArray[I]);
  If strFlag <> '' Then
    begin
    If Result <> '' Then
      Result := Result + ' ';

    Result := Result + strFlag;
    end;
  end;
end;

Function DeviceCharacteristicsToStr(AChars:Cardinal):WideString;
Var
  CharArray : Array [0..11] OF Cardinal;
begin
CharArray[0] := FILE_REMOVABLE_MEDIA;
CharArray[1] := FILE_READ_ONLY_DEVICE;
CharArray[2] := FILE_FLOPPY_DISKETTE;
CharArray[3] := FILE_WRITE_ONCE_MEDIA;
CharArray[4] := FILE_REMOTE_DEVICE;
CharArray[5] := FILE_DEVICE_IS_MOUNTED;
CharArray[6] := FILE_VIRTUAL_VOLUME;
CharArray[7] := FILE_AUTOGENERATED_DEVICE_NAME;
CharArray[8] := FILE_DEVICE_SECURE_OPEN;
CharArray[9] := FILE_CHARACTERISTIC_PNP_DEVICE;
CharArray[10] := FILE_CHARACTERISTIC_TS_DEVICE;
CharArray[11] := FILE_CHARACTERISTIC_WEBDAV_DEVICE;
Result := _FlagsToStr(CharArray, AChars, DeviceCharacteristicToStr);
end;

Function DeviceExtensionFlagsToStr(AFlags:Cardinal):WideString;
Var
  eflagArray : Array [0..9] OF Cardinal;
begin
eflagArray[0] := DOE_UNLOAD_PENDING;
eflagArray[1] := DOE_DELETE_PENDING;
eflagArray[2] := DOE_REMOVE_PENDING;
eflagArray[3] := DOE_REMOVE_PROCESSED;
eflagArray[4] := DOE_START_PENDING;
eflagArray[5] := DOE_STARTIO_REQUESTED;
eflagArray[6] := DOE_STARTIO_REQUESTED_BYKEY;
eflagArray[7] := DOE_STARTIO_CANCELABLE;
eflagArray[8] := DOE_STARTIO_DEFERRED;
eflagArray[9] := DOE_STARTIO_NO_CANCEL;
Result := _FlagsToStr(eflagArray, AFlags, DeviceExtensionFlagToStr);
end;

Function DeviceExtensionFlagToStr(AFlag:Cardinal):WideString;
begin
Case AFlag Of
  DOE_UNLOAD_PENDING : Result := 'DOE_UNLOAD_PENDING';
  DOE_DELETE_PENDING : Result := 'DOE_DELETE_PENDING';
  DOE_REMOVE_PENDING : Result := 'DOE_REMOVE_PENDING';
  DOE_REMOVE_PROCESSED : Result := 'DOE_REMOVE_PROCESSED';
  DOE_START_PENDING : Result := 'DOE_START_PENDING';
  DOE_STARTIO_REQUESTED : Result := 'DOE_STARTIO_REQUESTED';
  DOE_STARTIO_REQUESTED_BYKEY : Result := 'DOE_STARTIO_REQUESTED_BYKEY';
  DOE_STARTIO_CANCELABLE : Result := 'DOE_STARTIO_CANCELABLE';
  DOE_STARTIO_DEFERRED : Result := 'DOE_STARTIO_DEFERRED';
  DOE_STARTIO_NO_CANCEL : Result := 'DOE_STARTIO_NO_CANCEL';
  Else Result := '';
  end;
end;

Function DeviceFlagsToStr(AFlags:Cardinal):WideString;
Var
  FlagArray : Array [0..20] Of Cardinal;
begin
FlagArray[0] := DO_VERIFY_VOLUME;
FlagArray[1] := DO_BUFFERED_IO;
FlagArray[2] := DO_EXCLUSIVE;
FlagArray[3] := DO_DIRECT_IO;
FlagArray[4] := DO_MAP_IO_BUFFER;
FlagArray[5] := DO_DEVICE_HAS_NAME;
FlagArray[6] := DO_DEVICE_INITIALIZING;
FlagArray[7] := DO_SYSTEM_BOOT_PARTITION;
FlagArray[8] := DO_LONG_TERM_REQUESTS;
FlagArray[9] := DO_NEVER_LAST_DEVICE;
FlagArray[10] := DO_SHUTDOWN_REGISTERED;
FlagArray[11] := DO_BUS_ENUMERATED_DEVICE;
FlagArray[12] := DO_POWER_PAGABLE;
FlagArray[13] := DO_POWER_INRUSH;
FlagArray[14] := DO_LOW_PRIORITY_FILESYSTEM;
FlagArray[15] := DO_SUPPORTS_TRANSACTIONS;
FlagArray[16] := DO_FORCE_NEITHER_IO;
FlagArray[17] := DO_VOLUME_DEVICE_OBJECT;
FlagArray[18] := DO_SYSTEM_SYSTEM_PARTITION;
FlagArray[19] := DO_SYSTEM_CRITICAL_PARTITION;
FlagArray[20] := DO_DISALLOW_EXECUTE;
Result := _FlagsToStr(FlagArray, AFlags, DeviceFlagToStr);
end;

Function DriverFlagsToStr(AFlags:Cardinal):WideString;
Var
  FlagArray : Array [0..7] Of Cardinal;
begin
Result := '';
FlagArray[0] := DRVO_UNLOAD_INVOKED;
FlagArray[1] := DRVO_LEGACY_DRIVER;
FlagArray[2] := DRVO_BUILTIN_DRIVER;
FlagArray[3] := DRVO_REINIT_REGISTERED;
FlagArray[4] := DRVO_INITIALIZED;
FlagArray[5] := DRVO_BOOTREINIT_REGISTERED;
FlagArray[6] := DRVO_LEGACY_RESOURCES;
FlagArray[7] := DRVO_BASE_FILESYSTEM_DRIVER;
Result := _FlagsToStr(FlagArray, AFlags, DriverFlagToStr);
end;

Function DeviceCharacteristicToStr(AChar:Cardinal):WideString;
begin
Case AChar Of
  FILE_REMOVABLE_MEDIA : Result := 'RemovableMedia';
  FILE_READ_ONLY_DEVICE : Result := 'ReadOnly';
  FILE_FLOPPY_DISKETTE : Result := 'Floppy';
  FILE_WRITE_ONCE_MEDIA : Result := 'WriteOnce';
  FILE_REMOTE_DEVICE : Result := 'Remote';
  FILE_DEVICE_IS_MOUNTED : Result := 'Mounted';
  FILE_VIRTUAL_VOLUME : Result := 'VirtualVolume';
  FILE_AUTOGENERATED_DEVICE_NAME : Result := 'AutogeneratedName';
  FILE_DEVICE_SECURE_OPEN : Result := 'SecureOpen';
  FILE_CHARACTERISTIC_PNP_DEVICE : Result := 'PnPDevice';
  FILE_CHARACTERISTIC_TS_DEVICE : Result := 'TsDevice';
  FILE_CHARACTERISTIC_WEBDAV_DEVICE : Result := 'WebDAVDevice';
  Else Result := '';
  end;
end;

Function DeviceFlagToStr(AFlag:Cardinal):WideString;
begin
Case AFlag Of
  DO_VERIFY_VOLUME : Result := 'VerifyVolume';
  DO_BUFFERED_IO : Result := 'BufferedIo';
  DO_EXCLUSIVE : Result := 'Exclusive';
  DO_DIRECT_IO : Result := 'DirectIo';
  DO_MAP_IO_BUFFER : Result := 'MapIoBuffer';
  DO_DEVICE_HAS_NAME : Result := 'HasName';
  DO_DEVICE_INITIALIZING : Result := 'Initializing';
  DO_SYSTEM_BOOT_PARTITION : Result := 'SystemBootPartition';
  DO_LONG_TERM_REQUESTS : Result := 'LongTermRequests';
  DO_NEVER_LAST_DEVICE : Result := 'NeverLastDevice';
  DO_SHUTDOWN_REGISTERED : Result := 'ShutdownRegistered';
  DO_BUS_ENUMERATED_DEVICE : Result := 'BusEnumerated';
  DO_POWER_PAGABLE : Result := 'PowerPagable';
  DO_POWER_INRUSH : Result := 'PowerInrush';
  DO_LOW_PRIORITY_FILESYSTEM : Result := 'LowPriorityFilesystem';
  DO_SUPPORTS_TRANSACTIONS : Result := 'SupportsTransactions';
  DO_FORCE_NEITHER_IO : Result := 'ForceNeitherIo';
  DO_VOLUME_DEVICE_OBJECT : Result := 'VolumeDeviceObject';
  DO_SYSTEM_SYSTEM_PARTITION : Result := 'SystemPartition';
  DO_SYSTEM_CRITICAL_PARTITION : Result := 'CriticalPartition';
  DO_DISALLOW_EXECUTE : Result := 'DisallowExecute';
  Else Result := '';
  end;
end;

Function DriverFlagToStr(AFlag:Cardinal):WideString;
begin
Case AFlag Of
  DRVO_UNLOAD_INVOKED : Result := 'UnloadInvoked';
  DRVO_LEGACY_DRIVER : Result := 'LegacyDriver';
  DRVO_BUILTIN_DRIVER : Result := 'BuiltInDriver';
  DRVO_REINIT_REGISTERED : Result := 'InitRegistered';
  DRVO_INITIALIZED : Result := 'Initialized';
  DRVO_BOOTREINIT_REGISTERED : Result := 'BootReinitRegistered';
  DRVO_LEGACY_RESOURCES : Result := 'LegacyResources';
  DRVO_BASE_FILESYSTEM_DRIVER : Result := 'BaseFileSystemDriver';
  Else Result := '';
  end;
end;

Function IrpMajorToStr(AMajor:ULONG):WideString;
begin
Case AMajor Of
  IRP_MJ_CREATE : Result := 'Create';
  IRP_MJ_CREATE_NAMED_PIPE : Result := 'CreateNamedPipe';
  IRP_MJ_CLOSE : Result := 'Close';
  IRP_MJ_READ : Result := 'Read';
  IRP_MJ_WRITE : Result := 'Write';
  IRP_MJ_QUERY_INFORMATION : Result := 'QueryInformation';
  IRP_MJ_SET_INFORMATION : Result := 'SetInformation';
  IRP_MJ_QUERY_EA : Result := 'QueryEA';
  IRP_MJ_SET_EA : Result := 'SetEA';
  IRP_MJ_FLUSH_BUFFERS : Result := 'FlushBuffers';
  IRP_MJ_QUERY_VOLUME_INFORMATION : Result := 'QueryVolumeInformation';
  IRP_MJ_SET_VOLUME_INFORMATION : Result := 'SetVolumeInformation';
  IRP_MJ_DIRECTORY_CONTROL :  Result := 'DirectoryControl';
  IRP_MJ_FILE_SYSTEM_CONTROL  : Result := 'FileSystemControl';
  IRP_MJ_DEVICE_CONTROL  : Result := 'DeviceControl';
  IRP_MJ_INTERNAL_DEVICE_CONTROL  : Result := 'InternalDeviceControl';
  IRP_MJ_SHUTDOWN : Result := 'Shutdown';
  IRP_MJ_LOCK_CONTROL : Result := 'LockControl';
  IRP_MJ_CLEANUP : Result := 'Cleanup';
  IRP_MJ_CREATE_MAILSLOT : Result := 'CreateMailslot';
  IRP_MJ_QUERY_SECURITY : Result := 'QuerySecurity';
  IRP_MJ_SET_SECURITY : Result := 'SetSecurity';
  IRP_MJ_POWER : Result := 'Power';
  IRP_MJ_SYSTEM_CONTROL : Result := 'SystemControl';
  IRP_MJ_DEVICE_CHANGE : Result := 'DeviceChange';
  IRP_MJ_QUERY_QUOTA : Result := 'QueryQuota';
  IRP_MJ_SET_QUOTA : Result := 'SetQuota';
  IRP_MJ_PNP : Result := 'Pnp';
  end;
end;

Function DeviceTypeToStr(ADeviceType:Cardinal):WideString;
begin
Case ADeviceType Of
  FILE_DEVICE_BEEP : Result :='FILE_DEVICE_BEEP';
  FILE_DEVICE_CD_ROM : Result :='FILE_DEVICE_CD_ROM';
  FILE_DEVICE_CD_ROM_FILE_SYSTEM : Result :='FILE_DEVICE_CD_ROM_FILE_SYSTEM';
  FILE_DEVICE_CONTROLLER : Result :='FILE_DEVICE_CONTROLLER';
  FILE_DEVICE_DATALINK : Result :='FILE_DEVICE_DATALINK';
  FILE_DEVICE_DFS : Result :='FILE_DEVICE_DFS';
  FILE_DEVICE_DISK : Result :='FILE_DEVICE_DISK';
  FILE_DEVICE_DISK_FILE_SYSTEM : Result :='FILE_DEVICE_DISK_FILE_SYSTEM';
  FILE_DEVICE_FILE_SYSTEM : Result :='FILE_DEVICE_FILE_SYSTEM';
  FILE_DEVICE_INPORT_PORT : Result :='FILE_DEVICE_INPORT_PORT';
  FILE_DEVICE_KEYBOARD : Result :='FILE_DEVICE_KEYBOARD';
  FILE_DEVICE_MAILSLOT : Result :='FILE_DEVICE_MAILSLOT';
  FILE_DEVICE_MIDI_IN : Result :='FILE_DEVICE_MIDI_IN';
  FILE_DEVICE_MIDI_OUT : Result :='FILE_DEVICE_MIDI_OUT';
  FILE_DEVICE_MOUSE : Result :='FILE_DEVICE_MOUSE';
  FILE_DEVICE_MULTI_UNC_PROVIDER : Result :='FILE_DEVICE_MULTI_UNC_PROVIDER';
  FILE_DEVICE_NAMED_PIPE : Result :='FILE_DEVICE_NAMED_PIPE';
  FILE_DEVICE_NETWORK : Result :='FILE_DEVICE_NETWORK';
  FILE_DEVICE_NETWORK_BROWSER : Result :='FILE_DEVICE_NETWORK_BROWSER';
  FILE_DEVICE_NETWORK_FILE_SYSTEM : Result :='FILE_DEVICE_NETWORK_FILE_SYSTEM';
  FILE_DEVICE_NULL : Result :='FILE_DEVICE_NULL';
  FILE_DEVICE_PARALLEL_PORT : Result :='FILE_DEVICE_PARALLEL_PORT';
  FILE_DEVICE_PHYSICAL_NETCARD : Result :='FILE_DEVICE_PHYSICAL_NETCARD';
  FILE_DEVICE_PRINTER : Result :='FILE_DEVICE_PRINTER';
  FILE_DEVICE_SCANNER : Result :='FILE_DEVICE_SCANNER';
  FILE_DEVICE_SERIAL_MOUSE_PORT : Result :='FILE_DEVICE_SERIAL_MOUSE_PORT';
  FILE_DEVICE_SERIAL_PORT : Result :='FILE_DEVICE_SERIAL_PORT';
  FILE_DEVICE_SCREEN : Result :='FILE_DEVICE_SCREEN';
  FILE_DEVICE_SOUND : Result :='FILE_DEVICE_SOUND';
  FILE_DEVICE_STREAMS : Result :='FILE_DEVICE_STREAMS';
  FILE_DEVICE_TAPE : Result :='FILE_DEVICE_TAPE';
  FILE_DEVICE_TAPE_FILE_SYSTEM : Result :='FILE_DEVICE_TAPE_FILE_SYSTEM';
  FILE_DEVICE_TRANSPORT : Result :='FILE_DEVICE_TRANSPORT';
  FILE_DEVICE_UNKNOWN : Result :='FILE_DEVICE_UNKNOWN';
  FILE_DEVICE_VIDEO : Result :='FILE_DEVICE_VIDEO';
  FILE_DEVICE_VIRTUAL_DISK : Result :='FILE_DEVICE_VIRTUAL_DISK';
  FILE_DEVICE_WAVE_IN : Result :='FILE_DEVICE_WAVE_IN';
  FILE_DEVICE_WAVE_OUT : Result :='FILE_DEVICE_WAVE_OUT';
  FILE_DEVICE_8042_PORT : Result :='FILE_DEVICE_8042_PORT';
  FILE_DEVICE_NETWORK_REDIRECTOR : Result :='FILE_DEVICE_NETWORK_REDIRECTOR';
  FILE_DEVICE_BATTERY : Result :='FILE_DEVICE_BATTERY';
  FILE_DEVICE_BUS_EXTENDER : Result :='FILE_DEVICE_BUS_EXTENDER';
  FILE_DEVICE_MODEM : Result :='FILE_DEVICE_MODEM';
  FILE_DEVICE_VDM : Result :='FILE_DEVICE_VDM';
  FILE_DEVICE_MASS_STORAGE : Result :='FILE_DEVICE_MASS_STORAGE';
  FILE_DEVICE_SMB : Result :='FILE_DEVICE_SMB';
  FILE_DEVICE_KS : Result :='FILE_DEVICE_KS';
  FILE_DEVICE_CHANGER : Result :='FILE_DEVICE_CHANGER';
  FILE_DEVICE_SMARTCARD : Result :='FILE_DEVICE_SMARTCARD';
  FILE_DEVICE_ACPI : Result :='FILE_DEVICE_ACPI';
  FILE_DEVICE_DVD : Result :='FILE_DEVICE_DVD';
  FILE_DEVICE_FULLSCREEN_VIDEO : Result :='FILE_DEVICE_FULLSCREEN_VIDEO';
  FILE_DEVICE_DFS_FILE_SYSTEM : Result :='FILE_DEVICE_DFS_FILE_SYSTEM';
  FILE_DEVICE_DFS_VOLUME : Result :='FILE_DEVICE_DFS_VOLUME';
  FILE_DEVICE_SERENUM : Result :='FILE_DEVICE_SERENUM';
  FILE_DEVICE_TERMSRV : Result :='FILE_DEVICE_TERMSRV';
  FILE_DEVICE_KSEC : Result :='FILE_DEVICE_KSEC';
  FILE_DEVICE_FIPS : Result :='FILE_DEVICE_FIPS';
  FILE_DEVICE_INFINIBAND : Result :='FILE_DEVICE_INFINIBAND';
  FILE_DEVICE_VMBUS : Result :='FILE_DEVICE_VMBUS';
  FILE_DEVICE_CRYPT_PROVIDER : Result :='FILE_DEVICE_CRYPT_PROVIDER';
  FILE_DEVICE_WPD : Result :='FILE_DEVICE_WPD';
  FILE_DEVICE_BLUETOOTH : Result :='FILE_DEVICE_BLUETOOTH';
  FILE_DEVICE_MT_COMPOSITE : Result :='FILE_DEVICE_MT_COMPOSITE';
  FILE_DEVICE_MT_TRANSPORT : Result :='FILE_DEVICE_MT_TRANSPORT';
  FILE_DEVICE_BIOMETRIC : Result :='FILE_DEVICE_BIOMETRIC';
  FILE_DEVICE_PMI : Result :='FILE_DEVICE_PMI';
  Else Result := '<unknown>';
  end;
end;

Function DeviceIDListToStr(AIDList : Array Of WideString):WideString;
Var
  I : Integer;
begin
Result := '';
For I := Low(AIDList) To High(AIDList) Do
  Result := Format('%s, ', [AIDList[I]]);

If Result <> '' Then
  System.Delete(Result, Length(Result) - 1, 2);
end;

Function DeviceRelationsToStr(AArray : Array Of Pointer):WideString;
Var
  I : Integer;
begin
Result := '';
For I := Low(AArray) To High(AArray) Do
  Result := Format('0x%p, ', [AArray[I]]);

  If Result <> '' Then
  System.Delete(Result, Length(Result) - 1, 2);
end;



End.
