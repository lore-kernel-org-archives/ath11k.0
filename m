Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B51C433DB
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 15:22:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6881123329
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 15:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6881123329
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ciena.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GsAAcBoH9PAJj+OdjhH7EHG2UVHHuKV7wn6lAWMeGXg=; b=Zde+GppTBiynn0k3S9lF4bh1k
	z6xXzf8+g2zi++p+XpwmKbi+4C1YKJHQHictQsTf8ICTxQF5tPFjgPwBpGaY8q0lua1Lk84ht6500
	HpSBKNLoDYQtbFgRbfCh3GAkx43LYsIm5BLpyEUvgCLROua6G5GNCKQwcIN6s119PXqifXimW/1nm
	3s5UzhGq/lF/VKHyRfnCMQzO5rbfKINZ4NCBVbFvFAFNrFKAOHGAtuL6dVdjdHP6I6uCDk0IaCCpi
	+9vMYNP+xp77xu29AVF+Y9R9VePc1tx0S+1AdqYCoyIt6QveH2a86m21PfG3D79Kjr30nKggoZBuI
	JVagz9YcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzhz1-0001QE-55; Wed, 13 Jan 2021 15:22:51 +0000
Received: from mx0a-00103a01.pphosted.com ([67.231.144.234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzhys-0001MP-Jh
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 15:22:48 +0000
Received: from pps.filterd (m0222747.ppops.net [127.0.0.1])
 by mx0a-00103a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10DF6RNo024761; Wed, 13 Jan 2021 10:22:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=06252019;
 bh=kuPPJbWAubUFOh+JgNgGECugbDRjtzpVsOqrtWUMdio=;
 b=ci99cDxX6a81soAc63K5QZyEb+tHX5BkbBDx/l0CR+K4PQ2VQj2sqvNw4OVsfNLYzTvm
 PXIfLRgnB8dpghyFKNd6pZKHqeZ3/RlLyZcpOU2GEr/v/3RgJYzK21lWawWNBUyZ3CFe
 CX+7Sr1KEqCEbpLUX8VdxFiw30rOIBCj4RCW7xTM0Rx/JLhOTVpxzq+BSPEs8OfdQmBy
 Vos0XiJ+4/zJ9/xWd5GSFVs0SXZ06Qmh6PVFCS8U8SAqtBmdaUiqpaNsh6qWburGbIQm
 ijufDOoP9+P15bgqqyU/ECExvaJYmjFD4m0+bvmxzaidR/h5Vh/1GjKZOiZBcpOxBdWu Rw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by mx0a-00103a01.pphosted.com with ESMTP id 361vty0xvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jan 2021 10:22:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVuAbVr8+hB2blFK1n6hHfY6xHfJNhKKYHy51qn/Sc7lXxecmwCQk2jRnkt07gdkaMRp5KGhFmgn5lK5Ivk52oZf0Gmu6Frh9TpDVn8sYY6EjpI0Onc0Td80Xgz5WoxJSceVdEATs0jqZ4xuZUrUDYj+TaYKKfc4CcSv7bgpKa0PDqiS24K1Rwpe0fwNRDAlBkEKB//LZfYHwYFs17RYP1iwWRZgA4cCmUqiNioJWkwOj5SZkAEGkHxj/k3X0TTtPvIacGljprgfC0ndCS6LOr01Ttwp+v5+ZSs/Z2Q2SHRtIl9VzdPZONyLVIqFX8jbmjmZLBcjEe+qXdvXelbijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuPPJbWAubUFOh+JgNgGECugbDRjtzpVsOqrtWUMdio=;
 b=GDTPebDqkK8/BkylJkt+3G8dYbCfPbigKKqTOWCECMa2f0A4UEByf1K+s54hnjIGRg/Rbny/iP2N8DH3zpEvHjNsNxJarZ6n6BRGyBqQTL82iRUdQuMm7GsmGu94niMWTF8B4z2snSjuv/zq1aB5K37zIuEXw0ORO5b7NkRDuE0lakJIZv5oMuaArbPbfiivrst/Zn9roYJ/rKTqw1YU6PEnvHu8jL0hven8QF9GP/WGONX8UUdMR5tCkzLFeZGEx6opGKEtUDmRzJESy32CGB+3jJdw3m3NxaFwTgZnAlajtXX1/WRsOKmxyxTVMBgcAduw+acW8esyPUEUKPMo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from DM6PR04MB4492.namprd04.prod.outlook.com (2603:10b6:5:29::33) by
 DM6PR04MB5083.namprd04.prod.outlook.com (2603:10b6:5:12::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Wed, 13 Jan 2021 15:22:33 +0000
Received: from DM6PR04MB4492.namprd04.prod.outlook.com
 ([fe80::8dfe:9ade:ec1:da2e]) by DM6PR04MB4492.namprd04.prod.outlook.com
 ([fe80::8dfe:9ade:ec1:da2e%6]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 15:22:33 +0000
From: "Luo, Sining" <sluo@ciena.com>
To: "wink@technolu.st" <wink@technolu.st>, "kvalo@codeaurora.org"
 <kvalo@codeaurora.org>
Subject: Re: [**EXTERNAL**] Re: Ordering Dell XPS 13 9310 to test QCA6390
Thread-Topic: [**EXTERNAL**] Re: Ordering Dell XPS 13 9310 to test QCA6390
Thread-Index: AQHW07mQjBT6onfnE0CdoOyTbk32h6n53dT8gCunqeCAAAQLgIAAFMmngAACIQCAADfrAA==
Date: Wed, 13 Jan 2021 15:22:31 +0000
Message-ID: <075eed74b59afc9bc4f870aea6765f85d040cf47.camel@ciena.com>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
In-Reply-To: <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 
authentication-results: technolu.st; dkim=none (message not signed)
 header.d=none;technolu.st; dmarc=none action=none header.from=ciena.com;
x-originating-ip: [174.112.249.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42d13eb0-8b04-4de1-832b-08d8b7d70ce6
x-ms-traffictypediagnostic: DM6PR04MB5083:
x-microsoft-antispam-prvs: <DM6PR04MB5083A30AE39EFA4C9329DC08D0A90@DM6PR04MB5083.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uRDzoBZMjiz27XOM16QxNVgxm+cQRjs62VtXUEIhq/B2pssKHH4FFDNGd/r/hgPn+GniPbynPzduepRvaF/HnRH3fpACER+AIShaIlh0Fsh81hdzpv8JcuSExY9RqID3OPpSLpZKNZ0vJ4V0B2aUcxkJ0Y548SFi9eUMwq6DM6QFPB0bXumwP7PdFretY5WH9dZUJ3WNV749MpYWrRYcQSmGU98V3nZ0buKNwLze3HYPwN6XUExpvHEIF7FEgJMaILfnpCp92cR3eVeAiEifn3oktwJ/1+khy4DibHfm8C1DRD1S97iA2TM/9R3LVMeX7T65OGmA1N7YSBiDeRNlxt+doqE0t3uATBPi55pe6xEPaMjHYItZhZsVwsy+8m0EVZKuvliR0NU+ARa6CU1lXmTzBNYIwhogfA4x6nIwVZPXuoAtbLiKI0LLuS/PBbkXv4/cJTB+3PMYnuRNzED0mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB4492.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(66476007)(66946007)(2616005)(54906003)(91956017)(5660300002)(76116006)(110136005)(66446008)(64756008)(66556008)(6506007)(53546011)(71200400001)(26005)(316002)(6486002)(86362001)(6512007)(8936002)(186003)(508600001)(966005)(4326008)(2906002)(8676002)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UFR6dk5jYU9LY240UTRINHV1VjRUYWhsNXNqM3J0NjllWnFtdHhlaytMMUJp?=
 =?utf-8?B?aFZmbFllaTkwdTRpZVFJSm9LbEtpZHR0QTRaWFI3U0toSmtLblIwTGJ2WE50?=
 =?utf-8?B?MXNzN0FnaHFjQ2NETVJ0V29BVlMzVVBIbzhsQ0ZaQ2NCOGNwTWQ3OUVZNVBH?=
 =?utf-8?B?NThkYmtCUFlSS2VQRHdzdlF5MXpiYm03VmIzbWVQcUdCcnJoSnJrbFZsSmJj?=
 =?utf-8?B?cDlLUW8rM1ZIeW95ZDRPR1c1SW9maDBhTHFCbTBBb0JwQ3NwTXFTNjFGbzRm?=
 =?utf-8?B?dEdSY2l6eUVrcFJTVUJCRjU0VGNpYWhqSTFYNnFRdS9VTzJPM0VTVE5tQU0z?=
 =?utf-8?B?TkZYMWtPaG9zVm9GRnhaNHk4U3lRSkl2V3NMbXUrU3BSL3Q3QVduK253eEdh?=
 =?utf-8?B?ZXJzL2IwN210Q2pJa3FyWGFubzlYVUVsdHQ3M210SVJBZTBweDhLbDREbSs4?=
 =?utf-8?B?alU3VUZleDVsNUNOUmJYMGRKd1VsTEljL3ZRcnEzNjlvd3REejRTK2Q3YnRn?=
 =?utf-8?B?VTBWbEhiakFLcWttWEZOMjh1aXBiQ1BhdzNtYUpRbUxtUkM4NENFV05xRWcv?=
 =?utf-8?B?OWc3bEVzdFBxOFY5QU9NMVlNZ2J0Sis0K0UrUDdTaW5FOStUemdiV0ZUYmQ3?=
 =?utf-8?B?YzVaRTJ2RTFEK1B1MDgrRkZ3UmlySWhOWERleG11L0UzT1ZIWlBlUFlaRmdk?=
 =?utf-8?B?VmIrNUlrZ1dLL3NMRXVBclJRaTNTT1d5QUh6cEFpN2s5bC9UOXk1NmltV3p1?=
 =?utf-8?B?cTl6OWZ5MFRtekp0NnRxVEZ0ZGhmZE9KczVZQVhjQTByamt1OVZDMzFDcUEr?=
 =?utf-8?B?SzdiNUhPK0htUG5rdmpTRXlJRUxUVnZkUkhpSS9LdURtMEg1SHFOYWFLQVpM?=
 =?utf-8?B?SGl4SkNkUENZRHFWWG1UL0FYbTVScTQ4MWhlZnhqNXI5ak1qN2pjN0p3aGRo?=
 =?utf-8?B?Y3haektkYisxdUg4N2YxQ2Vtb2dZMHJXaFZyWHZKSjE3cUV2aS9uVkdldFRz?=
 =?utf-8?B?RFVVWTU2UnVPVlNhelVVWm80c2kvNEdrNnJyWVRPUzZXZ29kcVBKRGZYWTcy?=
 =?utf-8?B?a0xwOUpQTGZQdFdRYmlkd3Vyb1pObjlja0V4VEpzdFBRaEdtaHhVWWJrWG5w?=
 =?utf-8?B?SFpBVCtnTjlyK3ptYlNLcDJYRUpxbHVaSTNiTXMxeUVkb3ptRXIxU2JwL1FX?=
 =?utf-8?B?VnVERnJXd0YwbDNwdmxYb1RUOTlsbVJtZG0zaGNHT29HM21sd0NGV2xnYjBK?=
 =?utf-8?B?RWJsbE82eE11TGpsaVVVRk4vRWhuVTBxMlV1TmdYQVYxcFpJbS9Ec2l0UFZz?=
 =?utf-8?Q?X3a6xh5GkckI9STUKjK9gRxS/lkKRhwlq8?=
x-ms-exchange-transport-forked: True
Content-ID: <14A548117CC17F478C11DCDC21D21590@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4492.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d13eb0-8b04-4de1-832b-08d8b7d70ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 15:22:33.4650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36VhwuhnxImGv1Ot280m5IpOvTCRGrgrV7py3PKuqKBzU+pQnvHX99un8hQCaMpz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5083
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-13_07:2021-01-13,
 2021-01-13 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_102242_899576_50C12093 
X-CRM114-Status: GOOD (  30.91  )
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
 "mail@mitchellnordine.com" <mail@mitchellnordine.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIxLTAxLTEzIGF0IDEzOjAyICswMTAwLCB3aSBuayB3cm90ZToNCj4gT24gV2Vk
LCBKYW4gMTMsIDIwMjEgYXQgMTI6NTQgUE0gS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5v
cmc+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IHdpIG5rIDx3aW5rQHRlY2hub2x1LnN0PiB3cml0ZXM6
DQo+ID4gDQo+ID4gPiA+IEkgZ290IHRoZSBYUFMgMTMgOTMxMCBub3cgYW5kIGl0IGluZGVlZCBo
YWQgQVg1MDAuIEJ1dCBpdCBhbHNvDQo+ID4gPiA+IGhhcyBhbg0KPiA+ID4gPiB1cGRhdGVkIEJJ
T1M6DQo+ID4gPiA+IA0KPiA+ID4gPiBbwqDCoMKgIDAuMDAwMDAwXSBETUk6IERlbGwgSW5jLiBY
UFMgMTMgOTMxMC8wTVJUMTIsIEJJT1MgMS4xLjQNCj4gPiA+ID4gMTEvMjMvMjAyMA0KPiA+ID4g
PiANCj4gPiA+ID4gQW5kIHdpdGggdGhhdCBJIGNhbiBnZXQgMzIgTVNJIHZlY3RvcnM6DQo+ID4g
PiA+IA0KPiA+ID4gPiBbwqDCoMKgIDIuNzU4MjE5XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDog
V0FSTklORzogYXRoMTFrIFBDSQ0KPiA+ID4gPiBzdXBwb3J0IGlzIGV4cGVyaW1lbnRhbCENCj4g
PiA+ID4gWyAyLjc1ODc3OF0gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IEJBUiAwOiBhc3NpZ25l
ZCBbbWVtDQo+ID4gPiA+IDB4OGMzMDAwMDAtMHg4YzNmZmZmZiA2NGJpdF0NCj4gPiA+ID4gW8Kg
wqDCoCAyLjc1ODc5N10gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IGVuYWJsaW5nIGRldmljZSAo
MDAwMCAtPg0KPiA+ID4gPiAwMDAyKQ0KPiA+ID4gPiBbwqDCoMKgIDIuNzU5MDg2XSBhdGgxMWtf
cGNpIDAwMDA6NTY6MDAuMDogTVNJIHZlY3RvcnM6IDMyDQo+ID4gPiA+IFvCoMKgwqAgMy4yMDg0
NDddIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBxbWkgcmVxIG1lbV9zZWdbMF0NCj4gPiA+ID4g
MHgzZjAwMDAwMCAzNTIyNTYwIDENCj4gPiA+ID4gW8KgwqDCoCAzLjIwODQ0OV0gYXRoMTFrX3Bj
aSAwMDAwOjU2OjAwLjA6IHFtaSByZXEgbWVtX3NlZ1sxXQ0KPiA+ID4gPiAweDNmNTAwMDAwIDg4
NDczNiA0DQo+ID4gPiA+IFsgMy4yMTUzNTVdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBjaGlw
X2lkIDB4MCBjaGlwX2ZhbWlseSAweGINCj4gPiA+ID4gYm9hcmRfaWQgMHhmZiBzb2NfaWQgMHhm
ZmZmZmZmZg0KPiA+ID4gPiBbIDMuMjE1MzU4XSBhdGgxMWtfcGNpIDAwMDA6NTY6MDAuMDogZndf
dmVyc2lvbiAweDEwMWMwNmNjDQo+ID4gPiA+IGZ3X2J1aWxkX3RpbWVzdGFtcCAyMDIwLTA2LTI0
IDE5OjUwIGZ3X2J1aWxkX2lkDQo+ID4gPiANCj4gPiA+IMKgIEkgZGlkIHNlZSB0aGUgdXBkYXRl
ZCBCSU9TIGZyb20gYSBmZXcgd2Vla3MgYWdvLCBidXQgSSd2ZSBiZWVuIGENCj4gPiA+IGxpdHRs
ZSBoZXNpdGFudCB0byB1cGRhdGUgc2luY2UgSSB3YXNuJ3Qgc3VyZSB3aGF0IHdvdWxkIGhhcHBl
biBvcg0KPiA+ID4gaWYNCj4gPiA+IEkgY291bGQgZG93bmdyYWRlLg0KPiA+IA0KPiA+IE1ha2Vz
IHNlbnNlLCBiZXR0ZXIgdG8gYmUgY2FyZWZ1bC4NCj4gPiANCj4gPiA+IFNvIHRvIGNvbmZpcm0s
IHRoZSBuZXcgQklPUyBpcyBhbGxvd2luZyB0aGUgZHJpdmVyIHRvIG9idGFpbiBhbGwNCj4gPiA+
IDMyDQo+ID4gPiBtc2kgdmVjdG9ycyByZW1vdmluZyB0aGUgbmVlZCBmb3IgdGhlIHNpbmdsZSBN
U0kgcGF0Y2hpbmc/IERvZXMNCj4gPiA+IHRoZQ0KPiA+ID4gTUhJIC8gTTIgYmVoYXZpb3IgYWxz
byBjaGFuZ2UgdG8gd29yayBwcm9wZXJseT8NCj4gPiANCj4gPiBJIGhhdmUgbm90IHRlc3RlZCB0
aGVzZSB5ZXQgYXMgSSBvbmx5IGRpZCBhIHF1aWNrIDEwIG1pbnV0ZSB0ZXN0LiBJDQo+ID4gd2Fz
DQo+ID4gb2ZmbGluZSBvdmVyIHR3byB3ZWVrcyBzbyBJIGhhdmUgYSBsb3Qgb2YgY2F0Y2hpbmcg
dXAgdG8gZG8sIGJ1dA0KPiA+IHdpbGwNCj4gPiBnZXQgYmFjayB0byB5b3UgaW4gbmV4dCBmZXcg
ZGF5cyBvbiB0aGVzZS4gTXkgcGxhbiBpcyB0byBhbHNvIHRlc3QNCj4gPiB0aGlzDQo+ID4gbmV3
IEJJT1Mgd2l0aCB0aGUgb2ZmaWNpYWwgNS4xMCByZWxlYXNlIGZyb20gTGludXMgKHRhZyB2NS4x
MCkuDQo+ID4gDQo+ID4gLS0NCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvX187ISFP
U3NHRHchZDQySkZ3bjZ0SVR5a0VVUTZaWXRmSU1pZjVCUlBkVnRfek9xQ3pvSU5jNjQwT3p3U0h1
c3Y1WDU4OGckDQo+ID4gwqANCj4gPiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzX187ISFPU3NHRHchZDQySkZ3bjZ0SVR5a0VVUTZaWXRmSU1p
ZjVCUlBkVnRfek9xQ3pvSU5jNjQwT3p3U0h1c2F5MWhtdlkkDQo+ID4gwqANCj4gDQo+IEF3ZXNv
bWUsIGxldCBtZSBrbm93IGhvdyBpdCBnb2VzLsKgIEkndmUgZ290IHRoZSA5MzEwIGJyYW5jaCBy
dW5uaW5nDQo+IDUuMTAuMiB3aXRoIG5vIGlzc3VlcyAoMTYgZGF5cyB1cHRpbWUpIHNvIEkgd291
bGRuJ3QgZXhwZWN0IHlvdSB0byBzZWUNCj4gYW55dGhpbmcgc3VwZXIgbmV3IHRoZXJlLCBnb29k
IGx1Y2sgOkQuDQo+IA0KPiBwcyAtIEhhcHB5IG5ldyB5ZWFyDQo+IA0KDQpIaSBLYWxsZSBhbmQg
V2ksDQoNCkkndmUgdXBncmFkZWQgbXkgOTMxMCBCSU9TIHRvIHRoZSBzYW1lIDEuMS40IHNpbmNl
IGl0J3MgYXZhaWxhYmxlOg0KDQpbICAgIDAuMDAwMDAwXSBETUk6IERlbGwgSW5jLiBYUFMgMTMg
OTMxMC8wRjdNNEMsIEJJT1MgMS4xLjQgMTEvMjMvMjAyMA0KDQpCdXQgaXQncyBzdGlsbCBnZXR0
aW5nIGEgc2luZ2xlIE1TSSB2ZWN0b3I6DQoNClsgICAgMy4xNDM3MTJdIGF0aDExa19wY2kgMDAw
MDo1NjowMC4wOiBXQVJOSU5HOiBhdGgxMWsgUENJIHN1cHBvcnQgaXMNCmV4cGVyaW1lbnRhbCEN
ClsgICAgMy4xNDM3OTRdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBCQVIgMDogYXNzaWduZWQg
W21lbSAweDhjMzAwMDAwLQ0KMHg4YzNmZmZmZiA2NGJpdF0NClsgICAgMy4xNDM4MTFdIGF0aDEx
a19wY2kgMDAwMDo1NjowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikNClsgICAg
My4xNDM4ODVdIGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBNU0kgdmVjdG9yczogMQ0KWyAgICAz
Ljc1NTc0N10gYXRoMTFrX3BjaSAwMDAwOjU2OjAwLjA6IHFtaSByZXEgbWVtX3NlZ1swXSAweDU3
NDAwMDAwDQozNTIyNTYwIDENClsgICAgMy43NTU3NDhdIGF0aDExa19wY2kgMDAwMDo1NjowMC4w
OiBxbWkgcmVxIG1lbV9zZWdbMV0gMHg1NGQwMDAwMA0KODg0NzM2IDQNClsgICAgMy43NjQxMTBd
IGF0aDExa19wY2kgMDAwMDo1NjowMC4wOiBjaGlwX2lkIDB4MCBjaGlwX2ZhbWlseSAweGINCmJv
YXJkX2lkIDB4ZmYgc29jX2lkIDB4ZmZmZmZmZmYNClsgICAgMy43NjQxMTFdIGF0aDExa19wY2kg
MDAwMDo1NjowMC4wOiBmd192ZXJzaW9uIDB4MTAxYzA2Y2MNCmZ3X2J1aWxkX3RpbWVzdGFtcCAy
MDIwLTA2LTI0IDE5OjUwIGZ3X2J1aWxkX2lkIA0KWyAgICAzLjkzMzkzNl0gYXRoMTFrX3BjaSAw
MDAwOjU2OjAwLjAgd2xwODZzMDogcmVuYW1lZCBmcm9tIHdsYW4wDQoNCkRvZXMgaXQgbWVhbiB0
aGF0IHRoZSBzaW5nbGUgTVNJIGlzc3VlIGlzIG5vdCBmcm9tIHRoZSBCSU9TPyANCg0KVGhlcmUg
aXMgYSBuZXcgYmlvcyAxLjIuNSB0aGF0IGp1c3QgcmVsZWFzZWQgMiBkYXlzIGFnbywgSSB3aWxs
IHRyeSB0aGF0DQphbmQgcmVwb3J0IGJhY2suDQoNCkhhcHB5IE5ldyBZZWFyIQ0KU2luaW5nDQot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
