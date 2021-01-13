Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FE2C433DB
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 18:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34ECF233EA
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 18:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34ECF233EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ciena.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vp/1g3lrYTgkIbR52AefV8YxBRU0G36vhsOtYg0dn9c=; b=o/aGcR2+PXEVLuSItq6HYjxsI
	qdI+A7EHpg5+f8f0RW3/V7vNFJe1tLPRxqu1c7rrb4M7Lftk7IJfRzCHslKWbCJOhN+VrMW76OkuU
	7s28ZUGhOrHJ7cqpn/u6UwLgHmNPFMhdK3weGSVnCBL+JH2iUzvxmO+EaOrszZBl/TZGYKJZvai0N
	LUHPY2BhnnSu/O9ZX9Cn8btraAaT8MHVSuKz+BmBZjci7RIDdXUVol91SH70c3V4Ov5p+SYgdONiK
	e585B/PJ0GmdbWGKDBNsoojlVYrXQJ5i/HgssdXcsH8z0e6ewh43pLc689Z1J1TIQYMPKaYlEKM1g
	WioxePVmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzktT-0001Jf-4A; Wed, 13 Jan 2021 18:29:19 +0000
Received: from mx0b-00103a01.pphosted.com ([67.231.152.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzktP-0001Ip-9q
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 18:29:17 +0000
Received: from pps.filterd (m0222748.ppops.net [127.0.0.1])
 by mx0a-00103a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DIRQ9T018479; Wed, 13 Jan 2021 13:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=06252019;
 bh=3127sbEeN0zaTtnQ7fM1waa7XhIAerlfN6RpoS7HlDY=;
 b=PhIN9PBStsMMRaFtCmEF6adUhV63FoKub3Vipg4q7w+3LsvQKos0xJrkc68ZLW5d9hcj
 fxgjsNbcJJIoQJpjunRLOinfaaBosohDOTIJBN7CXA3SIryYZEsIhrRenEVbybEfQAbO
 RvLNeBCF4af5THVRj9axp7E+aK9FnoN8OfBACVR6PtuJzIVJyWur4kw0K61TW9pbPUrc
 HIpsFQxgmIh0I79H4pI9EDd+gSztTrCMHjt0p36zQ4LivXuOLJXOoYzv8MifePG75QCW
 uei5YEa43IhZzNgItKuGwBrWNfbpX5/zS7DhTRrw9yiRHHVaEdRoqzNMTjP+ViDZJt4U bg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0a-00103a01.pphosted.com with ESMTP id 361nbb243n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 13:29:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6VmpwUIENsnsSrTaQ2lrJhfWMbbOamLFHU/35lYJmQ08c4wac99bjzoHxxV9bh/TDcvsU2XLs4PUxXJA6CGJ+bgZzHOJfD+2LKqW6ZvDQuWmHBo9AQd4Q3htPORwGu5PhL4efDfKQ/aQylSsxA7CZvR4vvmV+BO35BNBHnRkTAZaCTlWJCCSHG6EYZQT10njBJIPauV8UIe0UNbTcfnkd0wLR4+fLpz+Q8dOeCw3cwAhM4LbOHooS0h8MI0+7wQn4u858Zse3Tf/1fHlxt0CSpbQLm0IK6jeAl+Nxz4YOMZiKcHu2kEtxtQUkmpircvtIrDNNAFRveK2o5iE06s4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3127sbEeN0zaTtnQ7fM1waa7XhIAerlfN6RpoS7HlDY=;
 b=ZSAK+i5vaSDCydA9tRKbNwpXhewD+tLShcA6lICrdeNP3qoaZv1XGxbKNZzpvEfqZMZ+mS1Iol5M575JdSLSqsDsKdo5258b5D5sY6n2MkTTXSwhFUxBGUA2Uf1zlBri85FC4FIhvhTyLo7GqV7zfNGOOTHEyYfSYT66BazN1g6qY9nqlktTnObgh7sMBGzNjZppdGgsz+WSKydq9963LJDYi5X5u2sMaMcYxLsraRihDIwrFS9+N5BTU0aPdwcU+jFKv7WF7KspUEvXO3srr2L0Uj6Op+NiLSgRK/jtJRm6+2wOzIez9XUUaJ8yUa+Xob6jm3f99GpMhUsvnG3r+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from DM6PR04MB4492.namprd04.prod.outlook.com (2603:10b6:5:29::33) by
 DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Wed, 13 Jan 2021 18:29:11 +0000
Received: from DM6PR04MB4492.namprd04.prod.outlook.com
 ([fe80::8dfe:9ade:ec1:da2e]) by DM6PR04MB4492.namprd04.prod.outlook.com
 ([fe80::8dfe:9ade:ec1:da2e%6]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 18:29:11 +0000
From: "Luo, Sining" <sluo@ciena.com>
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
Thread-Topic: Ordering Dell XPS 13 9310 to test QCA6390
Thread-Index: AQHW6dn8W7uvF5TAcEiuv0ecc8tLSQ==
Date: Wed, 13 Jan 2021 18:29:11 +0000
Message-ID: <97390297b66298e485ac5d477594b7d31d3aa7df.camel@ciena.com>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
 <874kjkix7m.fsf_-_@codeaurora.org>
In-Reply-To: <874kjkix7m.fsf_-_@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=ciena.com;
x-originating-ip: [2607:fea8:e2e4:ef00::106a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bd373ff-0b2a-47e1-bb8a-08d8b7f11f83
x-ms-traffictypediagnostic: DM6PR04MB6575:
x-microsoft-antispam-prvs: <DM6PR04MB6575917D6EF95ADE43CE853AD0A90@DM6PR04MB6575.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sqxmKjkhVIB/pr/yOfg5Q7+MWAIZmoAJnG/Oeo2ZRQPPcTAqUzWnzOQdyZOz48WkIVRTl07g8cux5a5ud+RTJnP6y+FZhGwpl8lI24sDTlIb5QDJW2AAys+qkn3HgtuWt3wOZZXw1RTlEj/8AgfkYsCvxXBNox4t/FgQ1ZM1yNEiHibRmcqwxN8S9i+CbxDndr0u0jNlpEHizCgI/GZ0FVGJ16gWWtaG+pjVLahUEACyz8YsV9I0xsA7oFkHYK6jwX81sh2v5eX23ZqpPtVLtd2bpGFmooOipblvImLk2/ytQBeQV66h3TBft72js7lDsiQcZfr3uel6DXSxtM3XlC/9M+2LYEtrS6y5jeQ5OpL7Bu70sV8pWfo3mVR5Qs0na3SN2/CeeDxFzXdZh7IoZCE0GjfUkBlA9HA1136/EmBuPu/UCg+K+vhOJtZRaBkIyWpudn1D0lfg8IgpOEC9aQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4492.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(6506007)(54906003)(53546011)(6486002)(5660300002)(186003)(966005)(316002)(6512007)(4326008)(83380400001)(76116006)(71200400001)(8936002)(66556008)(2616005)(66946007)(64756008)(8676002)(66446008)(91956017)(66476007)(478600001)(86362001)(6916009)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V2VaL0ZoN1ZycHM2L1dYczZ2dDh3RHAyR3ZqcEYrcUU4MDUxaHRFcEdUOGY4?=
 =?utf-8?B?aHJJTnJTYXk4OE1GMzAySFNCRHQ4Q3Q1cjk0dHR2amRtZ1Q0YUtQNXhneTJD?=
 =?utf-8?B?ZHZrUU56UERLcms5YVFHTEoxOHo3QzNhcExidnRhQmpWRW1kMERTTHFqdTBw?=
 =?utf-8?B?YUhmRWpkNG4rQlNyNFA4LzR6b0dRMVZwV2J5UUx6N2pJZDNacFJxMDlsMDRm?=
 =?utf-8?B?WkJhOTVQd0w3a0dYRjNhRHpLU2IrUUNtYXRuM2JZeG05bkFHek5PUm9TMGZS?=
 =?utf-8?B?RlhyWnYzQVZLeExad2NEaFFJYXNwU29mZ0JKZjJXZHhKMFo1eHNwMUJBdXdi?=
 =?utf-8?B?OCtKV1FZT1ZoUS9vOWpoaWJCeGlCakI1bHplRnVEZCtzaGVqZnA3bmVBR28x?=
 =?utf-8?B?dVY0NThZRWdHZWFLTTlCZHlvdGh4M3NHS1I3UlZTVlZDZGVhQ1poME5hbjZR?=
 =?utf-8?B?R1dFVVJwVEppMCthdXVhWmpNVmtiVHQ2emNGNkhpQjhsRFErcGkxbnRXeURC?=
 =?utf-8?B?RXVtTTUyM2RUcUxFOVQ1UStLRWw2ekxSUWtYZjBZZC9WeVAvdjA5TjB3Znkz?=
 =?utf-8?B?V0twWTVGb3EvbkUrZ3pGeGwydVRlYnFtQUk4VGtTMzIzM255K1hMY3Exa3Q4?=
 =?utf-8?B?TUM5L1VFdENDb0pLUlNBTjFQUElweXBqMVJPMC82djlPSkpJSHpDRC9nSTRy?=
 =?utf-8?B?OUhSUzRzbXJuZmZPTytzTzJpNVJiNEQ4Ynd3T0N6Y3RKcER6Zk5qNFMzK1pH?=
 =?utf-8?B?aDF3RTJrdG5YUjhKTlpUK2dmNElKaVkzSThsUk8rVk5oOWErZnBqYUpqYjhM?=
 =?utf-8?B?RnVMdktjM1BRWlJaV2pVZm5DYmV5Q2I5UTlnbFcvcmNkTlZJM1ZUVmlXeGFj?=
 =?utf-8?B?bk9lTWFmUTArTUh4ZGlTM3o0amtsSkMvUjJlTGJVUnRoZ1FyK2dtMlpyWFFM?=
 =?utf-8?B?ZlNWeGd5ZEhHNXdlTm9Nbjl1TnUvYXFOTmN3TXBtR3hHWHNHelZKdWpVMkhq?=
 =?utf-8?B?elgrR1RQNHFHaDkrZFBSSmx6NURuQ3NLQ3hHOTc4UXpRQ3B2cHNEVWx1NTJS?=
 =?utf-8?B?RzBxSGdSMm5MQW9vRUtiTkRUS0NVTDVVNnNyNXRrYThLRXdFaG9TTUdVcE5s?=
 =?utf-8?B?VUhHdEFjQ2FrcDl3WmJ0ZkpoYlN2dFdnVzNLc1l5VUsxbHBvWU8xN1JHZE4y?=
 =?utf-8?B?K1Z3NWRKVFhIdHcyR3ZpeUxJUlRlSEUwM0ZMbGhveWdleHlTaE9IK1VjMkEv?=
 =?utf-8?B?U2tPSUdITnVvY3hQckVSak83V1ZZbitDSm1VMHV1NkVBZ1JkUy9MSFMxbTRR?=
 =?utf-8?B?ZG9uSmN6U2hwQ1pza2d3YitwdVVRbVFubVVrd1MvcExpYnRhWkJmSzVFRnYx?=
 =?utf-8?Q?LciQHUarJ+4OJkfmlaff5F61Xjzn4nF4=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <B8B5384B8DE32247AA5C3ED033ADB7EE@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4492.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd373ff-0b2a-47e1-bb8a-08d8b7f11f83
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 18:29:11.5444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rYAbP8K3vfDKdkX0SIiyxHqXLPRJEY9nJfnTNm3vGJJj3TMiljzo2gpO3+UjC95H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6575
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_09:2021-01-13,
 2021-01-13 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_132916_258878_4ADBE565 
X-CRM114-Status: GOOD (  38.42  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "wink@technolu.st" <wink@technolu.st>,
 "mail@mitchellnordine.com" <mail@mitchellnordine.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIxLTAxLTEzIGF0IDE5OjA1ICswMjAwLCBLYWxsZSBWYWxvIHdyb3RlOg0KPiAi
THVvLCBTaW5pbmciIDxzbHVvQGNpZW5hLmNvbT4gd3JpdGVzOg0KPiANCj4gPiBPbiBXZWQsIDIw
MjEtMDEtMTMgYXQgMTM6MDIgKzAxMDAsIHdpIG5rIHdyb3RlOg0KPiA+ID4gT24gV2VkLCBKYW4g
MTMsIDIwMjEgYXQgMTI6NTQgUE0gS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+DQo+
ID4gPiB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IHdpIG5rIDx3aW5rQHRlY2hub2x1LnN0PiB3
cml0ZXM6DQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSSBnb3QgdGhlIFhQUyAxMyA5MzEwIG5vdyBh
bmQgaXQgaW5kZWVkIGhhZCBBWDUwMC4gQnV0IGl0DQo+ID4gPiA+ID4gPiBhbHNvDQo+ID4gPiA+
ID4gPiBoYXMgYW4NCj4gPiA+ID4gPiA+IHVwZGF0ZWQgQklPUzoNCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gW8KgwqDCoCAwLjAwMDAwMF0gRE1JOiBEZWxsIEluYy4gWFBTIDEzIDkzMTAvME1S
VDEyLCBCSU9TIDEuMS40DQo+ID4gPiA+ID4gPiAxMS8yMy8yMDIwDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IEFuZCB3aXRoIHRoYXQgSSBjYW4gZ2V0IDMyIE1TSSB2ZWN0b3JzOg0KPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiBbwqDCoMKgIDIuNzU4MjE5XSBhdGgxMWtfcGNpIDAwMDA6NTY6
MDAuMDogV0FSTklORzogYXRoMTFrIFBDSQ0KPiA+ID4gPiA+ID4gc3VwcG9ydCBpcyBleHBlcmlt
ZW50YWwhDQo+ID4gPiA+ID4gPiBbIDIuNzU4Nzc4XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDog
QkFSIDA6IGFzc2lnbmVkIFttZW0NCj4gPiA+ID4gPiA+IDB4OGMzMDAwMDAtMHg4YzNmZmZmZiA2
NGJpdF0NCj4gPiA+ID4gPiA+IFvCoMKgwqAgMi43NTg3OTddIGF0aDExa19wY2kgMDAwMDo1Njow
MC4wOiBlbmFibGluZyBkZXZpY2UNCj4gPiA+ID4gPiA+ICgwMDAwIC0+DQo+ID4gPiA+ID4gPiAw
MDAyKQ0KPiA+ID4gPiA+ID4gW8KgwqDCoCAyLjc1OTA4Nl0gYXRoMTFrX3BjaSAwMDAwOjU2OjAw
LjA6IE1TSSB2ZWN0b3JzOiAzMg0KPiA+ID4gPiA+ID4gW8KgwqDCoCAzLjIwODQ0N10gYXRoMTFr
X3BjaSAwMDAwOjU2OjAwLjA6IHFtaSByZXEgbWVtX3NlZ1swXQ0KPiA+ID4gPiA+ID4gMHgzZjAw
MDAwMCAzNTIyNTYwIDENCj4gPiA+ID4gPiA+IFvCoMKgwqAgMy4yMDg0NDldIGF0aDExa19wY2kg
MDAwMDo1NjowMC4wOiBxbWkgcmVxIG1lbV9zZWdbMV0NCj4gPiA+ID4gPiA+IDB4M2Y1MDAwMDAg
ODg0NzM2IDQNCj4gPiA+ID4gPiA+IFsgMy4yMTUzNTVdIGF0aDExa19wY2kgMDAwMDo1NjowMC4w
OiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseQ0KPiA+ID4gPiA+ID4gMHhiDQo+ID4gPiA+ID4gPiBi
b2FyZF9pZCAweGZmIHNvY19pZCAweGZmZmZmZmZmDQo+ID4gPiA+ID4gPiBbIDMuMjE1MzU4XSBh
dGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogZndfdmVyc2lvbiAweDEwMWMwNmNjDQo+ID4gPiA+ID4g
PiBmd19idWlsZF90aW1lc3RhbXAgMjAyMC0wNi0yNCAxOTo1MCBmd19idWlsZF9pZA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IMKgIEkgZGlkIHNlZSB0aGUgdXBkYXRlZCBCSU9TIGZyb20gYSBmZXcg
d2Vla3MgYWdvLCBidXQgSSd2ZQ0KPiA+ID4gPiA+IGJlZW4gYQ0KPiA+ID4gPiA+IGxpdHRsZSBo
ZXNpdGFudCB0byB1cGRhdGUgc2luY2UgSSB3YXNuJ3Qgc3VyZSB3aGF0IHdvdWxkDQo+ID4gPiA+
ID4gaGFwcGVuIG9yDQo+ID4gPiA+ID4gaWYNCj4gPiA+ID4gPiBJIGNvdWxkIGRvd25ncmFkZS4N
Cj4gPiA+ID4gDQo+ID4gPiA+IE1ha2VzIHNlbnNlLCBiZXR0ZXIgdG8gYmUgY2FyZWZ1bC4NCj4g
PiA+ID4gDQo+ID4gPiA+ID4gU28gdG8gY29uZmlybSwgdGhlIG5ldyBCSU9TIGlzIGFsbG93aW5n
IHRoZSBkcml2ZXIgdG8gb2J0YWluDQo+ID4gPiA+ID4gYWxsDQo+ID4gPiA+ID4gMzINCj4gPiA+
ID4gPiBtc2kgdmVjdG9ycyByZW1vdmluZyB0aGUgbmVlZCBmb3IgdGhlIHNpbmdsZSBNU0kgcGF0
Y2hpbmc/DQo+ID4gPiA+ID4gRG9lcw0KPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+IE1ISSAvIE0y
IGJlaGF2aW9yIGFsc28gY2hhbmdlIHRvIHdvcmsgcHJvcGVybHk/DQo+ID4gPiA+IA0KPiA+ID4g
PiBJIGhhdmUgbm90IHRlc3RlZCB0aGVzZSB5ZXQgYXMgSSBvbmx5IGRpZCBhIHF1aWNrIDEwIG1p
bnV0ZQ0KPiA+ID4gPiB0ZXN0LiBJDQo+ID4gPiA+IHdhcw0KPiA+ID4gPiBvZmZsaW5lIG92ZXIg
dHdvIHdlZWtzIHNvIEkgaGF2ZSBhIGxvdCBvZiBjYXRjaGluZyB1cCB0byBkbywgYnV0DQo+ID4g
PiA+IHdpbGwNCj4gPiA+ID4gZ2V0IGJhY2sgdG8geW91IGluIG5leHQgZmV3IGRheXMgb24gdGhl
c2UuIE15IHBsYW4gaXMgdG8gYWxzbw0KPiA+ID4gPiB0ZXN0DQo+ID4gPiA+IHRoaXMNCj4gPiA+
ID4gbmV3IEJJT1Mgd2l0aCB0aGUgb2ZmaWNpYWwgNS4xMCByZWxlYXNlIGZyb20gTGludXMgKHRh
ZyB2NS4xMCkuDQo+ID4gPiA+IA0KPiA+ID4gPiAtLQ0KPiA+ID4gPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL2xpc3QvX187ISFPU3NHRHchZDQySkZ3bjZ0SVR5a0VVUTZaWXRmSU1pZjVCUlBkVnRf
ek9xQ3pvSU5jNjQwT3p3U0h1c3Y1WDU4OGckDQo+ID4gPiA+IMKgDQo+ID4gPiA+IA0KPiA+ID4g
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5l
bC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzX187ISFP
U3NHRHchZDQySkZ3bjZ0SVR5a0VVUTZaWXRmSU1pZjVCUlBkVnRfek9xQ3pvSU5jNjQwT3p3U0h1
c2F5MWhtdlkkDQo+ID4gPiA+IMKgDQo+ID4gPiANCj4gPiA+IEF3ZXNvbWUsIGxldCBtZSBrbm93
IGhvdyBpdCBnb2VzLsKgIEkndmUgZ290IHRoZSA5MzEwIGJyYW5jaA0KPiA+ID4gcnVubmluZw0K
PiA+ID4gNS4xMC4yIHdpdGggbm8gaXNzdWVzICgxNiBkYXlzIHVwdGltZSkgc28gSSB3b3VsZG4n
dCBleHBlY3QgeW91IHRvDQo+ID4gPiBzZWUNCj4gPiA+IGFueXRoaW5nIHN1cGVyIG5ldyB0aGVy
ZSwgZ29vZCBsdWNrIDpELg0KPiA+ID4gDQo+ID4gPiBwcyAtIEhhcHB5IG5ldyB5ZWFyDQo+ID4g
PiANCj4gPiANCj4gPiBIaSBLYWxsZSBhbmQgV2ksDQo+ID4gDQo+ID4gSSd2ZSB1cGdyYWRlZCBt
eSA5MzEwIEJJT1MgdG8gdGhlIHNhbWUgMS4xLjQgc2luY2UgaXQncyBhdmFpbGFibGU6DQo+ID4g
DQo+ID4gW8KgwqDCoCAwLjAwMDAwMF0gRE1JOiBEZWxsIEluYy4gWFBTIDEzIDkzMTAvMEY3TTRD
LCBCSU9TIDEuMS40DQo+ID4gMTEvMjMvMjAyMA0KPiA+IA0KPiA+IEJ1dCBpdCdzIHN0aWxsIGdl
dHRpbmcgYSBzaW5nbGUgTVNJIHZlY3RvcjoNCj4gPiANCj4gPiBbwqDCoMKgIDMuMTQzNzEyXSBh
dGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogV0FSTklORzogYXRoMTFrIFBDSSBzdXBwb3J0DQo+ID4g
aXMNCj4gPiBleHBlcmltZW50YWwhDQo+ID4gW8KgwqDCoCAzLjE0Mzc5NF0gYXRoMTFrX3BjaSAw
MDAwOjU2OjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtDQo+ID4gMHg4YzMwMDAwMC0NCj4gPiAw
eDhjM2ZmZmZmIDY0Yml0XQ0KPiA+IFvCoMKgwqAgMy4xNDM4MTFdIGF0aDExa19wY2kgMDAwMDo1
NjowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4NCj4gPiAwMDAyKQ0KPiA+IFvCoMKgwqAg
My4xNDM4ODVdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBNU0kgdmVjdG9yczogMQ0KPiA+IFvC
oMKgwqAgMy43NTU3NDddIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBxbWkgcmVxIG1lbV9zZWdb
MF0NCj4gPiAweDU3NDAwMDAwDQo+ID4gMzUyMjU2MCAxDQo+ID4gW8KgwqDCoCAzLjc1NTc0OF0g
YXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IHFtaSByZXEgbWVtX3NlZ1sxXQ0KPiA+IDB4NTRkMDAw
MDANCj4gPiA4ODQ3MzYgNA0KPiA+IFvCoMKgwqAgMy43NjQxMTBdIGF0aDExa19wY2kgMDAwMDo1
NjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGINCj4gPiBib2FyZF9pZCAweGZmIHNv
Y19pZCAweGZmZmZmZmZmDQo+ID4gW8KgwqDCoCAzLjc2NDExMV0gYXRoMTFrX3BjaSAwMDAwOjU2
OjAwLjA6IGZ3X3ZlcnNpb24gMHgxMDFjMDZjYw0KPiA+IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIw
LTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lkIA0KPiA+IFvCoMKgwqAgMy45MzM5MzZdIGF0aDExa19w
Y2kgMDAwMDo1NjowMC4wIHdscDg2czA6IHJlbmFtZWQgZnJvbSB3bGFuMA0KPiA+IA0KPiA+IERv
ZXMgaXQgbWVhbiB0aGF0IHRoZSBzaW5nbGUgTVNJIGlzc3VlIGlzIG5vdCBmcm9tIHRoZSBCSU9T
PyANCj4gDQo+IERvIHlvdSBoYXZlIHZ0LWQgZW5hYmxlZCBpbiBCSU9TPyBJSVJDIHRoYXQncyBu
ZWVkZWQgZm9yIDMyIHZlY3RvcnMuDQo+IA0KDQpZZXMsIGl0IHdhcyBlbmFibGVkIGluIEJJT1Ms
IGJ1dCBpdCB3YXNuJ3QgZW5hYmxlZCBhdCBib290IGR1ZSB0byB0aGUNCkJJT1MgYnVnOg0KRE1B
UjogW0Zpcm13YXJlIEJ1Z106IFlvdXIgQklPUyBpcyBicm9rZW47IERNQVIgcmVwb3J0ZWQgYXQg
YWRkcmVzcyAwIQ0KDQpJIHdlbnQgYWhlYWQgdG8gdXBncmFkZSB0aGUgQklPUyB0byAxLjIuNS4g
VGhlIERNQVIgZXJyb3IgaXMgbm93IGdvbmUNCmFuZCBJIGNhbiBnZXQgMzIgTVNJIHZlY3RvcnMg
Zm9yIHRoZSBmaXJzdCB0aW1lIQ0KDQpbICAgIDMuOTcxMjE4XSBhdGgxMWtfcGNpIDAwMDA6NzI6
MDAuMDogV0FSTklORzogYXRoMTFrIFBDSSBzdXBwb3J0IGlzDQpleHBlcmltZW50YWwhDQpbICAg
IDMuOTcxMjg1XSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogQkFSIDA6IGFzc2lnbmVkIFttZW0g
MHhhMjUwMDAwMC0NCjB4YTI1ZmZmZmYgNjRiaXRdDQpbICAgIDMuOTcxMzAyXSBhdGgxMWtfcGNp
IDAwMDA6NzI6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpDQpbICAgIDMuOTcx
NDUyXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogTVNJIHZlY3RvcnM6IDMyDQpbICAgIDQuNjA5
NTkzXSBhdGgxMWtfcGNpIDAwMDA6NzI6MDAuMDogcW1pIHJlcSBtZW1fc2VnWzBdIDB4NTNjMDAw
MDANCjM1MjI1NjAgMQ0KWyAgICA0LjYwOTU5NV0gYXRoMTFrX3BjaSAwMDAwOjcyOjAwLjA6IHFt
aSByZXEgbWVtX3NlZ1sxXSAweDU0MTAwMDAwDQo4ODQ3MzYgNA0KWyAgICA0LjYxNjM5Nl0gYXRo
MTFrX3BjaSAwMDAwOjcyOjAwLjA6IGNoaXBfaWQgMHgwIGNoaXBfZmFtaWx5IDB4Yg0KYm9hcmRf
aWQgMHhmZiBzb2NfaWQgMHhmZmZmZmZmZg0KWyAgICA0LjYxNjM5OF0gYXRoMTFrX3BjaSAwMDAw
OjcyOjAwLjA6IGZ3X3ZlcnNpb24gMHgxMDFjMDZjYw0KZndfYnVpbGRfdGltZXN0YW1wIDIwMjAt
MDYtMjQgMTk6NTAgZndfYnVpbGRfaWQgDQpbICAgIDQuNzkzNjUwXSBhdGgxMWtfcGNpIDAwMDA6
NzI6MDAuMCB3bHAxMTRzMDogcmVuYW1lZCBmcm9tIHdsYW4wDQoNCi0tIAphdGgxMWsgbWFpbGlu
ZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
