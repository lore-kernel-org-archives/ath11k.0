Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D49FC433F5
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 04:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEn2RN9UpQl5XasUpC8kfx8kQF2C7BXrRQfjIKi+vKg=; b=weKZ5BIPK6gKXD
	ThflCQAZnXo9U8IXTuClhgUyBQywqhthh+aY8p5ss8Vxxkq6+BxoAH8DD/GFCglLuP8b6tyfnOQ1O
	1nIprpYKv0FPgesJfTKHhloHxj+UQMUV2NYx8P+JlXx+VmTg75StbC/3awFNfc6nLV6nNTZCCm8Zj
	SSvBU7rJPF/7lrcZY3N+OZrvApo830MulqjZ8LbjNopfAWysMrnSxxfJhiO9PwgWE7fHJFN3G9EmO
	+RtDJAAdZD/ydh57ujEwLvU2F8vacJsrijMBctuFfsbEABdHG5/Z+wWD1cKdEqHF0zcxv08vlP/Dz
	RFeHrFBMS0ix70CPrPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msHbW-007TxP-G8; Wed, 01 Dec 2021 04:52:26 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msHbT-007Twu-Cx
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 04:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1638334343; x=1638939143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bQGKcGXiZ0sdV0q4dZfQJl5/uwuEE9TIX0HOHxXqVC0=;
 b=m9UKsADyI9WSgrwt8V4OiR8SgdOyfX87GV83I56CYh3wked1uc0CVhEy
 J0ZCLRXLvIsE51f4x/dwNmsVKK3MuYEOhwJ6k/9DYK2R+UsLN6hni8EZb
 EVOJPzxmJ0spPgohThisJ/8WDYJM4K42hJanDWbufZjd4spbTMZx6Osf2 8=;
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 04:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAgT+mnIyFs8U1AwjUmaBQ2CtzCa2fm6Lj8YTdpPv93qVBXbJF7JJCfeS4+3FYN5Qn2FokQ+RfxFW4TGtvZKXyJSEGtPZcvBTWuzq/9PlmWyt7Y61OqjhI5yuxIpNBsUqR+Im1FfeM4X/bVCIlv8h3oBz1jHdiTJEsrc28MQRAhPcmhmGPQBiUHGxDBNUu3kEAqsmfdPRbpHq87rSPwoR9VDz3liBDpNVeFwaFY115T7mOzKjiYWhChHnacsLH5u9C31FBFbsXjUONMKlUAUoARp0iBaK0WcEZ8pY0bDeYpFbISc+N1h6b7mi4tvt1iJ7A1hK/sgF3qjWS1mIXfiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQGKcGXiZ0sdV0q4dZfQJl5/uwuEE9TIX0HOHxXqVC0=;
 b=VDozuQqaA56fmQHF3cGiWnE2Gux4k+QGF3TSER21EssTlt+ccgptu23OKtmpFNG48+4C/yP5BpPd1cfKnzb7kUBhV3azkg43fY4V4CjZ0698XNpiDllvwc/3QIlHLO6RIhJnS61M0+SAdPFeYf6eR96T1j41r7tnXi+FcTRqgPINbNsuWyj9/gcsXhaNlXSO+MiYeaJP6QzuWy5YAUpqtoQris7f+nCArDJYkh/HRJhqevsbvz0CTWajMaU3SassQBwFjoTK532ZNjTkedqzyXMJ2+fcyFph4ADg1eSrf54AXgFpQhnhe3QuBGDX2tij8MhxTtLz8UUDkRtSoDXLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CO1PR02MB8620.namprd02.prod.outlook.com (2603:10b6:303:15f::8)
 by CO6PR02MB7555.namprd02.prod.outlook.com (2603:10b6:303:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 04:52:19 +0000
Received: from CO1PR02MB8620.namprd02.prod.outlook.com
 ([fe80::546b:7950:7fa6:5517]) by CO1PR02MB8620.namprd02.prod.outlook.com
 ([fe80::546b:7950:7fa6:5517%9]) with mapi id 15.20.4755.014; Wed, 1 Dec 2021
 04:52:19 +0000
From: "Praneesh P (QUIC)" <quic_ppranees@quicinc.com>
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Sriram R
 (QUIC)" <quic_srirrama@quicinc.com>
Subject: RE: [PATCH] ath11k: Add provision to configure rx hashmap
Thread-Topic: [PATCH] ath11k: Add provision to configure rx hashmap
Thread-Index: AQHXyZp297aRVj102kKwkGPq5iGkcqv/wpSAgB2IpHA=
Date: Wed, 1 Dec 2021 04:52:19 +0000
Message-ID: <CO1PR02MB86205D503BEF9E0CE9D2788BFC689@CO1PR02MB8620.namprd02.prod.outlook.com>
References: <1635164316-27055-1-git-send-email-quic_ppranees@quicinc.com>
 <163671069706.11814.3105845576240199326.kvalo@codeaurora.org>
In-Reply-To: <163671069706.11814.3105845576240199326.kvalo@codeaurora.org>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a155161d-9a13-4321-57c3-08d9b4865adc
x-ms-traffictypediagnostic: CO6PR02MB7555:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CO6PR02MB755503982477930349CA62B780689@CO6PR02MB7555.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0bnKqFZtW/WUhCw7vE0rzybJZfA7CNVqQtSecqsZpMhTZ8kpo9jtsIo37GunlC9X0V1+VEgSIFSv23Ic7DIumb+IBbzd1Ytp/iPdaoM2fUbPL6X6O5PMnfwKdPFR7T/LSeBCUxC2md/ZnqFgagjFARBCAJ1Ush6SD0umvhJTuHbqcl2FYwUpicQ3rWxd7j5DtoKOycK38ntPu4F8vWVhXFLLkwjJmLZ28N8qHnsT41ee7+XgIBHqy6EqJdccyDomg4spNZVzPBGzwYKQupZglYHm7PC+jwF6aGAvhbP3iO8LrfxkQRH2I/NwIm8hCmFWe14p3kApc2xmvT4Wnm8wK2gjDJ/MMMfM/RqZSNUoSR1qse8TMHurW4vK86Nq3rc5EraTJLqbAJHRxGCSmg5NxtY+z3YrPiuS4dK3qZL61v7vwSeQQuPrjv6uzR1MbXO8hKER1LmuvgOq/G5HwiO58LjNn8X6th8SdL7vYe5iNQOlv5N3AsfYdyNsk3Atd9yGXFWFTJutX9sOrLw5Xt4/TOWZuX4KKhxDC7qHXITL9DDSFJ2fZY5MBU22zRYAwwMtGvZoEBNuzrxc6fPnaLFVrMExb5VpLxJjO/tnOJkkt54oIqWn3gOBHUjjkA3rmF22NkeSSUS0TrSWCSmkLQo2zpcCRBSRdXVbSVU0I+XloqQkDRffPxcmarMwJ89MEEPy1tveDQhxP28LiGVUlX6WUiD9n6myqHVJHx/GrdX4J1oKrlj+PXj0EDyO5UDTE3REtAUmdNoTH9EelH0OykTmyPNVuPwfrfTCqT8Fc3p5WI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR02MB8620.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(186003)(38070700005)(107886003)(4326008)(86362001)(508600001)(966005)(55016003)(5660300002)(52536014)(54906003)(122000001)(53546011)(6916009)(6506007)(38100700002)(8936002)(316002)(9686003)(66556008)(33656002)(66476007)(26005)(71200400001)(66946007)(83380400001)(66446008)(64756008)(2906002)(8676002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkMvQWZWekRyVnBYdC9TdG9kWEM1cVdPOHNDWHRuN2UxelFScjkrN1lTWmZM?=
 =?utf-8?B?bXUzS0lHaW5ISmFiSk9INi9zckU1UEhvNXhkdEM3VFBqRVQ3MVpTOWwya1Nq?=
 =?utf-8?B?ZXpFM1M5dU5WODZlMGZuZ21SamJOMFJUdUhHQng0VG1JQk83NmtvWkJYNHhS?=
 =?utf-8?B?NS90VWdmUjVKWFoxYzlZdGVYL2xGN0tOTVlRL3VOWENBdlg4bXhGSnFqZEZG?=
 =?utf-8?B?R3ZlbEtiTVNGRWc4UTQyVzg2aGh2aHpwS3ZKWVd1Y0dMZ2VneW5jYjJXZmNq?=
 =?utf-8?B?Ym9uTmFzQTV3dVhCeTlPazFBSk9mclN5ZkIyZDB4MkRSVDkrOWNzdkVIcWtF?=
 =?utf-8?B?NW1mRUJ1VXIzc1BIeEZqVHFCOW1kU3lOdUROUmRsd1VmclZXSmlzSnFxZ0Ez?=
 =?utf-8?B?WGtJdERBNEVBUkFBaDNYQTJqNFpPeVp5amxSUHZ2dzFLN3dOU3NlQWNtUVRS?=
 =?utf-8?B?a0FpSnFpV1BnN1BTbWx0Vmw4bXpaaVRsWVRhVFlmMnlsWU1kRmZLc0MwVXJV?=
 =?utf-8?B?Qk9Mb05EK3pZUWg0QXlyRitBUjIzSFlFWWdsd0sxWm9GNW9pZFAvdnRSUHoz?=
 =?utf-8?B?Mnl2b2dDbG5HSHZhOUZSTEhaWHVCVXpiSWJaSEI4ZjdJbkowVHFqbTdLOE1C?=
 =?utf-8?B?R1lzb3Q3Z2dwUmNUZGtoMGpPcXVYeTUyNk92NkRNb1pXVXROOGFtaWY3TjBW?=
 =?utf-8?B?LzVFblhpNVBDTGpBeCt6RXpWQ1A2Y2owemtVR0kvL2h2ME9VaTRsdTcyYXdw?=
 =?utf-8?B?NXdGWSt2UHRlS0xtU2Ewc3B6a2crR1M3QnUyTjFsOTQrcEt1ZnVOWVRuOWhl?=
 =?utf-8?B?RDJHM2hncWNuZTFKLy9ITzlXOHdHUDc2alhQUkZGeXZyUVRVYjVFZUJwNitC?=
 =?utf-8?B?MFNiY1RlMUx6TTUyUUtycmozSTkyZVJRQThUanRWOW85NmJGM3JpREdJNGdu?=
 =?utf-8?B?TGxrQ3NhNm02aWxnOTZ2K3FrMC9yazlsaitncnAxQUc5OWVEZy9jL0lzQkc5?=
 =?utf-8?B?OHRvZE1qY2RHQTE5RlZjb1dhTlYzK1YzQ2prS0JtSnZuQXREYWFkNE5tQUlH?=
 =?utf-8?B?TFViKzE3dXVkMkFFMGRnd1J4MVJSWTBKUHpPQ00vbENZSHc5UnRvNFNuMm1r?=
 =?utf-8?B?SGVGaW1uUDBXMktoZ2xqQ3ZhcTB2N1hmUkZWVmF0dktJK3RwT29PU21mM1F5?=
 =?utf-8?B?a090OEgzUWlmVm1zMnNHSjJDWS80OXdVQVBQY2xoR3ZYcXJnbGNDQlBjVjky?=
 =?utf-8?B?aUh2U2FIcTJHL2JKYUdxamV5QjJMRnY5a0w2YmNrcmE1ekkxYlRtS1NXd0th?=
 =?utf-8?B?eWNJdlVUcW85VGtNVm1mK0NXbnFXYlo2K2VybHNodjRnTlppdlFQdHNSbkgv?=
 =?utf-8?B?bTdoSXF3WUErYnhwYnFkdS9FeDVjbjdWS0V3N2V5QldNcFB0SFZNdW50ZTNm?=
 =?utf-8?B?KzQreTFEV1JRZk4weVloOEpHOVJsZXFEQmVyTTF4Ykwvckx1dk03VUFQK0J4?=
 =?utf-8?B?R1V6TTBpNXp1SGZpWVBRYTJ4UTVhYVlGR0NxRmIraW9WSEViZytaOTh6dTlv?=
 =?utf-8?B?cHlBZ1RjejY5N2hsNkdxcFNCRVN4a1Z1ZnpGME1wRTVsOVBYb0pWTVpCMWZl?=
 =?utf-8?B?dlEzZWpQdlF6RHpVK2xTRUJodXFDWngzbDlMOVpBa0pOZlN6QTVDLzJ1anIw?=
 =?utf-8?B?Z2NuMnoxTGNWNFpNSHd5MFdDUkJnNWxwMExqRHYxZUo4L2tJQVRHRjU2ZUUz?=
 =?utf-8?B?UG43MmNNUWdRRXI4Q0F3L1ZaSkFIcUlTOFZWa2lsN1lZRFFPQXBvRGlneWt1?=
 =?utf-8?B?bTJCSVREOFZWdWU3ZXNka0Z6RmZzK1Y3Vm00ZDhuYVdpUWx5c0tXdkk4SWt1?=
 =?utf-8?B?UEVldjFrL29ac2JRaUdkY3ZsVTFueS8wUks2SG5jdVNDeWFsbFUyQ2JLd2Rm?=
 =?utf-8?B?YjZ2SUp3cWw5cmhXN1ZsYUJLYkNnWXk1MWpnbk1mM3JRcFlSemlUMTU1Q1dD?=
 =?utf-8?B?RnhRSUdDaG1VOC9ld2RVUEttMnNIdWRYRjJYY3lyb2FwN0dRcm9HRGVSTFg0?=
 =?utf-8?B?aFRubjREb3hHSjR3ZEo0WnBsMmxWVWR6aGxnYTBjVDQ1OFEwcnFDTFRPRjMx?=
 =?utf-8?B?aU9vTHFRNTBySVpwT29pdEg1QzFsVjB4amRldkNDVm52TnB1RDRkdVcvZkk3?=
 =?utf-8?B?NGcxdzlNNmNIVjMvbTVYdGhEcDd5Z0pyRmJ6KzREQkdxZytQMjZBMjltem56?=
 =?utf-8?B?enRjeXlkQWdlbGtDdGdRSXNiYll3PT0=?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8620.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a155161d-9a13-4321-57c3-08d9b4865adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 04:52:19.0641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilzLEuuomX8LaSNUtOh58ro1qDHQBsw8pF8KsiOBSsEx58t/03NqfT6kd8Byc1qnXWC12P4BCOiItHN2PSPRIb95aE4yaT5aC6yvKUTkrGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_205223_542233_F46E1EDA 
X-CRM114-Status: GOOD (  15.99  )
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
> From: kvalo=codeaurora.org@mg.codeaurora.org
> <kvalo=codeaurora.org@mg.codeaurora.org> On Behalf Of Kalle Valo
> Sent: Friday, November 12, 2021 3:22 PM
> To: Praneesh P (QUIC) <quic_ppranees@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org; Praneesh P
> (QUIC) <quic_ppranees@quicinc.com>; Sriram R (QUIC)
> <quic_srirrama@quicinc.com>
> Subject: Re: [PATCH] ath11k: Add provision to configure rx hashmap
> 
> P Praneesh <quic_ppranees@quicinc.com> wrote:
> 
> > Currently the hashmap is set to default during REO setup and all REO
> > rings are equally distributed across 32 hash values.
> >
> > In multiple radio cases, 40MHz+80MHz+160MHz, distributing received
> > packets across all the CPU will cause CPU overhead. In this case,
> > during runtime we can span 40MHz and 80MHz among 2 cores and remaining
> > 2 cores are equally distributed for 160MHz by using register mapping.
> >
> > Add provision to configure the hashmap during runtime through debugfs
> > for improving flexibility to control the destination HW rx
> > queues/rings, so that affinity could be used to assign those
> > interrupts to specific rings. Setting 0 will disable hash based steering.
> >
> > echo "hashmap" > /sys/kernel/debug/ath11k/ipq8074\ hw2.0/rx_hash
> >
> > Developers who are aware of hardware register mapping can leverage
> > this rx_hash debugfs.
> >
> > Tested-on: QCN9074 hw1.0 PCI
> > WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
> > Tested-on: IPQ8074 hw2.0 AHB
> > WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
> >
> > Co-developed-by: Sriram R <quic_srirrama@quicinc.com>
> > Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> > Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> 
> debugfs is for debugging and testing. To me it looks like this feature is for
> configuring the driver, not debugging.
> 
[ppranees]  This debugfs only used for RX path debugging purpose during performance test, By default we intent to use default hash map.
> --
> https://patchwork.kernel.org/project/linux-wireless/patch/1635164316-27055-
> 1-git-send-email-quic_ppranees@quicinc.com/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatch
> es

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
