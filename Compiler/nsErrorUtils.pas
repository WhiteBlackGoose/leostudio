unit nsErrorUtils;

interface

uses
  nsTypes;

function NS_GetErrorStringBundle(aErrorModule: PRInt16): AnsiString;
function NS_GetErrorStringBundleKey(aError: nsresult): AnsiString;

implementation

uses
  nsInit, nsXPCOMGlue, nsXPCOM, nsConsts, nsError;

type
  nsIErrorService = interface;

  nsIErrorService = interface(nsISupports)
  ['{e72f94b2-5f85-11d4-9877-00c04fa0cf4a}']
    function registerErrorStringBundle(
                aErrorModule: PRInt16;
                aStringBundleURL: PAnsiChar): nsresult; stdcall;
    function unregisterErrorStringBundle(
                aErrorModule: PRInt16): nsresult; stdcall;
    function getErrorStringBundle(
                aErrorModule: PRInt16;
                out aResult: PAnsiChar): nsresult; stdcall;
    function registerErrorStringBundleKey(
                aError: nsresult;
                aStringBundleKey: PAnsiChar): nsresult; stdcall;
    function unregisterErrorStringBundleKey(
                aError: nsresult): nsresult; stdcall;
    function getErrorStringBundleKey(
                aError: nsresult;
                out aResult: PAnsiChar): nsresult; stdcall;
  end;

const
  NS_IERRORSERVICE_CID: TGUID = '{e72f94b2-5f85-11d4-9877-00c04fa0cf4a}';
  NS_ERRORSERVICE_NAME = 'Error Service';
  NS_ERRORSERVICE_CONTRACTID = '@mozilla.org/xpcom/error-service;1';
  NS_ERRORSERVICE_CID: TGUID = '{744afd5e-5f8c-11d4-9877-00c04fa0cf4a}';

var
  sErrorService: nsIErrorService = nil;

function ENSURE_ErrorService(): nsIErrorService;
var
  es: nsIErrorService;
begin
  if not Assigned(sErrorService) then
  begin
    try
      NS_GetService(NS_ERRORSERVICE_CONTRACTID, nsIErrorService, es);
      sErrorService := es;
    except
    end;
  end;
  Result := sErrorService;
end;

function NS_GetErrorStringBundle(aErrorModule: PRInt16): AnsiString;
var
  es: nsIErrorService;
  rv: nsresult;
  str: PAnsiChar;
begin
  es := ENSURE_ErrorService();
  if Assigned(es) then
  begin
    rv := es.getErrorStringBundle(aErrorModule, str);
    if NS_SUCCEEDED(rv) then
      Result := str;
  end;
end;

function NS_GetErrorStringBundleKey(aError: nsresult): AnsiString;
var
  es: nsIErrorService;
  rv: nsresult;
  str: PAnsiChar;
begin
  es := ENSURE_ErrorService();
  if Assigned(es) then
  begin
    rv := es.getErrorStringBundleKey(aError, str);
    if NS_SUCCEEDED(rv) then
      Result := str;
  end;
end;

end.
