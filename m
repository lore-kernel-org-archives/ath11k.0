Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32878C4707B
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Subject:From:CC:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9LS+cCf1TiEQqhfkHlRAPLNxHPpe1d7s3CuIIvOzVA=; b=Ci2Nu5FQH0XTf7WvLczcFgHUaX
	UijqTv5bFA0LDqsihe2Lmi7e2NFC35xNbrHpB7h2OQqTrYC9Raz7lEo/JCk8LbdE73K1nXVhfg8SG
	kvx5ZVzoFCvuVzri1nsoTUwwrL07xA5apJiqTf6Y+g2iGuFl26SZ5SssaGNswnNI6UmAHaZ67bcbQ
	afsj4N/tfGv7RdjmyiLdwUbSntIGcPMP//bXSk+CztTpcmvI1v9T5w2PrBQSc7Nw+aJs3FrLSBJjJ
	mE4vdAVI3cnAdaFU5Vm+BLnDKvP4CaMCv6mXnX4qyvXr6V8jR5eHtAQBro9Ch6fm64BUQJLBqbplC
	ZzApr5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPfb-002P7z-2V;
	Thu, 18 Jan 2024 10:30:47 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQPfX-002P6Y-2j
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 10:30:45 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I5oq7e000669;
	Thu, 18 Jan 2024 11:30:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	message-id:date:to:cc:from:subject:content-type
	:content-transfer-encoding:mime-version; s=12052020; bh=t9LS+cCf
	1TiEQqhfkHlRAPLNxHPpe1d7s3CuIIvOzVA=; b=oCkF8kCo8soH/RWixSVfskOT
	3AsSrEbYAS4xdRzA35N6nIJMn2vjTw3wEwx713vBIpVAcxpl4TvOBtqRg0uwGJHe
	wd9Xh7blCD5tPRgs9Eaj7URoA0WehnoXLeKZpfWUlVguaX3dF8IUQtM/hVLYdlL/
	4a1MmomoscYDTGM6hiH/PmiF0C2V/z01CopCCVFoLe+5bahYokpGegwIhCTx9Swo
	ARaOazP+jndFUBv7QQglu3ZxZY08I1UBnjyklJSZOIqKsyPP2Lpm6z7xndeKxuEU
	ASG2UVlFG4rO0shN+634GACEC46iJDXf15Jecy8GGyQd/CIsbix676O+fyCkPw==
Received: from mail.beijerelectronics.com ([195.67.87.132])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 3vkfrbxahq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 11:30:12 +0100 (CET)
Received: from EX01GLOBAL.beijerelectronics.com (10.101.10.25) by
 EX02GLOBAL.beijerelectronics.com (10.101.10.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.34; Thu, 18 Jan 2024 11:30:10 +0100
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105)
 by EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.2375.17 via Frontend Transport; Thu, 18 Jan 2024 11:30:10 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsSas7WviIjBJvE34W/R/olRZWg5hvz2WT+aLcyUmBIJVudjyfeiLe9EzV1vgtFXE5Bxs3UC7uPt3+mnp78NkcI9LjJpy7lOqmMIFemhSsJigpGBpKUR0XHiv211zeL8zH+FyixoXDMTRIJdbTKOYVqLjwufvLkA0Irg+/1ccXWe1wjU7rCN/gHZOoc1wc1SSXT8n36reKSaFgN0N9V+thie3SyRbLpWHhZCqcPawYy9rLERu5sLFU16T1qtk/se7KDq1HauAyKJAENhsymoXR97HfCWzJPovsavzT1h85/fHKZMVuAaPeAUqrlJM3ajTbhkr2BLD4R0CUlZEtr8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9LS+cCf1TiEQqhfkHlRAPLNxHPpe1d7s3CuIIvOzVA=;
 b=oJRdME8abJPhWlisAyKuLETA90xba6DsO9y5jVmmDIJx+1ZbvAdIgktglun64dwDybKqljH0K3ovwnYC4bDrH/0i79pxGUUoLY9UCtKsNiWo0eNFHM2WyuFpobIbbgLpbcNQE1kNunGEuLM7Bji6bEnmtPqc0xF20TzI/goifAxtA6gfB4sml3bhF2wRRyCZSPMDWOm2c/CuQwFIUiiwK6+XEE1pl7mWVRfyfRYL7cGhZikXqMvyMymBuMhtQZGe3CnOeeaV2nwSNFlv3BlFVqlZ58VCr6cEY4HJZGijfkK+Mf3o16mRjVa5P8CmCKV0B7O2ht3uBe5ePcZYhblBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9LS+cCf1TiEQqhfkHlRAPLNxHPpe1d7s3CuIIvOzVA=;
 b=dJ1JrvGGJfHv0vjcbWi+pxm9WyYTMuXkAY7C05K4D8kBkLP7CZ1MjxijWQi/ctTvJrazKURhAoXxQmpSb/gyQ19niZ2vPj5mq4V17+PZsU/QLobGKfinSdmR1DB179NGlYFeWhbrDPNaXAwByEPPMu0X2uP9xofcEegoNx5u8PA=
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:16c::15)
 by PR3P192MB0586.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 10:30:08 +0000
Received: from VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::c13c:49f8:c9bf:2e86]) by VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 ([fe80::c13c:49f8:c9bf:2e86%3]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:30:08 +0000
Message-ID: <d857016e-7bea-4f77-8931-97b0d56751f5@westermo.com>
Date: Thu, 18 Jan 2024 11:30:06 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Subject: ath11k: 512 client support on QCN9074
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00000105.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:1c) To VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:16c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1P192MB0734:EE_|PR3P192MB0586:EE_
X-MS-Office365-Filtering-Correlation-Id: 96fb793b-3e36-40ca-47a0-08dc18107177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rOAXL9KbSzOFGY2YDpzkd8sjTF8iTw2vgqljsrDxKfwD2KelkkXqG/8TbLZ7sO5HYYMWWPJ8Zd9CuYkCyOKFi0P0jMBnVxqspmEtitabaNFCnTzS2Ykf/i6uGrGU1sYQTKQn2DaTJVuoZ/ZmRWE8W/tz8RwdWwHuhdFuyqcm1i7+bJ0dr9pm3AZjZd5LLdTron6fNCdcr7sn6zwvuXHbvkKE6NGnyc72Z7soK0tXpW22iHPgaD/IjJqU8gF5I+NG3icB2La50MVufqDZ54ZLl9u30lOYhHS/o99ovjQOy0e4mkWTh0hGtTDTWxGDft5F6KSMk1+009ZHTGs9emqG0+5C3IPzwZgKuG4UlwFMC+h9k6hMkkOpw8wu0xdOZbZVbTmHx2sIYuHhTiyMBx8M8BBvatvuQLbWJ8HQJ6MlzBqjSA3friLBtJ21ojRgLNxqUcdXWECH3xxm/KFVC31qz9n58nmGufz2zh/NqscUsZJiHabaZhZCDDmzHp6VOT3zeK6upxRM8K5aQdZImHsSPyZyTfc7Uy7MhYQwzW1zIBeXHY3Dg1v/RfxrUIAHqnqUN9CuIftI+Fugf2SCtu6jDNrfwL/eIQdCVhYo5XB1mNOOpOUQFXX/oHIuKJM04l9mfeyx8tPBjW8KpAPflb5Ewg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P192MB0734.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(6506007)(6512007)(66946007)(316002)(66556008)(478600001)(6486002)(2616005)(8936002)(66476007)(26005)(8676002)(4326008)(44832011)(6916009)(558084003)(36756003)(2906002)(5660300002)(38100700002)(41300700001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG9MMVBrek9rVWMrUHFaS0VnZGJOZ2RxR1drZGdLYXpmbGYvQXVseDNzb3M1?=
 =?utf-8?B?QkJ1WnI2S0lHdHZlcXRybjU4a0JqWWpSKzZwclBZZTNyKzhjTGFrKzdyaGZm?=
 =?utf-8?B?amVGNGhQckJJOVZOdUFWeFRsbVgrV3Y1bVd4bVNuZTJkaGt1Rk5zWE9PZjNF?=
 =?utf-8?B?Wm5QbTEyOCtaVVp3S3JWeGpaLzQ1MEl2cWp1NGZmNXdpQk1QMWs4dkR3bXpi?=
 =?utf-8?B?dFVQOHdYbit6MTZyZW5idGw2UlE5Z2U5NG5KVEx5bWxxUGZIb1dFQ0VuVlc3?=
 =?utf-8?B?cG1lSTJYbU0yT0ozcmxodEh6RDNIeHdFUldnaHY4bnk3TTh4NnBvT0xjUGdT?=
 =?utf-8?B?TjhFOFNQbWV5clY5Q1J3ZGtWangrSzlqMGgxakRFeUtIRXlyakZCQ09QVWU3?=
 =?utf-8?B?bGllMEVNNEkvalVSTjlXUFo2UnRQemxkUk04TzNHbDRieHNSdys1MTNqb0Uw?=
 =?utf-8?B?ZHlBSlRtYkszbVNDbkhBY3BlZWFPSTNpU25odVRmNjVVbCtELzRhK0ZnalRi?=
 =?utf-8?B?N3B4MHo2bWQ0ZDBYUVljNTZDL0ZNSHBkVkRRVWZrTFBtZWpoOStHdFFwKzhO?=
 =?utf-8?B?WURSdFM3YzBoMW0vcXZmZVBLVThUaTQ1Z2plVUQxN3JjYTZFYndzcndheWdD?=
 =?utf-8?B?SXFSd1o4RkVWRFc2bW03UXB4clVyVExwNXA4WTEyUGJCZW5zTnhnQlNqL2Z1?=
 =?utf-8?B?dlFNVkV4Y292dzEzZXFUWTY4M3hiNTFSSnJXWWNObHA3TnNMUmJZVEY5SEtU?=
 =?utf-8?B?NklQVnNZYk5DNFc1bUhqODYrWGNFc01VSzY5ME9NWG5Cdmhtak5yaSttdHNz?=
 =?utf-8?B?NjZUMjlMcWxia0piK3BUMVNHUkl3TDNhQlVyTmtCbUh2QW1pTWVYZ1crR1Vs?=
 =?utf-8?B?cE4rNWE5SWdlSE8rUjYyM0lWV2ZXQWN0b0tINVVXUU1xUEhPSXowRW5zY3Vt?=
 =?utf-8?B?TUlPbUhZYkRZMWcramVhaGJZdTFxVmxlTy9CazZjWkJQbmhORmtWQnV4Zm5S?=
 =?utf-8?B?MjEzUjJkN3h4MitQeENDUXl5Z2R4RXRmdWtkMVZtc1poYzN2Y1hGL0ZvZW0v?=
 =?utf-8?B?ODU3RkVuWjBta2JNRUx5cnU0SmZQdnJDbDlYdGltb2UxRzEvQXB0bUIydGE0?=
 =?utf-8?B?UzZ0dEtrNnhTRDJkNUkyNmo1andjZFBQL1VmdGxEeGRCQWt6bkl3RE1EVzFq?=
 =?utf-8?B?RVJHUi94Rk1TRGVYSUx3VFdJUmRjR1lOTlhNN0dmam1OTVF2eGQ2dnhPNTNz?=
 =?utf-8?B?QWN0S29IUTBYRGZPeVhHbDg4UzFuSTJESVQ2OXBKT2hzMGpHZ3VuR0ZPZ1pv?=
 =?utf-8?B?a3VwV0pVSk1acjBRSTZRdWZFK0FKM0pOamVORG9QWWRCNlo0R0ZoYk9IL0J4?=
 =?utf-8?B?bVo5QytMYmoxcUZtNVh5b1NYeXZBNVRWNVhVMVRJdzEwOXVNN2JIN2w4Z1NV?=
 =?utf-8?B?K3l4a3l5eHJ4RUFNNFJQemdYUTJ4UTYvUUFoTnpDbFBpYVU2VFhMT3hHTmVx?=
 =?utf-8?B?b0NTZlVDdTlnUUkvQ3hvY3I3NlpqZUdxajFHZ0psWkl1cDRqK1ZtaEVjUkVM?=
 =?utf-8?B?R3hyTGdaQWsvaDlNdkdEcWE2aGJEbURuR2JReDNtSzVvS3ZmL1ozckk5ZGdX?=
 =?utf-8?B?SGJVZHQzVU1vUzVOQml2SHlBWnFNM0NmY0VRL29Yc2pzeUg3aEFMTy9RaTlU?=
 =?utf-8?B?SHhBd3hPTEdNbVU2OWRYOEFMRmNpYWFoWDVDNkNQT1ZxQ1BRL2dNaTRMcXQ4?=
 =?utf-8?B?Y2xLV09scVU3MDJxUVlkU0h2Tjl1dElQbFB0NHNCaUdxUS90UzdZY0p4VTFG?=
 =?utf-8?B?aHNLNVFKUHB5YkNTczlzRlpBNG9kOVhlcU1qWmdYWXNGTE9HTmhVbEh3aWFo?=
 =?utf-8?B?RkdnR2U5TnFHWGNrc3ZwL2NtYTVDSmdCOW9LNU82VnFMK0lQSjBlWjUyRWVD?=
 =?utf-8?B?R3Fqb1VZczkvS0Z4aDRoRExreGNlQWZpTUVaaUNjZ3J1c2t5V29PcVB3Ry9L?=
 =?utf-8?B?QklSOTRTV0pOTzRLWXBQQk0vR2dxQzJmTlhsK3FOZXJLREZDVW1iQ3RLcVk0?=
 =?utf-8?B?TkxLbmZLUGdlNHBOSFAxc0Z3U3ppYkRiVEZONFF6WTk2akt6VURBenNaTW5L?=
 =?utf-8?Q?3DBBs04p5C/NTAPINq3h39+5W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fb793b-3e36-40ca-47a0-08dc18107177
X-MS-Exchange-CrossTenant-AuthSource: VE1P192MB0734.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 10:30:08.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRPwFtgzYEMkBto2ukutepnneGzzbyWXCRip4suQMkmhfWn1QoZ+SsM0xvWU1U/vr5Cskvq+JyT2kj9d5iLb8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0586
X-OrganizationHeadersPreserved: PR3P192MB0586.EURP192.PROD.OUTLOOK.COM
X-CrossPremisesHeadersPromoted: EX01GLOBAL.beijerelectronics.com
X-CrossPremisesHeadersFiltered: EX01GLOBAL.beijerelectronics.com
X-OriginatorOrg: westermo.com
X-Proofpoint-GUID: iPBT0P3QD4b6ghcTRrgINVqOgbjShRcK
X-Proofpoint-ORIG-GUID: iPBT0P3QD4b6ghcTRrgINVqOgbjShRcK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_023044_651977_6FF56651 
X-CRM114-Status: UNSURE (   4.57  )
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

Hi kvalo,

The QCN9074 module with the ath11k driver currently only supports 128 clients. It should actually be able to support 512, shouldn't it? If so, is there a firmware restriction because of this, etc?


Best regards
Alexander Wilhelm

