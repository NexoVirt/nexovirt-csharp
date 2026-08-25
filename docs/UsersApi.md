# NexoVirt.Sdk.Api.UsersApi

All URIs are relative to *https://your-panel-host/api/v1*

| Method | HTTP request | Description |
|--------|--------------|-------------|
| [**AddUserSshKey**](UsersApi.md#addusersshkey) | **POST** /users/{userId}/ssh-keys | Add an SSH key to a user |
| [**AssignUserGuest**](UsersApi.md#assignuserguest) | **POST** /users/{userId}/guests | Assign guest ownership |
| [**CreateUser**](UsersApi.md#createuser) | **POST** /users | Create a customer user |
| [**DeleteUser**](UsersApi.md#deleteuser) | **DELETE** /users/{userId} | Delete a customer user |
| [**DeleteUserSshKey**](UsersApi.md#deleteusersshkey) | **DELETE** /users/{userId}/ssh-keys/{keyId} | Delete one of a user&#39;s SSH keys |
| [**GrantUserIps**](UsersApi.md#grantuserips) | **POST** /users/{userId}/ips | Grant IPs to a customer&#39;s pool |
| [**ListUserIps**](UsersApi.md#listuserips) | **GET** /users/{userId}/ips | List a customer&#39;s owned IP pool |
| [**ListUsers**](UsersApi.md#listusers) | **GET** /users | List customer users |
| [**ResetUserPassword**](UsersApi.md#resetuserpassword) | **POST** /users/{userId}/reset-password | Reset a customer&#39;s password |
| [**RevokeIp**](UsersApi.md#revokeip) | **DELETE** /ip-addresses/{ipId} | Revoke an owned IP back to the admin pool |
| [**UnassignUserGuest**](UsersApi.md#unassignuserguest) | **DELETE** /users/{userId}/guests | Unassign guest ownership |

<a id="addusersshkey"></a>
# **AddUserSshKey**
> Envelope AddUserSshKey (int userId, AddUserSshKeyRequest addUserSshKeyRequest)

Add an SSH key to a user

Validates, fingerprints and stores the key (deduped per user). Returns id/name/fingerprint only, never the key body.

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
    public class AddUserSshKeyExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 
            var addUserSshKeyRequest = new AddUserSshKeyRequest(); // AddUserSshKeyRequest | 

            try
            {
                // Add an SSH key to a user
                Envelope result = apiInstance.AddUserSshKey(userId, addUserSshKeyRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.AddUserSshKey: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AddUserSshKeyWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Add an SSH key to a user
    ApiResponse<Envelope> response = apiInstance.AddUserSshKeyWithHttpInfo(userId, addUserSshKeyRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.AddUserSshKeyWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |
| **addUserSshKeyRequest** | [**AddUserSshKeyRequest**](AddUserSshKeyRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

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

<a id="assignuserguest"></a>
# **AssignUserGuest**
> Envelope AssignUserGuest (int userId, AssignUserGuestRequest assignUserGuestRequest)

Assign guest ownership

Assigns ownership of a guest to a customer. One owner per guest.

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
    public class AssignUserGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 
            var assignUserGuestRequest = new AssignUserGuestRequest(); // AssignUserGuestRequest | 

            try
            {
                // Assign guest ownership
                Envelope result = apiInstance.AssignUserGuest(userId, assignUserGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.AssignUserGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the AssignUserGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Assign guest ownership
    ApiResponse<Envelope> response = apiInstance.AssignUserGuestWithHttpInfo(userId, assignUserGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.AssignUserGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |
| **assignUserGuestRequest** | [**AssignUserGuestRequest**](AssignUserGuestRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest assigned. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="createuser"></a>
# **CreateUser**
> CreateUser200Response CreateUser (CreateUserRequest createUserRequest)

Create a customer user

Creates a customer account with a generated password, returned once in the response. Enqueues a welcome email. 

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
    public class CreateUserExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var createUserRequest = new CreateUserRequest(); // CreateUserRequest | 

            try
            {
                // Create a customer user
                CreateUser200Response result = apiInstance.CreateUser(createUserRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.CreateUser: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the CreateUserWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Create a customer user
    ApiResponse<CreateUser200Response> response = apiInstance.CreateUserWithHttpInfo(createUserRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.CreateUserWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **createUserRequest** | [**CreateUserRequest**](CreateUserRequest.md) |  |  |

### Return type

[**CreateUser200Response**](CreateUser200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | User created. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteuser"></a>
# **DeleteUser**
> Envelope DeleteUser (int userId)

Delete a customer user

Deletes the customer account and its guest ownership assignments.

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
    public class DeleteUserExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 

            try
            {
                // Delete a customer user
                Envelope result = apiInstance.DeleteUser(userId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.DeleteUser: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteUserWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete a customer user
    ApiResponse<Envelope> response = apiInstance.DeleteUserWithHttpInfo(userId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.DeleteUserWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | User deleted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="deleteusersshkey"></a>
# **DeleteUserSshKey**
> Envelope DeleteUserSshKey (int userId, int keyId)

Delete one of a user's SSH keys

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
    public class DeleteUserSshKeyExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 
            var keyId = 56;  // int | 

            try
            {
                // Delete one of a user's SSH keys
                Envelope result = apiInstance.DeleteUserSshKey(userId, keyId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.DeleteUserSshKey: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the DeleteUserSshKeyWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Delete one of a user's SSH keys
    ApiResponse<Envelope> response = apiInstance.DeleteUserSshKeyWithHttpInfo(userId, keyId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.DeleteUserSshKeyWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |
| **keyId** | **int** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

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

<a id="grantuserips"></a>
# **GrantUserIps**
> Envelope GrantUserIps (int userId, GrantUserIpsRequest grantUserIpsRequest)

Grant IPs to a customer's pool

Grant IPs into a customer's pool. `mode=zone` (default) reserves the next `count` free addresses from `zone_id`; `mode=specific` grants the given `ids[]` from `zone_id`. 

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
    public class GrantUserIpsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 
            var grantUserIpsRequest = new GrantUserIpsRequest(); // GrantUserIpsRequest | 

            try
            {
                // Grant IPs to a customer's pool
                Envelope result = apiInstance.GrantUserIps(userId, grantUserIpsRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.GrantUserIps: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the GrantUserIpsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Grant IPs to a customer's pool
    ApiResponse<Envelope> response = apiInstance.GrantUserIpsWithHttpInfo(userId, grantUserIpsRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.GrantUserIpsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |
| **grantUserIpsRequest** | [**GrantUserIpsRequest**](GrantUserIpsRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Granted. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listuserips"></a>
# **ListUserIps**
> Envelope ListUserIps (int userId)

List a customer's owned IP pool

Every IP owned by the customer (assigned and free), enriched with zone name and family.

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
    public class ListUserIpsExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 

            try
            {
                // List a customer's owned IP pool
                Envelope result = apiInstance.ListUserIps(userId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.ListUserIps: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListUserIpsWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List a customer's owned IP pool
    ApiResponse<Envelope> response = apiInstance.ListUserIpsWithHttpInfo(userId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.ListUserIpsWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Owned IPs. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="listusers"></a>
# **ListUsers**
> ListUsers200Response ListUsers ()

List customer users

Lists customer accounts (never includes secrets). Requires an admin-capable token.

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
    public class ListUsersExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);

            try
            {
                // List customer users
                ListUsers200Response result = apiInstance.ListUsers();
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.ListUsers: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ListUsersWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // List customer users
    ApiResponse<ListUsers200Response> response = apiInstance.ListUsersWithHttpInfo();
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.ListUsersWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters
This endpoint does not need any parameter.
### Return type

[**ListUsers200Response**](ListUsers200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Customer users. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="resetuserpassword"></a>
# **ResetUserPassword**
> Envelope ResetUserPassword (int userId)

Reset a customer's password

Generates a new password for the customer and enqueues a notification email.

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
    public class ResetUserPasswordExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 

            try
            {
                // Reset a customer's password
                Envelope result = apiInstance.ResetUserPassword(userId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.ResetUserPassword: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the ResetUserPasswordWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Reset a customer's password
    ApiResponse<Envelope> response = apiInstance.ResetUserPasswordWithHttpInfo(userId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.ResetUserPasswordWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Password reset. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="revokeip"></a>
# **RevokeIp**
> Envelope RevokeIp (int ipId)

Revoke an owned IP back to the admin pool

Only an unassigned owned IP can be revoked.

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
    public class RevokeIpExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var ipId = 56;  // int | 

            try
            {
                // Revoke an owned IP back to the admin pool
                Envelope result = apiInstance.RevokeIp(ipId);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.RevokeIp: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the RevokeIpWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Revoke an owned IP back to the admin pool
    ApiResponse<Envelope> response = apiInstance.RevokeIpWithHttpInfo(ipId);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.RevokeIpWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **ipId** | **int** |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Revoked. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **404** | The host, guest, user, or job was not found. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<a id="unassignuserguest"></a>
# **UnassignUserGuest**
> Envelope UnassignUserGuest (int userId, AssignUserGuestRequest assignUserGuestRequest)

Unassign guest ownership

Removes the current owner from a guest.

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
    public class UnassignUserGuestExample
    {
        public static void Main()
        {
            Configuration config = new Configuration();
            config.BasePath = "https://your-panel-host/api/v1";
            // Configure Bearer token for authorization: bearerAuth
            config.AccessToken = "YOUR_BEARER_TOKEN";

            // create instances of HttpClient, HttpClientHandler to be reused later with different Api classes
            HttpClient httpClient = new HttpClient();
            HttpClientHandler httpClientHandler = new HttpClientHandler();
            var apiInstance = new UsersApi(httpClient, config, httpClientHandler);
            var userId = 56;  // int | 
            var assignUserGuestRequest = new AssignUserGuestRequest(); // AssignUserGuestRequest | 

            try
            {
                // Unassign guest ownership
                Envelope result = apiInstance.UnassignUserGuest(userId, assignUserGuestRequest);
                Debug.WriteLine(result);
            }
            catch (ApiException  e)
            {
                Debug.Print("Exception when calling UsersApi.UnassignUserGuest: " + e.Message);
                Debug.Print("Status Code: " + e.ErrorCode);
                Debug.Print(e.StackTrace);
            }
        }
    }
}
```

#### Using the UnassignUserGuestWithHttpInfo variant
This returns an ApiResponse object which contains the response data, status code and headers.

```csharp
try
{
    // Unassign guest ownership
    ApiResponse<Envelope> response = apiInstance.UnassignUserGuestWithHttpInfo(userId, assignUserGuestRequest);
    Debug.Write("Status Code: " + response.StatusCode);
    Debug.Write("Response Headers: " + response.Headers);
    Debug.Write("Response Body: " + response.Data);
}
catch (ApiException e)
{
    Debug.Print("Exception when calling UsersApi.UnassignUserGuestWithHttpInfo: " + e.Message);
    Debug.Print("Status Code: " + e.ErrorCode);
    Debug.Print(e.StackTrace);
}
```

### Parameters

| Name | Type | Description | Notes |
|------|------|-------------|-------|
| **userId** | **int** |  |  |
| **assignUserGuestRequest** | [**AssignUserGuestRequest**](AssignUserGuestRequest.md) |  |  |

### Return type

[**Envelope**](Envelope.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Guest unassigned. |  -  |
| **401** | Missing or invalid bearer token. |  -  |
| **403** | The token is not scoped to this host, or its IP allowlist rejected the caller. |  -  |
| **422** | The request failed validation, for example an invalid node name or missing field. |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

