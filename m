Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAD6C433EF
	for <ath11k@archiver.kernel.org>; Sat, 23 Jul 2022 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0CKHnEcBBBUjtQEJv1HP5GBI4+Ukt30XZ8Rhcr8k1o=; b=ZYcSI4kLgTF2+gbK+uJR9aCxuz
	IkCCdgFk88L4Fijy8rvpC09vnVkq1DC7ltyCYfOoSj3ax9olNfEwCoc1m20zlRotwfQjFpvTKVBM4
	7pc0gkn/hGBwTBY1ZCk4tE62EDKLGQWMHJ67eUqCsBXYlWem8f5crlmRy7NTvMZLSpebfuiG5T+qD
	kdoppCHsqVXPkrjI2+h7mZzyN1qU76KVfnT7PPSg5j3xciOhmtBYwLouebnzuNU5gbTbnOr6g+XXt
	7tMrzgPFHbsWhlngH/FbyxauFf0rbRBEI5jXeW6DAdNI+cA30UfHzLeuZ9x85S+DjBPFVWp8sxz+L
	NkRo6INg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFDwl-002dUx-DZ; Sat, 23 Jul 2022 12:09:27 +0000
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com ([40.107.244.50] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFDwh-002dPw-LQ
	for ath11k@lists.infradead.org; Sat, 23 Jul 2022 12:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAyn7Th7PfQBY7zZzhgV9B1lcIhJmaZ13j7T6yHuqRBpW5TUKq71m0m/aYClGbuipY6zOueKULHmA72xE4ynOGZB8BShjUbt4P2XOg8HP2uENK60iAzMkSG41k6z1jV5Z8KYBEQGRBhIc8du3FVQ4oib0zHLL+v+yKyl4L43wQLOKQDUKIaSVXN6W3FoXM4Rch4FjL9ZFD5Lmcnwop+QA5o45wkJzFD3fkKTfPmBZPc/swAYv+OgAvhYyaOlL29b6wu8CUe0001TiN/W3wVN/+0FMtqqtY8M5CFMhw35JkCvLJhLzl0twqc9pKEYinLF3t630wgPolIFRBahv90tmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2/aKuCKupK2rMTava7uLU+ZDtf3kIWCxW7Xvlfy9m0=;
 b=RldtKMvyorfLRxM7YEDzignUc40LAjjxU+obz27ctZQQfOBgrupCgX0lXOFrSFNWDBVg2VAilLzwVhQyaDOHbmJhpC/znJZaMpG7/upqXADkkU4puvh2zjGuaZIgkyFeal2psvMQHmTfvj80v4oGhAbFzN4W3B/4jgUELzgf4ddR5P3SdkBh+5vMBxSWxVEZ7M0N9d0bhUJeMNNXgIXbLV2KkjpjpnFrVEW2MlyVYejPY2Le4APttpCcY2hDxWvHYiMs/CSeQ6DIW05Zi7CW0Sgg0iP+vM4orRYr1A8EaW3YeSYAPdW1RBVb9H9c36wFPXQh1dsZ0iYNBgj9TYB5gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2/aKuCKupK2rMTava7uLU+ZDtf3kIWCxW7Xvlfy9m0=;
 b=ubde+iUBmJGxDPTQmvP+JQl7WZMwGdxS7hGwoRqwYSa4AU0K/IBKIc52GC+caBXoHNQbb5zw8ez4DOJh/XeaytsReJNiAv7lgOH8jsaKJ6ZjmUlVwR2ociQzJI/+/JWvdpGuQvYvmh06TRBdOyp2FHARCVq8rGw6NJ1o0XN5a1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Sat, 23 Jul
 2022 12:09:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Sat, 23 Jul 2022
 12:09:13 +0000
Message-ID: <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
Date: Sat, 23 Jul 2022 07:09:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
In-Reply-To: <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
X-ClientProxiedBy: CH0PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:610:77::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 871fbe43-56aa-4ea8-4715-08da6ca42839
X-MS-TrafficTypeDiagnostic: CH2PR12MB4922:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nPIuXGSM0LvMvsO4TJO/Oqajc5gCwhWCXxnexoIOpxWCi+OskABstbCVFL68Ak0P4z/besDoQ32ysFKkuEDem+Pggh2hUB/NZPzYDe+MiTeVHroNxkeBNN0WaBCkAbX3iRY1ztV3mevUepCciXawJqH5WshoCvL3SrDGqq72fROcIEDd3n6F+BeCQDu/AzOjo/J9XbjtYrfgszu+toZX0v77DRdY2BO0d2XOQJm+zZH7+Jv8j6MUXClcebrdKnRTQR3rKR0lbP1gISz5b3EhBCYQg/jKbXxrjufcjs59sUacU5TqvPmbeNt3xanRDUu3oFOlNzR9A6nUTcYyOebYgcwC2Y0XMScBDWQc7j5r4UaHmHZBPlKbTpsGc6fQZSysNoud7SF5aTIpnaqS497RKmBFROSsQubN7tZ9lkMBj51LEpQEdv71vH8is1H8Unz9m/vc50CAiJuRsRadX4eIsxzvnsjC3WvvEXsmnwMlbCxtkxc/rWeGvoTqlPTgeXEO5nCEQw4D3hT5eApduOnUkZiXM6qAVlB1ufGEs9fALM+ah3JZToxe8Rs4NE4q1OMxIwAnCek69tx8k0lpEnxbatIkGb9AUzql/1V3/MGTc3ispzT7Qp1Azqf9ELxUrAgmF9TC93iY9L+TE3/DFpUYJTSr6nUZ4hkPIQzG+bVgaV7qfFIS+m6TYNr820geWtr8DT7e2A8SAyx/a+pKIfkV/TmqiTmBZCMs0rtPffuUGFg07Nuca54b+ehenJPsfJssQupJ0FMYKqwJoQ9f+I0WiHjmEXLLRw+K1iNumZ5KR9YOWq/EYbVXvF038qXQ7qiy/Mlz/bnsl6kx87zEzldKgg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(86362001)(31696002)(38100700002)(8936002)(6486002)(478600001)(5660300002)(316002)(66476007)(66556008)(8676002)(66946007)(4326008)(2616005)(186003)(83380400001)(6506007)(31686004)(53546011)(4001150100001)(2906002)(41300700001)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cW9wR01aVDE4SXVycXdKT3ZsVlhWZ0ZqcTMvRmpCRm0yRGhJTUVpM0hyZnk3?=
 =?utf-8?B?eFlmVEs4d2l3dGdQVDcycFNJKzVtQ3hHcW9uOTFIelJjQndRVmVLODVQNDZs?=
 =?utf-8?B?UUozUDIzNm9GaUNhNmVKVSt6cmp4c0VTWHYvTmFEdUtIbkZxZVBqZDFkRUVq?=
 =?utf-8?B?MzU0NHJPREw1d0JCaHc5clBweDdHUm8vZ1RDME52N1RYK1ZLN1dxZ3I2UXpV?=
 =?utf-8?B?bStXbkxwYlJnL1hrLzFVSVhyb095dSt2cm1kUmFFSWliUzJVUERZQ2tlMTIv?=
 =?utf-8?B?TkhBb1BCUHBLNisxaW9JR0FTZ2RWUnE2bExvaDY2MTh0WDF1TVFmTkEzWjVY?=
 =?utf-8?B?Y1BMTDVVRzJSNStUaU5XMCtRKzFjTWNLWFF4MEVXNU1pMkdyT0lZVEMxR2Rr?=
 =?utf-8?B?K3hIb0RudVd5ckkrK25tUFZVT0RpWDdtT0M3UUl3azQ4Y3FBWlhWSk91OHdR?=
 =?utf-8?B?b2hCQmJvdFdJYndZTVFrZTQ2UGppaDB1Y3NKVkVxK04vV2phRHVsSThSMndQ?=
 =?utf-8?B?bTU4N05uMUh2VWJwaklIWXROQnFmQVZyQTVWS1U2Z0loQWJ6d0VGK1ExQUp1?=
 =?utf-8?B?MjlKQWYxK3FWbGpXTzU5V3BQVzlRUXM5bnVmOURHcm5WVlYxQnQzVTJ0SEpk?=
 =?utf-8?B?K3dBR0cvRUZ6bHcwV2tmWkVpZ2dCVVNhZ0U4aHN5ekw4MGpFSWNyT3l0QldW?=
 =?utf-8?B?M1YxKy9jS0t6UnFDaFJrSG8wSjFSZWFCVityMXJJMWYxam0rWGJMQ0xnZFpD?=
 =?utf-8?B?WE8rQnc5SytKYzJnVHhlaWVIK0cvYnpWbzhLVjRLMmdxYXZhZnlwR0F2ZGZn?=
 =?utf-8?B?aUpZVllWNkdUVDdFeVlNcWlIM2Z3QU92RmtFWWs4TGpJZ0hZdjgzUFFNQ0dC?=
 =?utf-8?B?YThORE9QZGtZSjI5ekxqOUFKWUFXbGJHa3FSSUhSK1BoMFBPMExyODRlMWNL?=
 =?utf-8?B?bzVrT0tpeGZsV3RlRENQRnAwT0cxcGwrdHV1dGl3RzNsT1FMV2pIRFdnV0Qy?=
 =?utf-8?B?RHVCN0FvcEYzWm9Cb1FXYkZ0WHZZaVNnamZpeWR1M0VBS3F2SEJlZVc0dHpj?=
 =?utf-8?B?SWFNS2hwaGMwZ1crbUo5UjNYZEI3M3FTMmtFM1NabDVSVEtoMnpUNDYzaFNt?=
 =?utf-8?B?bXpwOTRjcXozbFRXWFU0azVsdVpyaEJpVG94bStZUG9mZHJDUk9YKzFPV3R4?=
 =?utf-8?B?TFRTb3ZhV3B0cngvZ0RoZk1HWkpFaTJPVUpvMWhNNTBFLzBvQkpJRHRuSU1B?=
 =?utf-8?B?VTliM2pRQ2R1bHNoWjBITUhTZzFGMnBCKzk1akFNR1BXYVN4cWJWVUxWWDY2?=
 =?utf-8?B?Q2NqVURoTHF2b2w0cFVBS3diS1Jpa0VqbmVzYXRwcWRNbitjZzQ3YW92WUFQ?=
 =?utf-8?B?cGR3S2JEN0hBSTJrTTJzbWhGUjdFcWRwSGsrSlROUStGN0NTc2RHK0ZPWndn?=
 =?utf-8?B?Qk5NaFJJSmVjVnF3YmdibXFMRzRrVmhSZktXblpUWmVMVlJDN1FBNEVXd2dT?=
 =?utf-8?B?RUZtQk4zMGVLYTlWcktpemR3L3l0WWNrTjgrdld1VzY5QS9EM0lzRUx5VkJN?=
 =?utf-8?B?Vlg2N0FReS9pS1lLODhQSXBBNXlkWGZyNW4wWjVIMGlhUDU0VTZVRGhmMU02?=
 =?utf-8?B?RWoydlJHQS9vd1RvOUdqa0xBeHlZaUt4V1RNVTkvQ3F4bTRBUFhmVEdzeUVT?=
 =?utf-8?B?V09WTjIwaGNIZ1A1TWl0OE90ZjdOaGVpYk91UzgwUVRoak1ubVlWRWlpcDln?=
 =?utf-8?B?L1REbzJZM1l4QUZDbjVLaHN6UW5NSUROcjlhS3lMdkxxeU1uUE1BSzhUWHNw?=
 =?utf-8?B?WGVnbXJNMU0xU1NaOHJZVEZKSnN4MEYwTkU5N2poZFFJaWdYekMyaWFyeUgx?=
 =?utf-8?B?QmM0Wmw5TmY3OVRDU05yZnFHSWRyRWtKTHZnYWtISXoxampWWE1ZRWZ2M2pQ?=
 =?utf-8?B?dndqRnQ3eExQZjNXWjkxMytUckZZUnptYzlIM2ZkQ2NWRUJMZ1pkZGUxTXow?=
 =?utf-8?B?UDgyd2dxdFU5OURZbGV4T2E4eXZMOVlCMkFsOFVhditWRU1tbHcyM0lUc0RQ?=
 =?utf-8?B?dzd2MzFqOGlhZS9Qdm1MOTJPYzZHMVJnNkhHL3RUMGwySExCQWowcEdMREdE?=
 =?utf-8?B?cytNamtLOEFLWTk5NHYxYkhXNVNQeDNrZy92S0RPT1VVK1NjcmMzZXArMW5x?=
 =?utf-8?Q?creuKVVqCySgpscET8hbzZ52BBLWUPYX7SrwPKllm1Fp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871fbe43-56aa-4ea8-4715-08da6ca42839
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 12:09:13.3968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UmHDJSLpMdH7+lBVkQwYN440hvJyoE5DLfcnxM5MDGniVp839XT2hu0P9La95skmDuexb6Vjnu/YsgAXRKOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_050924_426965_756804D1 
X-CRM114-Status: GOOD (  21.27  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gNy8yMi8yMDIyIDE3OjAwLCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6Cj4gT24gNy8yMC8y
MDIyIDA4OjQ5LCBNYW5pa2FudGEgUHViYmlzZXR0eSB3cm90ZToKPj4gQ3VycmVudGx5LCBXTEFO
IGNoaXAgaXMgcG93ZXJlZCBvbmNlIGR1cmluZyBkcml2ZXIgcHJvYmUgYW5kIGlzIGtlcHQKPj4g
T04gKHBvd2VyZWQpIGFsd2F5cyBldmVuIHdoZW4gV0xBTiBpcyBub3QgYWN0aXZlOyBrZWVwaW5n
IHRoZSBjaGlwCj4+IHBvd2VyZWQgT04gYWxsIHRoZSB0aW1lIHdpbGwgY29uc3VtZSBleHRyYSBw
b3dlciB3aGljaCBpcyBub3QKPj4gZGVzaXJhYmxlIG9uIGEgYmF0dGVyeSBvcGVyYXRlZCBkZXZp
Y2UuIFNhbWUgaXMgdGhlIGNhc2Ugd2l0aCBub24tV29XCj4+IHN1c3BlbmQsIGNoaXAgd2lsbCBu
b3QgYmUgcHV0IGludG8gbG93IHBvd2VyIG1vZGUgd2hlbiB0aGUgc3lzdGVtIGlzCj4+IHN1c3Bl
bmRlZCByZXN1bHRpbmcgaW4gaGlnaGVyIGJhdHRlcnkgZHJhaW4uCj4+Cj4+IFNlbmQgUU1JIE1P
REUgT0ZGIGNvbW1hbmQgdG8gZmlybXdhcmUgZHVyaW5nIFdpRmkgT0ZGIHRvIHB1dCBkZXZpY2UK
Pj4gaW50byBsb3cgcG93ZXIgbW9kZS4KPj4KPj4gVGVzdGVkLW9uOiBXQ042NzUwIGh3MS4wIEFI
QiBXTEFOLk1TTC4xLjAuMS0wMDg4Ny1RQ0FNU0xTV1BMWi0xCj4+Cj4+IE1hbmlrYW50YSBQdWJi
aXNldHR5ICg0KToKPj4gwqDCoCBhdGgxMWs6IEZpeCBkb3VibGUgZnJlZSBpc3N1ZSBkdXJpbmcg
U1JORyBkZWluaXQKPj4gwqDCoCBhdGgxMWs6IE1vdmUgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24g
bG9naWMgdG8gc3RhcnQoKQo+PiDCoMKgIGF0aDExazogRW5hYmxlIGxvdyBwb3dlciBtb2RlIHdo
ZW4gV0xBTiBpcyBub3QgYWN0aXZlCj4+IMKgwqAgYXRoMTFrOiBGaXggZmFpbGVkIHRvIHBhcnNl
IHJlZ3VsYXRvcnkgZXZlbnQgcHJpbnQKPj4KPj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDExay9jb3JlLmMgfCAyMzcgKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+PiDCoCBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2NvcmUuaCB8wqDCoCA4ICstCj4+IMKgIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvaGFsLmPCoCB8wqDCoCAxICsKPj4gwqAgZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuY8KgIHzCoCAzMyArKy0tCj4+IMKgIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcmVnLmPCoCB8wqDCoCAyICsKPj4gwqAgNSBmaWxl
cyBjaGFuZ2VkLCAxODkgaW5zZXJ0aW9ucygrKSwgOTIgZGVsZXRpb25zKC0pCj4+Cj4gCj4gVGhp
cyBzZXJpZXMgbG9va2VkIHBvdGVudGlhbGx5IHByb21pc2luZyB0byBtZSBmb3IgYSBwcm9ibGVt
IHRoYXQgSSdtIAo+IHNlZWluZyBvbiBhIG5vdGVib29rIGZhaWxpbmcgdG8gc2xlZXAgd2hlcmUg
V0xBTl9XQUtFIGlzIGFzc2VydGVkIG9uIHRoZSAKPiBXQ042ODU1IG9uIHJlc3VtZSBldmVuIHRo
b3VnaCBXb1cgd2Fzbid0IHNldCBhdCBhbGwuwqAgVGhpcyBpcyAKPiBwcm9ibGVtYXRpYyBhcyBp
dCBjYXVzZXMgYSBzcHVyaW91cyB3YWtlIHdoaWxlIFNVVCBpcyByZWFkaW5nIGZyb20gdGhlIAo+
IEVDIHNpbmNlIHR3byBJUlFzIGFyZSBub3cgYWN0aXZlIGFuZCB0aGUga2VybmVsIHdha2VzIGZy
b20gdGhhdC4KPiBSZW1vdmluZyB0aGUgV0NONjg1NSBmcm9tIHRoZSBzeXN0ZW0gaXQgZG9lc24n
dCBoYXBwZW4uCj4gCj4gSSBmaWd1cmVkIEknZCBnaXZlIGl0IGEgc3BpbiB0byBzZWUgaWYgaXQg
aW1wcm92ZWQgdGhpbmdzLgo+IEkgYXBwbGllZCB0aGUgc2VyaWVzIG9uIHRvcCBvZiA1LjE5LXJj
NyBhbmQgaXQgYXBwbGllZCBjbGVhbmx5IGJ1dCBJIGdldCAKPiB0aW1lb3V0cyBvbiB3bGFuIGNh
cmQgaW5pdCAoYW5kIG9mIGNvdXJzZSBzdXNwZW5kIGZhaWxzIG5vdyB0b28pLgo+IAo+IEhlcmUn
cyB0aGUgbWhpL2F0aDExa19wY2kgc25pcHBldHM6Cj4gCj4gW8KgwqDCoCAyLjg2NDExMF0gYXRo
MTFrX3BjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtIAo+IDB4YjQwMDAwMDAt
MHhiNDFmZmZmZiA2NGJpdF0KPiBbwqDCoMKgIDIuODY0OTAxXSBhdGgxMWtfcGNpIDAwMDA6MDE6
MDAuMDogTVNJIHZlY3RvcnM6IDMyCj4gW8KgwqDCoCAyLjg2NDkxMl0gYXRoMTFrX3BjaSAwMDAw
OjAxOjAwLjA6IHdjbjY4NTUgaHcyLjEKPiBbwqDCoMKgIDMuMTA2ODkyXSBtaGkgbWhpMDogUmVx
dWVzdGVkIHRvIHBvd2VyIE9OCj4gW8KgwqDCoCAzLjEwNzA1NF0gbWhpIG1oaTA6IFBvd2VyIG9u
IHNldHVwIHN1Y2Nlc3MKPiBbwqDCoMKgIDMuMTk4MTc4XSBtaGkgbWhpMDogV2FpdCBmb3IgZGV2
aWNlIHRvIGVudGVyIFNCTCBvciBNaXNzaW9uIG1vZGUKPiBbwqDCoMKgIDMuOTcxMDE5XSBhdGgx
MWtfcGNpIDAwMDA6MDE6MDAuMDogY2hpcF9pZCAweDIgY2hpcF9mYW1pbHkgMHhiIAo+IGJvYXJk
X2lkIDB4ZmYgc29jX2lkIDB4NDAwYzAyMTAKPiBbwqDCoMKgIDMuOTcxMDI1XSBhdGgxMWtfcGNp
IDAwMDA6MDE6MDAuMDogZndfdmVyc2lvbiAweDExMDgwYmJiIAo+IGZ3X2J1aWxkX3RpbWVzdGFt
cCAyMDIxLTEyLTE2IDAzOjQyIGZ3X2J1aWxkX2lkIAo+IFdMQU4uSFNQLjEuMS0wMzAwMy1RQ0FI
U1BTV1BMX1YxX1YyX1NJTElDT05aX0xJVEUtMgo+IFvCoMKgwqAgNC4yOTAzMjhdIGF0aDExa19w
Y2kgMDAwMDowMTowMC4wIHdscDFzMDogcmVuYW1lZCBmcm9tIHdsYW4wCj4gW8KgwqDCoCA0LjMw
ODc2MF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IEZhaWxlZCB0byBzZXQgdGhlIHJlcXVlc3Rl
ZCAKPiBDb3VudHJ5IHJlZ3VsYXRvcnkgc2V0dGluZwo+IFvCoMKgwqAgNC4zMDkwMjhdIGF0aDEx
a19wY2kgMDAwMDowMTowMC4wOiBGYWlsZWQgdG8gc2V0IHRoZSByZXF1ZXN0ZWQgCj4gQ291bnRy
eSByZWd1bGF0b3J5IHNldHRpbmcKPiBbwqDCoCAxNC4zODYyMDFdIGF0aDExa19wY2kgMDAwMDow
MTowMC4wOiBxbWkgZmFpbGVkIHdsYW4gaW5pIHJlcXVlc3QsIGVyciAKPiA9IC0xMTAKPiBbwqDC
oCAxNC4zODYyMTBdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBxbWkgZmFpbGVkIHRvIHNlbmQg
d2xhbiBmdyBpbmk6LTExMAo+IFvCoMKgIDE0LjM4NjIxNF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAw
LjA6IGZhaWxlZCB0byBzZW5kIGZpcm13YXJlIHN0YXJ0OiAtMTEwCj4gW8KgwqAgMTQuMzg2MjQz
XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIHN0YXJ0IGZpcm13YXJlOiAtMTEw
Cj4gW8KgwqAgMTQuMzg2MjY2XSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIHNl
dHVwIGRldmljZTogLTExMAo+IFvCoMKgIDE0LjM4NjMwMF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAw
LjA6IGZhaWxlZCB0byBzdGFydCBkZXZpY2UgOiAtMTEwCj4gCj4gQW5kIHNvIC0gb24uCj4gSXMg
aXQgZnVuY3Rpb25hbGx5IGRlcGVuZGVudCBvbiBvdGhlciBwYXRjaGVzIGluIGxpbnV4LW5leHQg
b3IgYW5vdGhlciAKPiB0cmVlIEkgd29uJ3Qgc2VlIGluIDUuMTk/CgpJIGhhZCBhIHRyeSB3aXRo
IGxpbnV4LW5leHQgYW5kIHlvdXIgc2VyaWVzIGJ1dCBJIHJlcHJvZHVjZSB0aGUgc2FtZSAKZmFp
bHVyZSBJIGRlc2NyaWJlZCBhYm92ZS4KCmVlM2EwNjZlNGY0ZSAoSEVBRCkgYXRoMTFrOiBGaXgg
ZmFpbGVkIHRvIHBhcnNlIHJlZ3VsYXRvcnkgZXZlbnQgcHJpbnQKNGY4NTBmMWUyNmRjIGF0aDEx
azogRW5hYmxlIGxvdyBwb3dlciBtb2RlIHdoZW4gV0xBTiBpcyBub3QgYWN0aXZlCmUzMjBjOGVm
OTg0MSBhdGgxMWs6IE1vdmUgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gbG9naWMgdG8gc3RhcnQo
KQpkYmMyNjAzNmMxZWYgYXRoMTFrOiBGaXggZG91YmxlIGZyZWUgaXNzdWUgZHVyaW5nIFNSTkcg
ZGVpbml0CjE4YzEwN2ExZjEyMCAodGFnOiBuZXh0LTIwMjIwNzIyLCBsaW51eC1uZXh0L21hc3Rl
cikgQWRkIGxpbnV4LW5leHQgCnNwZWNpZmljIGZpbGVzIGZvciAyMDIyMDcyMgoKCgotLSAKYXRo
MTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
