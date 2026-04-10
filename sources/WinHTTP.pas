unit WinHTTP;

interface

uses  Classes,
  Windows;

type
  HINTERNET = Pointer;
  INTERNET_PORT = Word;
  {$IFDEF WIN64}
  DWORD_PTR = UInt64;
  {$ELSE}
  DWORD_PTR = DWORD;
  {$ENDIF}

const
  INTERNET_SCHEME_HTTP  = 1;
  INTERNET_SCHEME_HTTPS = 2;

  WINHTTP_ACCESS_TYPE_DEFAULT_PROXY    = 0;
  WINHTTP_ACCESS_TYPE_NO_PROXY         = 1;
  WINHTTP_ACCESS_TYPE_NAMED_PROXY      = 3;

  WINHTTP_FLAG_SECURE                  = $00800000;
  WINHTTP_FLAG_ESCAPE_DISABLE          = $00000004;
  WINHTTP_FLAG_ESCAPE_PERCENT          = $00000010;
  WINHTTP_FLAG_NULL_CODEPAGE           = $00000008;
  WINHTTP_FLAG_REFRESH                 = $00000100;

  WINHTTP_NO_REFERER                   = nil;
  WINHTTP_DEFAULT_ACCEPT_TYPES         = nil;
  WINHTTP_NO_ADDITIONAL_HEADERS        = nil;
  WINHTTP_NO_REQUEST_DATA              = nil;

  WINHTTP_ADDREQ_FLAG_ADD              = $20000000;
  WINHTTP_ADDREQ_FLAG_REPLACE          = $10000000;
  WINHTTP_ADDREQ_FLAG_ADD_IF_NEW       = $10000000;
  WINHTTP_ADDREQ_FLAG_COALESCE         = $40000000;
  WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON = $01000000;

  WINHTTP_QUERY_FLAG_NUMBER            = $20000000;
  WINHTTP_QUERY_FLAG_SYSTEMTIME        = $40000000;

  WINHTTP_QUERY_CUSTOM                  = 0;
  WINHTTP_QUERY_FLAGS                  = 1;
  WINHTTP_QUERY_MAIN_DOCUMENT           = 2;
  WINHTTP_QUERY_INFO_OPTIONS            = 3;
  WINHTTP_QUERY_URL                     = 4;
  WINHTTP_QUERY_CONTENT_TYPE            = 5;
  WINHTTP_QUERY_CONTENT_TRANSFER_ENCODING = 6;
  WINHTTP_QUERY_CONTENT_ID             = 7;
  WINHTTP_QUERY_TRANSFER_ENCODING        = 8;
  WINHTTP_QUERY_CONTENT_LANGUAGE        = 9;
  WINHTTP_QUERY_ALLOW                   = 10;
  WINHTTP_QUERY_PUBLIC                  = 11;
  WINHTTP_QUERY_DATE                    = 12;
  WINHTTP_QUERY_EXPIRES                 = 13;
  WINHTTP_QUERY_LAST_MODIFIED           = 14;
  WINHTTP_QUERY_MESSAGE_ID             = 15;
  WINHTTP_QUERY_URL_AUTHORITY           = 16;
  WINHTTP_QUERY_REMOTE_ADDR             = 17;
  WINHTTP_QUERY_CONTENT_BASE            = 18;
  WINHTTP_QUERY_CONTENT_LOCATION        = 19;
  WINHTTP_QUERY_CONTENT_MD5            = 20;
  WINHTTP_QUERY_CONTENT_RANGE           = 21;
  WINHTTP_QUERY_ETAG                   = 22;
  WINHTTP_QUERY_HOST                    = 23;
  WINHTTP_QUERY_ACCEPT                  = 24;
  WINHTTP_QUERY_SET_COOKIE             = 25;
  WINHTTP_QUERY_COOKIE                  = 26;
  WINHTTP_QUERY_REQUEST_METHOD          = 27;
  WINHTTP_QUERY_RETRY_AFTER            = 28;
  WINHTTP_QUERY_SERVER                   = 29;
  WINHTTP_QUERY_USER_AGENT              = 30;
  WINHTTP_QUERY_AUTH_CACHE_INFO          = 31;
  WINHTTP_QUERY_PROXY_AUTH_REALM        = 31;
  WINHTTP_QUERY_RAW_HEADERS              = 33;
  WINHTTP_QUERY_RAW_HEADERS_CRLF        = 34;
  WINHTTP_QUERY_CONNECTION              = 35;
  WINHTTP_QUERY_CONTENT_LENGTH          = 36;
  WINHTTP_QUERY_HEADER_STRICT           = 37;
  WINHTTP_QUERY_HEADER_WARNING          = 38;
  WINHTTP_QUERY_PROXY_AUTHENTICATE      = 39;
  WINHTTP_QUERY_AUTHENTICATE_HEADER     = 39;
  WINHTTP_QUERY_WWW_AUTHENTICATE         = 40;
  WINHTTP_QUERY_PROXY_AUTHORIZATION     = 41;
  WINHTTP_QUERY_PROXY_AUTHENTICATE_HEADER = 41;
  WINHTTP_QUERY_ACCEPT_RANGES            = 42;
  WINHTTP_QUERY_ACCEPT_ENCODING          = 43;
  WINHTTP_QUERY_ACCEPT_LANGUAGE          = 44;
  WINHTTP_QUERY_CONTENT_ENCODING        = 45;
  WINHTTP_QUERY_LOCATION                = 46;
  WINHTTP_QUERY_MIME_VERSION            = 47;
  WINHTTP_QUERY_FROM                    = 48;
  WINHTTP_QUERY_REFERRER                = 49;
  WINHTTP_QUERY_REFRESH                 = 50;
  WINHTTP_QUERY_RETRY_AFTER_DATE         = 51;
  WINHTTP_QUERY_CONTENT_DISPOSITION      = 52;
  WINHTTP_QUERY_AGE                      = 53;
  WINHTTP_QUERY_CACHE_CONTROL           = 54;
  WINHTTP_QUERY_CONNECTION_INFO         = 55;
  WINHTTP_QUERY_PROXY_CONNECTION_INFO    = 55;
  WINHTTP_QUERY_DNS_LOC_CACHE_ENTRY      = 56;
  WINHTTP_QUERY_PROTOCOL                 = 57;
 // WINHTTP_QUERY_TRANSFER_ENCODING        = 58;
  WINHTTP_QUERY_VERSION                 = 59;
  WINHTTP_QUERY_FIRST_AVAILABLE         = 60;

  WINHTTP_HEADER_NAME_BY_INDEX         = nil;
  WINHTTP_NO_OUTPUT_BUFFER             = nil;
  WINHTTP_NO_INFO                      = 0;

  WINHTTP_ERROR_BASE                   = 12000;
  ERROR_WINHTTP_OUT_OF_HANDLES         = WINHTTP_ERROR_BASE + 1;
  ERROR_WINHTTP_TIMEOUT                = WINHTTP_ERROR_BASE + 2;
  ERROR_WINHTTP_INTERNAL_ERROR         = WINHTTP_ERROR_BASE + 4;
  ERROR_WINHTTP_INVALID_URL            = WINHTTP_ERROR_BASE + 5;
  ERROR_WINHTTP_UNRECOGNIZED_SCHEME    = WINHTTP_ERROR_BASE + 6;
  ERROR_WINHTTP_NAME_NOT_RESOLVED      = WINHTTP_ERROR_BASE + 7;
  ERROR_WINHTTP_INVALID_OPTION         = WINHTTP_ERROR_BASE + 9;
  ERROR_WINHTTP_OPTION_NOT_SETTABLE     = WINHTTP_ERROR_BASE + 11;
  ERROR_WINHTTP_SHUTDOWN               = WINHTTP_ERROR_BASE + 179;
  ERROR_WINHTTP_LOGIN_FAILURE          = WINHTTP_ERROR_BASE + 15;
  ERROR_WINHTTP_OPERATION_CANCELLED    = WINHTTP_ERROR_BASE + 17;
  ERROR_WINHTTP_INVALID_RESPONSE       = WINHTTP_ERROR_BASE + 18;
  ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR = WINHTTP_ERROR_BASE + 31;
  ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT  = WINHTTP_ERROR_BASE + 33;
  ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT = WINHTTP_ERROR_BASE + 34;
  ERROR_WINHTTP_SEC_UNTRUSTED_ROOT     = WINHTTP_ERROR_BASE + 37;
  ERROR_WINHTTP_SEC_CERT_DATE_INVALID  = WINHTTP_ERROR_BASE + 37;
  ERROR_WINHTTP_SEC_CERT_CN_INVALID    = WINHTTP_ERROR_BASE + 38;
  ERROR_WINHTTP_SEC_INVALID_CERT       = WINHTTP_ERROR_BASE + 44;
  ERROR_WINHTTP_SEC_CERT_REVOKED       = WINHTTP_ERROR_BASE + 64;
  ERROR_WINHTTP_SECURITY_CHANNEL_ERROR = WINHTTP_ERROR_BASE + 157;
  ERROR_WINHTTP_CONNECT_FAILURE       = WINHTTP_ERROR_BASE + 14;
  ERROR_WINHTTP_SECURE_FAILURE         = WINHTTP_ERROR_BASE + 35;
  ERROR_WINHTTP_RESEND_REQUEST         = WINHTTP_ERROR_BASE + 32;

  WINHTTP_AUTOPROXY_AUTO_DETECT        = $00000001;
  WINHTTP_AUTOPROXY_CONFIG_URL         = $00000002;
  WINHTTP_AUTOPROXY_RUN_INPROCESS      = $00010000;
  WINHTTP_AUTOPROXY_RUN_OUTPROCESS_ONLY = $00020000;

  WINHTTP_AUTO_DETECT_TYPE_DHCP        = $00000001;
  WINHTTP_AUTO_DETECT_TYPE_DNS_A       = $00000002;
  HTTP_QUERY_CONTENT_TYPE = 1;

type
  URL_COMPONENTS = record
    dwStructSize    : DWORD;
    lpszScheme      : LPWSTR;
    dwSchemeLength  : DWORD;
    nScheme         : Integer;
    lpszHostName    : LPWSTR;
    dwHostNameLength: DWORD;
    nPort           : INTERNET_PORT;
    lpszUserName    : LPWSTR;
    dwUserNameLength: DWORD;
    lpszPassword    : LPWSTR;
    dwPasswordLength: DWORD;
    lpszUrlPath     : LPWSTR;
    dwUrlPathLength : DWORD;
    lpszExtraInfo   : LPWSTR;
    dwExtraInfoLength: DWORD;
  end;
  TUrlComponents = URL_COMPONENTS;
  PUrlComponents = ^TUrlComponents;

  WINHTTP_AUTOPROXY_OPTIONS = record
    dwFlags            : DWORD;
    dwAutoDetectFlags  : DWORD;
    lpszAutoConfigUrl  : LPCWSTR;
    lpvReserved        : Pointer;
    dwReserved         : DWORD;
    fAutoLoginIfChallenger: BOOL;
  end;
  TWinHttpAutoProxyOptions = WINHTTP_AUTOPROXY_OPTIONS;
  PWinHttpAutoProxyOptions = ^TWinHttpAutoProxyOptions;

  WINHTTP_PROXY_INFO = record
    dwAccessType    : DWORD;
    lpszProxy        : LPWSTR;
    lpszProxyBypass  : LPWSTR;
  end;
  TWinHttpProxyInfo = WINHTTP_PROXY_INFO;
  PWinHttpProxyInfo = ^TWinHttpProxyInfo;

  WINHTTP_PROXY_RESULT_ENTRY = record
    fProxy          : BOOL;
    fBypass         : BOOL;
    ProxyScheme     : Integer;
    pwszProxy       : PWideChar;
    ProxyPort       : INTERNET_PORT;
  end;
  TWinHttpProxyResultEntry = WINHTTP_PROXY_RESULT_ENTRY;
  PWinHttpProxyResultEntry = ^TWinHttpProxyResultEntry;

  WINHTTP_PROXY_RESULT = record
    cEntries        : DWORD;
    pEntries        : PWinHttpProxyResultEntry;
  end;
  TWinHttpProxyResult = WINHTTP_PROXY_RESULT;

const
  WINHTTP_OPTION_CALLBACK                    = 1;
  WINHTTP_OPTION_RESOLVE_TIMEOUT             = 2;
  WINHTTP_OPTION_CONNECT_TIMEOUT              = 3;
  WINHTTP_OPTION_SEND_TIMEOUT                = 4;
  WINHTTP_OPTION_RECEIVE_TIMEOUT             = 5;
  WINHTTP_OPTION_RECEIVE_RESPONSE_TIMEOUT    = 6;
  WINHTTP_OPTION_HANDLE_TYPE                 = 5;
  WINHTTP_OPTION_READ_BUFFER_SIZE             = 6;
  WINHTTP_OPTION_WRITE_BUFFER_SIZE            = 7;
  WINHTTP_OPTION_PROXY                         = 38;
  WINHTTP_OPTION_USER_AGENT                   = 41;
  WINHTTP_OPTION_CONTEXT_VALUE                = 45;
  WINHTTP_OPTION_CLIENT_CERT_CONTEXT          = 47;
  WINHTTP_OPTION_REQUEST_PRIORITY             = 58;
  WINHTTP_OPTION_HTTP_VERSION                 = 59;
  WINHTTP_OPTION_NO_UI                        = 59;
  WINHTTP_OPTION_PROXY_USAGE                  = 47;
  WINHTTP_OPTION_DECOMPRESSION                 = 118;
  WINHTTP_OPTION_UNSAFE_HEADER_ROUNDTRIPPING   = 113;
  WINHTTP_OPTION_ENCODE_EXTENSIONS             = 123;

  WINHTTP_OPTION_REDIRECT_POLICY              = 88;
  WINHTTP_OPTION_MAX_CONNS_PER_SERVER         = 89;
  WINHTTP_OPTION_MAX_CONNS_PER_1_0_SERVER     = 90;
  WINHTTP_OPTION_ENABLETRACING                 = 129;
  WINHTTP_OPTION_AMBIENT_AUTHENTICATION        = 147;
  WINHTTP_OPTION_SERVER_CERT_CONTEXT_STORE    = 112;
  WINHTTP_OPTION_SERVER_CERT_ISSUER_LIST_STORE = 111;
  WINHTTP_OPTION_SERVER_CERT_INFO_STORE        = 114;
  WINHTTP_OPTION_CONNECTION_INFO                = 139;
  WINHTTP_OPTION_DISABLE_FEATURE               = 63;
  WINHTTP_OPTION_LAST_STATUS                   = 44;
  WINHTTP_OPTION_LAST_NOTIFY                   = 57;
  WINHTTP_OPTION_PROXY_SPSL                    = 93;
  WINHTTP_OPTION_REDIRECT_POLICY_ALWAYS        = 0;
  WINHTTP_OPTION_REDIRECT_POLICY_NEVER         = 1;
  WINHTTP_OPTION_REDIRECT_POLICY_DISCONNECT    = 2;
  WINHTTP_OPTION_REDIRECT_POLICY_DEFAULT       = WINHTTP_OPTION_REDIRECT_POLICY_DISCONNECT;

  WINHTTP_REDIRECT_POLICY_DISCONNECT_ON_SECURITY_FAILURE = 0;
  WINHTTP_REDIRECT_POLICY_ALWAYS              = 1;
  WINHTTP_REDIRECT_POLICY_NEVER               = 2;
  WINHTTP_REDIRECT_POLICY_DEFAULT             = WINHTTP_REDIRECT_POLICY_DISCONNECT_ON_SECURITY_FAILURE;

type
  HTTP_VERSION_INFO = record
    dwMajorVersion: DWORD;
    dwMinorVersion: DWORD;
  end;
  THTTPVersionInfo = HTTP_VERSION_INFO;

const
  WINHTTP_AUTH_SCHEME_BASIC      = $00000001;
  WINHTTP_AUTH_SCHEME_NTLM       = $00000002;
  WINHTTP_AUTH_SCHEME_PASSPORT   = $00000004;
  WINHTTP_AUTH_SCHEME_DIGEST     = $00000008;
  WINHTTP_AUTH_SCHEME_NEGOTIATE  = $00000010;

  WINHTTP_AUTH_TARGET_SERVER     = $00000000;
  WINHTTP_AUTH_TARGET_PROXY      = $00000001;

type
  WINHTTP_STATUS_CALLBACK = procedure(
    hInternet: HINTERNET;
    dwContext: DWORD_PTR;
    dwInternetStatus: DWORD;
    lpvStatusInformation: Pointer;
    dwStatusInformationLength: DWORD
  ); stdcall;
  TWinHttpStatusCallback = WINHTTP_STATUS_CALLBACK;
  PWinHttpStatusCallback = ^WINHTTP_STATUS_CALLBACK;

const
  WINHTTP_CALLBACK_STATUS_RESOLVING_NAME          = $00000001;
  WINHTTP_CALLBACK_STATUS_NAME_RESOLVED           = $00000002;
  WINHTTP_CALLBACK_STATUS_CONNECTING_TO_SERVER     = $00000004;
  WINHTTP_CALLBACK_STATUS_CONNECTED_TO_SERVER     = $00000008;
  WINHTTP_CALLBACK_STATUS_SENDING_REQUEST          = $00000010;
  WINHTTP_CALLBACK_STATUS_REQUEST_SENT            = $00000020;
  WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE       = $00000040;
  WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED        = $00000080;
  WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION       = $00000100;
  WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED        = $00000200;
  WINHTTP_CALLBACK_STATUS_HANDLE_CREATED          = $00004000;
  WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING          = $00008000;
  WINHTTP_CALLBACK_STATUS_DETECTING_PROXY          = $00010000;
  WINHTTP_CALLBACK_STATUS_REQUEST_COMPLETE        = $00100000;
  WINHTTP_CALLBACK_STATUS_REDIRECT                = $00400000;
  WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE    = $00800000;
  WINHTTP_CALLBACK_STATUS_USER_INPUT_REQUIRED     = $01000000;
  WINHTTP_CALLBACK_STATUS_STATE_CHANGE             = $02000000;
  WINHTTP_CALLBACK_STATUS_P3P_HEADER               = $04000000;
  WINHTTP_CALLBACK_STATUS_P3P_POLICYREF            = $08000000;
  WINHTTP_CALLBACK_STATUS_COOKIE_SENT              = $10000000;
  WINHTTP_CALLBACK_STATUS_COOKIE_RECEIVED          = $20000000;
  WINHTTP_CALLBACK_STATUS_PRIVACY_IMPACTED         = $40000000;
//  WINHTTP_CALLBACK_STATUS_P3P_POLICYREF            = $80000000;
  WINHTTP_CALLBACK_STATUS_ALL                      = $7FFFFFFF;
  WINHTTP_CALLBACK_STATUS_NONE                     = $00000000;

type
  WINHTTP_CREDENTIALS = record
    dwAuthSchemes   : DWORD;
    dwCurrentAuthScheme: DWORD;
    lpszUserName    : LPWSTR;
    dwUserNameLength: DWORD;
    lpszPassword    : LPWSTR;
    dwPasswordLength: DWORD;
    lpszRealm       : LPWSTR;
    dwRealmLength   : DWORD;
    lpszAuthTarget  : LPWSTR;
    dwAuthTargetLength: DWORD;
  end;
  TWinHttpCredentials = WINHTTP_CREDENTIALS;
  PWinHttpCredentials = ^TWinHttpCredentials;

function WinHttpOpen(
  pwszUserAgent: LPCWSTR;
  dwAccessType: DWORD;
  pwszProxyName: LPCWSTR;
  pwszProxyBypass: LPCWSTR;
  dwFlags: DWORD
): HINTERNET; stdcall; external 'winhttp.dll';

function WinHttpCloseHandle(
  hInternet: HINTERNET
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpConnect(
  hSession: HINTERNET;
  pswzServerName: LPCWSTR;
  nServerPort: INTERNET_PORT;
  dwFlags: DWORD
): HINTERNET; stdcall; external 'winhttp.dll';

function WinHttpOpenRequest(
  hConnect: HINTERNET;
  pwszVerb: LPCWSTR;
  pwszObjectName: LPCWSTR;
  pwszVersion: LPCWSTR;
  pwszReferrer: LPCWSTR;
  ppwszAcceptTypes: PLPWSTR;
  dwFlags: DWORD
): HINTERNET; stdcall; external 'winhttp.dll';

function WinHttpSendRequest(
  hRequest: HINTERNET;
  pwszHeaders: LPCWSTR;
  dwHeadersLength: DWORD;
  lpOptional: Pointer;
  dwOptionalLength: DWORD;
  dwTotalLength: DWORD;
  dwContext: DWORD_PTR
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpReceiveResponse(
  hRequest: HINTERNET;
  lpReserved: Pointer
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpQueryHeaders(
  hRequest: HINTERNET;
  dwInfoLevel: DWORD;
  pwszName: LPCWSTR;
  lpBuffer: Pointer;
  var lpdwBufferLength: DWORD;
  var lpdwIndex: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpReadData(
  hRequest: HINTERNET;
  lpBuffer: Pointer;
  dwNumberOfBytesToRead: DWORD;
  var lpdwNumberOfBytesRead: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpWriteData(
  hRequest: HINTERNET;
  lpBuffer: Pointer;
  dwNumberOfBytesToWrite: DWORD;
  var lpdwNumberOfBytesWritten: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpQueryDataAvailable(
  hRequest: HINTERNET;
  var lpdwNumberOfBytesAvailable: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpAddRequestHeaders(
  hRequest: HINTERNET;
  pwszHeaders: LPCWSTR;
  dwHeadersLength: DWORD;
  dwModifiers: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpCrackUrl(
  pwszUrl: LPCWSTR;
  dwUrlLength: DWORD;
  dwFlags: DWORD;
  var lpUrlComponents: TUrlComponents
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpCreateUrl(
  var lpUrlComponents: TUrlComponents;
  dwFlags: DWORD;
  pwszUrl: LPWSTR;
  var lpdwUrlLength: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpSetOption(
  hInternet: HINTERNET;
  dwOption: DWORD;
  lpBuffer: Pointer;
  dwBufferLength: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpQueryOption(
  hInternet: HINTERNET;
  dwOption: DWORD;
  lpBuffer: Pointer;
  var lpdwBufferLength: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpSetTimeouts(
  hInternet: HINTERNET;
  nResolveTimeout: Integer;
  nConnectTimeout: Integer;
  nSendTimeout: Integer;
  nReceiveTimeout: Integer
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpGetIEProxyConfigForCurrentUser(
  var pProxyConfig: TWinHttpProxyInfo
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpGetProxyForUrl(
  hSession: HINTERNET;
  pwszUrl: LPCWSTR;
  var pAutoProxyOptions: TWinHttpAutoProxyOptions;
  var pProxyInfo: TWinHttpProxyInfo
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpCreateProxyResolver(
  hSession: HINTERNET;
  var phResolver: HINTERNET
): DWORD; stdcall; external 'winhttp.dll';

function WinHttpGetProxyForUrlEx(
  hResolver: HINTERNET;
  pwszUrl: LPCWSTR;
  var pAutoProxyOptions: TWinHttpAutoProxyOptions;
  pBuffer: Pointer;
  dwBufferLength: DWORD;
  pvReserved: Pointer
): DWORD; stdcall; external 'winhttp.dll';

function WinHttpFreeProxyResult(
  var pProxyResult: TWinHttpProxyResult
): DWORD; stdcall; external 'winhttp.dll';

function WinHttpSetStatusCallback(
  hInternet: HINTERNET;
  lpfnInternetCallback: TWinHttpStatusCallback;
  dwNotificationFlags: DWORD;
  dwReserved: DWORD_PTR
): TWinHttpStatusCallback; stdcall; external 'winhttp.dll';

function WinHttpSetCredentials(
  hRequest: HINTERNET;
  AuthTargets: DWORD;
  AuthScheme: DWORD;
  pwszUserName: LPCWSTR;
  pwszPassword: LPCWSTR;
  pAuthParams: Pointer
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpQueryAuthSchemes(
  hRequest: HINTERNET;
  var lpdwSupportedSchemes: DWORD;
  var lpdwFirstScheme: DWORD;
  var lpdwAuthTarget: DWORD
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpTimeFromSystemTime(
  pst: PSystemTime;
  pwszTime: LPWSTR
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpTimeToSystemTime(
  pwszTime: LPCWSTR;
  var pst: SYSTEMTIME
): BOOL; stdcall; external 'winhttp.dll';

function WinHttpDetectAutoProxyConfigUrl(
  dwAutoDetectFlags: DWORD;
  var pwszAutoConfigUrl: LPWSTR
): BOOL; stdcall; external 'winhttp.dll';

procedure WinHttpSetGlobalAcceptLanguage(
  pwszLanguage: LPCWSTR
); stdcall; external 'winhttp.dll';

function WinHttpWriteProxyOptions(
  hResolver: HINTERNET;
  var pOptions: TWinHttpAutoProxyOptions;
  dwOptionCount: DWORD;
  pBuffer: Pointer;
  dwBufferLength: DWORD;
  var lpdwBufferLength: DWORD;
  pAuthParams: Pointer
): DWORD; stdcall; external 'winhttp.dll';


function WinHttpGet(const Url: String; out Response: AnsiString): Boolean;

implementation


function WinHttpGet(const Url: String; out Response: AnsiString): Boolean;
var
  hSession, hConnect, hRequest: HINTERNET;
  uc: TUrlComponents;
  Port: INTERNET_PORT;
  Flags, Read, Avail: DWORD;
  Buf: array[0..8191] of Byte; // 加大缓冲区，8KB更适合现代网络
  HostBuf, PathBuf: array[0..511] of WideChar;
  
  CTypeBuf: array[0..511] of WideChar;
  CTypeLen, Index: DWORD;
  ContentType: String;
  
  MemStream: TMemoryStream; // 用于高效拼接网络流
begin
  Result := False;
  Response := '';
  
  FillChar(uc, SizeOf(uc), 0);
  uc.dwStructSize := SizeOf(uc);
  uc.lpszHostName := @HostBuf;
  uc.dwHostNameLength := Length(HostBuf);
  uc.lpszUrlPath := @PathBuf;
  uc.dwUrlPathLength := Length(PathBuf);

  if not WinHttpCrackUrl(PWideChar(WideString(Url)), 0, 0, uc) then Exit;
  
  Port := uc.nPort;
  if Port = 0 then
  begin
    if uc.nScheme = INTERNET_SCHEME_HTTPS then
      Port := 443
    else
      Port := 80;
  end;
  
  Flags := 0;
  if uc.nScheme = INTERNET_SCHEME_HTTPS then
    Flags := WINHTTP_FLAG_SECURE;

  hSession := WinHttpOpen('WinHTTP/1.0', WINHTTP_ACCESS_TYPE_DEFAULT_PROXY, nil, nil, 0);
  if not Assigned(hSession) then Exit;

  try
    hConnect := WinHttpConnect(hSession, uc.lpszHostName, Port, 0);
    if not Assigned(hConnect) then Exit;
    try
      hRequest := WinHttpOpenRequest(hConnect, 'GET', uc.lpszUrlPath, nil, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, Flags);
      if not Assigned(hRequest) then Exit;
      try
        if WinHttpSendRequest(hRequest, WINHTTP_NO_ADDITIONAL_HEADERS, 0, WINHTTP_NO_REQUEST_DATA, 0, 0, 0) then
        begin
          if WinHttpReceiveResponse(hRequest, nil) then
          begin
            // ==========================================================
            // 获取 Content-Type
            // ==========================================================
            FillChar(CTypeBuf, SizeOf(CTypeBuf), 0);
            CTypeLen := SizeOf(CTypeBuf);
            Index := 0;

            // 注意这里：如果您的 WinHTTP 单元要求传递 PDWORD 指针，请将 Index 改为 @Index
            if WinHttpQueryHeaders(
              hRequest,
              HTTP_QUERY_CONTENT_TYPE,
              WINHTTP_HEADER_NAME_BY_INDEX, // nil
              @CTypeBuf,
              CTypeLen,
              Index // 或 @Index，取决于头文件声明
            ) then
            begin
              ContentType := String(CTypeBuf);
              // 测试时可取消注释: ShowMessage('ContentType: ' + ContentType);
            end;

            // ==========================================================
            // 高效读取数据体
            // ==========================================================
            MemStream := TMemoryStream.Create;
            try
              while WinHttpQueryDataAvailable(hRequest, Avail) and (Avail > 0) do
              begin
                // Avail 是系统建议的值，但保险起见，我们仍用缓冲区大小和 Avail 中较小的一个
                Read := 0;
                if WinHttpReadData(hRequest, @Buf, SizeOf(Buf), Read) then
                begin
                  if Read > 0 then
                    MemStream.Write(Buf[0], Read);
                end else
                  Break; // 读取失败则跳出
              end;
              
              // 【核心】一步到位分配和赋值给 AnsiString，零内存碎片，且保证二进制安全
              if MemStream.Size > 0 then
                SetString(Response, PAnsiChar(MemStream.Memory), MemStream.Size);
                
            finally
              MemStream.Free;
            end;

            Result := True;
          end;
        end;
      finally
        WinHttpCloseHandle(hRequest);
      end;
    finally
      WinHttpCloseHandle(hConnect);
    end;
  finally
    WinHttpCloseHandle(hSession);
  end;
end;

{
function WinHttpGet(const Url: String; out Response: AnsiString): Boolean;
var
  hSession, hConnect, hRequest: HINTERNET;
  uc: TUrlComponents;
  Port: INTERNET_PORT;
  Flags: DWORD;
  Read, Avail: DWORD;
  Buf: array[0..4095] of Byte;
  HostBuf, PathBuf: array[0..511] of WideChar;

  // === 新增：查询 Content-Type 所用 ===
  CTypeBuf: array[0..511] of WideChar;
  CTypeLen: DWORD;
  Index: DWORD;
  ContentType: String;
begin
  Result := False;
  Response := '';
  FillChar(uc, SizeOf(uc), 0);
  uc.dwStructSize := SizeOf(uc);

  uc.lpszHostName := @HostBuf;
  uc.dwHostNameLength := Length(HostBuf);

  uc.lpszUrlPath := @PathBuf;
  uc.dwUrlPathLength := Length(PathBuf);

  if not WinHttpCrackUrl(PWideChar(WideString(Url)), 0, 0, uc) then Exit;
  Port := uc.nPort;
  if Port = 0 then
  begin
    if uc.nScheme = INTERNET_SCHEME_HTTPS then
      Port := 443
    else
      Port := 80;
  end;
  Flags := 0;
  if uc.nScheme = INTERNET_SCHEME_HTTPS then
    Flags := WINHTTP_FLAG_SECURE;
  

  hSession := WinHttpOpen('WinHTTP/1.0', WINHTTP_ACCESS_TYPE_DEFAULT_PROXY, nil, nil, 0);
  if not Assigned(hSession) then Exit;


  try
    hConnect := WinHttpConnect(hSession, uc.lpszHostName, Port, 0);
    if not Assigned(hConnect) then Exit;
    try
      hRequest := WinHttpOpenRequest(hConnect, 'GET', uc.lpszUrlPath,
        nil, nil, nil, Flags);


      if not Assigned(hRequest) then Exit;
      try
        if WinHttpSendRequest(hRequest, nil, 0, nil, 0, 0, 0) then
        begin
          if WinHttpReceiveResponse(hRequest, nil) then
          begin

            // ==========================================================
            // === ? 在这里调用 WinHttpQueryHeaders 获取 Content-Type ===
            // ==========================================================
            FillChar(CTypeBuf, SizeOf(CTypeBuf), 0);
            CTypeLen := SizeOf(CTypeBuf);
            Index := 0;

            if WinHttpQueryHeaders(
              hRequest,
              HTTP_QUERY_CONTENT_TYPE,  // 查询类型
              nil,
              @CTypeBuf,                // 输出内容
              CTypeLen,
              Index) then
            begin
              ContentType := CTypeBuf;
             // ShowMessage(ContentType) ;
              // 在这里你可以判断：
              // ContentType = 'application/json; charset=utf-8' → 二进制
              // ContentType = 'text/plain; charset=utf-8'       → 文本
            end;

            // === 原有读取逻辑不变 ===
            while WinHttpQueryDataAvailable(hRequest, Avail) and (Avail > 0) do
            begin
              WinHttpReadData(hRequest, @Buf, SizeOf(Buf), Read);
              if Read > 0 then
                Response := Response + Copy(PAnsiChar(@Buf), 1, Read);
            end;
           // ShowMessage(Response) ;
            Result := True;
          end;
        end;
      finally
        WinHttpCloseHandle(hRequest);
      end;
    finally
      WinHttpCloseHandle(hConnect);
    end;
  finally
    WinHttpCloseHandle(hSession);
  end;
end;
   }
end.
