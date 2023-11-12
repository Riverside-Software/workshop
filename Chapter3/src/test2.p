using OpenEdge.Core.Collections.* from propath.
using OpenEdge.Net.HTTP.*.
using OpenEdge.Net.URI.
using Progress.Json.ObjectModel.*.

define variable oClient as IHttpClient no-undo.
define variable oURI as URI no-undo.
define variable oRequest as IHttpRequest no-undo. 
define variable OResponse as IHttpResponse no-undo.
define variable oList as IList no-undo.

oURI = URI:Parse("http://example.com").
oRequest = RequestBuilder:GET(oURI):request.

oClient = ClientBuilder:Build():Client.
oResponse = oClient:Execute(oRequest).

if oResponse:StatusCode <> 200 then
    return error "Request Error: " + string(oResponse:StatusCode).
else do:
    message string(oResponse:StatusCode) + " -- " + oResponse:StatusReason view-as alert-box.
    output to "target/output.html".
    put unformatted oResponse:entity.
    output close.
    message "target/output.html written" view-as alert-box.
end.

// OpenEdge.Core
oList = new List().
oList:Add(1, oClient).

quit.