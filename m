Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83DBE7E62E
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rT4oubY9GVCkDT2Q9SDfK9VmEQZDH1ozT2bIF+5o4Hc=; b=zqp792eplQe2ux
	QP4vw+HudzMHLtgM0+EKfQbvoPzTSd0C3Or1HcE6h94/rul0pWZBkhmxIAG9tligeAIaJM8Yxudj+
	y2cYk+ogEnECvMyRrAr/YW3f6a9fOzt/ObwuIU6FEaHmjOKvCsNWc9yj8fGMBjqau5JxXyCIGoGBd
	v8p0vQtwStoD1NfU3/I03duXVYyIgFvGmYojS9InHhe4uTXCLVdFOfFICfPG5laKzpUPqQ72JuKbc
	3Rbl5aDFcssdBfV4qOSKlpGFtzuchrthBDdmzNfXzHJQYBKbB/rGBnlxPtedYc10iZ3yeoxmmBOmb
	hm9wBa3QyEmnNjRh7Vrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7aP-00GP0N-0w;
	Tue, 26 Sep 2023 12:54:45 +0000
Received: from mail-be0deu01on2060b.outbound.protection.outlook.com ([2a01:111:f400:7e23::60b] helo=DEU01-BE0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql7aL-00GOyU-1t
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 12:54:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izHN766g+EZbWJwWj7odX6pYAQlhuPSDLb9cBIQMsICuEhpTFSs+/oc3nxOHERozNsQ/78xU+0ZlvR5Ma6gBm3dt3qzv22BLwh+JuvzoBpYMw62I8bZyt1CT+/M6RJwc+b1Zxr9/kmk4zxyPyVikE3qiwlL3BcHxgE0RRznRC40vkwj5IIHWFVJyotF/qOcRPQpiIGD7PEMy9511urPAdC+hVmCm5891TN22UUIINckPKdeSNWJti/c7BtHZMlCO+ZStZuM3Yj9XEjmhcf60XziIPPRjQHSk41olHU0Q/DocPpepi43T8jkKng7Rx5cvBhnXIL/KWEBnqVF8ypYEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SslTm9R0+fHGOnXeQvk36RVuN6dEWqnw8TjU99vEWyQ=;
 b=mMPUwRcnRupu+rl4pCaSh7+4xQe6twfgi5FQUuLOaF4SxuazH5Td2bbR4jnROIoW/RyRky4E/I1ogt4PKDzESQVh3TsETVMgm+/UIP5WAyN3t7ebD4+dUiQSV+FeinQI26sOk6NA5keNZ40kLOYVNAocewME0OB8sezJT8in/RePeBt6AgveWL6vSooDJtg+Zqfw7zMmBeiCujIaFlce5cnjUcFqaLvACv7cCwzton7RvblWjVVyPSpSgbkzGlOutIFQRGyOlcepzHa25rpHfEWqKMfCOvU8gEHEXdrbQ4gCDRa/0zUIBzKah3/RUbsi6vZuYkCGv/9mlGcNQaC/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghmt.de; dmarc=pass action=none header.from=ghmt.de; dkim=pass
 header.d=ghmt.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghmt.onmicrosoft.com;
 s=selector1-ghmt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SslTm9R0+fHGOnXeQvk36RVuN6dEWqnw8TjU99vEWyQ=;
 b=pEuSQ8i1+7H3E9cSanRUf0ibsdPpzQh9OvIC5Pep6k/9lTWxsZCvbEY9emcR99e/sjnmWQfKmsUTRx3GwmzHLSGMd/16BdwORsQKRFNIDBAcMH0yRr1840UtQFfnQPHVmsTFEdbbaI+GYEacQnOAJxCkL2KzUvUgWdESojVeYembhMTgWczuPV8XM2F4ZUGgqO5hbaoqV5URI9xKCw21BwbakrUWK70JRmwbNWeuMzmfOM0aQH3NjYJkm2VwBK1Vq1OPYF8df87NRYQWaMlpuVRi5DPzZPMoNMK5i4gE7UjLE3b23Ybti+56NcEmX0LO1hjji5y18AVVLtfi98s2Ag==
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:2::16) by
 FRYP281MB2256.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:43::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Tue, 26 Sep 2023 12:54:32 +0000
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::a310:8b24:af98:dcd2]) by FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::a310:8b24:af98:dcd2%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 12:54:32 +0000
From: "Lindner, Frank" <Frank.Lindner@ghmt.de>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
Subject: AW: QCN9074 monitor mode crash
Thread-Topic: QCN9074 monitor mode crash
Thread-Index: AdnwcPluMUTAXNJIQGiwjPSPbngqLAAAXhaAAAF75SA=
Date: Tue, 26 Sep 2023 12:54:32 +0000
Message-ID: <FRYP281MB0160A49B9AE3A983EA967984EBC3A@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
References: <FRYP281MB01607D994228CF144904CDEDEBC3A@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <9e2f39c5-4a58-4be8-a320-da1432287086@quicinc.com>
In-Reply-To: <9e2f39c5-4a58-4be8-a320-da1432287086@quicinc.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ghmt.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB0160:EE_|FRYP281MB2256:EE_
x-ms-office365-filtering-correlation-id: 6329f50b-1e97-4514-8559-08dbbe8fbaa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 43TMhq6dCqqe5cBwQLmt1SeKlonbTFl8nyfLd5y2BqoSH0DmJpS+J+PtNVyR3vOOkI/iYj1duLutKcf7TtVwCtyDzz9mrcg/MdSAjXdw8cDxiqG8dF/bhxrmIO1knZdenmKvjRqd41yveJSlhe3DPZHhy672yJe8AvZN9VIcpCRwsYxDtMV/IyBkXqhAR3RnvY5qZW3BZYd40ZZaHZwWrxQUD3MR2MinbU+9pWNdLf/lml3Bp1gJAFtGpXEx/IHZ4888by6LeMyd2351y8PyrQfz/zHdSPCWudRxsNabVtBUR59qQOFZ/GimR//HBnFqyKDvHp+znYWn+BXwt5ygOri/Wj4fJmykyuuXVghLnbLh7BNXGziqje8OzBCmRp9kUmMYtsOWw8VM/jzOCKcsi53vsDGoQSK5zCuXcOHWyeldpF+glSH3Vpqstu/ZKMPCo4lRA+qvHzwz9Bjz8me3HB3NgpBJ6gD2p17opdXXhkCxesQ3N51UBtSNi/l9+5LhPp4vKirCMK58RGmpD6OtCYRbRVtCup5A0mrrbqYrY0ERr7kR9T0VhbKiUo7QieIuiqQB6rbTDqi82mA6CI9X5bHC3Pi81i61E/KizBMtBt7pyOsX7AjsjSWPyYO1C9CdBgArcR4iU4K+kiLpWGM/eQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39840400004)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(478600001)(8676002)(8936002)(55016003)(26005)(110136005)(2906002)(52536014)(966005)(66476007)(316002)(41300700001)(76116006)(64756008)(66556008)(66446008)(66946007)(5660300002)(6506007)(7696005)(71200400001)(53546011)(9686003)(83380400001)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnFYTXV2VXVhdFZBN3NpOElXZ1VrQ09pcFpyU0hOQTN1WEVPYVBKMHg5eVY1?=
 =?utf-8?B?b0hPSTRINThFNElMVlRzdUtQcGxUSGxKMXFXZDdYWGtBN0E0SGl1MmlhVHFE?=
 =?utf-8?B?MUtSTWtIZDdKUVpjamh0YTRrSlllWU9nVWhGeGdjTWZqTTBjaFpWckNLbzdu?=
 =?utf-8?B?T09pOEdwMEFuVXMvUDdjc0tVNllrOXhyMWRvbVpVOXRoWUNvTk03Y2tWWXB1?=
 =?utf-8?B?QTdHMlNHdVZsOFcvNytDMCsrTDhtU0RsUngwdzB0ZkFkb3hvamZoQk9PNzdi?=
 =?utf-8?B?TWJnRjNNdVhhMDkvK1Q3YTFiRVNUVC9wVlZBMnJOT2xKd3JEdUliYXhaNnhR?=
 =?utf-8?B?L2xpcUlra0g4aE0wWkZUVUZWYkRTanB5Z0VGUit1a3BDZWxBR0xrZ1dQUktZ?=
 =?utf-8?B?T1loeVZQR05aT1VId04xVEtqRVE1YkJqaUErQlFZVmtVUWZxYlp2ZEZUTDVQ?=
 =?utf-8?B?OFJkRmUxN25DWnJtRWZBNTJCMk5VQUo3Z0VQUTRmb3dMNEhKNmJoTkJFcHJ3?=
 =?utf-8?B?Ky82WXV6VXgwU1hSNzFYR1ZQMStDZUUyT2RacGhkNEVSQXpicDhweGl3UFNB?=
 =?utf-8?B?TWlUWkRyWjNyeVcrTXFCWXUzVmV4MGNTK1E2cGRmdUcxM2pyTGc4QURqTXAy?=
 =?utf-8?B?ZDREYXBjc291ZXowRUlNSnFXTkRXOTZuMEJYazhjd2JHa0NmNnhRU0hBUkxN?=
 =?utf-8?B?a3RpeGFGdlUxdDJOTU53eXUxMXNXQlNUTTZRSklncjFkRmxRQ2hXdUg0T0hn?=
 =?utf-8?B?OHN4RUlKQzdtQ2dOOUJoS3Z0UEozbm5ZSHpMWmhJZWZUNHNBc1BOa25ZbVJV?=
 =?utf-8?B?OVc0UGZoek0yVDhrTy8vTzBtRnhpVnVNeVovUDBpK2lyMGI5RkRRemZkcmNa?=
 =?utf-8?B?SCs3YlcxckJvM1BJRCtjYjJiUDQrNndtbWw4NzJJb0ptdWNhV3gwMGxPeGFB?=
 =?utf-8?B?M3NFOEVSUlB0WTN4aitLWmlXcE1YcXN5cWpsZlUvaHlzM1dNSjdLNlV5OXEr?=
 =?utf-8?B?R0NQSFg1bmoxdEtMOVlqWVpIb1ZqVW4wMkFYMlNZUzc4bUFHOWRSajhaTWsr?=
 =?utf-8?B?dUx4ekFyMGg0TVgrZWhFby9TV2YyRGxCV2dDNndpSzdxTWNLclQ5YmJrMEJQ?=
 =?utf-8?B?d2dOYytuWmxOOXpRL1FoWmRwczg4RFRBSStBZkY0M3hadTJCWVh2dDY4QmF2?=
 =?utf-8?B?MEswMkZBaGNKSHhHb2FvTXdRbEdWaUd5S2VqNDUrOG41TC9qZnFQRTE3dmdG?=
 =?utf-8?B?c2tVTGc2Nzd6ekJhemR2dFBHc0ZCdkcwKythWUJZR21CZDlCMFFYLzRJcWVu?=
 =?utf-8?B?cUZEbDZsVnJGODZkRkZnQXdZSUJBTm5TYnVtYUR2RisrTlI0c1hCcjQ3bUlS?=
 =?utf-8?B?UzRqMjE3SkpoVC92cXpHN3I5MkdHaENzcEpoSVlCaGdxOFl3SFpmMG5VcU5D?=
 =?utf-8?B?c29CNWJDWk5UQndHekVsMW9DS0VkNUdFOXVUUHRjSE9XcXg5dzFvVFd4RStV?=
 =?utf-8?B?cXluenFadnFrRmwxUGVJVGZVYXh3dzJaemhWY2NvNjJKVFVFVi9lblhIcG95?=
 =?utf-8?B?RGNITFlwSlk5c2pyZmNabzZCU2dHSS8zVEtrbDJlOW4vT3VreU9SZWZhRGFy?=
 =?utf-8?B?cnVHb3BJTThMSUFQWGlWRzlNd0NDSkVHdUVtNXNZVlpOWDJUdUF1Z1RLa1Fu?=
 =?utf-8?B?djhJU3NvaVdqWTFPVUlPcGRQZGhqaXZqekFnbll4aVpScTVWWXdnUkcxMXlQ?=
 =?utf-8?B?b0JSUHYxOXMyQU1OVUhwRVcrUVh3cFFhU2J1NGkybmpxNUVPZHJKakZUb3lW?=
 =?utf-8?B?dVFsVjQxQ0FBZXVpRksxVDgwakZLZFlWUkw5VXNWeEQ4V05KTnkwbFIrZHJi?=
 =?utf-8?B?aDVGQzV6RXloTFpUZTdnNllwNEFPTmMrY1NicmJOWGhDVUlyOFR4dFNTMTh4?=
 =?utf-8?B?b25pQ3BYd3llMGhTa0tGSUlza2NrRVVkYnh4RkpRRWNta3c0UHFpcUZHNEpD?=
 =?utf-8?B?ZFBJSWtBcmFEQkZkNmZPSGxXV3JDaGRDTjJYZEVKdldQMzhMTTI5bXhySU5L?=
 =?utf-8?B?b2J1aHppS2xlMVEreHp1YVM3bzFZeXJqcVNabGJXYUlNMStqYktpeHZLNWxt?=
 =?utf-8?Q?c3463iM2MTjKuSQ5FSC6m3rXM?=
MIME-Version: 1.0
X-OriginatorOrg: ghmt.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6329f50b-1e97-4514-8559-08dbbe8fbaa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 12:54:32.3378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9223b922-6d43-40bb-85e5-a10749de3853
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXquEhrWyLf9GF6LULxUFCXvpFHsuzWmly0+LFnPXaVmwYU0Gl+TjsV4SKRD8+bPWpP2QiDb7Jz25FuqfTGDFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB2256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_055441_623943_7FA57BF5 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SGksDQpzZWFtcywgdGhhdCB0aGlzIHBhdGNoIGlzIGFscmVhZHkgaW4gbXkgc291cmNlLiBJIGRp
ZCBhIGJ1aWxkIG91dCBvZiBhdGgtbmV4dCBicmFuY2gsIHdoaWNoIGluY2x1ZGVzIHRoaXMuIFN0
aWxsIGNyYXNoaW5nLg0KDQpCUg0KRnJhbmsNCg0KLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmlj
aHQtLS0tLQ0KVm9uOiBBZGl0eWEgS3VtYXIgU2luZ2ggPHF1aWNfYWRpc2lAcXVpY2luYy5jb20+
DQpHZXNlbmRldDogRGllbnN0YWcsIDI2LiBTZXB0ZW1iZXIgMjAyMyAxNDoxMQ0KQW46IExpbmRu
ZXIsIEZyYW5rIDxGcmFuay5MaW5kbmVyQGdobXQuZGU+OyBhdGgxMWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KQmV0cmVmZjogUmU6IFFDTjkwNzQgbW9uaXRvciBtb2RlIGNyYXNoDQoNCk9uIDkvMjYv
MjMgMTc6MzAsIExpbmRuZXIsIEZyYW5rIHdyb3RlOg0KPiBIaSwNCj4NCj4gSeKAmW0gZmFjaW5n
IGlzc3VlcyB3aXRoIFFDTjkwNzQgaW4gbW9uaXRvci1tb2RlLg0KPiBBcyBzb29uIGFzIEkgc3dp
dGNoIHRvIG1vbi1tb2RlIGFuZCB0aGUgZmlyc3QgcGFja2V0IGlzIHJlY2VpdmVkLCB0aGUgbW9k
dWxlL2tlcm5lbCBjcmFzaGVzLiBJdCBpcyBpbmRlcGVuZGVudCBvZiBrZXJuZWwtdmVyc2lvbiwg
SSd2ZSB0ZXN0ZWQgZnJvbSA1LnggdXAgbGF0ZXN0ICgxIG1vbnRoIGFnbykgNi4yLg0KPg0KPiBB
bnkgaGludCB3aGVyZSB0byBsb29rIGZ1cnRoZXI/DQo+DQo+IEJSDQo+IEZyYW5rDQo+DQo+DQo+
IFZvcnN0YW5kc3ZvcnNpdHplbmRlcjogRGlwbC4tSW5nLiBEaXJrIFdpbGhlbG0NCj4gQXVmc2lj
aHRzcmF0c3ZvcnNpdHplbmRlcjogRHIuLUluZy4gUGV0ZXIgSGFzc2UNCj4gSGFuZGVsc3JlZ2lz
dGVyOiBIUkIgU2FhcmJyw7xja2VuIE5yLiAxMzIwMSBVc3QuSUQgTnIuOiBERSAxNTM4MDc2MjcN
Cg0KSXMgeW91ciBpc3N1ZSBzaW1pbGFyIHRvIHRoaXMgb25lIC0NCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIyMTEyOTE0MjUzMi4y
MzQyMS0xLXF1aWNfbm1hcmFuQHF1aWNpbmMuY29tLw0KPw0KDQoNCg0KDQpWb3JzdGFuZHN2b3Jz
aXR6ZW5kZXI6IERpcGwuLUluZy4gRGlyayBXaWxoZWxtDQpBdWZzaWNodHNyYXRzdm9yc2l0emVu
ZGVyOiBEci4tSW5nLiBQZXRlciBIYXNzZQ0KSGFuZGVsc3JlZ2lzdGVyOiBIUkIgU2FhcmJyw7xj
a2VuIE5yLiAxMzIwMQ0KVXN0LklEIE5yLjogREUgMTUzODA3NjI3DQotLSAKYXRoMTFrIG1haWxp
bmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
