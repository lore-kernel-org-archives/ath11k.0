Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2812D58E5F
	for <ath11k@archiver.kernel.org>; Mon,  2 Mar 2026 05:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8IhuOd6D0Z8YeM/6ROgsOAd71CR6FK92JyOmVjR1f0=; b=cJFhileG5igyqzFj1p0XkY1Yat
	9ADRN63SizFDgSjxgsDsJGXzUi6kfMZzZnLEpees3iSXfSWQJNId2AhM3O4DG5uI+2XT7sxjdidxr
	FBbkp2bwj5Bdf4OMk2RyW9psTNF6xn+fd+Lbk704B2uHIJdfzFC4HdMS4EYKmkam8c9XBjK9FNM6k
	iDA9Es5/wVGYwfYiS1XueN05w5Nqw7+4t0I3S9rKgvtCTNUKycIRpA8hoxemueogUaqrq8luvw47P
	YKeQ2bG1zxrCc9AV4lk6NmEsBa8gQeFYa116Sv0r5qy8KXCHXijXVlz0FIdXs2LX8/r+Prty3OX8y
	hQ+wOWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvm1-0000000CIQP-34Tg;
	Mon, 02 Mar 2026 05:24:53 +0000
Received: from mail-centralusazon11020122.outbound.protection.outlook.com ([52.101.61.122] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvly-0000000CIQ4-1omu
	for ath11k@lists.infradead.org;
	Mon, 02 Mar 2026 05:24:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD0fvSVN7gM3xc0Vz3LLqbwJ0xRKQBk3HqDeeyBgdHyWzJsdaA3jfgIKDPlwDaqZNSo6ZVMOqNt+sZL9Y1gC0rJH2IbHmKuhZjWh18yJCtkyayr4MomxR7i6+aG+rQ/tVizZLgg73JxJo9NNmHYSgRwtOvNEChzN68goU/5virFQucF2NW9+CBvP8Sfg+UjLFjrY3ekKmmvKHiuFzqLEyuQcv39RJ5PpEAo+e3cHll6IE9hnQ2DNzFTQInTo5RdK9BrVkRgXj1ltgCXa/0uRtr1wMOkunH4M8FjE5HLJVK9msDSUggtS2UJdddX9drqDP5M4jO9UYVxqALcoGnm/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8IhuOd6D0Z8YeM/6ROgsOAd71CR6FK92JyOmVjR1f0=;
 b=tWO5uwPrfHeFe9DWyuYWCOzA2J/miMNQIUmbPhum4ZPfv7XKdUJeyvAx8F4j7mTJAAhmxtcV5Li5n2hNTwghSpyIA2Ne95LyI0blUjZxiK0d3Xajdi0T4T8Wu6EQevvAuglP/Rxa+6cj4c8guhKgAfmu9i338bIU82ge9EWoQ/dNZOud04AFxEe0cmPC8d59dMQdHFGZTkX1eRNNIt1dJDXttu6FIi1DTpsaW+BOHYXFXaIMt6M9560WeuYkZm1rt9bYuy0qSyTCHQtQ9YFOVgfNDrb8A62Fw2It+BnmrrzElRPI2c1IBCbhDeMRcS1XIC+8ZRDjioC4D3Qy2uZXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silexamerica.com; dmarc=pass action=none
 header.from=silexamerica.com; dkim=pass header.d=silexamerica.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silexamerica.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8IhuOd6D0Z8YeM/6ROgsOAd71CR6FK92JyOmVjR1f0=;
 b=CRHX2BaBs4jrb7KYGzwalr/M+PD7X74K738TYQBX5nHaWCtprFjnzcy0A91Pw8JedRyBNwBg9C4NzwjNv7Pha3AhUjbhAA90K/iRX4QasgsjvPbmIAkh11uYoqT8Q1kQcpP4JNe8V0ARMMoW+tcHulJxhToQp0yoLNoYPWjrOMUtzdxm+A4SJ/lJdK2sa37NzR3m8uVlPfbsABd7jtA2zeXvDUzwcuWeIJccV2T4QQlELQfe8aJPK/WPIcYD7+4en8KxLFa4Y5dMQlYJRxE3oYeYEZJcR8ljPTYzgbbCJOweSQiGB0uvp8mLP9o6gI93lMvRzU0KUF1duwsxeOUdew==
Received: from CY8PR19MB7643.namprd19.prod.outlook.com (2603:10b6:930:7c::8)
 by PH7PR19MB6634.namprd19.prod.outlook.com (2603:10b6:510:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 05:24:45 +0000
Received: from CY8PR19MB7643.namprd19.prod.outlook.com
 ([fe80::29d0:89a7:16e5:b1f4]) by CY8PR19MB7643.namprd19.prod.outlook.com
 ([fe80::29d0:89a7:16e5:b1f4%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 05:24:45 +0000
From: Dawei Chen <dchen@silexamerica.com>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: A question about supporting the QCN9072 radio
Thread-Topic: A question about supporting the QCN9072 radio
Thread-Index: AQHcqEobxzTDjII7VEOOSoqv8YhDc7WXYe/agAAAMS2AAoE5gIAA00btgAACOv4=
Date: Mon, 2 Mar 2026 05:24:44 +0000
Message-ID: <CY8PR19MB764303EE2EFA9D9DB0282013CA7EA@CY8PR19MB7643.namprd19.prod.outlook.com>
References: <CY8PR19MB76432CFEF9F0BF8862EE4D7BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB76437B84E62BF9881F7DD48BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB7643FC8B2AA5ED9707EB479CCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <5d3d085b-9480-470d-bbb2-bd4a1fbae2c1@oss.qualcomm.com>
 <CY8PR19MB7643369A3333498D5FBCF4B3CA7EA@CY8PR19MB7643.namprd19.prod.outlook.com>
In-Reply-To: <CY8PR19MB7643369A3333498D5FBCF4B3CA7EA@CY8PR19MB7643.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=silexamerica.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR19MB7643:EE_|PH7PR19MB6634:EE_
x-ms-office365-filtering-correlation-id: b35c1a58-3794-41cf-13be-08de781c03b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 0g9v0sp6fw0lJyDAa8JQgbNIzV7Bf66pAFDFXFI2VjyAOqo9IL3c99oXzf43DoSkMjtN6s50u3noM6S2SDX71+a6o7On1mhJ9QIHGeM3krcighystNhyGJngvaKI1E9PaaZHQc1AZzErzu80rw5Tb6sbca4vkQoL7zO8NhoUAz+olbzlKuS78LcmODSZtfOYZtywFgbWLz/GEAiToiEnIL/xnLqaCVoEDJku7Uuwvm0415bXpAzwyrrK2NLg4w2KfhbbleatwSaKZE2Ubyr17a2ZoWUIFg8ddURFx86HDNFtn5NtWmK/8PGRw2PowV8MU37B7OAAuGBAqIoW3y3P5BombYtGxv1ao6pEfa4lpr7TGMtsJuQiylt+BGLmhNQvTI5RiqRY9gJ561OhL2OIURrRyNqUzqVjsxyGuYzT01CYllrYkCxOnuNricbZpPnEzJAjFXaW1zIIhk4VpP4EDmF/16TFuBhWjhoMQC4QYkMUM2cZqSLxFyXyGhl/xmCo0c6E7Du0+dmGQKgR+eIMFqaSht1OS4ZmZEWKNU+clC4zXx9hpmhbDlEuF6lorOJrJMWEmZCX4oEocgCWOTZ41PSYoWhlg0i61FVTLF0aL4EJv6Dz66KtBCtLft1lsuMvKy9WRnHbfqhjVviJw38VL7Kjyx4dEYtDyhj/mi5TuX6QLfF2q+h4TOi2VP0SIckT794VgLk1bJV095+yOoZZLDVle6QiY95IS2CDvSA4jlMTQum6POXgzAScE9TUen0ffUkdsAmgXaGONCKMvIiAiBzxH1+lKT/u0ZvDL1cD4dI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR19MB7643.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QXJqUGk8hu9mDwEmOxzQEDc9QWTIJt/m97uUbW4J01PjMfSy17RtkeXd4E?=
 =?iso-8859-1?Q?QahRyisCMxn1V0uv//n5q652/TLq8uiEwYOKhCs8i7XF8nemBHjR1e6L1U?=
 =?iso-8859-1?Q?wQnaut4R3rzcBE5EcMsXNVo3mwxLHeq7K4zk+fprYbRxe/e8ivsDLkarNO?=
 =?iso-8859-1?Q?E23JyAtMWZ0Ull1WMfB/gJv1CTozrnSsvF90iiCkKe62lLdnSJ2Dj49wL1?=
 =?iso-8859-1?Q?IlayY1tZ1aVN+QhRoae4mlzAD89EgYdsyYR/4o2iDJSJWQ08ZRoI8meNYo?=
 =?iso-8859-1?Q?u/WAyvML4NR92X+CTpXMpIZTNSoEU3CY5v1jZ11dB8TczPnYWkui3CkkHE?=
 =?iso-8859-1?Q?1mlLlMOKLLe9l53GQ7TeWgEFgt9GltKIamu4fy3mtl4XFKKl9CvYuKtH4K?=
 =?iso-8859-1?Q?3R83ycgYa/F1L6TEEiCMlKZZj+dBxZvlg/jsbJv/B3rzyNpSZ1vwvFbQ3p?=
 =?iso-8859-1?Q?6C9BgRhERh+T26fv5V9m332hzCYUCcWo4T/tezVZL5rU3wpT7jIKdF5lX/?=
 =?iso-8859-1?Q?yWHgVSqVCrm+VlCt9PIX1kCRlGRd1PbgxDlT65yG6KX2d+0gDrcBlyIVyU?=
 =?iso-8859-1?Q?WR3rSEh0FuJo4Ed07zWeLRGgtJ3hpcX89VnXc7rwdcqZO22Z9KOmEtdZ7A?=
 =?iso-8859-1?Q?Tp7P/4w3EeXG4ZtrC7XUtVKxw2/x5WDSglDSB0oR9Okx3dQkhgIxRlwb3F?=
 =?iso-8859-1?Q?UwA7ChfEBdxFwLLRDvsHQQSh4zeB2SraW/+omBkVHyj3dhqNG6Xcqy/E9v?=
 =?iso-8859-1?Q?uiYdxm+JTAtD1319wFbD3kIguGYYkoauc+omFrD+0rWYIWM/8SMZLVZLD8?=
 =?iso-8859-1?Q?bGNjU423AMRYXlcpjw6rQaDRzq+gQvGLB4QpRhyHrImn+yPAcYkYz3Eov7?=
 =?iso-8859-1?Q?9jB/gx6D7mOgQSKp1f1mSn8R5onKh80BzIb53yc25XMt7/mp1BBS6FvkrQ?=
 =?iso-8859-1?Q?A5oFkpuM3iOJXVqMfeYSaIXIAE9o0rMzYpIWyaDwkV4WSnXw3RFzklnZf/?=
 =?iso-8859-1?Q?ILmo3h2kD1e9llFuagOCfrUpqglCjgOd1fINWWsBzXNlMP6SBy+WUi5z9T?=
 =?iso-8859-1?Q?S0UQDhv2uvKrUpb4nZxq/2cmfXnvAWVH4u3pjIJwjhY9nxVAKWtXjzhSQS?=
 =?iso-8859-1?Q?2k14XeaR9+LfG34h7/863nzM1vzCDYHUSHQHAPu90ojeIMjXnXJOUmYs+V?=
 =?iso-8859-1?Q?I9sKsmTsuL5EB+J8riQDftEj1+EQomQnYdPphbb94UluM2U5bnPjVARrtQ?=
 =?iso-8859-1?Q?b6bRw1w3fDDAjUYEUyyiHa7BXV1tegZCZ1tQfteQIbcANAiYaBdWr3qM8I?=
 =?iso-8859-1?Q?8y09H3jSZ37eIVZg6RX/6o9zp9Txs2FLTZP8bjYV/Ehw+JNtCXDS6uaY5r?=
 =?iso-8859-1?Q?cIhvd6VvEzNEVdFXMhBIwh4eIXr2DPHgiqvNFhhA785hKSWEZnVjHg1kIR?=
 =?iso-8859-1?Q?R1nauJhqQHUHH/55gwsG2BFNYO8stougFRUxLSaaBZg4+US6WUtTRh0Q7g?=
 =?iso-8859-1?Q?tDHJAf3om5zDpXkYQxEXjjkgZtTDQptZben7vOBAS08oiDDWYPjW4XrNyX?=
 =?iso-8859-1?Q?BwhcuL1zgrr63C3hR7lHEqaK/wnTCz5lzyvEFKWyNXn1FCAOgVNEUK9Ml2?=
 =?iso-8859-1?Q?n5mhMDmBwI20jCGJP+NQ5Qzz18Pds/ypvTSss0wzV9P2XMqjh+ypX9dyBy?=
 =?iso-8859-1?Q?89Y6MGOdPvesTknHLxBy4pbbb8uG4Wna4BnFQMc7RGAS0xm8mz2UG9e0HK?=
 =?iso-8859-1?Q?GKSPn0cI8n7eiJmMKJEFnG+0x0G5Y8c9S82mu7OVKrfHy8G+meYh943alm?=
 =?iso-8859-1?Q?b/tvbOoZfw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silexamerica.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR19MB7643.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35c1a58-3794-41cf-13be-08de781c03b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 05:24:44.9524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b6aaf860-4a59-41a1-b5af-737a5a27e33a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t2xoc9AD8ZCwxKHH0zmhDx3RcM1P1CLuKJxZtcIKZsr2iUVr0MnH03lxgyRm0LmpeZ/KO2437TLL4rHpADNgrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_212450_576241_0D489A7F 
X-CRM114-Status: GOOD (  10.96  )
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

Hi Vasanthakumar,

My apologies.  It was a typo in my original email.
I meant to type ath11k.

The ath11k source code has references to QCN9074. Ath11k-firmware files are=
 also available for QCN9074.

However, there is no reference to QCN9072 and no ath11k-firmware for QCN907=
2.
My concern is that the current ath11k solution (host driver and TFW) does n=
ot support QCN9072.

Best Regards,
Dawei
________________________________________
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com=
>
Sent: Sunday, March 1, 2026 8:39 AM
To: Dawei Chen <dchen@silexamerica.com>; ath11k@lists.infradead.org <ath11k=
@lists.infradead.org>
Subject: Re: A question about supporting the QCN9072 radio



On 2/28/2026 7:55 AM, Dawei Chen wrote:
> Hi ath11k team and contributors,
>
> I was wondering if anyone could confirm if the latest ath12k driver and f=
irmware supports QCN9072.
> I am interested in using this radio and the openwrt stack for a router pr=
oject.
>
>  From my research on the internet, I have not seen any information that e=
xplicitly suggest ath12k support for QCN9072.
> I was wondering if someone could provide guidance or opinion on this QCN9=
072 radio.

QCN9072 is a wifi-6E chipset, pls try ath11k instead of ath12k that is mean=
t for wifi-7
and future chipsets.

Vasanth
This email may contain confidential or privileged information. If you are n=
ot the intended recipient, please do not use, copy, or distribute its conte=
nts. Also, please notify the sender immediately and delete this e-mail from=
 your system. For the full disclaimer, Click here<https://www.silextechnolo=
gy.com/email-disclaimer> .**

