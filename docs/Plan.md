# NexoVirt.Sdk.Model.Plan

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Id** | **int** |  | [optional] 
**Name** | **string** |  | [optional] 
**Description** | **string** |  | [optional] 
**Cores** | **int** |  | [optional] 
**MemoryMb** | **int** |  | [optional] 
**DiskGb** | **int** |  | [optional] 
**TrafficLimitGb** | **int** | Monthly traffic limit. 0 means unlimited. | [optional] 
**RuntimeDays** | **int** | Expiry in days. 0 means unlimited. | [optional] 
**GraceDays** | **int** | Grace period before auto-delete after expiry. | [optional] 
**SnapshotLimit** | **int** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

