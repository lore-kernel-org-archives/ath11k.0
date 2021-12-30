Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C0CC433F5
	for <ath11k@archiver.kernel.org>; Thu, 30 Dec 2021 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmYRh5dDn8PU6zlbCwnMX1qCKna/5GvE4mUjZBOab+4=; b=1K2heqrCRS5qeD
	HcWCKbJgV+6o30KyUWQ5TxF2qAaFUIdfSwdbtVdViCQYSL8dDySsX/dkP3ozTwGUJZE6IX+OdnDu1
	l+WYk30bO9BiGKUdSh6eQcIJW5MkU/VXjhsw45GOG1X6srQ49cC70rjnsEaUlS1tvOVgCdI6oacuL
	4p3HXqQeSSLu2Nt6PYNk6O1SL7jZLi5PIhyiXaruqbC6JQ2+gXNt1fk/McCYGHIX/OyOYQvs1jxOW
	wLl/MGdmvU4hrBIIoH5Kgl1ChHbFteD9IvjIBsTxQt4nDscZDVvgdDVUmaX7+7+wXJoIKFC4Y1KP7
	9htIjvVOZ9V2JWZi/CdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2kav-003Z4m-9z; Thu, 30 Dec 2021 01:51:05 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2kas-003Z4F-Bw
 for ath11k@lists.infradead.org; Thu, 30 Dec 2021 01:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640829062; x=1641433862;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QStE0xmwVBUpXjWKAnT3uIwhag41h9fpJ0Bbml7F6lg=;
 b=zHhaFyuJH2Z6nfzGwGs7v6IR644KdxbwGaikzfsykXaOzN07fGTVnZFW
 QauVVM2hh2eSBpSu23sM1zMbaxrOPTh3U27OjqzkWRIIrc4qjALHKOnKJ
 I/X2VBjLJeRNbjhfMnMnS7h8lUfl3QDgq4yxZpwRvzaW5NKi0ii0H0TXb U=;
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 01:51:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJycWBn/70Q0EWNOFUMyEaDP4RS7DYKVVZW2cE0jhTrxpWHxAD/ukl/qf44NexOLbI0FEfZJd/lrvWXX/pATE/y0eP4zQ6eSih2X8Mnb2V7GCiIUtM4u21ALGG0S41a2e6vbN6Dmv5h6eX9LUMNvsrqP9StxlWPEnHHMZxj0r51tJi3Vt+0pgphvqcdmtUri47W8DXPk0MrSveqZtTbOtuqJOykhAvyq4kyCUCsjs0tu6w7MUK/QTsGwsaoG5zDxtTkdV9HFCWLAN7+Cn8TqNjIHkRh5XZFxrc8SGErFbKkwWbaW7eaStCkIv05uVpLwJhhYphPsZgjBVtugB0oFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QStE0xmwVBUpXjWKAnT3uIwhag41h9fpJ0Bbml7F6lg=;
 b=a88d9Tkk8CWFWWS8HB1bzQQhrTrrB4r/y7C83gYImyNm44eOBir1+GFCJM4Oxd4nHOgnvPxik16NET5o8tSq67Q3AIaJAz+PKBWGVtm1RPD7COVYrErBBjfh+GqgFK0fORPUMxc3fD2a3PN9YZuge/XFlNj8oezuMxBiVBkfbNkOnAUl6EzEBYjpNbpD/R/O+ubdprW9qlWZ186T/uLBuaaKT0OZirWpdwzKpyphDfydEzZ4D/HFKEzICfAlbQiU+B2ZuEteRhq9eXqQ+MYZr9shOkOOnxjPv40lxwTlqyGClHtuTKNwJhQDjPp3er8ZfjsOgF5RU/x9AlFrnaZdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from CH0PR02MB8212.namprd02.prod.outlook.com (2603:10b6:610:eb::20)
 by CH2PR02MB6072.namprd02.prod.outlook.com (2603:10b6:610:4::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 30 Dec
 2021 01:50:57 +0000
Received: from CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::65f2:d1bc:e5bb:e6c6]) by CH0PR02MB8212.namprd02.prod.outlook.com
 ([fe80::65f2:d1bc:e5bb:e6c6%5]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 01:50:57 +0000
From: "Karthikeyan Periyasamy (QUIC)" <quic_periyasa@quicinc.com>
To: "nbd@nbd.name" <nbd@nbd.name>, "Karthikeyan Periyasamy (QUIC)"
 <quic_periyasa@quicinc.com>, "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH] ath11k: Add peer rhash table support
Thread-Topic: [PATCH] ath11k: Add peer rhash table support
Thread-Index: AQHX99cG3FHx9zGRrEmBbJZZi+JR/6w/xuUAgAqFsBA=
Date: Thu, 30 Dec 2021 01:50:56 +0000
Message-ID: <CH0PR02MB821230DF90D7F0AE5F4A3556F6459@CH0PR02MB8212.namprd02.prod.outlook.com>
References: <1640248077-14075-1-git-send-email-quic_periyasa@quicinc.com>
 <89da4b36-e814-9238-71a6-044af49e8de8@nbd.name>
In-Reply-To: <89da4b36-e814-9238-71a6-044af49e8de8@nbd.name>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 530b5f6f-5d29-40b5-492a-08d9cb36d297
x-ms-traffictypediagnostic: CH2PR02MB6072:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CH2PR02MB60725DC5BE65507261A4B00D8A459@CH2PR02MB6072.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WS9lQViFT6hoIRM/PmPoYUDJzpIHa3cZSCUP49fWgvUqk/Kc6fSZpT/wMFb0syTcPjGMxMW+kNlGqeGfissspGu1mn9L7ejFJ6nvu0TaROZxZftqARsVxijClDdkvv/mubty/udHwFdJ1BgtR7zUSKS1sFVsohgcX380mVQbgl4aR8dheY7AWVkEbLNB7S9prsimrRCqWefU91TbX8HS8vN3e0zIzuORPHiUo34SMcIrPMww3R4gSAZMqfm6hcbBs3r7/+NB8X/CJlBOEpAvREhVavlMa8mSuRMcvaI9Dym2lsTDi1J0faVNRQOH/H1bct/o0ndjN6+B6z421UWOfr3JFVdYh1ZUAhEOeJEqqyKsMLQ8kaqx03dRvJzUNzixrbm3pA2QNJfdplRlPHY3ZYMuXt5XE5Tw77xt/R0qFt7PWGk7zssuIFrDTjXsgNQUJ7+9FjKJZcxjh5z0kcpx/K/tpPSPZ0vQ7Pg8JaeToe6gr9T3o5aB5OgTN4w2cXlSdpxP2NpjdjLq5pm14d38FziEVttAPIuxD2Bx5LjFKFf/2lQ6iHCERO7lfSWVFcOuFG2OvymNs7g96cdkQItVYw5zej9J3yBTemQo7Z8wP3c7VdVeMPI36JAfvfXBFsNnEC1FkZpdz+z6MK3LmHhHubc2a7YC76tbcjrFApBXZP3E12nv3vcOHyGPctd9OUcxy/6CA/sWff9dTuk9/DCPFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB8212.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(6506007)(53546011)(66946007)(110136005)(38070700005)(122000001)(8676002)(71200400001)(5660300002)(316002)(38100700002)(4001150100001)(2906002)(7696005)(64756008)(55016003)(66476007)(76116006)(83380400001)(508600001)(9686003)(86362001)(4326008)(52536014)(33656002)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlhiK2t4N3FkdHFvalQ5K2RkSHU5R0xoQ3Zsa3FLYWZBNnhqYU44a1NQU1pS?=
 =?utf-8?B?cDkrSGpFbjVNaHpoalZwTkYweXNNZFoyYnA3cVBIUldYM09zck1oeE5TMm1y?=
 =?utf-8?B?UWdsNmVPWHZYZHJpZEhuVjZVZENLaGY0NHg3MjhqaGRNcXZmY2M3bG9rcHE2?=
 =?utf-8?B?V1EyMllMMUJyZ0FIRVhZN3FLQmc0VFlYY1ExWSswYngwWGMza295azJ2cXpp?=
 =?utf-8?B?UkNzWDNpWDZHZnc3dG4zUFNkSjFsbk5pdGtWanJmTUFvbGFMa2xrK01uVlRJ?=
 =?utf-8?B?dmp2cXhuTG5DbitKMEpBZEllNWlaSXA3VGRsSlRFQ0tGZ0VDczc0OHFpSk5h?=
 =?utf-8?B?clJjcnFOUlRaTlduWGtWWkdRMWN4NFRpQURBRTZaTmFYZkcwNHNRbWpDbFNN?=
 =?utf-8?B?TlNDRm1zeDlFbzZQeGkyMFoxdkxMRzRUV3Nyc1dpQkoveUhZcTdjWExNMXAr?=
 =?utf-8?B?TzB6dHE4V3dGczJjT1BLdXdpT2hTTjB5QTRpc0h4QmpPMXFRa2VOZVl3dkds?=
 =?utf-8?B?dVNNaEhvR3c5YVBqT001ZnpJTHNqOXRJT1FyZnVxbVZEeGFUSFNKQ05XaVN3?=
 =?utf-8?B?VjZra0w0MEdHUjRZd2RPdnNCSU9nSytGTGZ3QW5sZWg3aVpxL1dzWWtvdWcr?=
 =?utf-8?B?RmFwOW1OSk44aVNFRHluM056cC9hNHd4c0lPZElYUzFGaUpYNE1kdklmUWY4?=
 =?utf-8?B?M1phUU1oMzhiUVJFWHh1MTQ0WlpVSUwvbStIRFJoV2UyQ0Z5VnpkbXBIaHZv?=
 =?utf-8?B?dG42ZzE0WUNwMnI2WGIyZlp1MElia0lmR2V3OThHZTZrelZKb0RLakpIdGJ1?=
 =?utf-8?B?TEk2eDBXYWZ6MXR0aVJMNWwxMjNtOGNiUXZ4SDRMK0JtR1VFQ21ncTRBRkVB?=
 =?utf-8?B?N3VuRTd6Um0vOURVRDZFKzNDOFVmUTRIV3o3UWh4NGsvY3VyTkRKNXVONi9o?=
 =?utf-8?B?a1U0enpMQXltRkRnUEhEZHlJUXJzdEFaeUxpUXRGcTBGRXZLZjVLTWMvY3hh?=
 =?utf-8?B?M3QrWG1wQzNnRDZOVjJlMnM2dVNmSElwTDIrMGFnM29kRnhFeDhsU3M4Rldk?=
 =?utf-8?B?SmQxUEh5SFNyaHhXWHZBNm5PRGlxRmsrMjdGWWw3V0VvM1JwczdQcVJ5SWVL?=
 =?utf-8?B?VUo5eWJibFRlUlFIaDcrUldRVm43b2d3a3dzSCtTa2J6Ym9jY0hqbUZ3bFRa?=
 =?utf-8?B?ZnU4OHI3UjMxTzk1ZFhUcUZGckFMS3hsVFlmZlRwR2xmc2xLV2J2TmZqaFhn?=
 =?utf-8?B?dHk5YTRaK1lQMjdKc0h1WGZ2cnJFWUNaeVlTZFloUVA4a2pSU1ZlK201SDY4?=
 =?utf-8?B?RUFCaU1adW1sbGI4MWtoZHY4aHlNNTlqQndTWXBnUlJuV3I5aGxtWk9NcS83?=
 =?utf-8?B?ZUY0TTUyS09yTEhVYVZSaVNrVFJaRVVXSU96VjdDVCtiOVpRZndIRlJrcld4?=
 =?utf-8?B?VHRSNklUNE9nZDU0dEVsSHVZWDZkUEp6MklVcy81UXBCcEdacXNUWWpxYWFE?=
 =?utf-8?B?K0VVbU1JMmJzMTNndUNycXIzcXhnUllZM1Q4UFE3L2tEZmhlaG5DYVRmZURU?=
 =?utf-8?B?K3VibW9XS3RDR0oxci9NRENzTUwwelkvZFhqSkdQY2lnUHRtcVJlY241ekEx?=
 =?utf-8?B?Z3Bad09OR1dYLzA3c3RZVHJTU2lOdnB0ZDJvdnJWeVhDSWt1V0JZemM5Vk51?=
 =?utf-8?B?QjBHeEpzOHBjSjBiN2Vua0lUOThNdlNKV2ZQdGliYmRpNkhoakpQSnZkZXpE?=
 =?utf-8?B?azdGemZJUFhPeTdDMjFQdHRYcmF0Z0Jta3FkblAyUUo1bnQwa2MrRDlmVmxX?=
 =?utf-8?B?QUlCemNXLzFoa2J1Nm9RN2N2RWJyTE4xVEU3d016R29tNm0vTHU4UGozVmtz?=
 =?utf-8?B?dXlxandmRkdGdU1sTzg3bnlmcDU5bVdFcUFMbGpOcCsvUEtlLzFBczI4Sisv?=
 =?utf-8?B?bDhBWWtOSWNCRVBwNmw0Z1FlQjZMYzEwdTJ1UUhSK0tUSXVKamZ4SExHSDFF?=
 =?utf-8?B?d1A5R1NPUUlUWEhydVVsejZGaG0renF4R3ZTM3hFUmdnVkMrcXdReWNnV2RU?=
 =?utf-8?B?cjdORHllVDJON3R1dXF1ZUtzRVVCQjJZQWhyTWpaY29oWGl1a3Nqbm0yNUZr?=
 =?utf-8?B?OHpPY01DZytQVC9ZV1JzcE4vSVNJeW43eGl1ZXlrWmd0T0JYOWFGQ2ZGVGxo?=
 =?utf-8?B?dnkxSWNRYUVERERLWGp4RkN4ZWJlcSt3OWVzUXQ4MEMxd2dVVXo1WkNYMGxU?=
 =?utf-8?B?QVM2SEVPMXhpVWZpREY1dDNPTGh1Zm1SMy9jSXhMdmducFZ2dENJNmV0dXAr?=
 =?utf-8?B?c24zc2NKNVB3YitJbTI0alZyQmdYS3JBMm9VVG04NnhhMEU3UUtJQT09?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8212.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530b5f6f-5d29-40b5-492a-08d9cb36d297
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2021 01:50:57.0189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pP5KS4Lk4z6vfUUrJjQTmDNmGpZit1P21hiQyOczVXswqpymw/y3bGch5A2mKKwDIuUIysijkB3cuA3BxHsVVHh/zgzYzKFhIuTpiXaLxFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_175102_516952_D3AD3E5E 
X-CRM114-Status: GOOD (  16.24  )
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
> From: Felix Fietkau <nbd@nbd.name>
> Sent: Thursday, December 23, 2021 2:29 PM
> To: Karthikeyan Periyasamy (QUIC) <quic_periyasa@quicinc.com>;
> ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Subject: Re: [PATCH] ath11k: Add peer rhash table support
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary
> of any links or attachments, and do not enable macros.
> 
> On 2021-12-23 09:27, Karthikeyan Periyasamy wrote:
> > When more clients (128) are connected, the UL data traffic KPI
> > measurement is low compared to single client. This issue is due to
> > more CPU cycles spent on the peer lookup operation with more clients.
> > So reduce the peer lookup operation by modifying the linear based
> > lookup operation into the rhash based lookup operation. This improve
> > the peak throughput measurement. Since this is a software algorithm
> > change, it is applicable for all the platforms.
> >
> > TCP UL 128 Clients test case Observation (64bit system):
> > Previous: ~550 Mbps
> > Now   : ~860 Mbps
> >
> > Tested-on: QCN9074 hw1.0 PCI
> > WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> >
> > Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Why does ath11k keep a separate peer list instead of just using the sta
> entry? That seems ugly and inefficient...

Atheros driver keep the peer list to track the peer entries that firmware is aware of peer_id across the SOC not per radio.
STA entry is per radio/hw not per SOC. It can't fulfill the requirement to map the SOC level peer_id to the peer list. Also firmware
map the AST index / peer id to the peer entries. So driver keeps the peer list, which help to drive the firmware. 
In this patch, we efficiently reduce the peer lookup operation.

Thanks,
Karthikeyan P
-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
