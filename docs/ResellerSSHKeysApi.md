# NexoVirt.Sdk.Api.ResellerSSHKeysApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**AddResellerCustomerSshKey**](ResellerSSHKeysApi.md#addresellercustomersshkey) | **POST** /customers/{customerId}/ssh-keys | Add an SSH key |
| [**DeleteResellerCustomerSshKey**](ResellerSSHKeysApi.md#deleteresellercustomersshkey) | **DELETE** /customers/{customerId}/ssh-keys/{keyId} | Delete an SSH key |
| [**ListResellerCustomerSshKeys**](ResellerSSHKeysApi.md#listresellercustomersshkeys) | **GET** /customers/{customerId}/ssh-keys | List a customer&#39;s SSH keys |

<a id="addresellercustomersshkey"></a>
# **AddResellerCustomerSshKey**
> Envelope AddResellerCustomerSshKey (int customerId, AddUserSshKeyRequest addUserSshKeyRequest)

Add an SSH key

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class AddResellerCustomerSshKeyExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerSSHKeysApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.
            var addUserSshKeyRequest = new AddUserSshKeyRequest(); // AddUserSshKeyRequest | 

            try
            {
                // Add an SSH key
                Envelope result = apiInstance.AddResellerCustomerSshKey(customerId, addUserSshKeyRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerSSHKeysApi.AddResellerCustomerSshKey: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AddResellerCustomerSshKeyWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Add an SSH key
    ApiResponse<Envelope> response = apiInstance.AddResellerCustomerSshKeyWithHttpInfo(customerId, addUserSshKeyRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerSSHKeysApi.AddResellerCustomerSshKeyWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |
| **addUserSshKeyRequest** | [**AddUserSshKeyRequest**](AddUserSshKeyRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Added. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteresellercustomersshkey"></a>
# **DeleteResellerCustomerSshKey**
> Envelope DeleteResellerCustomerSshKey (int customerId, int keyId)

Delete an SSH key

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class DeleteResellerCustomerSshKeyExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerSSHKeysApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.
            var keyId = 56;  // int | An SSH key id belonging to the given customer.

            try
            {
                // Delete an SSH key
                Envelope result = apiInstance.DeleteResellerCustomerSshKey(customerId, keyId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerSSHKeysApi.DeleteResellerCustomerSshKey: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteResellerCustomerSshKeyWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete an SSH key
    ApiResponse<Envelope> response = apiInstance.DeleteResellerCustomerSshKeyWithHttpInfo(customerId, keyId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerSSHKeysApi.DeleteResellerCustomerSshKeyWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |
| **keyId** | **int** | An SSH key id belonging to the given customer. |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Deleted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listresellercustomersshkeys"></a>
# **ListResellerCustomerSshKeys**
> Envelope ListResellerCustomerSshKeys (int customerId)

List a customer's SSH keys

id/name/fingerprint only, never the key body.

### Example
```csharp
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using NexoVirt.Sdk.Api;
using NexoVirt.Sdk.Client;
using NexoVirt.Sdk.Model;

namespace Example
{
    public class ListResellerCustomerSshKeysExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: resellerBearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new ResellerSSHKeysApi(httpClient, config, httpClientHandler);
            var customerId = 56;  // int | The panel's internal user id of one of the calling reseller's own customers.

            try
            {
                // List a customer's SSH keys
                Envelope result = apiInstance.ListResellerCustomerSshKeys(customerId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling ResellerSSHKeysApi.ListResellerCustomerSshKeys: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListResellerCustomerSshKeysWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List a customer's SSH keys
    ApiResponse<Envelope> response = apiInstance.ListResellerCustomerSshKeysWithHttpInfo(customerId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling ResellerSSHKeysApi.ListResellerCustomerSshKeysWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **customerId** | **int** | The panel&#39;s internal user id of one of the calling reseller&#39;s own customers. |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[resellerBearerAuth](../README.md#resellerBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | SSH keys. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

