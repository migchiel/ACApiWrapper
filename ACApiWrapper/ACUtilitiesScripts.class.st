Class {
	#name : #ACUtilitiesScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACUtilitiesScripts >> createIpRestrictions [

	<script: 'self new createIpRestrictions'>
	| payload |
	payload := ('192.175.132.0/24
192.175.133.0/24
192.175.134.0/24
192.175.135.0/24
192.175.142.0/24
192.175.143.0/24
192.175.144.0/24
192.175.145.0/24
192.175.146.0/24
192.175.147.0/24
192.175.149.0/24
192.175.150.0/24
192.175.161.0/24
192.175.162.0/24
192.175.163.0/24
192.175.164.0/24
192.175.166.0/24
192.175.167.0/24
192.175.169.0/24
192.175.176.0/24
192.175.177.0/24
192.175.178.0/24
192.175.179.0/24
192.175.180.0/24
192.175.182.0/24
192.175.184.0/24
192.175.186.0/24
192.175.187.0/24
192.175.188.0/24
192.175.189.0/24
192.175.194.0/24
192.175.195.0/24
192.175.196.0/24
192.175.197.0/24
192.175.198.0/24
192.175.199.0/24
192.175.204.0/24
192.175.205.0/24
192.175.206.0/24
192.175.213.0/24
192.175.214.0/24
192.175.223.0/24
192.175.224.0/24
192.175.226.0/24
192.175.232.0/24
192.175.236.0/24
192.175.237.0/24
192.175.238.0/24
192.175.239.0/24
192.175.241.0/24
192.175.242.0/24
192.175.243.0/24
192.175.244.0/24
192.175.245.0/24
192.175.247.0/24
192.175.254.0/24' splitOn: Character cr) collect: [ :i | 
		           NeoJSONObject new
			           at: 'ipAddress' put: i;
			           yourself ].

	ACApiItemView openWith: (payload collect: #ipAddress).

	ZnClient new
		path: 'https://app.armorcode.com/api/tenantConfig/allowedIPs/bulk';
		forJsonREST;
		setBearerAuthentication:
			(Smalltalk os environment at: 'acapi_token');
		contents: payload;post;inspect
]

{ #category : #'as yet unclassified' }
ACUtilitiesScripts >> readIpRestrictions [
	
	<script: 'self new readIpRestrictions'>
	ACApiItemView openWith: (TenantConfigClient new read  collect: #ipAddress)
]