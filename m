Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A812C19F53
	for <ath11k@archiver.kernel.org>; Mon, 29 Apr 2024 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hUg6AoA+LN8cn7OwnFk2MJG9DHdJknKiF3BTRXbDB80=; b=JAjKiy8gFXUEus
	20l/AODxyOY9w0k1jc4Q0xk/64lIpIyfVJiDrsTGR/mHSvgytISn9at3b+y3B1T5rhfwDWj3jUMeo
	XF3bpkK96r+S2RISK2MXj+JJUwX1v4VYZK7TOlppHDHnLzMuLpa+rfmtdmC2rPCOgAy4NccO0TSJr
	sV0sR9w89KQfeYrqN1xFNVpIi03XjJCmC0BzWO0jEvI3/oyvrWtyD7AhRh7XBxDRdPwtiE0LJvxnG
	E50AjVcP6Ts9MWve8LmMlWqq0D9SazY6cWjUNSQt8P4nGQYy0WtzlQ/8O0bAGb/vFsZIInoKMAHQv
	RCo03eEAcHkOr/dCb0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SNU-00000003CpS-09cD;
	Mon, 29 Apr 2024 14:53:12 +0000
Received: from mail-be0deu01on20701.outbound.protection.outlook.com ([2a01:111:f403:2622::701] helo=DEU01-BE0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SNP-00000003CmG-3poX
	for ath11k@lists.infradead.org;
	Mon, 29 Apr 2024 14:53:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA5iYIaup2nqbw7IO/sbtIK7p2QZKZlIDtkPShdFlAn9PpqzgGmVCRQCkf7LRrh7OiRaNTRe8mTKZfL425Vb0fdOQKqMGTSuEoELcaYMWQSbJkiMBcTTryQQDdI0e4ynn6fWgxFT9QpfeiSCCj9uKC8H2I3kml/qoUOzk1/6kACUHr0fe5MWVhLpY5If1ui4TjQzQ+np11kgc1Z+ZlspfmKetuiLGenY/2Qh6NJ6tFQN1licK6/06hg/FJotXNJ3MKSJAFbmAe175NGlZIoOqVhIYi7XS2ko0oiPLAByk21hDtFQkeP7vwr5NLcIXw6ecW7l1/nmxAt2z9+y81SP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUg6AoA+LN8cn7OwnFk2MJG9DHdJknKiF3BTRXbDB80=;
 b=JZNg0++4525OU2DXN9KUwqNM23F4InruiU4+Qv1kAkn6nrI1b2u9oaEF3Jsjh6WCHF8tgHKrmFcsu4yQM+IV8oX3/HsbC8LRSmMsfGlbGQqvLKVGkwZsMjghcjfpS/NopS3Oa+2ELhQwWj3m/o1uwpBdnv535sRRPFMl1vGE7gCOyNcFknXCX/7Rm50g8ACVqputTjNOyo2823NG5Q4FpOh+vNE2utwwj1HmUI0cjebk0HviWu2eCVhFnp4jj/aGpVBdSlTUb9rbCyiycckgNWdkmTRHFL4rFFe5LVsHJesHyVkdVfvtkvIEzw09U68l7D/babdTwgkGqnzmslU/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghmt.de; dmarc=pass action=none header.from=ghmt.de; dkim=pass
 header.d=ghmt.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghmt.onmicrosoft.com;
 s=selector1-ghmt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUg6AoA+LN8cn7OwnFk2MJG9DHdJknKiF3BTRXbDB80=;
 b=fIK8pgWQ2Fn4rVhTpcmqROWiREKPQraOJMN+7IrZawEb/oBIm0lDabpNApMlltMEnNYzMx8s7e5pWsDQ/ezDw9KffG7mPm0KSe2QaHwfW1DB2KtZmiWkUzpsfZ5mCbEcdH48DCh+rAg8DyHM4I3fXNKDKf8M1A87zI39QTCegked6LCsYK/JdID5iKriShM3+RMq/FXWekLZ8Mdmz4ylyq3jggSkFCwiAVjpVmRCjk1ojx+klpnvxRqXtgiFIQksrMDmFWEV5AKuwRgTSz0wtc2pAErHTr+FLJNBHN8CsC7E1Dpmp8YL/6gb+3h6Y9018PqAHmJjogM3ar0CKJ35iw==
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:2::16) by
 BEZP281MB3256.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.21; Mon, 29 Apr 2024 14:53:00 +0000
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::f261:e007:793e:e606]) by FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::f261:e007:793e:e606%7]) with mapi id 15.20.7544.019; Mon, 29 Apr 2024
 14:53:00 +0000
From: "Lindner, Frank" <Frank.Lindner@ghmt.de>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: ath11k
Thread-Topic: ath11k
Thread-Index: AdqaRHWavgFFIAlCQOa2l6qTl3RdZQ==
Date: Mon, 29 Apr 2024 14:53:00 +0000
Message-ID: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ghmt.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB0160:EE_|BEZP281MB3256:EE_
x-ms-office365-filtering-correlation-id: d87b9753-343d-4ecb-9a85-08dc685c1076
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?cDlrZEd2OE5JUCtIT1BGbDVYQ04wMEluUjQzSGVnRUdYUkVjcms1N1dJTXU0?=
 =?utf-8?B?MFlSUnFEQkRXNzFnSGZqb3FXT0xzemJzSFpERngxS1BUVnJvdFpDQ0tMRlN2?=
 =?utf-8?B?NTVXU3BOOGFzbGxZRXpaclprajB5bm9mQlRiQlRNbm5wVWp0RFJTV1Y4Z3A5?=
 =?utf-8?B?dE42OW5adEVqZXFVWE5mc3Q3TkM5QjY1SDdkQ1VUTDlVMGdwZ1NnRk9NQXkr?=
 =?utf-8?B?UG5ydlAyWnd4RXhWUGZGZXZROHlEYWJERkhLemlxZzAwVlRmK0w4M294Nyty?=
 =?utf-8?B?Ym9jd2VHS3Z5b3Z3SEZFa2pLZUY5eVI0eVFqU0FmZ3B3YnJZOUtxQStFb0VF?=
 =?utf-8?B?QmNjVGNQTXpzSExzVlR3aVp2UDY2elhYTC9qb29Od0NKY2NubThqb01zUjZm?=
 =?utf-8?B?UjJ4SmJBVUVXZVJyLy9mbzd0T2IyS29nWlE4TmpPNy9lTTlJaWQ1S0lrOXNx?=
 =?utf-8?B?UVkxTmgwVFNxYitrZVlEdGU0ZW1LM1lKdU1yaGNhbis4TXZ3cFRoUWIvYVhq?=
 =?utf-8?B?ZTIwQU4yMGZibmQwbE9yVVJJRGlWSEhoWnBlUHFFdE5sZC9yUjdkQTFVbVhW?=
 =?utf-8?B?ang2dEhydk4yRUR0MWEwZ2xLNmVvSzBlakpvZDRNUWprSTZDUFA3bjk1eTk2?=
 =?utf-8?B?NnBzOEw4cE1sT1RkR05RK1Z1YVY0UXExVTFEWk5McytNVWVOS2JBdTVTSklk?=
 =?utf-8?B?cEZYdUdrdTJEdHlEWm9uOXFXR08wbm1hZnFtcnJ2L0tidWU1RnNRWXdIemFx?=
 =?utf-8?B?eXRQemlnMzBMRmN2QmsyZmZjaEIvSDRYaEJEc3V6eWtORUF3L0p1S1MzczFo?=
 =?utf-8?B?V3d1RWlWTXRjZGdwaHlMOE9BYnFHU25FVjBBTE9CNTdHRFVGSS9VekJYVERp?=
 =?utf-8?B?RDE1dFZ5MTJsalVOb0JUUUcrQzkwbFlQbTI2MHo5Y29zMGZwSVpDWWVVNER6?=
 =?utf-8?B?T0VQVmxZTW1JaXR3MDFkVWNVN2EvQXJ6Sm5JYU1aWHNXK2doUmxIYTRDb0pt?=
 =?utf-8?B?c0dZWUg0c0FzcHE3amhKUVlhTHgzdEJyK2dUWU85Nk14dWUwT0VYaU52bDRO?=
 =?utf-8?B?SHFyWXV2ei96M1BNOVFIUjFDNGV4UEtleWhJS1NZcEVaSmo3eU9NZkc4eStT?=
 =?utf-8?B?T2NJazBObEZ3OVMwQW9TckpVTkhHY1ViRHNxQjdtNXI3bUxMUjZ5ZEdZSllx?=
 =?utf-8?B?RnpKRkFhcnJYVmdBOTRoNi9LN0MxSlVkeVI4MnN3cWFTelcxWGhSZWlNL1N5?=
 =?utf-8?B?UTQ2TXc2ZWh4eEViYzlVeTVBV2s3cmJmQ1RseVhmWFNSNC9PS05zZmdOeTh6?=
 =?utf-8?B?eDF5aVRrMnd1Q1Y2bzV4aFJUSjJ3clV1MmV0ZW5rTk9mVkFLd0hZWWdWeU93?=
 =?utf-8?B?Ukt2aHBkL0JtdWpMdktmQVR6R3I0bFh5VGY4b2oyZzcxeW9ibXk3Y3pKb0Zh?=
 =?utf-8?B?b0pRRGlPSjVzaWxydUViVXArUFFmMmFPOEJ0SmxzNXkyL2Rhb0o4K0RsZFdk?=
 =?utf-8?B?WmZONjhPS1AycHNZQUJPclJqVjRpTHFzQ0FFZjNvV3JGc0ZRSThtS253b0U2?=
 =?utf-8?B?dzlMam5FVlM5bWxWN3N4TUNyeUdPSS82enRJY2hpVm9hL2FRbEdBZGpGQ01q?=
 =?utf-8?B?NTdGdm14L0QyOEM5ZHFCeHN1ZWVDdS9oWFBQVHVUdkUzWHF3QmJNUXd3eXdB?=
 =?utf-8?B?TEgyY0JIczNYenI3aGhHV09wV1IrZjNPaTdSOHZ0WklDK0ZsVkVzbVl6amg3?=
 =?utf-8?B?NTF6MzBucU5sdFRyUk9JSHI2NmM0eWR3MTg5bGtqTGlVMXR2MEN2VmJPc3dF?=
 =?utf-8?B?eTJpOG01bnBRanNRcjZldz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnNBVmRaNWJBVGJKS1BYMWdVMGFtdTFKd3FWUjFKMVlNTzd1WC9LQTQ5UXdC?=
 =?utf-8?B?eG1VTm1YTWtDMzVyYS84N2xyMGc0WlFuUVNmR2NoR2xqS091dS94S1lPSkdt?=
 =?utf-8?B?L0FrZWNFWjdDQVN2UkZqMUZselRSYmVZWVNwR1NDL3lncmR6MWJ5RExabnps?=
 =?utf-8?B?V2I1RXUrM3IzWlgrS2U4dndPaXljODIyZXUvY3FCdGJRZDh1cG9kR3RMUXV1?=
 =?utf-8?B?Z1NQdnphRWd3SUxicmo5QVhSOGFMQndiSC9tVjRNZGxIdTlvdmhTd1dldDVr?=
 =?utf-8?B?Qm10dVZielBYZ28xeTFJaU5SVkdGclcyMG9yb2x1Y3FvUmh3M01vZ0pHK1dV?=
 =?utf-8?B?QUpzb01qL0NrbUozcGF6U1dOODlxYVpSaXI3RUl6aThlV1Y5MDNuem9vYUpj?=
 =?utf-8?B?UzlqaURjRDZzL1NCSW51bzZtRzQ2djdHSy9OR0I2TnR2QitUV3hOQVNJeDFL?=
 =?utf-8?B?UW5Hb2krMlJjR1JaRWh6KzhrcFpTWktCa1U1T2dXbmlIdWxodkRIa3ZORkVq?=
 =?utf-8?B?VEhxTE5yWFlFamVhY3ZBbWpaNVhRNUJrakJaZXVncVNTb0lZcmRBKzNUWmQx?=
 =?utf-8?B?TDB1S1Y2Q0I2UDhWWndLOWpVWVBvL2NDQ0ticE5KVCs4TVdZeDdYVWRxK043?=
 =?utf-8?B?NlhiWitGaTRscjBWVmhzSDVvQWxCZjZ1THNwKzdHc25HeGJ1ek1wdkZxeTQy?=
 =?utf-8?B?bXRJRHlIVkpEVFlwR1c4eFRQT2pIVGh4MkhUcDQxMENRcWlBK0hVU25pQkJK?=
 =?utf-8?B?SjROcC82TlprdVlFM1JvODJhM3FrYXpXeWJZWlpnTHNLTWJPTGRPR2Ryanht?=
 =?utf-8?B?NHFCa3cvSjZlejhYK2luRkowUHFuV2NpKys2eUgrME9uRVU0dmluNWYzSDUy?=
 =?utf-8?B?WEtDY2Yva0t2eDdGYzN6Si9UTHEzRzcwRExVOGJNS0xmSnRwOW0ra09FSlp2?=
 =?utf-8?B?QXRxM2dXZ25EMGlBeUU1a2Q5REVzTUhpYjlEMWZ3OG5kbkdmN3ROS0Rodk9G?=
 =?utf-8?B?QTI4SkNGaFRvMzMrMTI1c1hkSThqZnI0K0ZLc3RXNXVsbkxzY1ozMFZvbExE?=
 =?utf-8?B?Zm1QQTNHUzdUdkI2dXJjdVd6RXZpQ1ZTVmhBMjRPbG5XbmdTTWZDUE54d3Vv?=
 =?utf-8?B?UWNtek1xejVmbExrZG94SUQ2YU00QWpPVzRIOGZTWWJOWW11K2ZSWXB3Mm9u?=
 =?utf-8?B?LzRlNU1ibTlsNFY2SDhWVlVMbFFLRk1CVXdHOW4wM1U1WFRGSzZVZWErY3gr?=
 =?utf-8?B?MUZONS9sSm1YVUVzTWwwY2l0a0pvc0dGbjJ0ODhheTZzOEVPT1doUnJpcERo?=
 =?utf-8?B?UUJaTUZnWjhJNjNOaTBhZW5GaFd0TWphWm1teDRMRmRzNlY5Y1c5R1BaRFNa?=
 =?utf-8?B?QUR0NnkwY0VCTVlwU0hrS0xwSk53VU0wWE9YODVqMWxmUkFZQ01OSEVVWE1o?=
 =?utf-8?B?cThSTFJHdFZzWTYwakFpaG9HNENkU0RlV2NlNHJUWlZCbWNlSzhyak0zSlBk?=
 =?utf-8?B?cWFjTWc1TGtDdEM4cFdoMXBDZ2Q1aWRuZjBXMk9NTnhzY2VablFjdG03UWZF?=
 =?utf-8?B?Ti9Yb1RuY1RtanUrRjlIK3JCNExjd00xM3FoVXRuOVIrSk93MVZLeHpNaEVk?=
 =?utf-8?B?aDZmd2pXdmFzbVNRZi9CdFRUeW5PVEc2SHVnQVZJaVpaeHg2RXhqbXZ2dllW?=
 =?utf-8?B?RTduc2NtTHhEdVpXOWZqNCtCNFlSazRuYXFpcWhWbGIyTDBCTlk4VFlGZS8v?=
 =?utf-8?B?OXZMVzdsWDNhR05QZUI4KzN3dzVpZjVkUW93SjBEWGp2Sk5wZUo5bFpNeW1B?=
 =?utf-8?B?blc0WXFaR3pIU1QvQUt0dTA0dUFDVlhGQWxxUUoxVmpGL1gwQ1cyYmZVS20y?=
 =?utf-8?B?ZEUzdUVnRXBJaWpobkJYVjEvMzcvNnpoS1A0QnFTeVIwRmFic0dOZ3d0ZVkz?=
 =?utf-8?B?alpEelpWbVFlZDdjS0dhU0pyUDJKYm10RDRhRGI3UGpkTG9YL0Fra1FpalBG?=
 =?utf-8?B?akkrcy9WejB1Vjlsc1JyT0k4WDFMUmgvTnVRMlBzL1hoSjR0c2c3RDU0MTNC?=
 =?utf-8?B?a25NeWNwbnMwbHRZT0Z5ZkVqTXBOOSs2UUdpQndFbVl3NkFieEJGakM3Sm55?=
 =?utf-8?Q?DPNYs187Nq/lxUfGkYb1IHf3f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ghmt.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d87b9753-343d-4ecb-9a85-08dc685c1076
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 14:53:00.2229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9223b922-6d43-40bb-85e5-a10749de3853
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92RxM4wcvyEtgXlDTc7RkPs0i5xwS8QMA8zmWlEJQUrPYURSTXsMX+w6Q91LiitoJeUxbiluGSMOj1EA5jnKUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB3256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_075308_522911_67EB48F9 
X-CRM114-Status: UNSURE (   6.46  )
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

SGkgZGV2LWd1eXMsDQoNClFDTjkwNzQgbVBDSWUtbW9kdWxlIHdpdGggYXRoLW5leHQgS2VybmVs
IDYuOS4wLXJjMSAoVWJ1bnR1IDI0LjA0KSBjYXVzaW5nIEtlcm5lbCBDcmFzaCwgd2hlbiBzZXR0
aW5nIGRldmljZSB0byBtb25pdG9yIG1vZGUuIFRoaXMgZG9lcyBub3QgaGFwcGVuIGluc3RhbnRs
eSwgaXQgbWFrZSB0YWtlIHNvbWUgdGltZSB0byBmYWlsLg0KDQpbTW9uIEFwciAyOSAxNDoxNzo1
NyAyMDI0XSByY3U6IElORk86IHJjdV9wcmVlbXB0IHNlbGYtZGV0ZWN0ZWQgc3RhbGwgb24gQ1BV
DQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSByY3U6ICAgICAgICAgMC0uLi4uOiAoMTU2NjEg
dGlja3MgdGhpcyBHUCkgaWRsZT05Mzk0LzEvMHg0MDAwMDAwMDAwMDAwMDAwIHNvZnRpcnE9MjY5
NjEvMjY5NjIgZnFzPTc0OTkNCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdIHJjdTogICAgICAg
ICAodD0xNTAwMCBqaWZmaWVzIGc9NzgwOTMgcT0xMDcwIG5jcHVzPTE2KQ0KW01vbiBBcHIgMjkg
MTQ6MTc6NTcgMjAyNF0gQ1BVOiAwIFBJRDogMTUgQ29tbToga3NvZnRpcnFkLzAgVGFpbnRlZDog
RyAgICAgICAgICAgICBMICAgICA2LjkuMC1yYzEtYXRoLW5leHQtajAwMSAjMTENCltNb24gQXBy
IDI5IDE0OjE3OjU3IDIwMjRdIEhhcmR3YXJlIG5hbWU6IFRvIEJlIEZpbGxlZCBCeSBPLkUuTS4g
WjU5ME0gUHJvNC9aNTkwTSBQcm80LCBCSU9TIFAyLjIwIDA2LzA2LzIwMjINCltNb24gQXByIDI5
IDE0OjE3OjU3IDIwMjRdIFJJUDogMDAxMDphdGgxMWtfaGFsX3NybmdfZHN0X3BlZWsrMHgxOC8w
eDMwIFthdGgxMWtdDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBDb2RlOiAwMCAwMCA5MCA5
MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA5MCA2NiAwZiAxZiAwMCAw
ZiAxZiA0NCAwMCAwMCA1NSA4YiA0NiA2MCA0NSAzMSBjMCA0OCA4OSBlNSAzYiA0NiA3MCA3NCAw
OCA8NDg+IDhiIDU2IDEwIDRjIDhkIDA0IDgyIDRjIDg5IGMwIDVkIGMzIGNjIGNjIGNjIGNjIDBm
IDFmIDgwIDAwIDAwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBSU1A6IDAwMTg6ZmZmZmJh
MGU4MDExM2I5MCBFRkxBR1M6IDAwMDAwMjgzDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBS
QVg6IDAwMDAwMDAwMDAwMDFiZjggUkJYOiBmZmZmOTI0ZTRhODFhM2Y4IFJDWDogMDAwMDAwMDAw
MDAwMDAwMA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gUkRYOiAwMDAwMDAwMDAwMDAwYzBh
IFJTSTogZmZmZjkyNGU0NTM0NzA4OCBSREk6IGZmZmY5MjRlNDUzNDAwMDANCltNb24gQXByIDI5
IDE0OjE3OjU3IDIwMjRdIFJCUDogZmZmZmJhMGU4MDExM2I5MCBSMDg6IDAwMDAwMDAwMDAwMDAw
MDAgUjA5OiBmZmZmOTI0ZTRhODFhMWQwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBSMTA6
IGZmZmZiYTBlODAxMTNhZTggUjExOiAwMDAwMDAwMDAwMDBmZmZmIFIxMjogMDAwMDAwMDAwMDAw
MDAwMA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gUjEzOiBmZmZmOTI0ZTRhODE5ZmUwIFIx
NDogZmZmZjkyNGU0ZDU3NWMwMCBSMTU6IGZmZmY5MjRlNDUzNDcwODgNCltNb24gQXByIDI5IDE0
OjE3OjU3IDIwMjRdIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOTI2ZDFlZTAw
MDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCltNb24gQXByIDI5IDE0OjE3OjU3IDIw
MjRdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCltN
b24gQXByIDI5IDE0OjE3OjU3IDIwMjRdIENSMjogMDAwMDdmY2M4NmQxNjZlMCBDUjM6IDAwMDAw
MDA4MjcwM2MwMDMgQ1I0OiAwMDAwMDAwMDAwNzcwZWYwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAy
MDI0XSBQS1JVOiA1NTU1NTU1NA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gQ2FsbCBUcmFj
ZToNCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA8SVJRPg0KW01vbiBBcHIgMjkgMTQ6MTc6
NTcgMjAyNF0gID8gc2hvd19yZWdzKzB4NmQvMHg4MA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAy
NF0gID8gZHVtcF9jcHVfdGFzaysweDc1LzB4OTANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRd
ICA/IHJjdV9kdW1wX2NwdV9zdGFja3MrMHhlYi8weDE4MA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcg
MjAyNF0gID8gcmN1X3NjaGVkX2Nsb2NrX2lycSsweDU3Mi8weDEzMzANCltNb24gQXByIDI5IDE0
OjE3OjU3IDIwMjRdICA/IHJhd19ub3RpZmllcl9jYWxsX2NoYWluKzB4MWEvMHgyMA0KW01vbiBB
cHIgMjkgMTQ6MTc6NTcgMjAyNF0gID8gdGltZWtlZXBpbmdfdXBkYXRlKzB4ZjcvMHgxNTANCltN
b24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/IGFjY291bnRfc3lzdGVtX2luZGV4X3RpbWUrMHg5
Zi8weGMwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPyB1cGRhdGVfcHJvY2Vzc190aW1l
cysweDc1LzB4YzANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/IHRpY2tfbm9oel9oYW5k
bGVyKzB4ZGMvMHgxNDANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/IF9fcGZ4X3RpY2tf
bm9oel9oYW5kbGVyKzB4MTAvMHgxMA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gID8gX19o
cnRpbWVyX3J1bl9xdWV1ZXMrMHgxMGUvMHgyOTANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRd
ICA/IGNsb2NrZXZlbnRzX3Byb2dyYW1fZXZlbnQrMHhhZS8weDEzMA0KW01vbiBBcHIgMjkgMTQ6
MTc6NTcgMjAyNF0gID8gaHJ0aW1lcl9pbnRlcnJ1cHQrMHgxMDgvMHgyNDANCltNb24gQXByIDI5
IDE0OjE3OjU3IDIwMjRdICA/IGhhbmRsZV9lZGdlX2lycSsweGRlLzB4MjQwDQpbTW9uIEFwciAy
OSAxNDoxNzo1NyAyMDI0XSAgPyBfX3N5c3ZlY19hcGljX3RpbWVyX2ludGVycnVwdCsweDVhLzB4
MTUwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPyBzeXN2ZWNfYXBpY190aW1lcl9pbnRl
cnJ1cHQrMHg3Zi8weDkwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPC9JUlE+DQpbTW9u
IEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPFRBU0s+DQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0
XSAgPyBhc21fc3lzdmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzB4MWYvMHgzMA0KW01vbiBBcHIg
MjkgMTQ6MTc6NTcgMjAyNF0gID8gYXRoMTFrX2hhbF9zcm5nX2RzdF9wZWVrKzB4MTgvMHgzMCBb
YXRoMTFrXQ0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gIGF0aDExa19kcF9yeF9wcm9jZXNz
X21vbl9zdGF0dXMrMHhjNDUvMHgxMTkwIFthdGgxMWtdDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAy
MDI0XSAgPyBpZHJfYWxsb2NfdTMyKzB4OTcvMHhkMA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAy
NF0gIGF0aDExa19kcF9yeF9wcm9jZXNzX21vbl9yaW5ncysweDMyYS8weDU1MCBbYXRoMTFrXQ0K
W01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gIGF0aDExa19kcF9zZXJ2aWNlX3NybmcrMHgyODkv
MHg1YTAgW2F0aDExa10NCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICBhdGgxMWtfcGNpY19l
eHRfZ3JwX25hcGlfcG9sbCsweDMwLzB4ZDAgW2F0aDExa10NCltNb24gQXByIDI5IDE0OjE3OjU3
IDIwMjRdICBfX25hcGlfcG9sbCsweDMwLzB4MWYwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0
XSAgbmV0X3J4X2FjdGlvbisweDE5OC8weDMyMA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0g
IF9fZG9fc29mdGlycSsweGRkLzB4MzE5DQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPyBf
X3BmeF9zbXBib290X3RocmVhZF9mbisweDEwLzB4MTANCltNb24gQXByIDI5IDE0OjE3OjU3IDIw
MjRdICBydW5fa3NvZnRpcnFkKzB4MzEvMHg1MA0KW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0g
IHNtcGJvb3RfdGhyZWFkX2ZuKzB4ZTMvMHgxZTANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRd
ICBrdGhyZWFkKzB4ZjUvMHgxMzANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/IF9fcGZ4
X2t0aHJlYWQrMHgxMC8weDEwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgcmV0X2Zyb21f
Zm9yaysweDNkLzB4NjANCltNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/IF9fcGZ4X2t0aHJl
YWQrMHgxMC8weDEwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgcmV0X2Zyb21fZm9ya19h
c20rMHgxYS8weDMwDQpbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPC9UQVNLPg0KDQpBbnkg
aWRlYXM/DQoNCkJSIEZyYW5rDQoNCg0KDQoNClZvcnN0YW5kOiBEaXJrIFdpbGhlbG0gKFYpLCBX
dWxmIEphbm5zZW4NCkF1ZnNpY2h0c3JhdDogUm9uIFNjaGVlcGVycyAoVikNCkhhbmRlbHNyZWdp
c3RlcjogSFJCIFNhYXJicsO8Y2tlbiBOci4gMTMyMDENClVzdC5JRCBOci46IERFIDE1MzgwNzYy
Nw0K

