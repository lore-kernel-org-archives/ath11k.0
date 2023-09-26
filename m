Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6387BE7E62D
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ym3naT3VQUENTUDxaqEPLouuGsofDCacK9tGYtrMPis=; b=xjw5oec9HSkThA
	F+1jyxLg6jFodzigBFj+AZj7zdSoGXjna0Q6W4z18cjHsOqhOht53LZJXSSrTvh5EiASYQfYZ5z5g
	QnnQphVq/eXx7rNXVQY8/UjTLDrbYVx9KyICczc+pNHJCErFmY1sDRNwXTWsToBc927pZGcHIitQl
	HHN9BXlyca5sBX/A6R3xBg+F1bcuwIkUk6gq1ejbWbkYUoRlFdFXCz7lGZEp9vzcxVzlIyr6+iYHr
	ThecS5aLkdvKEjhqNhn0/8E7cPPVc3bLokICwCRiyN+FvWyTI02Me9aU17k7xduyf/shRFyouCwvs
	FtuwXBnsoRl4JbRp1JfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6jm-00GJTg-0O;
	Tue, 26 Sep 2023 12:00:22 +0000
Received: from mail-be0deu01on2061d.outbound.protection.outlook.com ([2a01:111:f400:7e23::61d] helo=DEU01-BE0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6jj-00GJT1-2A
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 12:00:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nePiZNX3pS2F5u7shmMj5PGtsRrAfO+X+r++RV6Rb+WQi3tze6luLpOrL3PyKrgMjspSMDjTLSJj6grMKN9Od90GRSO5mUL0J9WNAPu30bBsYpKH5KvV55pusDUFsMYhW//2EtHhhtr3y6fNuShoUXBuRINa0GS5x15MFDNLh0G+KisvgdNO9xLXkXNM0MQYtux9EgPESUHuYMDPWCLQFf/PQL7aO9Af8gRqjmspEbVCovZJXt71wlbdZfSwg03YKizkvGx2jayU8TRpaBoFwcExNlJXUBhYzkBFYc1ngnFtH0aTCwYBeSNneFWVefM4Rsy45Dku/mLKOsTHi5amDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYFu1qvASz8d6znBwssvECfpmQULnLUMU/Jlik//bx4=;
 b=Es3IkzVXKdcJ3Hh2v8Z1e4kaIDJ3woqac/dHBoNA73XacmatiHzBtiCgjey0iLvO/uqH6na1h42QCmEBClkDzDWwdbH4Yoqc9prQrXYGx9z6tGkehevmkDAxPiwS7d0thYuRDX9VNDSR8NTaBreVXW0UEChbJNQwvpM4lXobfuxfOF4W6xoGuj+JpF0bqwr7Uj+SEoBMCyOLZoHfhsNgPqlPH7Rj9aIX4RelG7CV6l2n1jARDBQa7f2/EeF9NdslswcirdqOpL8UOr0Y+VF8XFlhA05lBpgqBachtSgY5mUy8ei6HxTnYOh37P7kafovxm9FtrvXzXMP/emkfKLsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghmt.de; dmarc=pass action=none header.from=ghmt.de; dkim=pass
 header.d=ghmt.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghmt.onmicrosoft.com;
 s=selector1-ghmt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYFu1qvASz8d6znBwssvECfpmQULnLUMU/Jlik//bx4=;
 b=eYfP2HTFA2YZQ7L437tfGXI8OpWAG47RKfzW6pizA3oMKyIKpKJBKNm+hnhtz6sfpba5O0HMb+iMJVy6Z2GwuqoyU+z86gmKt5ceDPaJqXuOhx0z1vzivRqWtQ1whfZ3cq8EWa8I+RS74Mg0TBoeZuZjk88t0+EKkblMKhlFvi0wDRYfpwip0obIgpv/wg0C+FyWesu7Di7dFixEj980X/lqUi8rZyVdfihSHHJgnSBIiSk8s5uTeQqa6zdOjer8MGoBK+Spo7/SY0+QqA1dAnd5KxGeFSJsw+piUfby4eUcUgpWHL5sFowUYceNFW6QhYi8PLohfywqIYZsMuO8WA==
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:2::16) by
 BEZP281MB1959.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:5f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Tue, 26 Sep 2023 12:00:11 +0000
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::a310:8b24:af98:dcd2]) by FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::a310:8b24:af98:dcd2%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 12:00:11 +0000
From: "Lindner, Frank" <Frank.Lindner@ghmt.de>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: QCN9074 monitor mode crash
Thread-Topic: QCN9074 monitor mode crash
Thread-Index: AdnwcPluMUTAXNJIQGiwjPSPbngqLA==
Date: Tue, 26 Sep 2023 12:00:11 +0000
Message-ID: <FRYP281MB01607D994228CF144904CDEDEBC3A@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ghmt.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB0160:EE_|BEZP281MB1959:EE_
x-ms-office365-filtering-correlation-id: 2ceedd2b-1bc4-407c-1ed9-08dbbe882302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QYf3BWaI4T6bAF057MBR07b7xW8xezUmqDE3llIwqRSkMnkOueXvTHo1r8uYyCas3f9eUXsq1IpOO4VMH7BL6HlENv6RdWWc4FMUI/7x9401xgJAWUYQ+4j2uippFGf8UJVswhZ2him6aUua3514w4q1PoKiJbD0aX3F+i16aKZ/u4tLwJU1yMEVKPNQyqUNQnh1KF1H2WxPmONX/l31rggeI6H3BYrbl9bHpdZWbpuqHl6LzIo46/SErcXI/vaJ/03KBQn2s2xhk4/J4UC0tIj8MPimSTuscDMZKXX2tgkDNddmSYrD0SqRCbxcPbisRaBRy2NVglBE/gI0NQfkZ6NiRmRBbaGbi1JcZ7bxkVRSP7zfewIVX3ooo985CWi/41dFtXvid634rhTre8SoQiOKi+wxluMMfqavMlL1VdW297dpIWDl12E7iFgtcq5+Az8GAX0BzkY48Jjr9Jz062m8bcDUGzINk3kG4lmIY5UNppDpT+NatuYgnPoyReUT9PTGdBunaUpA98/V/gUv5qAfiCVqo7W+YUc/HsV0ezYrGPfq0BsnS7fsTMPhyMExgp/OhjuQDZaax+1oqZg00M5O+RoAIJlNtwWi0ouuHCU+D4VONZBhOEtTAMb4lSUY9Xlnlo6t0iFwyEt6g4UrpzVC4ia5xStZB2KJ5/Eckg0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39840400004)(346002)(376002)(396003)(230922051799003)(186009)(1800799009)(451199024)(33656002)(122000001)(38100700002)(38070700005)(86362001)(55016003)(2906002)(4744005)(41300700001)(316002)(66556008)(76116006)(478600001)(66476007)(66446008)(52536014)(6916009)(66946007)(64756008)(71200400001)(7696005)(6506007)(5660300002)(9686003)(83380400001)(8676002)(8936002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1A5REdDZVZOVHNUNUwzT3BHQnlscm1MNmt5UFRiWEJLRXUzaVRhUUxWdWNr?=
 =?utf-8?B?ZU9GOHFKR0g5RzMrRGtnTmR2NXN1TlJySFRGZEJsNzd1ZDI5VVBpWk12cUxM?=
 =?utf-8?B?a1hteitwcXEzY3NBR3lyVFZPUi9VRUZtTzUvWS9McEp6NEt2Wm1TSnlteERB?=
 =?utf-8?B?b2F0Yjllbi9sNDk5dlEyVis3OGJtUmxDZEp6QUROcDl6SVU3Q2hGN1pYejNy?=
 =?utf-8?B?azF4SmhiUFNka1lhZlFHUnZ4bEhPOEdZcG5tZWFXSi9oc3VhWG5LdkRQbnJ2?=
 =?utf-8?B?U2J4ZGJRQXFRTnJLMnp2YWVseEZxYlg0OXdNcUxVU2lXSmMzeWpMNUZhZDd1?=
 =?utf-8?B?R2hBU29tRkFaR2lpcU01cGZBTUFFeXhrdmRlM1F5NlpCSklwL2tzS3dSOVFB?=
 =?utf-8?B?aW5iMUc0SnpKaFUxdXJwNGF2QjEya2Rnak53RklPZzdCaW84VGZRQ0thYkZV?=
 =?utf-8?B?QXZBMFQ3eTJHU1M5TlJWTzY1aWpCOFRZR3RaeE1yejM5ZzJOM3M0aHM4NjVm?=
 =?utf-8?B?Q253Q1Y5Tm95c3hBa3JraTc2NnhPL0hWbXUzMEdFc2dVd2NMbFd2c1ZPSjhH?=
 =?utf-8?B?L0NxUEt4akdVZWFXSCt1UFBQeWFyTDRUc2dkdWIySjB3OVNTaVAwRHNtbFhO?=
 =?utf-8?B?aVJVODZyS2l0RFVNY0tzbU1uUTBYVEFWZCtyNWpMTWtXVUVYY3NtNTFOcWl6?=
 =?utf-8?B?aDVEWmJxb1I0WlBGMTkxMkt6aGI3YWZHd2cvSmdXR09mQ05aSFprbTRrYlBD?=
 =?utf-8?B?TllMRXVtWVBsckRjQmNwUUF3Y3ZZa0VYVHAzenpZWlZXZkJCcGZCRkVKUHFx?=
 =?utf-8?B?bHZxNnVsbWh2cytxT3hqZU5laFYyaVpGVnIzUmpzaVJBSm9zRVRnLzkyeENL?=
 =?utf-8?B?dmdRZ0ord2ttc21GSmNaZ2JvWldtUGZsNWZhMkFzbnBnbE0xQWZlZEZjbXVZ?=
 =?utf-8?B?Ly9uekY1cmQzWkIxR1h4Vzh6ekM4cFRaMmxEd0JGcEc5VDdhSWt3TEdMcXJ2?=
 =?utf-8?B?Y0Nrem5Cc3VwU2kyT3paZGZ4TFJTUStaQXJTMzJaN3c0WXcrWGg4NUpoYU9h?=
 =?utf-8?B?OGVweVpBT1F5c1JZWE9SUGdUVDNyTDl4R1h3MjFXLzNtZG9MTWFHVDNyYVE4?=
 =?utf-8?B?RjJrRStOQ01Mc094a1dPYkxXRkJZSW0ydmhTR3JRYTBuOVUvYU9nbTdwUE1C?=
 =?utf-8?B?UVFPWkcxL0M4QWNXVE96RFdWM0JJaXl4ZHlsVy9Bb2hjRjk2emNBL3d0UWk5?=
 =?utf-8?B?cUllc0xEM3M4L25OdTJoZzFGVGVaemc3UGYvWkExdGlrYjZPZmpMd1llb0lQ?=
 =?utf-8?B?b3c3STNLRVZtTnBERjRBb0s2cjduL2w1R2JxRmVzT3dsUVVpditFYUI0SmNW?=
 =?utf-8?B?WTVtSlRnVG4xVkJFMVZCc0NkdGdQeGRSQ3FhTkhYRmZVMkE5WlpFYUVmdXZY?=
 =?utf-8?B?ejF0Sk9JVTgrNmp5YnJvdUNhSWpZUzJqd2hMUFVyWDljYmplL2dwQlV2TkQx?=
 =?utf-8?B?dlpBUE9sRmRuNDVYZWVWRDJVRnpzN3g5UWJyakcyK2F5VlBjTTRvQlVTOFVi?=
 =?utf-8?B?c1JZaDJ0VXlJZFE2bTVQMS9YbXljWC9tSXM3anNSdVAzY215KzVrVEpDa1hq?=
 =?utf-8?B?aXZZSTk4TENWUlBPdmR6UmxDa3h3MEdRd04zem9vMGVOMGJkRjF3ZENzUE1n?=
 =?utf-8?B?VUJZblQ5U052ZzRrYndOUlFEZkhhRG1lUmhiSzZTbHo5MlZNS0NFeXVUS2tM?=
 =?utf-8?B?NXBuTWU4YWNGZ2FJTDMxQ1d0YXdHaTd6cXI3T2Qrb2hXaVQyZVhIeDlSblI3?=
 =?utf-8?B?OWY4Wkhrdm05bGxpYjRkdzYySkVVa21iV2pqSitxbmNCUlI1YmN5Wm9DVUJL?=
 =?utf-8?B?QzBoVUFjUUM3SjBlWE9kQ3RMVzBsM3BxUVNUalN6cHYvK0g0R2ZGZ0NMeVJL?=
 =?utf-8?B?anhDUjhEYkpzdGJKSVkweDZLaU9aai85eWVPY0RXcnJuYUdZNHF0cmFxTlhq?=
 =?utf-8?B?ZTZScW9reEJYT3VwNTY0dzdsN3IrS3puQllWcHUxSW1vcmdMR1Q3RWVybU5i?=
 =?utf-8?B?UTdRUXBIWk1GZis1aFFMZ20rZDhuNmtGNzBNSVcxeTlmZXY4NXEzMzNSK09L?=
 =?utf-8?Q?wSzV+TF2wO7xSWJpi3VsLYssN?=
MIME-Version: 1.0
X-OriginatorOrg: ghmt.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceedd2b-1bc4-407c-1ed9-08dbbe882302
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 12:00:11.4928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9223b922-6d43-40bb-85e5-a10749de3853
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sr4AkcOd+8sa+dfdpI+RcnKg4Wb+ooBj/OqJKdVGkjy+lKhKW9fvp9ZX96rqamrdRYq8ygN/E0CrT7MzUE8QUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_050019_765339_273C5452 
X-CRM114-Status: UNSURE (   4.74  )
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

SGksDQoNCknigJltIGZhY2luZyBpc3N1ZXMgd2l0aCBRQ045MDc0IGluIG1vbml0b3ItbW9kZS4N
CkFzIHNvb24gYXMgSSBzd2l0Y2ggdG8gbW9uLW1vZGUgYW5kIHRoZSBmaXJzdCBwYWNrZXQgaXMg
cmVjZWl2ZWQsIHRoZSBtb2R1bGUva2VybmVsIGNyYXNoZXMuIEl0IGlzIGluZGVwZW5kZW50IG9m
IGtlcm5lbC12ZXJzaW9uLCBJJ3ZlIHRlc3RlZCBmcm9tIDUueCB1cCBsYXRlc3QgKDEgbW9udGgg
YWdvKSA2LjIuDQoNCkFueSBoaW50IHdoZXJlIHRvIGxvb2sgZnVydGhlcj8NCg0KQlINCkZyYW5r
DQoNCg0KVm9yc3RhbmRzdm9yc2l0emVuZGVyOiBEaXBsLi1JbmcuIERpcmsgV2lsaGVsbQ0KQXVm
c2ljaHRzcmF0c3ZvcnNpdHplbmRlcjogRHIuLUluZy4gUGV0ZXIgSGFzc2UNCkhhbmRlbHNyZWdp
c3RlcjogSFJCIFNhYXJicsO8Y2tlbiBOci4gMTMyMDENClVzdC5JRCBOci46IERFIDE1MzgwNzYy
Nw0KLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
