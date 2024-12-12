Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF007E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 07:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ebtqlSS2/4CIJOTQivn/NSkGqf9/gqgszaXFAGvud8=; b=BvodvIfms06dnMpMlMuLD3IenB
	RILxGZ+WQoht4bRyq2OjaTmYEUbEuVd5/ZYRjfM/7PSol7bPM9EyF4+1FtZ3XDBXZE9cmSwQ9TgmV
	YfxSVDO6QBKcFTFqbT8UzZda4Bua5D1/Goy71y0/s4bW1scLaIVzN0sqsIM56bWacyA8MHBykYyeW
	No7uZZVbkX3U+y3DnbF1orXYvRo0NU4LsV9olcJQpNJi1Myi0XIN0RvSp5JnrRaFZsCaNNw93wwpA
	n2SkpMyNtXF6dipiRlxESKPYEroFQi3yIOE/4s4V9sR13b4RZvsrby1UHVxtsDKJsB3WF9Ucr3sCj
	TIEVTL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe4r-0000000HDc3-35jP;
	Thu, 12 Dec 2024 07:57:41 +0000
Received: from mail-japanwestazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d406::] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe4p-0000000HDa0-1ncE
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 07:57:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxFQ5O7TIbzW6vSMUSX4s6ldVvI1GWBmfNZ7RD5UwK8U9q33U+caI58Bu7xCInHApVPylKscJtklAit5VGqA3l4Th76KN5m+2MXBnp6zi75HoLilqxIhhs9uSa6F1IA/9pcbcGHwz+AOnd4KX1Nv0/CBzzdKJq6z9xPLBS+Nme/MeeSh8iYqn39fSfrjic8Hs3IF3hl6jrsD4dgp8tNlHbmCsoO5FADqRn9oF26hJZ9wXUsomkD1KgCWsYmg1c0HPZAFlczysR865f3mxEB+C1aMR77atYeb2goNwzY5QTPf6341A6QNCuNugMBvaql+Ut4JKIpVwvnCrLOeFiKbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ebtqlSS2/4CIJOTQivn/NSkGqf9/gqgszaXFAGvud8=;
 b=DDy46m6C/Z5+dfRGx1yJIW5y5BDJBf6qc03BOPcPP3K3jaule3Jgr/xAZAp7ZCtHteLF9ilNup63cje8TMw22oMEqI5iv+aiwP8hmLGson+IHo5YveAReyL5OKIUuX/xUy0c5DAHhvVl6qk7c4DGbbep6I3jEjlM3swgYZ5LCx0agZttQNByND0A82yiDez8mHw9e5ratQBzwsmjY2h5UgOnIcpCycX3r+1OSMFeAGpNHF3787h/mWKSovNtgrcX8NgY76dWGCe6/A2cqQ3p1hzcxdlVzAd/zhC2adPYCUs2EnFgAuk1YDTp5G80Y8/iu/lf/6Kuu0nH4WyN89ZlKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ebtqlSS2/4CIJOTQivn/NSkGqf9/gqgszaXFAGvud8=;
 b=eXR53Bx2FBSo9Bej2Exqx0OStfw5gfeRWRZekV2ssrm+uSS+nFH+t5eIoyyXEX2Gg9qpFyAosYCVL4LH9qJZKhupgOWXP7UtLU5A5VLhk2z42JcSAsZcLDKNDnLt2WM+kVeCEBZdQKUMe1PAVMNStRqXWuR+E66Nqebjg22ZaZUz0w5LgcsSuXb2MZXdHJTU1SfTsn0HhegnmBUa3GQDxwrpZ2n3A5mX7K2GViRPZeEtFQNci/mDsczUQAVIV1Srz7RgreOdwK3WSAcxI3wxxGfzFKWuqzHJglxrEUuTjfAKjG0Fz36zSshxiCcyEC5eDu7d8AX3Ply0SECARpOprQ==
Received: from OSZPR01MB6597.jpnprd01.prod.outlook.com (2603:1096:604:f9::10)
 by TYCPR01MB6849.jpnprd01.prod.outlook.com (2603:1096:400:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 07:42:31 +0000
Received: from OSZPR01MB6597.jpnprd01.prod.outlook.com
 ([fe80::d0e4:9b77:ede7:4cdb]) by OSZPR01MB6597.jpnprd01.prod.outlook.com
 ([fe80::d0e4:9b77:ede7:4cdb%5]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 07:42:31 +0000
From: wang chaozheng <ultwcz1997@outlook.com>
To: "ionic@ionic.de" <ionic@ionic.de>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, wang chaozheng
	<ultwcz1997@outlook.com>
Subject: Re: ath11k for QCA6391
Thread-Topic: ath11k for QCA6391
Thread-Index: AQHbTGj6qAkDteXSJ061CROhd04l3w==
Date: Thu, 12 Dec 2024 07:42:31 +0000
Message-ID: <OSZPR01MB659723077AA21A568465CDEDD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB6597:EE_|TYCPR01MB6849:EE_
x-ms-office365-filtering-correlation-id: b3cb80d1-efbe-4755-8b9b-08dd1a8088f7
x-microsoft-antispam: BCL:0;ARA:14566002|8062599003|7092599003|15030799003|461199028|8060799006|19110799003|15080799006|440099028|3412199025|102099032|4295299021|1710799026;
x-microsoft-antispam-message-info: =?gb2312?B?MVBEVUh6a2dFNUwzSDlvbytEaTA2UDFoZ3hCcmUzTk5rZnFCVnV5K3QrZ1pt?=
 =?gb2312?B?aU4xMjhZdkNhdzJpSElHTElFUm1CWEtOM3p6SHgwYTZYZUVQYXhyQlpUS2hM?=
 =?gb2312?B?bWF3VXgvWFBtZURHc05tRFluci9Rc0wxQVJhR0pObjgzYXhTTmJ6U0tBbFdj?=
 =?gb2312?B?ZC9YRWNKdFM1RlIxNWNVR2NtK09KV2ZZN2p6Y0h3blpNRVdOTVhuSmlJTzNw?=
 =?gb2312?B?dlRub20ybTRNTzdZN0MzVEIrdjkzcnhsVmpJWlZpaVFIanFsTUZFZVQyQUZO?=
 =?gb2312?B?OVROWXpqMHpXSFFiTnZBYnRSTzM2eTQyUVQzRUdVcU5EaXZNSittK1Q3eTFR?=
 =?gb2312?B?N2hBMkFzUkhady9wSCs5SVdJMkZhalVMUTlGMTRCMXpnd25DQVRpc0VHcnJU?=
 =?gb2312?B?QlFaMkIxbmR6YXpuQUx4bHlZUlVINGRuQUk3K0Y4ZFpNUTJJNEYrWjZUYVY4?=
 =?gb2312?B?bGZMVDI0RWdPUHVGWURzcVZtaHNEa202K21na3hhTEFSSGNOMjllWEFBUlMw?=
 =?gb2312?B?MkxZSHFoL3ZHVWVKc0tScFMwWSsrckpYOGEvaDNzSWczdDlFZjh4cDAzS2Q4?=
 =?gb2312?B?aFl0TXQ3ZnpoZC9Xb1F1MWJPQzFyVFdWVDZpQ29BWHNpU1hZOWtzaG9NOWJG?=
 =?gb2312?B?NFp1Yk1kNjZ5KzNoZFBmRThUWWVFS3hmU0Ezb2xzUzcrNHYzYWNQRzk2VXYy?=
 =?gb2312?B?NUtlSElNSS9GWk1yUzFWMmNQNVg1Ni90QnB2a2pPSCsxbWhUZ0hoRUhIbVNQ?=
 =?gb2312?B?YlBRb3NuMFpJb2JvOFF4VWljcm00TUUvR3ljZC9FTncvV0syQTZUdEZ6ZkIz?=
 =?gb2312?B?aVpyU0lLdHMrZS9IbkR5OXllcnI0K1R4YmNxaGc2M2d5QUx5QjlJNjY3cjhY?=
 =?gb2312?B?R1ZKVDdEaXV2UGlTUS95eUVERDM1bHBsQkhrVWg2ODMxS2Rva2lNZndYSHdF?=
 =?gb2312?B?UmVuQktjSy9BU3YxS3JPdnhmWHR0clhBbzNqWVYvTHZRaGQ4T3lrS0UyRXZF?=
 =?gb2312?B?bXYzSVRJcTJrM0FNMGp4SjZtVzR1TkdMc0NDVEg2aXBEbWVObE9ZQWVHQ2xS?=
 =?gb2312?B?enZUQWtnTEZQTVcrQWYzM2hXNjV0WCtmV3NCQTZpcnR4aDJzZkxvbkIrZUZD?=
 =?gb2312?B?bmhMajVSYVl5U05obzhSNXFSRFdseXA3ZSt6a2Vibkd2WlNVUGhNN1ZkZHlu?=
 =?gb2312?B?SndYbWMxYnFObm9WUDVUei9XY0FYbjVvczMwbzczYmMzYVl3emtKOEtKNGJB?=
 =?gb2312?B?WGVNVTMvNnlmTGVTMlY5ZE5iNGdEVnpHc3FWckV6QkNwc0ZzS1lTTkNpVWNG?=
 =?gb2312?B?S1B5M2J2WFBzMXVJVXB6S2NzclpLWXlIamVXeS9wOEk3OER1eGRCM2I0aUZu?=
 =?gb2312?B?b24wSUtiMVYvWHlNN0ZQcHJ1SlpxakVwWndxd1ZaNlVjWTlOS0hhWUNFNVp3?=
 =?gb2312?B?UDBHcllENnZ5QnVNcjhnZ01pRHRCdnNldTdQeWRBWHRhMUxGekZaM3MrRmN3?=
 =?gb2312?Q?+OzRVs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?UmxoM0xhUEJXS1NXSlltakM2UG85a0J1cHJId09BaVhNUDVvYklhZHZYeUEy?=
 =?gb2312?B?U3QyencxampVd0NQNUlxNWtDcFZSQXZrNnNSK1NKbllzVks1MVgwWm5sakZ3?=
 =?gb2312?B?VXVodkE5TnQyaTIwLzNMOFJMNUwyZmJBNmRwd2JaUWtMZUtiUm5nZkxGem9T?=
 =?gb2312?B?a2ppVVZuUklSUGhqOFJvZXdlS0dPMmgwODA2TzM5c3ZpTlhkVW5vTHpKdlU2?=
 =?gb2312?B?dU5tSHNkUFRSak9WZHNoV09FR1hQeERyWTZhcVoyZnRHSUhjOUhCTWFKd21p?=
 =?gb2312?B?dTdLeVNma2JMNm5wTFBqQkVFSVRaT0dGbDlseVBjMjVJV3VOVEtxT0Z4STZu?=
 =?gb2312?B?V21iWnBjelRKdDhpSTNHVkhkMWtRd3ZpV01vMGQyRnRNZWFNRG9JOU8weGoz?=
 =?gb2312?B?ZnVsVHFWdnBjRldTTlBnaytJQjNENEhjTUFoNTljSDg0TkFSZk5DOXcreGU5?=
 =?gb2312?B?WGxZeGsyMkw3Um1YdHlORUpzczdiTlNNMzFhT2NNL3lVeldZOEZ5allpZHoy?=
 =?gb2312?B?Y1BvSHp5NnZ1M2FkUWxpd0RLQThXQVdtU1pPb3JMemdtbjB4K2syM1lKeDBm?=
 =?gb2312?B?bFpYNCtsOWZma0dDanRTL2YrTUtHTElRK2ZEWG1rQVoyVVA2V2k4VjZSYmha?=
 =?gb2312?B?M0p1cUZ2c1BwanJ4bkp4dGJVRUVhNm04WmN2LzZIU1cxWVlaMFhuWFVqNUFq?=
 =?gb2312?B?QjFYYUFaMktTQzdyZnVBdklZYSsvMXJXcHNpbDl5dUMycHNSQzkvdVI5UHBi?=
 =?gb2312?B?dGxPdTh6VjVrcS9tN0UzTG1wRjU4cTNuU2t1RkpkSXRieUZ5eHVuTmZxL1NY?=
 =?gb2312?B?WFJjSi9oMk8vYUhmVjdrSk94VWJKaGVKeFY1UVRIVjlPQk1jcmpYMDdRbVpU?=
 =?gb2312?B?VzJVRjY5dTlYVGpseVlTd2NZeGR0WWJmczFVb0xwY2w4UTJNeFZJbFlsMzRK?=
 =?gb2312?B?WWUzaUpOdWRkSllveXVhbUNGNFRKOXdSMVoyNlU3bi9GVk5FRWhObGkyQzFY?=
 =?gb2312?B?eE1aL3lwU0g4MnZrRkdUb0ZYcUc1ci9nU2d0blNRNVh0a1J4MDJzNEhmOWFV?=
 =?gb2312?B?TFRmcThYeGRaalBYSGJGK0lySWhSMG5lQXFCSlRkRXNVbC9WNFRCcTduQkNm?=
 =?gb2312?B?MFpkMUpEOW5rWkUxY091WUpJUGxvNmJGRGhMYWp4aE9zUkhUWUpjNHA5cUZD?=
 =?gb2312?B?UWltb3ZCT0NuWitXaFg3eHY5bmdHdnZmV0RkY255eFpNRFB1dlZIeGQzV1hn?=
 =?gb2312?B?dUpCTkxnSHAzUGVPaElJelRlenhCdVdKdTVYandlRW1xL04vVU9vUm1TTGtX?=
 =?gb2312?B?Z3E3L2xDMTJIeFA0QVJ6RVJrc09lOHBDT1BDYmFnR3NsVDhpU2RsdzA1TXpQ?=
 =?gb2312?B?T0pQdFF0MlZmT1UrOVhRY0wyY0doaXBuclZyVlZVOUpZdDlBUWRROElUNzBw?=
 =?gb2312?B?VTFrcThBY0pSZDdTYTI0Q2s4czA0UTlZSklMOE52TURRWVE4QVNlVDVJandK?=
 =?gb2312?B?dXVnRXRTRnFtMjBXUmxJMlR1d040SEFRb2N6U0QwQnpKMk1ldmJ3SFhybTRG?=
 =?gb2312?B?RzcyOG1UT2diVVJJeGswNmFZVnRyVzR6a3pBdHBaMVI4UVBBcVh5alNzemNL?=
 =?gb2312?B?eU9VS1N0RzFJTWdvUytKVGFjbmxPVzBlbG1xVGpZVUxFR3d3RHlCNm90elBP?=
 =?gb2312?Q?QeDBipcaZN0qxVAQitQ1?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB6597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cb80d1-efbe-4755-8b9b-08dd1a8088f7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 07:42:31.2041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6849
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_235739_468184_7F869E3C 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

KiBPbiAxMi8xMi8yNCAwNjozNSwgTWloYWkgTW9sZG92YW4gd3JvdGU6Cj4gWW91ciBrZXJuZWwg
aXMgdmVyeSBvbGQuIFdoaWxlIGJlaW5nIExUUyBhbmQgc2hpcHBpbmcgYSBsb3Qgb2YgYmFja3Bv
cnRzLCB0aGF0Cj4gdHlwaWNhbGx5IGlzIG5vdCB0aGUgY2FzZSBmb3IgbmV3IGZlYXR1cmVzLiBB
ZGRpdGlvbmFsbHksIGV2ZW4gZm9yIExUUwo+IHN0YW5kYXJkcywgdGhpcyB2ZXJzaW9uIGlzIGFu
dGlxdWUgKGMuZi46IGN1cnJlbnQgdmVyc2lvbiBvZiB0aGUgNS4xMCBsaW5lIGlzCjUuMTAuMjMw
KS4KCkkga25vd24gaXQsIHRoYW5rIHlvdS4gCgo+IERvIHlvdXJzZWxmIGEgZmF2b3IgYW5kIHJl
dGVzdCB3aXRoIHRoZSBtYWlubGluZSBrZXJuZWwgdmVyc2lvbiwgcGxlYXNlLgoKSSBXaWxsIHRl
c3QgZm9yIG5ld2VyIGtlcm5lbC4KCkJlc3QgcmVnYXJkcy4KV2FuZw==

