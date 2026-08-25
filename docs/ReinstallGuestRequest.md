# NexoVirt.Sdk.Model.ReinstallGuestRequest

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Node** | **string** | The PVE node the guest currently lives on. | 
**OsTemplate** | **string** | &#x60;tpl:&lt;id&gt;&#x60; for QEMU, or a &#x60;vztmpl&#x60; volid for LXC. | 
**Password** | **string** | New root password, minimum 5 characters. | [optional] 
**SshKeys** | **List&lt;string&gt;** | Public key bodies, merged with any owner-stored keys. | [optional] 
**OwnerId** | **int** | When set, the owner&#39;s stored SSH keys are merged into the reinstall (same as create). | [optional] 
**Name** | **string** | Optional new guest name. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

