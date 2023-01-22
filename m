Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6212C25B4E
	for <ath11k@archiver.kernel.org>; Sun, 22 Jan 2023 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:From:To:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTXTFyt5Nu+0ybL5DlWTjxyK7k3UJHoci0G9gH0L69Q=; b=vcLrrqBCKW+LDJ
	Wwyn1Ti+5qWU2xtjnNib+orKAHEKSQZBIsYb4vuj5oIsa6AJRXdIAF/MiFAFIz5hOrEqJNl0zNHI3
	XAB4GEBiSuqtTkmY5fqhNZjahYOZmfSfKB2bBLFaNAuC9i0AUURUKMyCtGxDq8ihgdZmmC8aWNsim
	11KLaCY4eSOFoQq6qY4CQfCR6sgbE3fHP6A3eB3apNasffDhzzS+A3dYqCA8wQjFMs5YOGZsvKWlk
	lnj0AywtMRWQNzLkfSR3KnnGaO2ggjLVs4wzkil6LpaHgDuIjph3J9Ce21J3NUsDKIiSLrb71juSm
	I7W9teIeZIwhAfPbIQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJUiR-00Ey2C-Ie; Sun, 22 Jan 2023 07:24:35 +0000
Received: from mail-os0jpn01olkn2030.outbound.protection.outlook.com ([40.92.98.30] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJUiP-00Ey1i-B0
	for ath11k@lists.infradead.org; Sun, 22 Jan 2023 07:24:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImTAUNqMsqL/QKq8uY0Ckytn/caAKed9bRQqbPo5M6nWI+u1aAHexHBSHvU4BFFyTKlbwnac0H5iRmN1fLCMyQYgiN56W0ehyLaMqFguE0t272pvRvHU/ztGhZChAv8bCm1JFoLIjriChfKChrQ1QD/Gxk3MH19K1wfERXcbJ8ivL82EqX/l+fxgLrfTQ3u0E/NUDTbaAlhABCoxMvyvCtPvFuUKxx0/DSEoY10sofA7eRQ8zRnRO/a6bIS8edCLKOkN6zr6ItjIXNLnOii8D79Mvd6rmP9OATaEJGu8dPI/NfFiSlq2DTel9tRjFLNwpq/7fhqbofOxEObjdc/3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/is15Q2EdHZeZOR6JyDHfRULVrFK9v1dqrv711aKsU=;
 b=EL6mHr1bqfO4+bmW1DYpI+wF0nWDVg1ZNb9vBOVCDeI5S5nXqFak9Kcsw/hVxc0AaSOZiscVJQQGUY3OQI6vdC4zQnJY1GikYJq9bSEbnFwfKjuxaYjkV7+ja4vFKLBZK079xm9PdLKLvxdbKUZf9pObq6JSS++lCtxlx10/lwvRmrfpJMVv7WqYpH/VzzEqnw+n+hT0KRrVFbwLxMlRBwklCxEp0PWcM/d0qhrsmr32STkx624UiJZlpuJt1EOBHaF3YIGuVvUmDBMfVS6L9B+1DR0Ga0gvfZNPf46xDNGejNAdHi4BegAxPw3sFhS3z+Bv5RDk/Lm81xqF/K+2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/is15Q2EdHZeZOR6JyDHfRULVrFK9v1dqrv711aKsU=;
 b=NiuaGqMdgwkQy+dgjkr+N3SXaTS2JN/8x2T3LWRklxsXH4WS5OVJrNYCy9mVqxl0xMdBTytJENjhSYqlUmjY8Fpusj37XBT+eCm5rggtJcuymslfETLbXd2VIt0g6cHEExReQYyWEHvjRHbw2+ECx3YfV9oYxP7IqDP/oRFDXxhGzzdgdjS8AhR/AEKL7kfO8xb0THOVIaNupEEbd5K/vlnf1RlMsW5o75lA7LKxkU43J4cueCLgavbDxJqbAlJ0GeBjlYs49vuDoXvM7CAcB3ngEW3TsijewjNtvv+l08mS3bUD5nwj1ZMaamn3EQy9Kp51pk5uvmrrqhTNV+jDIQ==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:252::12)
 by TYCP286MB2257.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:154::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Sun, 22 Jan
 2023 07:24:27 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::20f8:c5a7:6b12:55e7]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::20f8:c5a7:6b12:55e7%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 07:24:27 +0000
Message-ID:  <TY3P286MB2611B5894FD76753446C6B1D98CB9@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Sun, 22 Jan 2023 15:24:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: ath11k@lists.infradead.org
From: Shengyu Qu <wiagn233@outlook.com>
Subject: WCN6855 board-2.bin update date?
X-TMN: [n1sXZ9Kk3v4XgbHs6Kx8MUJo86VWI7SVpi2ibqxp/as+rchI32jke+EW179WnoaQ]
X-ClientProxiedBy: TYAPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::26) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:252::12)
X-Microsoft-Original-Message-ID:  <179dc4c3-a4be-5d2a-8cbf-f6b4ecfbfe72@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TYCP286MB2257:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dcb92f-2a9a-4fae-6687-08dafc49b1a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/PcpeA8EB9fyg8LqbtngJDppv4dndYToDBaAhl7v2LGJoz+uHoMBRa6p1BFXDfZuOowjJUHp0/dbTHssvOADSslCX2s43712MJHn2GRyU2oQoC/diZc873GfgqCzyrq3eN2pxqdeelKlRyclBX6B76pVz1oaw7wNm4kePcJjuBfSEg4dOWe6relFT9ue6WVwjb9wN9txaf0mqEgO+NNy7qwNep3QmX7MgEUyKoSRdONLOwfFZI1jmKVj/IAaUAiCKjr5UPEPN8dURgo/j96BjLuyioG0pnNlwbCXQVoseRNNACXgmjwF5K/XR0VIwlK//odaV8AqVon96ZpeYFqkEZySVhdbPbz8Q+f6bQAfuLZ8zG10Wv8xwgYUiWhZ0nFXx9JDqh22yuMRCtVKch2RJ2qJGbRN11FHn+eqHi2Kcf3D0YKot0IaM81AY9N0g60g4KP7J3O8qlP0iwjplPAJc77EzRVj6Dmchd9SPqNr4MaH5aN99Xo03j8iFfaRixVYs5p3iDYfdfYPAX928NOJ4HHFt5jTXGQWU6qZaIgSH3n5bGUGE8BfOQs9Xk62+cEHRWS7fSoEMreb+5r/a3xtyMpzE/K0kBs41KXZl+hZywE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dytqTU1aSlM0ZW5vZDVWMGMvNHJjOTZMUW9JUENvUnpHUjBMdHNtQkJFUVBk?=
 =?utf-8?B?cHovOE4yMDBZSWtQamQrYmcvNTB4SHd0K1pJV2gyVU5UMGhubEtwZS90aW5S?=
 =?utf-8?B?ekU0d2t3YmRRU21tTzRtM2kzVERDeDIwVnZDYmJ6WjREVUNlNHFDZXNnd000?=
 =?utf-8?B?N05xU1JSQjh1TmlMejVZaFFubi9QRVQyUGVZTXNyMk4ybWRISWN5R1F2YmV1?=
 =?utf-8?B?UEYyWkljcVNYWEpndVlEelluS1RHZlVCaUMzY2dZUUJHWkRnWHorQ1UyZ05R?=
 =?utf-8?B?T0J4SnZPNXRyVUNSTU91VlZhUURZTjJ1ZlRSdWxnenlMVEtxdmt0dFJ2OThv?=
 =?utf-8?B?YWNtdEllcGkyc1BGNGs1U1RxVGhVUWIwZWppbEkxWmUzU0hsL0JBQWwvNGdF?=
 =?utf-8?B?ejJzSnhSeFZUTGl4Sk84Q3l1Ui9TKzZkWkFBeDY1ck4zZjZ3NkhaUVpHTyto?=
 =?utf-8?B?NFJrZFRqY1J4U2V0bjBQM1g2SFNheDdEMFhWSk5BT3ZlRVF4c3MzaHNzaERX?=
 =?utf-8?B?M1krbFQ2ajNEQ2xCdEtQeTJTdjZGaW9sU2RuY0RieElyODNIMTY4MWpXTEFZ?=
 =?utf-8?B?Yko1bnBtbXQ1VXYzaWtGSWVlQlpuTGQ0MGw2RjVHclpKSEI2aTV3K2dSRito?=
 =?utf-8?B?U0hocFNUSWFQRlpQVUViOHc5ZW5OU0UwR3hUUElIamFiaXJxQmpVdnM5RFpT?=
 =?utf-8?B?ditTblhrUlBLdEFMdkIrVHVpQkNOZGp4cWZmZzZzQlAzcUZRZ0xiS001RmQx?=
 =?utf-8?B?SWtxU1dPODFVZkg0WHpyZDhoZU42NHlyMGxFSGE1cVJjUmxXcGxrbUhGM3Rw?=
 =?utf-8?B?OHZFWis1UkY2OWdkQnJUOHdsNjJRakJlWElOTVMwZFV3MnhMWkJaZDVuc0o5?=
 =?utf-8?B?a09NekJZeXNSVi9vNHVXS2YrRTROeHRmNHpsU00zMVd0eW8xa2ZiUHBWQi9Z?=
 =?utf-8?B?dE5PSXRCMGVobUlsbnFtSml6UEhzbjZWRkxBeVUxVmk5NDFqbEUvcDVyeWlT?=
 =?utf-8?B?NUg2anBER1J3a09Ba0Z6Mkl3RUZJcytNV0RqZmVvZ0NIMkwxVDVZWmJnR1Zp?=
 =?utf-8?B?SCtLMHc3UE5UQ2ViYWFqK0hMajhOWVI0UStKSU9qZXRLWEdlWS83NXlrMmVZ?=
 =?utf-8?B?SE42Vzl5SlROK2pUazRwTXk4MVZFNUt3NzVpbG1UYktxak5GQjQ0SGc0Vks4?=
 =?utf-8?B?SXZZS3NTU1E1RStBYyt2ZG9JN1BnTnp0N0pjdElReHpiSVJUWVE1VkFWUk1O?=
 =?utf-8?B?bGxZdG5kQVFrOEFLcHdWKzNuVTNwQzRVQTQzWGp6Qm5JMlhQR3dIVnF5VVBl?=
 =?utf-8?B?b0s5QjBpMGlnbUlDM25FU1cyVXoyeFhvR3ZHbys5RjNRZGlYeGN2blkvTXl1?=
 =?utf-8?B?dkdyeTlqdVB6VDF5OU4yRnRGWmZyOXA4VVlkT0QzNE55djlvS3phQjh6UmtG?=
 =?utf-8?B?NlljbDVxVkxNOUQ3STJjRGpXekxuZzM0cWRTa0tocnFBQ25SVyt2R2JVN1hJ?=
 =?utf-8?B?emMzVkJ6T3MrSk40OE9rcU9IQnNKN1JTdHp4cmtnMVFBcWt6ZXg3eDZqZlIv?=
 =?utf-8?B?cXJvb2pzNnlWRGh3bDZERmhNVTBPcm16TXRSQ3U0TGVhbnZuaU81NTRxVSs0?=
 =?utf-8?B?SW1zQkFjSlR6VVY1NVJoUFI5VURoOFVBUlE5ZjlpREE1NDFzbkdxaXJKRnB5?=
 =?utf-8?B?ZTBrdmxSM2dqdmVCalFiZTFQRGYxRDhNNmducUNIaU9PajJyZGRKbEUyV2F3?=
 =?utf-8?B?VTBRMGVnTjlXbm9NUkd3cXpZZnlxZDNQT0FkTHlzM1Zaa2dveGhRR2doNDBQ?=
 =?utf-8?B?dUp5a0tUNmlwWSthUE03dz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dcb92f-2a9a-4fae-6687-08dafc49b1a6
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 07:24:27.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_232433_437043_387570E9 
X-CRM114-Status: UNSURE (   1.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello,
I'm using WCN6855 in my notebook currently. There is no related
calibration information for my card OEM version in linux-firmware
version of board-2.bin now. And correct calibration information already
exists in Kalle's git repo. So I'm asking when could we get a update in
linux-firmware? I'm using Ubuntu, and almost every apt upgrade would
overwrite newer board-2.bin with linux-firmware one, which really annoys me.
Shengyu

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
