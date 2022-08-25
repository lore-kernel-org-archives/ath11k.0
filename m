Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF46ECAA25
	for <ath11k@archiver.kernel.org>; Thu, 25 Aug 2022 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MTcHf8+YIGbQJqVDXFc8/iAY2ZBOen09pJxcG2ej2o=; b=TuNPLZ8UozmK7CsHqReUlWWNID
	DY8PvPHnnDWVpxZJ67Z6fGS1FDEDYPqs5ArEYmo58Njoh1KGJk5B/wBm7qaKCbAQ0mL9kvQ9rPWVq
	BCvruOrOtDXZHFnPfRWeOy47PUAw0Nm17Pkx4rxN1aqx6Ge8LobzKdbvhamKHKH8EjHxi+tEsII8n
	8wb7vR9SCL2uMqNEOddmg0uxWXTI6Y+nwkRNYsk9GUT9Q+WdiMuKRmxjdolF9l6i6gEN/M8KgAG4H
	a0/tdlu9TVKqj2P0Qnl87bZDgFUQU4vYd6R976ckRibSDzqg1UpcXfNP+rPic80VGyPUvwytBiTQW
	EqsKtscg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRGT6-00GnoA-3n; Thu, 25 Aug 2022 17:16:36 +0000
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com ([40.107.237.52] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRGT2-00GnmZ-3f
	for ath11k@lists.infradead.org; Thu, 25 Aug 2022 17:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VucpknED3k/ZtemwzrQFbTEXrGJBype18bOA8U8b4D+capZR4zBMXnQ+UJYLn4Ss7T3LW3NevZVEvzP/rqs4heem22JfBw/Gy4/NGiw2MpndwmntvrTR1MVsBc1Fbj9lBm2CEDXuaYi4+8uYoF2FViO4tMnCsV8s8clX44hM9zkiKYsHco3/krY3vzF2XVij3g0bNZ/BG/Vfn1/b09yjKgDCSMKKsqkEzmEAK5LBy8xsGHpzedT3feZFz8MfzZz6kXSKe+ssxtiyEHP+cfcJMX6KvmkScgqFD74WRnYFfm0sVbeAiR+yh/3GWAFeTASkkH/DvbUhRAZwKY2scpbU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTYpXJf+ekONyF7OwzcOivCC3fbeWjERxMbDFVUXUsg=;
 b=eDbMWveEVDRcQKzX+fLIJafcWhAENnOVFM/M16qOrsLD7dL99H4hYXlNm0eZ4wcqBICkwbRhXzOhcAHSZe7Hv8ohJDlRItrkWXQe/2ueb8ZKK10WuAmeAryqzVRfdUnXxlkBO2G4Pbl6owSPDANQCTT6yQy7B9Zp4sFYzazb/lpUzazCF0G6lTtgATLKyfdYHxoS3wS3nL1YhZVi8sR8wpug/avWwv92r8LJBkc0gRJRLcRucIGTpOOqnqZGQhPbwN5x3WHCmFRsP1MJjtO2UYhct5PtvAqQ9VRsZaZrjDwyJj+SKmSVuhNKhrfauk74w/sAeKQebM/AKW+g4HjDNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTYpXJf+ekONyF7OwzcOivCC3fbeWjERxMbDFVUXUsg=;
 b=S+j0XrfThirChcxpYuIG8uf1PW0K0j5FyQtAeieYlFUkxJjt3txrrG6Stri85vQzQUhr6pIvjZNmwGlIRB1V/Q1pSPV/Cnpo9ucjkkKrhcEXr9GkakhPPG2seSNwSzIRN4SkI2MLJCpaO8Hy59TBAoKZkEf0ytc1QPrTregA1t0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BN6PR1201MB0004.namprd12.prod.outlook.com (2603:10b6:404:ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 17:16:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::e00a:1f8c:dcd1:afc3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::e00a:1f8c:dcd1:afc3%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 17:16:24 +0000
Message-ID: <7e00cc36-3a07-92e2-c60e-a3c8939b407e@amd.com>
Date: Thu, 25 Aug 2022 12:16:22 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/4] ath11k: Enable low power mode when WLAN is not active
Content-Language: en-US
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
 <ad99d238-dc1a-3233-fc6b-0cd49e428903@amd.com>
 <6daefd60-dcbc-06e1-8091-ea225690edf8@amd.com>
 <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <ecce8764-1760-4617-49aa-c111305ebd55@quicinc.com>
X-ClientProxiedBy: MN2PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:208:134::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e89473-2706-48fa-d722-08da86bd896e
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kxrZz9Hw7yKeyaLl/P9rw2x1AeJp7PP4b1IyjN5/HnkIPOIrLnDWmXpgIox5TQxhdbUaHEhYskW1aMeC0D5BAGp3NNKdO9p+dY7eoMXBevLelQAzKrKDpPsJ/6Q0EQSpig2Uv1KUvOf82jhqL+MQv5vBZap/Ij8dZFAJxpNg0SWSnHw+o6yY+PL7uiD8/FGAF3IJlAqSWkJET3bZ/v1eG29cRs9X0G4iQGqGpyL3U2DEsWMgtW2oljnt7xQ4k2O7pNyUxkWET2c6n0J2MaeVg1tevD8UoN3tiA3LYg/44HnRwuVe2ZHqK+n9UR1jEebWTF5En47QRsRHigJt7WVZwGpSE1rYYnpk29/awxI0Ft8adb31k8OgbD482zas2rwDcfwvdGqjP/2S79oRPVKL39ZN8D8rEGlLlmLlGyYw43BH1uUqxLm4ul43ATKajvzJBestjlhBUhzmrRptSDaUNkfva52apRSWPa3uWRvuKZQ1assLReHPo39/YxLNR4RyzvaG9sZCP1jTVzZu1tzrq5Qpz2XatemzELUB6C5d2g51ILXH09ExYaW8kn8uU4TSMsvpN6MOui4x9Y7ICyqdQC1HibxdXDtZUsh8fvFdF3IU2N9ifizhQpI9lGxqwnXdn3vFNh1tx71bf5ii0xZ/p2U3IKywx3tRg8J7DOGldnkXfbR+Jfu+8UWpEZl/3Ruae0EVuEHxCJ9E84fSQFosqkEPynTcJAheUQxd7xF88UMheZsg2aQYRfb3+fOfb/LHxPBRiiQQOTwHmpsdKVparEXi3aj5ecQ2s7grSGt7FGQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(86362001)(31696002)(186003)(6512007)(4326008)(66476007)(6506007)(8676002)(53546011)(66946007)(66556008)(6486002)(41300700001)(26005)(478600001)(2616005)(38100700002)(36756003)(4001150100001)(83380400001)(8936002)(316002)(2906002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bGZFUDBaQXhwVmZiajFKeUZidVJ0ZllyQ0F5TE9WbWorZ0RyQmt2NDNxOUNE?=
 =?utf-8?B?dDdRSTZvOE4vd2pudjZGTjIyS0kvNUVlTW5kems1amlWd3BYVTVaU2Z4OHNU?=
 =?utf-8?B?eGlON0RweTZUemp3NDFaeHBkRkhVeEQzdnNxbERBNzlwUnBLUEN0NW9FSXhW?=
 =?utf-8?B?eXhCbElvbGFrSGxxRDVMY0JsMzBOLzZKZE5Ya0o1N3BYdTJJN1dSQXcwTlN2?=
 =?utf-8?B?em01NCtXd0Y3eUcxMFIwb3BTY2tIZE9WajJYemJCaEdCbzlSRHdnZER4THBR?=
 =?utf-8?B?ZlhNMDdrcjVaYWZVUzZBUGJ5Q01oS0xXbW9kd2h3alpqQ3dDK05qMDlaQmtR?=
 =?utf-8?B?enFUOWFFR0lHVjhUcnhwS1U0YWxZQ0ZGTjhIR0RPSmhWZDhNbXY3eEZSektW?=
 =?utf-8?B?SFJUY1BveElac0l6djZiV0NFZ1ZvTWRhKzllZjV5UnF6RDdJdTQ3d2o0SGMv?=
 =?utf-8?B?SlBEZE5oejNuTng3YTdIRmZ6RThtcm1mU0xXZFJsbitsUDc4eDdEUkNyTDg4?=
 =?utf-8?B?WkkzSlFHSXRVcU80eXpPL1VOdU12dDhoeWc2aitPUS9hOXVFTGZ4M3J0U2pa?=
 =?utf-8?B?L0MrNTcvTjIrZHp6VVIzNUpid0owR3dxVU8rbkVDdDQ2WkEzaFhiZmtMdXJ2?=
 =?utf-8?B?eGFvSFduM0Vyamc1QUNadHkydmZRQ1dsTFFZcDR3Y3MxZnJqRmxUYWE3TVY1?=
 =?utf-8?B?SDFpMURoSlZlT1NMcURpOUJLeU9zdk1GcUNXVk90Qy9MQ09VU2ZDT2tjTkFp?=
 =?utf-8?B?TzFabUV6dyt1TjRyakdKekx0OFRuM09UTklyZkpxem1IY1Vxd0VOUzNxVWwy?=
 =?utf-8?B?OGNYTWZWZTUwU01CWG4xNFFUeTJQVFhIZ2lGSW1janQ4U1Vjb2gwcDZ1YmdE?=
 =?utf-8?B?bmtTQ2x6V0VrNmNGZ1FzeUw4R1R2QUxjUEFmZTNUc3BKNnR6VkI0eDZPUlFZ?=
 =?utf-8?B?ZkpZbHZra1doZFhDbmptMUFFRndEZjhBOXA0T2d4V0dLYkFQS1ZxMG5IS1JO?=
 =?utf-8?B?eVhKTFBEWm1zNlh6dWloeFVYamlnWjhnVlAveGpiOEtZZWJTcFhscjhBVzZl?=
 =?utf-8?B?TzRzTGd4dVB4d1AyazkydSswRUszRmhjK21qV2RqSVc4NTNlL1hES204MzhN?=
 =?utf-8?B?SFcwRG9wRVBkRDZrcHNzZE5mZk5KOUtERXdhTTVnVk5yTzJNWGFIalJHTWFk?=
 =?utf-8?B?SHFzOWl6c0NFMmFCVHVtcUpTalJiajB3U29oeTUybWZwdHA2NkVjYVF4d2h4?=
 =?utf-8?B?NkMrWTg4S2g1N2lIVTJ1ZmdnbG40S2dYVHQrNFZNMXEvb2tpTk1LekkwR0da?=
 =?utf-8?B?cVFLZkl5QkNYTytzKzJpOW4yeU9DK3FTRWlEQU5nSWF1QTZkNmRTTVdDTzk1?=
 =?utf-8?B?aHJMM0dMalg2TW9RVlBTRnRsVmIvT0tMZ2ZYYWtSU2F4M0d4czhVYUxsZmp5?=
 =?utf-8?B?L2d3czZ2djg5ajBIVTdiVXB2aU96WXRVU0Y2dUI2RDNZUUEyOFlZMUwxSG9O?=
 =?utf-8?B?OGlWN3lPUVhjL2Y0bWlNb2NzWjhnTm4vYU9MK0svUjFjaE92aE5Od3dsRURP?=
 =?utf-8?B?bUw0SGE2YXZzbnZqUE9aMFNlMGJXcDdqUVNoNWhIT0VnTCtnaUxpSGhYNHdp?=
 =?utf-8?B?ZmZLOUMvWGJBRGFUeVRJQXNadmVBT2lROWRZc3kwTU1valBaWTdhSnNTazNv?=
 =?utf-8?B?TERrM2EzRU1qeXBnQlZCN3hFN3czb1N3a0lyZ3F4NDdRWXdOVmpwejlsZVJG?=
 =?utf-8?B?c2RHVDdYeTRWRDlGd3pQb1VFQUp2eGdIRy9hWHI0MjczMDFacnRoOEVDTXJH?=
 =?utf-8?B?YVl3d1RjSjh4OWdMYmg0NGxvZTVhZFhvNUk2UnFUQldnbTlxM0JvdDRZczVO?=
 =?utf-8?B?WlRMUkZ1dzdXVzZmaVR4OFJQMmVYdUZSZmNRUi9LSHh1UHNhMEE5WDJXVFlr?=
 =?utf-8?B?RWJMaGJraXowQ2l4WlNKQ2UvRFRURHhFZmtoSVQwZWtudFluY2ppYlJMWWdW?=
 =?utf-8?B?anQ0Q1BhNnAyak5LbkpQeEU0Sm1ncHRNQlI2U2VoRVE1Q2VQcDR4UXgwRFpQ?=
 =?utf-8?B?VnB4RFU2clo4ZlJ4VFNhdkUyamgrT0NuTS9RU1pNd1RzM0pIOVBnTm1jKzJG?=
 =?utf-8?Q?89kMnxxwXiPYO1va6As6swpIF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e89473-2706-48fa-d722-08da86bd896e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 17:16:24.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XRu8C6rMN+yCOXyS1Cfk6/QYST7RQakZR7s4Ucc/woA0RkGmXRttEBDzYkFYv3yIGDgHn2PGWWVujR0xtOxKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_101632_690890_E2DC0222 
X-CRM114-Status: GOOD (  28.37  )
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

T24gOC8yNS8yMDIyIDA2OjI0LCBNYW5pa2FudGEgUHViYmlzZXR0eSB3cm90ZToKPiBPbiA3LzIz
LzIwMjIgNTozOSBQTSwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOgo+PiBPbiA3LzIyLzIwMjIg
MTc6MDAsIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToKPj4+IE9uIDcvMjAvMjAyMiAwODo0OSwg
TWFuaWthbnRhIFB1YmJpc2V0dHkgd3JvdGU6Cj4+Pj4gQ3VycmVudGx5LCBXTEFOIGNoaXAgaXMg
cG93ZXJlZCBvbmNlIGR1cmluZyBkcml2ZXIgcHJvYmUgYW5kIGlzIGtlcHQKPj4+PiBPTiAocG93
ZXJlZCkgYWx3YXlzIGV2ZW4gd2hlbiBXTEFOIGlzIG5vdCBhY3RpdmU7IGtlZXBpbmcgdGhlIGNo
aXAKPj4+PiBwb3dlcmVkIE9OIGFsbCB0aGUgdGltZSB3aWxsIGNvbnN1bWUgZXh0cmEgcG93ZXIg
d2hpY2ggaXMgbm90Cj4+Pj4gZGVzaXJhYmxlIG9uIGEgYmF0dGVyeSBvcGVyYXRlZCBkZXZpY2Uu
IFNhbWUgaXMgdGhlIGNhc2Ugd2l0aCBub24tV29XCj4+Pj4gc3VzcGVuZCwgY2hpcCB3aWxsIG5v
dCBiZSBwdXQgaW50byBsb3cgcG93ZXIgbW9kZSB3aGVuIHRoZSBzeXN0ZW0gaXMKPj4+PiBzdXNw
ZW5kZWQgcmVzdWx0aW5nIGluIGhpZ2hlciBiYXR0ZXJ5IGRyYWluLgo+Pj4+Cj4+Pj4gU2VuZCBR
TUkgTU9ERSBPRkYgY29tbWFuZCB0byBmaXJtd2FyZSBkdXJpbmcgV2lGaSBPRkYgdG8gcHV0IGRl
dmljZQo+Pj4+IGludG8gbG93IHBvd2VyIG1vZGUuCj4+Pj4KPj4+PiBUZXN0ZWQtb246IFdDTjY3
NTAgaHcxLjAgQUhCIFdMQU4uTVNMLjEuMC4xLTAwODg3LVFDQU1TTFNXUExaLTEKPj4+Pgo+Pj4+
IE1hbmlrYW50YSBQdWJiaXNldHR5ICg0KToKPj4+PiDCoMKgIGF0aDExazogRml4IGRvdWJsZSBm
cmVlIGlzc3VlIGR1cmluZyBTUk5HIGRlaW5pdAo+Pj4+IMKgwqAgYXRoMTFrOiBNb3ZlIGhhcmR3
YXJlIGluaXRpYWxpemF0aW9uIGxvZ2ljIHRvIHN0YXJ0KCkKPj4+PiDCoMKgIGF0aDExazogRW5h
YmxlIGxvdyBwb3dlciBtb2RlIHdoZW4gV0xBTiBpcyBub3QgYWN0aXZlCj4+Pj4gwqDCoCBhdGgx
MWs6IEZpeCBmYWlsZWQgdG8gcGFyc2UgcmVndWxhdG9yeSBldmVudCBwcmludAo+Pj4+Cj4+Pj4g
wqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9jb3JlLmMgfCAyMzcgCj4+Pj4gKysr
KysrKysrKysrKysrKysrLS0tLS0tLQo+Pj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvY29yZS5oIHzCoMKgIDggKy0KPj4+PiDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTFrL2hhbC5jwqAgfMKgwqAgMSArCj4+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDExay9tYWMuY8KgIHzCoCAzMyArKy0tCj4+Pj4gwqAgZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDExay9yZWcuY8KgIHzCoMKgIDIgKwo+Pj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgMTg5
IGluc2VydGlvbnMoKyksIDkyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pgo+Pj4gVGhpcyBzZXJpZXMg
bG9va2VkIHBvdGVudGlhbGx5IHByb21pc2luZyB0byBtZSBmb3IgYSBwcm9ibGVtIHRoYXQgSSdt
IAo+Pj4gc2VlaW5nIG9uIGEgbm90ZWJvb2sgZmFpbGluZyB0byBzbGVlcCB3aGVyZSBXTEFOX1dB
S0UgaXMgYXNzZXJ0ZWQgb24gCj4+PiB0aGUgV0NONjg1NSBvbiByZXN1bWUgZXZlbiB0aG91Z2gg
V29XIHdhc24ndCBzZXQgYXQgYWxsLsKgIFRoaXMgaXMgCj4+PiBwcm9ibGVtYXRpYyBhcyBpdCBj
YXVzZXMgYSBzcHVyaW91cyB3YWtlIHdoaWxlIFNVVCBpcyByZWFkaW5nIGZyb20gCj4+PiB0aGUg
RUMgc2luY2UgdHdvIElSUXMgYXJlIG5vdyBhY3RpdmUgYW5kIHRoZSBrZXJuZWwgd2FrZXMgZnJv
bSB0aGF0Lgo+Pj4gUmVtb3ZpbmcgdGhlIFdDTjY4NTUgZnJvbSB0aGUgc3lzdGVtIGl0IGRvZXNu
J3QgaGFwcGVuLgo+Pj4KPj4+IEkgZmlndXJlZCBJJ2QgZ2l2ZSBpdCBhIHNwaW4gdG8gc2VlIGlm
IGl0IGltcHJvdmVkIHRoaW5ncy4KPj4+IEkgYXBwbGllZCB0aGUgc2VyaWVzIG9uIHRvcCBvZiA1
LjE5LXJjNyBhbmQgaXQgYXBwbGllZCBjbGVhbmx5IGJ1dCBJIAo+Pj4gZ2V0IHRpbWVvdXRzIG9u
IHdsYW4gY2FyZCBpbml0IChhbmQgb2YgY291cnNlIHN1c3BlbmQgZmFpbHMgbm93IHRvbykuCj4+
Pgo+Pj4gSGVyZSdzIHRoZSBtaGkvYXRoMTFrX3BjaSBzbmlwcGV0czoKPj4+Cj4+PiBbwqDCoMKg
IDIuODY0MTEwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0g
Cj4+PiAweGI0MDAwMDAwLTB4YjQxZmZmZmYgNjRiaXRdCj4+PiBbwqDCoMKgIDIuODY0OTAxXSBh
dGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogTVNJIHZlY3RvcnM6IDMyCj4+PiBbwqDCoMKgIDIuODY0
OTEyXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogd2NuNjg1NSBodzIuMQo+Pj4gW8KgwqDCoCAz
LjEwNjg5Ml0gbWhpIG1oaTA6IFJlcXVlc3RlZCB0byBwb3dlciBPTgo+Pj4gW8KgwqDCoCAzLjEw
NzA1NF0gbWhpIG1oaTA6IFBvd2VyIG9uIHNldHVwIHN1Y2Nlc3MKPj4+IFvCoMKgwqAgMy4xOTgx
NzhdIG1oaSBtaGkwOiBXYWl0IGZvciBkZXZpY2UgdG8gZW50ZXIgU0JMIG9yIE1pc3Npb24gbW9k
ZQo+Pj4gW8KgwqDCoCAzLjk3MTAxOV0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjA6IGNoaXBfaWQg
MHgyIGNoaXBfZmFtaWx5IDB4YiAKPj4+IGJvYXJkX2lkIDB4ZmYgc29jX2lkIDB4NDAwYzAyMTAK
Pj4+IFvCoMKgwqAgMy45NzEwMjVdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBmd192ZXJzaW9u
IDB4MTEwODBiYmIgCj4+PiBmd19idWlsZF90aW1lc3RhbXAgMjAyMS0xMi0xNiAwMzo0MiBmd19i
dWlsZF9pZCAKPj4+IFdMQU4uSFNQLjEuMS0wMzAwMy1RQ0FIU1BTV1BMX1YxX1YyX1NJTElDT05a
X0xJVEUtMgo+Pj4gW8KgwqDCoCA0LjI5MDMyOF0gYXRoMTFrX3BjaSAwMDAwOjAxOjAwLjAgd2xw
MXMwOiByZW5hbWVkIGZyb20gd2xhbjAKPj4+IFvCoMKgwqAgNC4zMDg3NjBdIGF0aDExa19wY2kg
MDAwMDowMTowMC4wOiBGYWlsZWQgdG8gc2V0IHRoZSByZXF1ZXN0ZWQgCj4+PiBDb3VudHJ5IHJl
Z3VsYXRvcnkgc2V0dGluZwo+Pj4gW8KgwqDCoCA0LjMwOTAyOF0gYXRoMTFrX3BjaSAwMDAwOjAx
OjAwLjA6IEZhaWxlZCB0byBzZXQgdGhlIHJlcXVlc3RlZCAKPj4+IENvdW50cnkgcmVndWxhdG9y
eSBzZXR0aW5nCj4+PiBbwqDCoCAxNC4zODYyMDFdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBx
bWkgZmFpbGVkIHdsYW4gaW5pIHJlcXVlc3QsIAo+Pj4gZXJyID0gLTExMAo+Pj4gW8KgwqAgMTQu
Mzg2MjEwXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogcW1pIGZhaWxlZCB0byBzZW5kIHdsYW4g
ZncgCj4+PiBpbmk6LTExMAo+Pj4gW8KgwqAgMTQuMzg2MjE0XSBhdGgxMWtfcGNpIDAwMDA6MDE6
MDAuMDogZmFpbGVkIHRvIHNlbmQgZmlybXdhcmUgCj4+PiBzdGFydDogLTExMAo+Pj4gW8KgwqAg
MTQuMzg2MjQzXSBhdGgxMWtfcGNpIDAwMDA6MDE6MDAuMDogZmFpbGVkIHRvIHN0YXJ0IGZpcm13
YXJlOiAtMTEwCj4+PiBbwqDCoCAxNC4zODYyNjZdIGF0aDExa19wY2kgMDAwMDowMTowMC4wOiBm
YWlsZWQgdG8gc2V0dXAgZGV2aWNlOiAtMTEwCj4+PiBbwqDCoCAxNC4zODYzMDBdIGF0aDExa19w
Y2kgMDAwMDowMTowMC4wOiBmYWlsZWQgdG8gc3RhcnQgZGV2aWNlIDogLTExMAo+Pj4KPj4+IEFu
ZCBzbyAtIG9uLgo+Pj4gSXMgaXQgZnVuY3Rpb25hbGx5IGRlcGVuZGVudCBvbiBvdGhlciBwYXRj
aGVzIGluIGxpbnV4LW5leHQgb3IgCj4+PiBhbm90aGVyIHRyZWUgSSB3b24ndCBzZWUgaW4gNS4x
OT8KPj4KPj4gSSBoYWQgYSB0cnkgd2l0aCBsaW51eC1uZXh0IGFuZCB5b3VyIHNlcmllcyBidXQg
SSByZXByb2R1Y2UgdGhlIHNhbWUgCj4+IGZhaWx1cmUgSSBkZXNjcmliZWQgYWJvdmUuCj4+Cj4+
IGVlM2EwNjZlNGY0ZSAoSEVBRCkgYXRoMTFrOiBGaXggZmFpbGVkIHRvIHBhcnNlIHJlZ3VsYXRv
cnkgZXZlbnQgcHJpbnQKPj4gNGY4NTBmMWUyNmRjIGF0aDExazogRW5hYmxlIGxvdyBwb3dlciBt
b2RlIHdoZW4gV0xBTiBpcyBub3QgYWN0aXZlCj4+IGUzMjBjOGVmOTg0MSBhdGgxMWs6IE1vdmUg
aGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gbG9naWMgdG8gc3RhcnQoKQo+PiBkYmMyNjAzNmMxZWYg
YXRoMTFrOiBGaXggZG91YmxlIGZyZWUgaXNzdWUgZHVyaW5nIFNSTkcgZGVpbml0Cj4+IDE4YzEw
N2ExZjEyMCAodGFnOiBuZXh0LTIwMjIwNzIyLCBsaW51eC1uZXh0L21hc3RlcikgQWRkIGxpbnV4
LW5leHQgCj4+IHNwZWNpZmljIGZpbGVzIGZvciAyMDIyMDcyMgo+Pgo+Pgo+IAo+IFNvcnJ5IGZv
ciBsYXRlIHJlcGx5IGFuZCB0aGFua3MgZm9yIHJlcG9ydGluZyB0aGUgYnVnLgo+IEFmdGVyIHNl
dmVyYWwgcm91bmRzIG9mIGRpc2N1c3Npb25zIHdpdGggdGhlIGNvbmNlcm5lZCB0ZWFtcyBvbiB0
aGUgCj4gZmFpbHVyZSB0aGF0IHlvdSBoYXZlIHJlcG9ydGVkLCB3ZSBoYXZlIHJvb3QgY2F1c2Vk
IHRoZSBpc3N1ZS4KPiAKClRoYW5rcyBmb3IgZ2V0dGluZyBiYWNrIHRvIG1lIGFuZCBjb25maXJt
aW5nIHRoYXQuCgo+IFRoZSBjaGFuZ2VzIHRoYXQgSSBoYXZlIHBvc3RlZCB3aWxsIG5vdCB3b3Jr
IG9uIG90aGVyIHRhcmdldHMgbGlrZSAKPiBXQ042ODU1IGFzIGlzLiBJdCByZXF1aXJlcyBhZGRp
dGlvbmFsIGNoYW5nZXMgYW5kIHRoZXJlZm9yZSBsb3RzIG9mIAo+IHRlc3RpbmcuCgpXZWxsIGds
YWQgSSByZXBvcnRlZCBpdCBhbmQgc2F2ZWQgeW91IGEgcmVncmVzc2lvbiEKCj4gCj4gRm9yIG5v
dywgSSBoYXZlIHBvc3RlZCBhIFYyIGVuYWJsaW5nIHRoZSAibG93IHBvd2VyIG1vZGUiIGRlc2ln
biBvbmx5IG9uCj4gV0NONjc1MC4gSSBoYXZlIHN0YXJ0ZWQgd29ya2luZyBvbiBlbmFibGluZyB0
aGUgbG9naWMgZm9yIG90aGVyIGNoaXBzZXRzIAo+IGFsc28uIE9uY2UgdGhlIGNoYW5nZXMgYXJl
IHdlbGwgdGVzdGVkLCBJJ2xsIHBvc3QgYSBzZXBhcmF0ZSBwYXRjaCB0byAKPiBlbmFibGUgaXQg
b24gV0NONjg1NS4gSXQgbWlnaHQgdGFrZSBhIGxpdHRsZSBtb3JlIHRpbWUuCj4gCgpXaWxsIGxv
dyBwb3dlciBtb2RlIG9uIFdDTjY4NTUgYWxzbyByZXF1aXJlIEYvVyBjaGFuZ2VzLCBvciB5b3Ug
ZXhwZWN0IAp0aGF0IGl0IHdpbGwgYmUgYWJsZSB0byBiZSBkb25lIGVudGlyZWx5IGluIHRoZSBr
ZXJuZWwgZHJpdmVyPwoKSSBhbSBlYWdlciB0byBzZWUgaWYgbG93IHBvd2VyIG1vZGUgY2FuIGZp
eCBteSBleGlzdGluZyBtZW50aW9uZWQgaXNzdWUuIAogIElmIGl0IGNhbiB5b3UgbWF5IENDIG1l
IHdoZW4gdGhleSBnbyBvdXQgYW5kIEknbSBoYXBweSB0byB0ZXN0IHRoZXNlIApwYXRjaGVzIHRv
byB3aGVuIHlvdSBoYXZlIHRoZW0gcmVhZHkuCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRo
MTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMWsK
