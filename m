Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2945C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 02:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBdTHbjy8wBfW85vakE6MMuwqaryI1Z/iWOAAM5fvtk=; b=yr5XA6yO+7l1lr
	NYq7lwvlonEzaYa3bvPAIsN+HIiDY4CKXReVzO4DQgD6Pz46QiffB2r6WwEg9FDAHdhIL7ImkqwQW
	hbPW7rtEG9KBepw3GJbxO1cXKQ8OeNwK6eZSW7NWbt1AB9ciUAdM4VI5+JDkoEo+QtqScyM1I8rbs
	HL/CbVYJuuFWVsjYr87C+x8Cf/3sJ+Dod5vUWKHGvtsOrAGNityftm+n1/lITZHDjzUiiEXNmbmbx
	4ox+BBv4uO2vRZZnJLWBQ0cJ13vvg5+T8qQbYU+MwAhDGaV/JIezz8Z9VgEXgwAhchdQNaKfgsAaG
	GszE5TUnv/6HBM5DTpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW7j6-006K2O-Qe; Mon, 21 Mar 2022 02:24:56 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW7j4-006K1d-7A
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 02:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1647829494; x=1648434294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KhssA82tt+NTBAuVeiSwzKbnKJmvBSbNovxK36DJO9c=;
 b=aevtcReWvhCajOfL2eb1MT8qTHpWozMkNUyclCk5WZAwE5ZopgnmgLT9
 PyuPzpwlHF9TLIlJcFIX18WBFbDzI6kMNAORFmbU0huZ9A83hrnjQOaWH
 DsCF6JapRK47NH9nrTGqSQmCeLFYUAGJgN4ne7WG+v8rDbiCHWlw6CY67 M=;
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 02:24:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WON3t/lkgheOLvu21ooVIr1jPcjxPxGlqfq6mhmh+Zwvpj70gXGTFkMu3+FVG7yYeQIHaf+pFzRiwrX+MHARODAIEvrVL6SknYit2XHRZXlxpiWLmKQrhS6ATWyZMWKWN730bLdwTcCtb48/7dvyPrXeXIukAHbMfLNTJ6Ya5UnHtilt0qkcDv+JhGGPKwuWYYii3YTduPFK86UzuhLkTmcf/c4NG/aDVMwuh2/+ZT/UsAHaAak19FBaNs4rniLuUVIweHfBZeKVTzVmtUEQdWuSAba0e/Fv9dWw9hz/UG+229hj0I2+lNdVrbb7siMuv42GnFGtUWRYid3tBmwD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhssA82tt+NTBAuVeiSwzKbnKJmvBSbNovxK36DJO9c=;
 b=bDYRFuDrBOVAJy/FDGXwjbtnnI0cbx/+Ptb2PZc2RZtm4ykcaTmSok9DGsHy9a3OJZDna11SpXg1HoW8Oyat0NxODS3fSEMCPYrFYb5J1urBlMgO11Zrvc1PUKCHG9AmnOv3L+7jLLxZmGnHlAN2eeeyQY7I3FhBOgv9ANMrQHUfnPZN6kBrK5wPlJ08Sd0FezLlJQ6p6Cpai4QRDwoZW7v49+Sml25KNWQ/fFy1Hle1YsBGUQ8VjDSdpIlIEmYpfc0Re+6mqYNLC+srho+U27tCLcp8fuDc2cLi8JecwrVeTr2bejXlZVmeQKHgAs+sAKcHofEtmW/J2dFYfJOfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5430.namprd02.prod.outlook.com (2603:10b6:a03:a4::25)
 by SJ0PR02MB7581.namprd02.prod.outlook.com (2603:10b6:a03:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 02:24:47 +0000
Received: from BYAPR02MB5430.namprd02.prod.outlook.com
 ([fe80::1d1d:ddaa:4a23:3055]) by BYAPR02MB5430.namprd02.prod.outlook.com
 ([fe80::1d1d:ddaa:4a23:3055%5]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 02:24:47 +0000
From: "Baochen Qiang (QUIC)" <quic_bqiang@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, "Baochen Qiang (QUIC)"
 <quic_bqiang@quicinc.com>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] ath11k: Add support for SAR
Thread-Topic: [PATCH] ath11k: Add support for SAR
Thread-Index: AQHYOt/13uQjUd0QyUesekUNDXsOnqzJH+hQ
Date: Mon, 21 Mar 2022 02:24:47 +0000
Message-ID: <BYAPR02MB543076C526E59CB0E98B3DBCE0169@BYAPR02MB5430.namprd02.prod.outlook.com>
References: <20220317012728.18932-1-quic_bqiang@quicinc.com>
 <164761864196.8951.13534371903381562941.kvalo@kernel.org>
In-Reply-To: <164761864196.8951.13534371903381562941.kvalo@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f0f37ac-a654-4943-1bff-08da0ae1f85e
x-ms-traffictypediagnostic: SJ0PR02MB7581:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR02MB7581783D71BFA1E1CFDBDC309C169@SJ0PR02MB7581.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l8Far2ciBo9ElJWXF1ei+4xFIq9rP0IUefGn+axGJAVk87C1gRaIWMMljM7ed1Qa7Cq10IkSWLtgdiXDZd2tb8+woa3VZjMpbet7wT/Vlxs6mxTpwOLMFiON2eeFPkbpdZB+mO56fdG5dgFzb4m6WNw/SukuaUou0DJSri2Z0m0QwVEshfcH0UhAk7gxbQwOgmZrcdUwkl0ylpxzc/u1FujOgl9oDTt4PQPmsoivZgLgNhww7EXw2RQTP/orXCGbTUeZmiuv2bkTP8RoK2SCQn0WxAlf/r+zTqJO9/ztAsV4SYqi30urMM02ZR88ksxICFRL+XIodg78v1KupoBL7KKBeVDcp5aIYs1p+eqr6q4M0li3OLjrkMTTFnFf2EJnFmALOsr4arxp3ClS45XbLB9XqXmu/Ll1t51kC2H6OnKNLDimS8FKVIEua4QeqdycTxqSefTOISjGautEVseaLU/zrlHl9htGWbCMQoUfyvUWC/C+pg3GwHn+1fratTPFhPGJeAEgZcv69Di3ciT5Utvtg/i3ViWFMsJqxo04OGpOfl0FNvxpvAcjXr6MB4RR6uqpYKej2QN5hBhhNtObpcnR8gXoYEO+q1JEH1WYu3jsdjNOSH4/11+q9TWFsaSIC48a/x0ioAnz0dbUasEpfEWmPYIpbvkfCl+nBg6aKig9s98FisFAl/lgyT1EcBzP5xqmeP6/3YpReWHmoUJU0F1/ibWhli/T5kDjSFcL522sjaVEmwMZzrtXFwz4Pl4DEeZ95nMTk4UE/G6DW7/AKoWDK8zroeJVfPoZfhACR+6mD5dQyCuPI1u9b+oDV6yq3+LxqAnvqSDGNp4N2xhrjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5430.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(38100700002)(5660300002)(38070700005)(55016003)(122000001)(86362001)(7696005)(6506007)(83380400001)(508600001)(53546011)(186003)(966005)(33656002)(26005)(9686003)(64756008)(66476007)(8676002)(4326008)(66446008)(66556008)(66946007)(76116006)(8936002)(110136005)(71200400001)(54906003)(52536014)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bC9TdE1XZGl2ak5TSWJNajRaNnFIOGlwNTF0bFNIekM4U0drRnF0NkRHNVBl?=
 =?utf-8?B?NGhQbGJMNTBRRlpKSjZsNlBBWXV1bllLVUxKTTN5MW9WNEROeXhCaXBZWWdE?=
 =?utf-8?B?Q3JZZDQrOFA3TE1uRUdKTUppSnJ4T3hBTG1QSkRlZ3Z6cDA2TmlIMlUwRkt2?=
 =?utf-8?B?K3FPUHBFZFdCWVJiVHRFUy9SYTlzNkNWWWFaS2JLbXltb2g3NDFrSDdxNlBn?=
 =?utf-8?B?cnBmS0pteXlJdUZZSVVKa09IdkRjNm5nRXVpYjhZeHo1SDVqVldiczUvc1dk?=
 =?utf-8?B?MmVRaWlXK0E3NVptdlBzQUovREVHcFdVWHpod0hlZGloMW5vSTRuSWEwSFBD?=
 =?utf-8?B?ZjUwR1QrdjNLOTFWaVdyZVZrV2JxbHhRODBkdGloUTBQbWg1dVljcEVWZlhP?=
 =?utf-8?B?Rm56RHdIYmg0WHUzUVZXVVZtblNKMURzcEZ1Vi8vSGNybUdoaUxGYXlSazlt?=
 =?utf-8?B?V2twd0pKYXk3V0lRQXdTUEg1OW5YbkQ5ck81bEhQQ0RsdngrUUNxdTZ2TnV6?=
 =?utf-8?B?ekg1WSt3N0hlWUFLN1BjdlpaUjJ6OFE0Vmx6V0tidWtZdmNlUGNaOHZSbGFm?=
 =?utf-8?B?c0NGN0tzZlBQVmhtdXY5Y29XMXpjTWxRTzVJWkkxUDFQaDladUdCZkhseEtq?=
 =?utf-8?B?NXo0YW5VZ01tZFpnUHYzZHNibTVxREVZMk4xZW1HemdpZ1hCaTlBRmw1Y3Bs?=
 =?utf-8?B?dkhaUFlwRExjVXdubllwems0QysxbWU2c2k3SkViRW5FQVcvK2p4K1NkMGNR?=
 =?utf-8?B?Uy9uYUZSaXF3MGoybnY0OUh3NEdCSWdmV2R2aVFBQUtBaE5OTEdaaWhLb1Bh?=
 =?utf-8?B?NDk3K09MdXNCTWMwMHNNWmpiT0JPM0pKc2xFdE0vZEpPc1B3NHhDSXNjR2xt?=
 =?utf-8?B?eTYyWHQ2WGhXSjhFZTcxejRWSzk4YVZvUU1GR3IzVmVHRS9WYmxJUlpja0pI?=
 =?utf-8?B?WkRNMElQSnhRWkRlMGd2eEZoSllNUC9PRWlyek1JaGVnRlpnUmZQTFFOWW1M?=
 =?utf-8?B?a3NuWVZ4aTBBWllsMWdKQ2lPbUdvbm50WHRPMFlRbHR3NXJlZFh1YWZaWFY0?=
 =?utf-8?B?TmpQUGI3amJGZ29ESTdVaXROTXgrYm81Tjl4RDRFSmJCQ29GRGQyTTRlaU5Z?=
 =?utf-8?B?N0szdmVMMktCVXZLa0dsZ01BcDlzNWNtWUVzMFJ5UmN6cG5rK0g2L1Q4c2lm?=
 =?utf-8?B?c1p1YjNOMDRCTVpIcnVvY3hqcmF4VHFUVFBUZ2VuS2ZDQmR0S2xtbWpIeldY?=
 =?utf-8?B?ZG1SR2pIVTljM3dBTWdNM3hSWGRXL3JiaHFjTHlOcXJ0TFN4aG4zU0FpdXoz?=
 =?utf-8?B?dzdiaFFsRG9sR2IzbENPcWxoUk1XdGdBaVpDeFlDTVh0K1BsQW12cnJoc0h2?=
 =?utf-8?B?a2RqS3FaZ005d1p3Vk1jTyt2cEcyb1V1UEFDTjREOW5NQUZYSjE0L0VvSnVQ?=
 =?utf-8?B?U0RJYTBJc0Zrd01GanpMR2pyaUVRb0xURnYvMWlhcjhabEt1dW1ZYjJjQnp0?=
 =?utf-8?B?bXBIdHpjWDRRS3VqaG16MUt3a2dFaFJBMDBZenNqNEZMbW5QKzNjdXNMUTFI?=
 =?utf-8?B?Z2ZLVHNFbVRnYUp3ZUd2a2Q1SER0cUZobGJDbkd4ZTlOVDRzVFM5emZYUlh6?=
 =?utf-8?B?bkFEUm1lM3M5bEUwcjNJU0dsNWJYZk9VYy9xR3FnOXVuTmtaUXZNd0UyQ01R?=
 =?utf-8?B?bWU4K0VDRm1pdjR5cXBydkhuWXp4dVNLc1NXTjdjQTVUOCtBWlh6MjJtTzZN?=
 =?utf-8?B?VkRpeUhyTDBISHZuS1ZOWVNONXhiRjBGY1A4Vm5zeFFJb2ZmQnpCZDd2WS9h?=
 =?utf-8?B?a1pIbi9objZ2UjZBWDJUTkNJSUNTS1drTHZqbzJXN2pPdkhFWmF1YTRmMzUw?=
 =?utf-8?B?QWZNeXhBMURkcnFXOVFQR2RMZFBFYUFxZE41YmdNM2Fid0ZSOUxxMFc0U2FS?=
 =?utf-8?Q?95CTghk6m3MHLdNAf/EbNSKSDCNSeZLn?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5430.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0f37ac-a654-4943-1bff-08da0ae1f85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 02:24:47.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Emd9G38aP3ywHMXCuhEVU0oFyvHz8knanTUw+pzb78tf1nsGS/9Z2Pf1EyhJ4puSiWNQ1wYi0akiTcB1FOdIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_192454_353905_09CE2C08 
X-CRM114-Status: GOOD (  17.49  )
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
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Friday, March 18, 2022 11:51 PM
> To: Baochen Qiang (QUIC) <quic_bqiang@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: Re: [PATCH] ath11k: Add support for SAR
> 
> Baochen Qiang <quic_bqiang@quicinc.com> wrote:
> 
> > ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops, and
> > this function is called when user space application calls
> > NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR type and
> > frequency ranges to wiphy so user space can query SAR capabilities.
> >
> > This feature is currently enabled for WCN6855.
> >
> > Tested-on: WCN6855 hw2.0 PCI
> > WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> >
> > Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> What did you use as the baseline? I could not able to find an ath- tag to which
> this patch would apply. I strongly recommend using --base, that way I don't
> need to waste time trying to guess what was the baseline.
> 
> Patch set to Changes Requested.
> 

Hi Kalle, I have added the base flag in v2.
And please note this patch depends on https://patchwork.kernel.org/project/linux-wireless/patch/20211224085236.9064-2-quic_wgong@quicinc.com/ which is now in public review.

> --
> https://patchwork.kernel.org/project/linux-
> wireless/patch/20220317012728.18932-1-quic_bqiang@quicinc.com/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatch
> es

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
