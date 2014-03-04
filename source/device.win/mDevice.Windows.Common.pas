unit mDevice.Windows.Common;

interface

uses
  WinApi.Windows;

  {$Z4}

const
  POWER_SYSTEM_MAXIMUM = 7;
  {$EXTERNALSYM POWER_SYSTEM_MAXIMUM}

type
  TRelationship = record
    Flag: DWORD;
    Desc: String;
  end;

  _DEVICE_POWER_STATE = (
    PowerDeviceUnspecified,
    PowerDeviceD0,
    PowerDeviceD1,
    PowerDeviceD2,
    PowerDeviceD3,
    PowerDeviceMaximum);
  {$EXTERNALSYM _DEVICE_POWER_STATE}
  DEVICE_POWER_STATE = _DEVICE_POWER_STATE;
  {$EXTERNALSYM DEVICE_POWER_STATE}
  PDEVICE_POWER_STATE = ^DEVICE_POWER_STATE;
  {$EXTERNALSYM PDEVICE_POWER_STATE}
  TDevicePowerState = DEVICE_POWER_STATE;
  PDevicePowerState = PDEVICE_POWER_STATE;

  _SYSTEM_POWER_STATE = (
    PowerSystemUnspecified,
    PowerSystemWorking,
    PowerSystemSleeping1,
    PowerSystemSleeping2,
    PowerSystemSleeping3,
    PowerSystemHibernate,
    PowerSystemShutdown,
    PowerSystemMaximum);
  {$EXTERNALSYM _SYSTEM_POWER_STATE}
  SYSTEM_POWER_STATE = _SYSTEM_POWER_STATE;
  {$EXTERNALSYM SYSTEM_POWER_STATE}
  PSYSTEM_POWER_STATE = ^SYSTEM_POWER_STATE;
  {$EXTERNALSYM PSYSTEM_POWER_STATE}
  TSystemPowerState = SYSTEM_POWER_STATE;
  PSystemPowerState = PSYSTEM_POWER_STATE;

  TCM_Power_Data  = record
    PD_Size: DWORD;
    PD_MostRecentPowerState: DEVICE_POWER_STATE;
    PD_Capabilities,
    PD_D1Latency,
    PD_D2Latency,
    PD_D3Latency: ULONG;
    PD_PowerStateMapping: array [0..POWER_SYSTEM_MAXIMUM - 1] of DEVICE_POWER_STATE;
    PD_DeepestSystemWake: SYSTEM_POWER_STATE;
  end;

const
//
// Device registry property codes
// (Codes marked as read-only (R) may only be used for
// SetupDiGetDeviceRegistryProperty)
//
// These values should cover the same set of registry properties
// as defined by the CM_DRP codes in cfgmgr32.h.
//

  SPDRP_DEVICEDESC                  = $00000000; // DeviceDesc (R/W)
  {$EXTERNALSYM SPDRP_DEVICEDESC}
  SPDRP_HARDWAREID                  = $00000001; // HardwareID (R/W)
  {$EXTERNALSYM SPDRP_HARDWAREID}
  SPDRP_COMPATIBLEIDS               = $00000002; // CompatibleIDs (R/W)
  {$EXTERNALSYM SPDRP_COMPATIBLEIDS}
  SPDRP_UNUSED0                     = $00000003; // unused
  {$EXTERNALSYM SPDRP_UNUSED0}
  SPDRP_SERVICE                     = $00000004; // Service (R/W)
  {$EXTERNALSYM SPDRP_SERVICE}
  SPDRP_UNUSED1                     = $00000005; // unused
  {$EXTERNALSYM SPDRP_UNUSED1}
  SPDRP_UNUSED2                     = $00000006; // unused
  {$EXTERNALSYM SPDRP_UNUSED2}
  SPDRP_CLASS                       = $00000007; // Class (R--tied to ClassGUID)
  {$EXTERNALSYM SPDRP_CLASS}
  SPDRP_CLASSGUID                   = $00000008; // ClassGUID (R/W)
  {$EXTERNALSYM SPDRP_CLASSGUID}
  SPDRP_DRIVER                      = $00000009; // Driver (R/W)
  {$EXTERNALSYM SPDRP_DRIVER}
  SPDRP_CONFIGFLAGS                 = $0000000A; // ConfigFlags (R/W)
  {$EXTERNALSYM SPDRP_CONFIGFLAGS}
  SPDRP_MFG                         = $0000000B; // Mfg (R/W)
  {$EXTERNALSYM SPDRP_MFG}
  SPDRP_FRIENDLYNAME                = $0000000C; // FriendlyName (R/W)
  {$EXTERNALSYM SPDRP_FRIENDLYNAME}
  SPDRP_LOCATION_INFORMATION        = $0000000D; // LocationInformation (R/W)
  {$EXTERNALSYM SPDRP_LOCATION_INFORMATION}
  SPDRP_PHYSICAL_DEVICE_OBJECT_NAME = $0000000E; // PhysicalDeviceObjectName (R)
  {$EXTERNALSYM SPDRP_PHYSICAL_DEVICE_OBJECT_NAME}
  SPDRP_CAPABILITIES                = $0000000F; // Capabilities (R)
  {$EXTERNALSYM SPDRP_CAPABILITIES}
  SPDRP_UI_NUMBER                   = $00000010; // UiNumber (R)
  {$EXTERNALSYM SPDRP_UI_NUMBER}
  SPDRP_UPPERFILTERS                = $00000011; // UpperFilters (R/W)
  {$EXTERNALSYM SPDRP_UPPERFILTERS}
  SPDRP_LOWERFILTERS                = $00000012; // LowerFilters (R/W)
  {$EXTERNALSYM SPDRP_LOWERFILTERS}
  SPDRP_BUSTYPEGUID                 = $00000013; // BusTypeGUID (R)
  {$EXTERNALSYM SPDRP_BUSTYPEGUID}
  SPDRP_LEGACYBUSTYPE               = $00000014; // LegacyBusType (R)
  {$EXTERNALSYM SPDRP_LEGACYBUSTYPE}
  SPDRP_BUSNUMBER                   = $00000015; // BusNumber (R)
  {$EXTERNALSYM SPDRP_BUSNUMBER}
  SPDRP_ENUMERATOR_NAME             = $00000016; // Enumerator Name (R)
  {$EXTERNALSYM SPDRP_ENUMERATOR_NAME}
  SPDRP_SECURITY                    = $00000017; // Security (R/W, binary form)
  {$EXTERNALSYM SPDRP_SECURITY}
  SPDRP_SECURITY_SDS                = $00000018; // Security (W, SDS form)
  {$EXTERNALSYM SPDRP_SECURITY_SDS}
  SPDRP_DEVTYPE                     = $00000019; // Device Type (R/W)
  {$EXTERNALSYM SPDRP_DEVTYPE}
  SPDRP_EXCLUSIVE                   = $0000001A; // Device is exclusive-access (R/W)
  {$EXTERNALSYM SPDRP_EXCLUSIVE}
  SPDRP_CHARACTERISTICS             = $0000001B; // Device Characteristics (R/W)
  {$EXTERNALSYM SPDRP_CHARACTERISTICS}
  SPDRP_ADDRESS                     = $0000001C; // Device Address (R)
  {$EXTERNALSYM SPDRP_ADDRESS}
  SPDRP_UI_NUMBER_DESC_FORMAT       = $0000001D; // UiNumberDescFormat (R/W)
  {$EXTERNALSYM SPDRP_UI_NUMBER_DESC_FORMAT}
  SPDRP_DEVICE_POWER_DATA           = $0000001E;
  {$EXTERNALSYM SPDRP_DEVICE_POWER_DATA}
  SPDRP_REMOVAL_POLICY              = $0000001F;
  {$EXTERNALSYM SPDRP_REMOVAL_POLICY}
  SPDRP_REMOVAL_POLICY_HW_DEFAULT   = $00000020;
  {$EXTERNALSYM SPDRP_REMOVAL_POLICY_HW_DEFAULT}
  SPDRP_REMOVAL_POLICY_OVERRIDE     = $00000021;
  {$EXTERNALSYM SPDRP_REMOVAL_POLICY_OVERRIDE}
  SDRP_INSTALL_STATE                = $00000022;
  {$EXTERNALSYM SDRP_INSTALL_STATE}

  //
  // Capabilities bits (the capability value is returned from calling
  // CM_Get_DevInst_Registry_Property with CM_DRP_CAPABILITIES property)
  //
  CM_DEVCAP_LOCKSUPPORTED     = $00000001;
  {$EXTERNALSYM CM_DEVCAP_LOCKSUPPORTED}
  CM_DEVCAP_EJECTSUPPORTED    = $00000002;
  {$EXTERNALSYM CM_DEVCAP_EJECTSUPPORTED}
  CM_DEVCAP_REMOVABLE         = $00000004;
  {$EXTERNALSYM CM_DEVCAP_REMOVABLE}
  CM_DEVCAP_DOCKDEVICE        = $00000008;
  {$EXTERNALSYM CM_DEVCAP_DOCKDEVICE}
  CM_DEVCAP_UNIQUEID          = $00000010;
  {$EXTERNALSYM CM_DEVCAP_UNIQUEID}
  CM_DEVCAP_SILENTINSTALL     = $00000020;
  {$EXTERNALSYM CM_DEVCAP_SILENTINSTALL}
  CM_DEVCAP_RAWDEVICEOK       = $00000040;
  {$EXTERNALSYM CM_DEVCAP_RAWDEVICEOK}
  CM_DEVCAP_SURPRISEREMOVALOK = $00000080;
  {$EXTERNALSYM CM_DEVCAP_SURPRISEREMOVALOK}
  CM_DEVCAP_HARDWAREDISABLED  = $00000100;
  {$EXTERNALSYM CM_DEVCAP_HARDWAREDISABLED}
  CM_DEVCAP_NONDYNAMIC        = $00000200;
  {$EXTERNALSYM CM_DEVCAP_NONDYNAMIC}

  //
  // Removal policies (retrievable via CM_Get_DevInst_Registry_Property with
  // the CM_DRP_REMOVAL_POLICY, CM_DRP_REMOVAL_POLICY_OVERRIDE, or
  // CM_DRP_REMOVAL_POLICY_HW_DEFAULT properties)
  //
  CM_REMOVAL_POLICY_EXPECT_NO_REMOVAL             = 1;
  {$EXTERNALSYM CM_REMOVAL_POLICY_EXPECT_NO_REMOVAL}
  CM_REMOVAL_POLICY_EXPECT_ORDERLY_REMOVAL        = 2;
  {$EXTERNALSYM CM_REMOVAL_POLICY_EXPECT_ORDERLY_REMOVAL}
  CM_REMOVAL_POLICY_EXPECT_SURPRISE_REMOVAL       = 3;
  {$EXTERNALSYM CM_REMOVAL_POLICY_EXPECT_SURPRISE_REMOVAL}

  //
  // Device install states (retrievable via CM_Get_DevInst_Registry_Property with
  // the CM_DRP_INSTALL_STATE properties)
  //
  CM_INSTALL_STATE_INSTALLED                      = 0;
  {$EXTERNALSYM CM_INSTALL_STATE_INSTALLED}
  CM_INSTALL_STATE_NEEDS_REINSTALL                = 1;
  {$EXTERNALSYM CM_INSTALL_STATE_NEEDS_REINSTALL}
  CM_INSTALL_STATE_FAILED_INSTALL                 = 2;
  {$EXTERNALSYM CM_INSTALL_STATE_FAILED_INSTALL}
  CM_INSTALL_STATE_FINISH_INSTALL                 = 3;
  {$EXTERNALSYM CM_INSTALL_STATE_FINISH_INSTALL}

  CapabilitiesRelationships: array [0..9] of TRelationship =
    (
      (Flag: CM_DEVCAP_LOCKSUPPORTED; Desc: 'CM_DEVCAP_LOCKSUPPORTED'),
      (Flag: CM_DEVCAP_EJECTSUPPORTED; Desc: 'CM_DEVCAP_EJECTSUPPORTED'),
      (Flag: CM_DEVCAP_REMOVABLE; Desc: 'CM_DEVCAP_REMOVABLE'),
      (Flag: CM_DEVCAP_DOCKDEVICE; Desc: 'CM_DEVCAP_DOCKDEVICE'),
      (Flag: CM_DEVCAP_UNIQUEID; Desc: 'CM_DEVCAP_UNIQUEID'),
      (Flag: CM_DEVCAP_SILENTINSTALL; Desc: 'CM_DEVCAP_SILENTINSTALL'),
      (Flag: CM_DEVCAP_RAWDEVICEOK; Desc: 'CM_DEVCAP_RAWDEVICEOK'),
      (Flag: CM_DEVCAP_SURPRISEREMOVALOK; Desc: 'CM_DEVCAP_SURPRISEREMOVALOK'),
      (Flag: CM_DEVCAP_HARDWAREDISABLED; Desc: 'CM_DEVCAP_HARDWAREDISABLED'),
      (Flag: CM_DEVCAP_NONDYNAMIC; Desc: 'CM_DEVCAP_NONDYNAMIC')
    );


  CONFIGFLAG_DISABLED            = $00000001; // Set if disabled
  {$EXTERNALSYM CONFIGFLAG_DISABLED}
  CONFIGFLAG_REMOVED             = $00000002; // Set if a present hardware enum device deleted
  {$EXTERNALSYM CONFIGFLAG_REMOVED}
  CONFIGFLAG_MANUAL_INSTALL      = $00000004; // Set if the devnode was manually installed
  {$EXTERNALSYM CONFIGFLAG_MANUAL_INSTALL}
  CONFIGFLAG_IGNORE_BOOT_LC      = $00000008; // Set if skip the boot config
  {$EXTERNALSYM CONFIGFLAG_IGNORE_BOOT_LC}
  CONFIGFLAG_NET_BOOT            = $00000010; // Load this devnode when in net boot
  {$EXTERNALSYM CONFIGFLAG_NET_BOOT}
  CONFIGFLAG_REINSTALL           = $00000020; // Redo install
  {$EXTERNALSYM CONFIGFLAG_REINSTALL}
  CONFIGFLAG_FAILEDINSTALL       = $00000040; // Failed the install
  {$EXTERNALSYM CONFIGFLAG_FAILEDINSTALL}
  CONFIGFLAG_CANTSTOPACHILD      = $00000080; // Can't stop/remove a single child
  {$EXTERNALSYM CONFIGFLAG_CANTSTOPACHILD}
  CONFIGFLAG_OKREMOVEROM         = $00000100; // Can remove even if rom.
  {$EXTERNALSYM CONFIGFLAG_OKREMOVEROM}
  CONFIGFLAG_NOREMOVEEXIT        = $00000200; // Don't remove at exit.
  {$EXTERNALSYM CONFIGFLAG_NOREMOVEEXIT}
  CONFIGFLAG_FINISH_INSTALL      = $00000400; // Complete install for devnode running 'raw'
  {$EXTERNALSYM CONFIGFLAG_FINISH_INSTALL}
  CONFIGFLAG_NEEDS_FORCED_CONFIG = $00000800; // This devnode requires a forced config
  {$EXTERNALSYM CONFIGFLAG_NEEDS_FORCED_CONFIG}
  CONFIGFLAG_NETBOOT_CARD = $00001000; // This is the remote boot network card
  {$EXTERNALSYM CONFIGFLAG_NETBOOT_CARD}
  CONFIGFLAG_PARTIAL_LOG_CONF    = $00002000; // This device has a partial logconfig
  {$EXTERNALSYM CONFIGFLAG_PARTIAL_LOG_CONF}
  CONFIGFLAG_SUPPRESS_SURPRISE   = $00004000; // Set if unsafe removals should be ignored
  {$EXTERNALSYM CONFIGFLAG_SUPPRESS_SURPRISE}
  CONFIGFLAG_VERIFY_HARDWARE     = $00008000; // Set if hardware should be tested for logo failures
  {$EXTERNALSYM CONFIGFLAG_VERIFY_HARDWARE}

  ConfigFlagRelationships: array [0..15] of TRelationship =
    (
      (Flag: CONFIGFLAG_DISABLED; Desc: 'CONFIGFLAG_DISABLED'),
      (Flag: CONFIGFLAG_REMOVED; Desc: 'CONFIGFLAG_REMOVED'),
      (Flag: CONFIGFLAG_MANUAL_INSTALL; Desc: 'CONFIGFLAG_MANUAL_INSTALL'),
      (Flag: CONFIGFLAG_IGNORE_BOOT_LC; Desc: 'CONFIGFLAG_IGNORE_BOOT_LC'),
      (Flag: CONFIGFLAG_NET_BOOT; Desc: 'CONFIGFLAG_NET_BOOT'),
      (Flag: CONFIGFLAG_REINSTALL; Desc: 'CONFIGFLAG_REINSTALL'),
      (Flag: CONFIGFLAG_FAILEDINSTALL; Desc: 'CONFIGFLAG_FAILEDINSTALL'),
      (Flag: CONFIGFLAG_CANTSTOPACHILD; Desc: 'CONFIGFLAG_CANTSTOPACHILD'),
      (Flag: CONFIGFLAG_OKREMOVEROM; Desc: 'CONFIGFLAG_OKREMOVEROM'),
      (Flag: CONFIGFLAG_NOREMOVEEXIT; Desc: 'CONFIGFLAG_NOREMOVEEXIT'),
      (Flag: CONFIGFLAG_FINISH_INSTALL; Desc: 'CONFIGFLAG_FINISH_INSTALL'),
      (Flag: CONFIGFLAG_NEEDS_FORCED_CONFIG; Desc: 'CONFIGFLAG_NEEDS_FORCED_CONFIG'),
      (Flag: CONFIGFLAG_NETBOOT_CARD; Desc: 'CONFIGFLAG_NETBOOT_CARD'),
      (Flag: CONFIGFLAG_PARTIAL_LOG_CONF; Desc: 'CONFIGFLAG_PARTIAL_LOG_CONF'),
      (Flag: CONFIGFLAG_SUPPRESS_SURPRISE; Desc: 'CONFIGFLAG_SUPPRESS_SURPRISE'),
      (Flag: CONFIGFLAG_VERIFY_HARDWARE; Desc: 'CONFIGFLAG_VERIFY_HARDWARE')
    );

//-----------------------------------------------------------------------------
// Device Power Information
// Accessable via CM_Get_DevInst_Registry_Property_Ex(CM_DRP_DEVICE_POWER_DATA)
//-----------------------------------------------------------------------------

  PDCAP_D0_SUPPORTED           = $00000001;
  {$EXTERNALSYM PDCAP_D0_SUPPORTED}
  PDCAP_D1_SUPPORTED           = $00000002;
  {$EXTERNALSYM PDCAP_D1_SUPPORTED}
  PDCAP_D2_SUPPORTED           = $00000004;
  {$EXTERNALSYM PDCAP_D2_SUPPORTED}
  PDCAP_D3_SUPPORTED           = $00000008;
  {$EXTERNALSYM PDCAP_D3_SUPPORTED}
  PDCAP_WAKE_FROM_D0_SUPPORTED = $00000010;
  {$EXTERNALSYM PDCAP_WAKE_FROM_D0_SUPPORTED}
  PDCAP_WAKE_FROM_D1_SUPPORTED = $00000020;
  {$EXTERNALSYM PDCAP_WAKE_FROM_D1_SUPPORTED}
  PDCAP_WAKE_FROM_D2_SUPPORTED = $00000040;
  {$EXTERNALSYM PDCAP_WAKE_FROM_D2_SUPPORTED}
  PDCAP_WAKE_FROM_D3_SUPPORTED = $00000080;
  {$EXTERNALSYM PDCAP_WAKE_FROM_D3_SUPPORTED}
  PDCAP_WARM_EJECT_SUPPORTED   = $00000100;
  {$EXTERNALSYM PDCAP_WARM_EJECT_SUPPORTED}

  PDCAPRelationships: array [0..8] of TRelationship =
    (
      (Flag: PDCAP_D0_SUPPORTED; Desc: 'PDCAP_D0_SUPPORTED'),
      (Flag: PDCAP_D1_SUPPORTED; Desc: 'PDCAP_D1_SUPPORTED'),
      (Flag: PDCAP_D2_SUPPORTED; Desc: 'PDCAP_D2_SUPPORTED'),
      (Flag: PDCAP_D3_SUPPORTED; Desc: 'PDCAP_D3_SUPPORTED'),
      (Flag: PDCAP_WAKE_FROM_D0_SUPPORTED; Desc: 'PDCAP_WAKE_FROM_D0_SUPPORTED'),
      (Flag: PDCAP_WAKE_FROM_D1_SUPPORTED; Desc: 'PDCAP_WAKE_FROM_D1_SUPPORTED'),
      (Flag: PDCAP_WAKE_FROM_D2_SUPPORTED; Desc: 'PDCAP_WAKE_FROM_D2_SUPPORTED'),
      (Flag: PDCAP_WAKE_FROM_D3_SUPPORTED; Desc: 'PDCAP_WAKE_FROM_D3_SUPPORTED'),
      (Flag: PDCAP_WARM_EJECT_SUPPORTED; Desc: 'PDCAP_WARM_EJECT_SUPPORTED')
    );

function HasFlag(const Value, dwFlag: DWORD): Boolean;
procedure AddToResult(var AResult: String; const Value: String);
function ExtractMultiString(const Value: String): String;

implementation

function HasFlag(const Value, dwFlag: DWORD): Boolean;
begin
  Result := (Value and dwFlag) = dwFlag;
end;

procedure AddToResult(var AResult: String; const Value: String);
begin
  if AResult = '' then
    AResult := Value
  else
    AResult := AResult + ', ' + Value;
end;

function ExtractMultiString(const Value: String): String;
var
  P: PChar;
begin
  P := @Value[1];
  while P^ <> #0 do
  begin
    if Result <> '' then
      Result := Result + ', ';
    Result := Result + P;
    Inc(P, lstrlen(P) + 1);
  end;
end;

end.
