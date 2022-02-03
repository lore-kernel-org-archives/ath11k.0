Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B68C433EF
	for <ath11k@archiver.kernel.org>; Thu,  3 Feb 2022 04:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbEIexY5gz5Pgt1r9jmc2NvaclcwYdE3ObSXEYU2jUU=; b=Rea3Sv8VrB9w+x
	g7cxAIP0CMXIi2a2oUVJm3cKter4xlKorHSR2CFIMQTEHUtTY6f2kEfqgVy9/1arbxsgIv3iRHkI+
	wZn0CU8tM70iqCfYmZSMhtiDpqTM5TYnSVj3J5r6r6qlrobzG56fJcG8x4/YaiKfgrECe39OOhaWV
	MIWL8RvFtQHLrTYvJ+kXhcv9f18oQrMlVRXuV8reLV8IFOZHmyxQ8wR6mGDa6eZ9d6jULMelL9YSJ
	r1DFR0p08tyk22iPsWOwvMpP7lYTJZZkg1M3WUarwUkqNGGxbWeI9AKR9P8J3px1dFgsitKcz/VEs
	rvAIh67Lz/HFUV7YHyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFTHu-00HWpc-6N; Thu, 03 Feb 2022 04:00:02 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFTHq-00HWoE-Sj
 for ath11k@lists.infradead.org; Thu, 03 Feb 2022 04:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1643860798; x=1644465598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xTgXxg6JQ8m9yNwMuNbOmxLQ/6S78s/k9kbOBICBwNU=;
 b=cPGZ2fkKmwYEdNUkP9G7nDBgJFIUKVSR5CBgPJdowFy6pCipgwYbptob
 leCEZ6dvChQJBFjFa0GpWR15H7ZUE9Ij4D1CEvZvZXaGZaAHqip1ro3UK
 GLnlFUllG5+i66EEgG5nJT4jXeKQ9wyqN1B9xq0IMJ77PVaF0gy8Vm0Rz E=;
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 03:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7k3UPzpVnQDHTbFXJd8MLGe5Dj+R2qgulJkRSlBp33/a7bKGqqjiHFIczrhr68iAY5WHjfN2cqv8VyMdzqns5TJgt1pgnn/qCbuJNHwD/tVR/W7BCCMWAKa1Daom0WDz1sd4j1na0UFlCZvtNVRXMxUEpAd2ZdTOXo5d+77lqJPjausrBtXhsOgFYDYWaVg0YkfQSFRWmf/qf02Dnch9CRXKWnnJYTsInuRTa80DEeNAJZkQzoow2XQ4rUP4BmgpBriarcBEYj3pOGePEwZzgEcHkhM1PjgqRPY+aUr+Ieusvc5QdJqn2ITppC+JSoO6vk4Ci3lqysFx6C0u91LTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTgXxg6JQ8m9yNwMuNbOmxLQ/6S78s/k9kbOBICBwNU=;
 b=Jh2qV4awpzucDzH2YEMXlkOp/nIYzMGop1ySo5XCccy4jvZ1yX34LRY3skZilEAM+YEtEj2c5wQBf0G08pa+n2DxSB5US0ip8KFQjSU+Fb+iHy4qCQnJdxayEkfChx41UlLD/dOmkQO5MQewqnMtlogtJNVusN1qkPpkpldZ+TGp+J0QNS2ZNWXRKemDaLltiDojW68Q682UoFsDElmHTxlNvR1bM7SxdwXuCNMVPcTjmWU+KlDO6fJv10TtABcAuRRG3joWJa2YvNut9mOgKh7Spshs8pLYj9DpJivgsQc3h0aKffN4rk1iMnlKXZ4Ad2FU+qZdCb/vNcrMAIRYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by PH0PR02MB7703.namprd02.prod.outlook.com (2603:10b6:510:5c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 03:59:55 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::c46e:8122:675f:933e]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::c46e:8122:675f:933e%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 03:59:55 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "Jeff Johnson (QUIC)" <quic_jjohnson@quicinc.com>, "Karthikeyan Periyasamy
 (QUIC)" <quic_periyasa@quicinc.com>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v3] ath11k: Add peer rhash table support
Thread-Topic: [PATCH v3] ath11k: Add peer rhash table support
Thread-Index: AQHYGAcswChVSVdESkiJ45rN60RDxqyA37oAgABU1qA=
Date: Thu, 3 Feb 2022 03:59:54 +0000
Message-ID: <CH0PR02MB82123D9C6B4B0D866B97AABBF6289@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <1643787194-31355-1-git-send-email-quic_periyasa@quicinc.com>
 <de395fa7-6906-bdef-19c7-dbc229bd35e9@quicinc.com>
In-Reply-To: <de395fa7-6906-bdef-19c7-dbc229bd35e9@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44085c7c-6850-44da-a3d4-08d9e6c9a336
x-ms-traffictypediagnostic: PH0PR02MB7703:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR02MB770377AAF2655A7C049980298A289@PH0PR02MB7703.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wMIN9ktZMVpvsHPDXbWjwbGopqFuxvNmUDSox5+PA+mYVRTvN97u3cdsn8QUbdH8YqQSmFaq9L4JW/S0diYEZEWEkUCuh8KkNk/NjMfAEhee/CaUeDi2YKWgzxL3FmPCObZT4uqBddNJc0xmPuht9u39TCH45ncxpG5pqqnQp36yHj8gpKmGUi0OauIjok/Ppedt8AxnP/1CmdTKuCKBDblH6g0BVF+IRBORIloxP7GHj/6Jm4RgL1dgMx18hEF+VOh5yEhtyrPnHKSQfD7h0zbnatcBQCFO7m0uI9APe7ak+nQMpW0MZI+FqWaZwkVPLKI5vbBHRK8tFxGl3CQ2VAtJo/BRM6EGRqZPn7kokuIWeND4FLqF5fCcxOBlalt6J3WDzb0Uw4I7Lxa89D9bCQ2DaRCToU8ckayU90AeEomUW7cGqCb3bSn06RmfJMi4BLERyGioxnUCHbAMUWTZuN9AaxbYjf2apGgnMBKHv1JRY3Ju4MdI4e2jjsyBADfpQWl2UUT6ED3HzWdNBs2CDHziD99FxlBoEDNhsMW6rprh1P+3C5BBx966K1NCxJfgW0siZVeP4Nf3UHh3ye7hfy/fAxXCvm4gVM4XdsOk8aW3GlYEGgUCq7SaO+RNMlThZjCVkJ+xMjJlr5u+TOvz5YXG22yy7f7rgmpI5hClbWxIC785lHJ2b9T1zs6kU++3MsNJTIFwJy0koC5WeOxCzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB8212.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(508600001)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(316002)(6506007)(53546011)(8936002)(7696005)(71200400001)(110136005)(33656002)(55016003)(66946007)(76116006)(38070700005)(52536014)(2906002)(86362001)(38100700002)(186003)(83380400001)(122000001)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2VqZnlkb1VUTVUxb2svRXdjekxwU3NHUUNzaUR3RXdmVW9wNnowbkhrVVJT?=
 =?utf-8?B?SEkzMWhwa2Faa1diV0g4QzRBNWNvVWhpSENkWVJwdVV1ZEJGZXpzT2hBWDBE?=
 =?utf-8?B?WmVqTDZzeHhHVkhKY2I1NWdZQ2IvN0R1SSsybzgwWEFQK2o3bm95VUFXeE5B?=
 =?utf-8?B?Q3plU3dBTGtjUnd1VGFRVjVHNHhSd1ZoZWV2VTg0bHFBWlJnVG8yZTFhVW9y?=
 =?utf-8?B?QmZIcy8wU2ZqSEUxMm8zWkFjUWIwTjZMcVFlVXNIbi9qRzJ0REFseDFHdktk?=
 =?utf-8?B?bGQ0aHBFRHhKbVg5WE1seWJlanJzV2FadEtzTXFYUTNOQkxYZHYzdFNPTm5Q?=
 =?utf-8?B?eWdaT29WeitkUmhMRVRXaXd5T1VnWjFDRVBGRkpUWWxWOVB6RGo2UFJnL2xK?=
 =?utf-8?B?RDBoNm9nQmNNdXZMVkhqUWVueEcwalpGMXNOS293SkFXbVl6UnlPaXJ6cUk1?=
 =?utf-8?B?eUl6dzc2LzVKRkdZWHFYVnQ3RnNkcVREcFFYcG9qdFBVUlhha0Z6cithTUZn?=
 =?utf-8?B?NTMxclJoMXJLVEFCNVVzRys4QUlQRE00REZ6c0NwV3hic2orWFB0SFAraXNY?=
 =?utf-8?B?N1JsZXd3dGJQTElVRlpWUzB4c2lHT2M4N2k1UFk3OVQzUlhrU0lVelZjekE0?=
 =?utf-8?B?ay9mc1dyS2VWZ0RHYVArRGRMYitqZGhoMTJldWp2UDd3NXRIZ0g4N0o3YUdQ?=
 =?utf-8?B?cTIvZlNPVkpMZWJzbjJIM0h3a05VQUZGK2ppNHVKZTlUSk5TZGhUTnZNYXgr?=
 =?utf-8?B?ckhJeGdVbXR6R3lpQ2E4Z01Db2pDYjE3MHQyekVRSUlrdkJNZ3pLc1BUWEty?=
 =?utf-8?B?dHNHSWxQNGxPek5QcTFKRTBwRU9DUFowYnVaMkFoRVFLa3BPeUlhdmlrZ1o2?=
 =?utf-8?B?aEl1RWJ2aGg2WmpBc1kveENNNUJzSjNwTndvdkt4SGNFQ0o3b0F0Q1VsZk9h?=
 =?utf-8?B?NlFLUlBvSC9QSjJKWGNJUXN4aEhWWU41ZDhURW5wdWZiYkFYaElyTk5ySllq?=
 =?utf-8?B?ZkVJZHRYc21DZFUwb0ozOFBuajNSSUF3alExZkQ2UnNQZmE1dGM1aVlVd1NJ?=
 =?utf-8?B?K2tnN0IwTWV0eSt4elpXOUtWRkYvdDNOclkrd0hlc3FMeVNYeVVtS3RBYk90?=
 =?utf-8?B?YmMxejR5VTdnR0g0L1NiSE5zYjVhZGgzeTl5cFV5bmxLUVdwRHljMURNTEc5?=
 =?utf-8?B?aW0xVk03NEZxWEZlc3FLUVpaN2ZESlFaSWo3VEZiWHNQZS9qdWFUMmQ4eUNJ?=
 =?utf-8?B?ZjFPbGsxMEoxSkdmRnlYdFoyd2FuaExyN1ZFSzkvOWFTbmxOM3dTQzZqazM0?=
 =?utf-8?B?TW9CSHdVa0FRTmVBNEZKdHppTmN2L0pmQ3lKWDhpaWRJN3FFRnpJY2VIT29S?=
 =?utf-8?B?aHBjVHgySElhcm5YcjhYYklYZVl1Tmh2OEV6ZUpjOWEvK0VhNU43aE9KM1Zt?=
 =?utf-8?B?eVZjUzVlQ0hRWVJZQ2ZrdXVyWXNRZ3RtK1p5UHFQVXN5R0lvYjVZclNuVk1P?=
 =?utf-8?B?MmJUWjlrN1RpYmM3bGQ5Zk1ZM3k0TUtHcExsUzY1YWpvSkI0YlpMdHUwbnF3?=
 =?utf-8?B?L1lMWkpCa3ZBOHlxVDZsTFFGL21nekU2NVUzNnp0V3c1cG83d2NtelM4UG1X?=
 =?utf-8?B?OTBaTnZrVUtxSGZpSHI3ZWRQYWg4RHNhbWl2SVVSTm5rL0xiZjM3R2pDTXRW?=
 =?utf-8?B?U1lqNXZPTzhKMzBzajZPdUd2aFk1QTVrME5jUWx1NjZHYzk5cGtwTExTaXp0?=
 =?utf-8?B?cHJoWUp0RU94VEVGeFI1WnFhdDJqamdLWXdhWDFqTzJjdE9RZjJXTTAzT3c0?=
 =?utf-8?B?Z3Q4KzRKNElOTVNYK3ovTDkydzBXZE9Pc3RuNFBSclF2WUJPUi9ZVzBkREsw?=
 =?utf-8?B?ZmExdVU2MjZmN0FJd0FISEtMcGJybVFlZUk0RVNlOUxoN3BIbXNuL1VMTElo?=
 =?utf-8?B?Tmllc3ZIZUhadHczUWp4a3FtQXk4VWc0QjNpNGVrdDZPdDBZbGw5KzRBdExJ?=
 =?utf-8?B?NzEwNmxCZWRxbXYyZ0JVOGQwekpmVlBXNVVVS2JvbU5uKzNqS3hFNmlYZjc2?=
 =?utf-8?B?TDlXdUowZkJrMFpkckZKemFPSFdmb1NpUnA5L0phcWFKKzJONkVwalByK1Mv?=
 =?utf-8?B?dWRDVmdiUmQxZ0tmb1RYSzNCald4YzNKZ1RBN0p4d3BkMVBhM2NjV2ZyQm5V?=
 =?utf-8?B?a0JyeTQ4VHZCa2YyYnZBbGk5MGVJYmRlWHdsSmRKVGk0ejBMZExVZlNESC9N?=
 =?utf-8?B?bU1STTdFeTRUL1BsQXJDV2pMdXNmdWZFSGlOV3pjc0lyUEtvdjZjd1JBWTVW?=
 =?utf-8?B?dUNNUnZ3YVJ6bWZpMkdUQytvWkZ1NEJuTXhJZWRVMHFvTGdtd0FaUT09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44085c7c-6850-44da-a3d4-08d9e6c9a336
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 03:59:54.9141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4ipJiWfDcfMqzjoVI1zBT+E7NOKXwQ6SDA6yrbl9YiGP1mqrXODy2Gk88zT0UGWslG79Db7Ir2+hzNEwULsraJwfYnSOeMdAs3D5ZIgE3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_195958_957059_6617B20C 
X-CRM114-Status: GOOD (  10.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Jeff Johnson (QUIC) <quic_jjohnson@quicinc.com>
> Sent: Thursday, February 3, 2022 4:25 AM
> To: Karthikeyan Periyasamy (QUIC) <quic_periyasa@quicinc.com>;
> ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCH v3] ath11k: Add peer rhash table support
> 
> On 2/1/2022 11:33 PM, Karthikeyan Periyasamy wrote:
> > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights
> reserved.
> 
> should now be 2021-2022 in all copyrights?

Yes, will address this comment in the next version of the patch

Thanks,
Karthikeyan P
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
