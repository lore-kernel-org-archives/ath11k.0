Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F85C4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELqgD8ELhe/vHDndjYbexSNTAtWd24GnzA3d6R/5HQc=; b=Dzh7dA75D244bJwqlbHByaDcAF
	TzE0MHe2TJl97WsC0BmiZ4i9ySaXd+4hhVWsvIXZ8HdNms1r8DdejRNZ7UPVChqXOu96+rpy+ic2I
	R4fj6y/lc4AP5nuruAKhdIFpibad5ngHbbtfMTXXGDXCX0MqUr9VvM4xMPBYSlYevkewC1Kfnk4fr
	TiK+nUz2pqQIEdjve5R/Emogv9n3ecJkd36Q8E3auxbcoZgSzQd3NtyttGhPOyGhrCFq5HXFPiNjr
	tjCY8lOGIgzLNfwMB1DlrpV5EXkIYh+2aV2eQswNJJbpelPOFJUGFNz+sFsOHIOc1KyMnaW7lkk7P
	YiqpXnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ll4-00000006BpI-1CEU;
	Tue, 30 Apr 2024 11:34:50 +0000
Received: from mail-be0deu01on20701.outbound.protection.outlook.com ([2a01:111:f403:2622::701] helo=DEU01-BE0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ll0-00000006BoX-3gfO
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 11:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlQI3eX5rEcCgzvvuuP7kxtC7o2Luam5q/bk3SQRapFkOCjivV/6ifVVecNdxtVeGWfREevZACMBCtC4KILrxXQnydxuA+ik1k/mKsd9eShYpoRvZJ7nh2MOZlCNrAAYeDtDcbPHELdo1oitpgYTezGQ9DVGHmTFZ/RFD7K/qyB7h2F+XMHiYlEPn0253Jub5SA1Qvflx4rMtZJzXML0gxPJpG1pfwwIYQ2kIn/ZrUIjRJLCmUon/TOePaubiqZiWOcpxhT0DtTbYcmFpa6ztvbZsMZ0NMeiw1ci5NREyGSlWb8J1zI+y1/yXZ1stjDWG2njjr81u/glfaMvQcMeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELqgD8ELhe/vHDndjYbexSNTAtWd24GnzA3d6R/5HQc=;
 b=NI5bobQ7LTmHqvEFPAqUTcaigWxfkxuUgP+FL9wxbE8sRVsScpEWtL8RxY+Iai9qE18xPcq//Yz+OydtGKLM8Ckf0o+f7mAdGi/SlG8u9xMh5bZDDBoKN/qpKKlsLYYLnFXSem8oMZyf8AN4aprMiHLJLRlmu3akOhinHZnbI/T7Ejkw/ZdosXTjILI03VXvYCSF2n2hq/Hk6GQnNbtjb1K4leGppVIY+IqpSGqNxZlq1XMtj1+ZvHZmBK8ZiTIGperbIALCmtIuUGJ+ch8pWUBT1vDkG1WlkVAdc/mdXrr/6HB/yDJhxRNDb3F+u8SrUCgYWk5+azcCgocajBfS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ghmt.de; dmarc=pass action=none header.from=ghmt.de; dkim=pass
 header.d=ghmt.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghmt.onmicrosoft.com;
 s=selector1-ghmt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELqgD8ELhe/vHDndjYbexSNTAtWd24GnzA3d6R/5HQc=;
 b=ihYidovftJ2RlOnxC1re16FWCb4fgdP7GK/xJ9ikTq2UupcayZ2kKOf77RkG966KFcCrxvxR6YHxNnyaG7tBCMPCmAtDfkeHxboiF65FMdNmJu9rVGWmNzqCXpEny+cxJ51npx+jQT5dhX1Qvg2XHFCdPpbrtRt3kU2shCg5+/esCV5Dwu7uHg+GZWTtI0RNktRm7M4F+RGIWbWUo0Gcyh8SMbtu5PlrBFp1cRhLymLIcicqEfb5lk9XIlBSRX5qJ38cn49vsZ1TfQ7Rck+G+UzdMVrKmni1JfGlUkp5+7JMrpDsGLAkwJkDqJkCdJ5jTqZ1LclCmuCjmCClHKSU/w==
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:2::16) by
 FR0P281MB2122.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:28::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.23; Tue, 30 Apr 2024 11:34:40 +0000
Received: from FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::f261:e007:793e:e606]) by FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
 ([fe80::f261:e007:793e:e606%7]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 11:34:40 +0000
From: "Lindner, Frank" <Frank.Lindner@ghmt.de>
To: Kang Yang <quic_kangyang@quicinc.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
Subject: AW: ath11k
Thread-Topic: ath11k
Thread-Index: AdqaRHWavgFFIAlCQOa2l6qTl3RdZQAXOkaAAABNogAAADWlAAATkj+w
Date: Tue, 30 Apr 2024 11:34:40 +0000
Message-ID: <FRYP281MB0160C7239CB63E4061D4CDB4EB1A2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
 <8ab6d337-1c2b-40d8-80a4-2a1ca4092987@quicinc.com>
 <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
In-Reply-To: <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ghmt.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB0160:EE_|FR0P281MB2122:EE_
x-ms-office365-filtering-correlation-id: 73b6bbf7-7f8a-441e-6b85-08dc69098605
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aUh1SFhCcmIyM3MyZnA1K2ZvUmdCTnNWTnhXWk8zcnUvWnFJc05PcVExdUVL?=
 =?utf-8?B?ODBrdnhGY3R4K01RVHdwWU1HRUNDd3JIQXV6U1phTHVXci9YWUNadktYeHgv?=
 =?utf-8?B?aGFBWFl4QzQ0OUpPbFo0dmJiNzZoWFZ1a3JCQndRWFJMUlRMQ2wvNkN2MXln?=
 =?utf-8?B?eEhpNnRhb3J2dWo1ZERLYzNjZUFhbVluaVFkbGZ0NDJDNVgrNWlvdk1CZVNZ?=
 =?utf-8?B?UDJxaDRBT0JhVW5rMjBGM2VDNFNFdkZKSkNKbW9HUzhnR0Z2VWROaGZLbk93?=
 =?utf-8?B?RDlUVlRjTHNXQnljUEVkZHpCR01DR1p1dTFvNUc2STdOT2g0SEdtZ0VTNmNI?=
 =?utf-8?B?cFlxVVhtM1g3QVFQRk1KUHVSY09QVnNnNUoxczBYSEQ0OENlTkpRQVJUa2pD?=
 =?utf-8?B?TjVPYk9CcndMVW1lNHJ0Q0t6U3Yxd3hpekRlcHdlVnJwclAwUzh6cXF3cnJB?=
 =?utf-8?B?QkJaaWJydWZTODNBcEpNVXNZbDFLWjNIc2ZuSU9SVG1DY3hvSFBNanE5UTJW?=
 =?utf-8?B?OGM1SHl1S2hINGlQc0pVSnNWS2pJLytXUjNpbnRDM1d2bXFkRmJWL09qalgx?=
 =?utf-8?B?L05HaDJKMDdWcnpkMmJKSXlYQnFTNjFRa3gvdDFwK3djRDNZR0p1U1krZHZx?=
 =?utf-8?B?NU1QWHFwOXI5blJBT2VxWHRwZ0hLTlhVMUxCMENEM28xdjFCU2U2L0JaOFBt?=
 =?utf-8?B?d3RCcWc4QVIrQXIyWnRZc1ZDME8vTmZpUFBPcEhQcFlXb2svYzh5VXNUeUhu?=
 =?utf-8?B?Si84ZDRIdlpnRUdmVXVnZ1RNVXZGOGlzSGVNYXJRK3ZLQW5xOFQ3TXREQzlT?=
 =?utf-8?B?aStuTVJzMkdHOE93Q09FMG42UUc2dHUrak9LbFh6dHd5d2EwS0E4b1lNQ0pU?=
 =?utf-8?B?ZU5NRHZpMlJnTVBLN2RuMzFaVVl4UWQwSVRxRFE1K2FNeW91a2xMYnFZTXJr?=
 =?utf-8?B?bHE3MThyajE2UWxMNE1QMnArc09ldG4wMXF0WDBzN1VkS2tnYlFweGN3SlpD?=
 =?utf-8?B?SXVpRkJkc25mbUFtU25hazIvUEd4VncrUjVpMWdOVDNLQVdpcXFDRjR3akxE?=
 =?utf-8?B?VzAxQ1o0a1RXQW9oM3VTaERvRW1qSVpzUVdRSTF5c1JDcXpZcWV3dEQzOWtx?=
 =?utf-8?B?ZzI4NzJLVHBTaWZ1MTBhMXQrU0dmbzA4a04rRVF6a3hFRStLVlpTeHJxUlNj?=
 =?utf-8?B?SkdCdmNQd2JzRlVDVmVuMDFNMTRsTFZDVHdaZ2pza1NvVW5oR0FYbUtuRnNm?=
 =?utf-8?B?YWoxRVhzVmd4VXNCdDQ4RVh6QndTclh2UFZBM2xEUUR6SC9XYUJNV2Z5NCtW?=
 =?utf-8?B?TG5JdHVtN1hob2hpbllWMWVucm1pbHVGS2s2eGc3OWdITUdmYkZzTzF2ZTdi?=
 =?utf-8?B?MGp5VCt1QklxUVptRHdlZ2d2UGUweGNOOEFKc08vNEpQQUtJUURpSDdRWXVj?=
 =?utf-8?B?Rit2UWtvbEhPdGdaM1U1TjJGd0c1ei9WWFJ1YlZQMU5lK3VMeU1PeEVNTklW?=
 =?utf-8?B?T3hVQkhVczNPclJxUjcreURBR1RncmdTb2tiZ2RSZEY4OGRhMWwzUm95cHFR?=
 =?utf-8?B?NmlZMDFKWXQ1WkJJa3pHOUkvWXBHajdtU2RpWU5sL21JTFE2RElibnBGUHRh?=
 =?utf-8?B?RFcyN0x5UDFSYTNLcmxLSkE0a0lNYTV5UWZGZDcwZlordmROWUlSQjFwaFA1?=
 =?utf-8?B?bVZUci9WZlluMlFUb0xpUDFha3BzbjZNZG93Y21jNUc3TUNEOEppMlUyZWlY?=
 =?utf-8?B?c05iOVdwZDFZT1pmazFPTDlNeGNZaGZSRGltSUJGcDIwc0hFVTF4bWxjZnlW?=
 =?utf-8?B?ZmhoNDZtV0N2SWx6TDkzdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVV0Rk11ZklXZVlxV0RIUU11SmoxSzIwSTU0MUQwb2NrSUJMTGVqWFVlR2hj?=
 =?utf-8?B?UXFPZGxUNTJkYmM0eGpEN2YvaTRhNDN2ajh6MXlrMWdzUlM2K3NxbnNqdjVH?=
 =?utf-8?B?QTNsUUptdzZVdTFiNEU3OGE3WCtOMWlpRWxpbU5PeG8xT08vY25VWXVEYjVG?=
 =?utf-8?B?dmFxTEZFbFVRZW4rN2ZjVlhreTVBTUljL3BJNHZ4bWNlbVlsUEZEVndPYm9B?=
 =?utf-8?B?T1BMbmdtUVZpQi8rWEY2Y2RKMk5PQWZYcHdWanJpUGovZmFMd2VEUldsY2ZL?=
 =?utf-8?B?Mzdhem9oamRqNHM3ZWtvRnNyMmFXaEtTdzRFUGFKYzB4Rm1BZ3ZVTkRXbXUv?=
 =?utf-8?B?d3RmTjZEc3NneVlQakZyQU51S3M3ZUswZHZoQ1VjRVpaYTBBTHpFMms5Rk5V?=
 =?utf-8?B?VDZnUEwrK3pFZkNrMGJ3RGNaSldLUlg0b0cxMk4zUXVTOFh6dlhKVG43Tllo?=
 =?utf-8?B?YUZrNitYQjhQU1lJWTNxQStnMlVXaEVycnZCdUIxUUNaUy9xYkRwVWVEMnlu?=
 =?utf-8?B?KzBKVjRtTWw0aS9vZXBOdURHbnZLSU5mV3NuUndMcEJ2MGROdkk1eXNnTUI3?=
 =?utf-8?B?L05wUkR4R0pkQ29MOXZXUkhvaXlrTUZqeHpHM2QwNktoaFh5c3YyVEUvNU14?=
 =?utf-8?B?eXl1SmFNNjdvMmROcXk4VUI0b1I2cy9CY3Juck1PUGhCV05KMGpsMG5rWDJS?=
 =?utf-8?B?Z3JJSS83dUMyczBpU291bU4rTU4yZ0VySTdIZlRtdFZleVlmWVJxTlZaUitm?=
 =?utf-8?B?TG1CVGVMYzU5M0djMVB1MlZWTXNzUERldHdGQ0RaN3BDbFBKRVcxWkRKWUFv?=
 =?utf-8?B?dzVoVW9hVGxwbWFuVElGanlwc3BrdFJLR3BtUHRSY2J3Yi9aVWF0TEI1aEdL?=
 =?utf-8?B?enU2bzBmUkJob0MvUllLVjFkaDBaTkVUSldCWHZ2b1ZWQ0JCVGNIb2dUOXNY?=
 =?utf-8?B?OFg4NjhCM3lkUWlsby9jeXloQUVsQzUveS9Xcmt6dGQ2aDRoV1B6dzVMMXlW?=
 =?utf-8?B?cmV5ejRjcXgrNW5oOTdLTXRuQU5TbzNBS2JCSHdqdEZQQzNORXJJVThDL3hE?=
 =?utf-8?B?cjlVRWlTTWVxakNNbjJwdHRNN1FyMzN0cit2bVpVbWZvbURqZVRmbzdHT0gy?=
 =?utf-8?B?WFpUOCs0anBOQ3QxOHdSbXpUN1REQ1BaOUh1cForZEk0VHFkZE9WMUMyV3NB?=
 =?utf-8?B?aG1CTDd4TVJja1NPeEZMZ2pzKzY0cVRTVy8raFVQb2Nkdnp6aDh3bzVyLzkz?=
 =?utf-8?B?cXR4ZDZ5cmo5Z2xRR1VDWEltOFo2S0IvRnprK0QxVU94WHJyZi9NQUhxUkFr?=
 =?utf-8?B?TE9UeWJ0Q2wvUUNNT2svMXFoazVEd3pTKzNidzRCSThzdGpyQ2xsYzhPVG9h?=
 =?utf-8?B?dklGRmd6ODVYVTE0ME8yQVZtc3NSS0JqM3hpL0RIRDUyS2NvemIxYlFOSEtK?=
 =?utf-8?B?N3N5SjJEYmNobW8rZzV6NUJKL2VJUlVjOUh2bGd4aWhPcy9rU1ovY3FBUmlj?=
 =?utf-8?B?QndBZWV5RHFFd0VrSWpQMGg4WmhaQlRoRTVBV1E1eGxNZjJVeXdDeFN6dXpH?=
 =?utf-8?B?SmkwdUtER1RYTXFxUithNytiVGw4TitsK1pycWpyeFRaNndSWk43YXdDOU5q?=
 =?utf-8?B?dGtrM01CUjdlLzMxMzNOWStRNDRLSENFR3dDa0tBTEQ1VUNLaTk3cUsvZ0JF?=
 =?utf-8?B?cVBKY0dFREYyRzFsQnNiVjJ2Nm9vNVcwQUpDeTBaVHlMYmZGQ3NSZkQvRVJx?=
 =?utf-8?B?L0VCak9jQU8xbnNaYU5iSUNrdzg2cWZXTmdsKzQ2bExxUlZacDR3Nk5EVEZh?=
 =?utf-8?B?dGNibk9NU3MweTNLeXJTaTlvUG9MNXJobEJwQnhuU1VSYmIyRFBuYnYxQlc2?=
 =?utf-8?B?eHgyMEtzUVBRNTc3Ky8vUlpYZGFBcm1SbTRVL0FSU05BV2VnK3dySmZIaWtp?=
 =?utf-8?B?bkU5MTl1TGRuSFNHZ0hQTkd0VXg0TDhoN0RqL0hHdnFOVkxITE1nbjZQRU9S?=
 =?utf-8?B?ZVFDcS8wVmxRclVuQ1oxTjZRVDhyUjhDTklNc25UTEszUHNIQU9PYzNGc1dz?=
 =?utf-8?B?MGJDUnJHQ1p1NE16Z05PNWNpUjFDVUZzRFVrb1BGdVBKN2FzOE92aWZ0K0Rl?=
 =?utf-8?Q?zzBJtropsrG1eJP+b5xpYcRSr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ghmt.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b6bbf7-7f8a-441e-6b85-08dc69098605
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 11:34:40.3806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9223b922-6d43-40bb-85e5-a10749de3853
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvhpyp744LDlUx7MN27oWpx6XOWXtna8mwRH7QFkxr40afHGOmtrLOhKd+Tslj0fPRJRBeleSnR40n+YZlq8ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_043447_182266_062F828E 
X-CRM114-Status: GOOD (  10.83  )
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

SGksDQoNCnNlZW1zIEkgbmVlZCBhIHBhdGNoIGZvciB0aGlzPw0KSSdtIG5vdCByZWFsbHkgc3Vy
ZSB3aGVyZSB0byBhZGQgdGhpcyBsb2NrLXN0YXRlbWVudC4NCkFsc28sIHRoZSB1bmxvY2sgc3Rh
dGVtYW50IHNlZW1zIGFsbHJlYWR5IHRvIGV4aXN0Lg0KDQpCUiBGcmFuaw0KDQotLS0tLVVyc3By
w7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQpWb246IEthbmcgWWFuZyA8cXVpY19rYW5neWFuZ0Bx
dWljaW5jLmNvbT4NCkdlc2VuZGV0OiBEaWVuc3RhZywgMzAuIEFwcmlsIDIwMjQgMDQ6MDkNCkFu
OiBKZWZmIEpvaG5zb24gPHF1aWNfampvaG5zb25AcXVpY2luYy5jb20+OyBMaW5kbmVyLCBGcmFu
ayA8RnJhbmsuTGluZG5lckBnaG10LmRlPjsgYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcNCkJl
dHJlZmY6IFJlOiBhdGgxMWsNCg0KDQoNCk9uIDQvMzAvMjAyNCAxMDowMyBBTSwgSmVmZiBKb2hu
c29uIHdyb3RlOg0KPiBPbiA0LzI5LzIwMjQgNjo1NCBQTSwgS2FuZyBZYW5nIHdyb3RlOg0KPj4N
Cj4+DQo+PiBPbiA0LzI5LzIwMjQgMTA6NTMgUE0sIExpbmRuZXIsIEZyYW5rIHdyb3RlOg0KPj4+
IEhpIGRldi1ndXlzLA0KPj4+DQo+Pj4gUUNOOTA3NCBtUENJZS1tb2R1bGUgd2l0aCBhdGgtbmV4
dCBLZXJuZWwgNi45LjAtcmMxIChVYnVudHUgMjQuMDQpIGNhdXNpbmcgS2VybmVsIENyYXNoLCB3
aGVuIHNldHRpbmcgZGV2aWNlIHRvIG1vbml0b3IgbW9kZS4gVGhpcyBkb2VzIG5vdCBoYXBwZW4g
aW5zdGFudGx5LCBpdCBtYWtlIHRha2Ugc29tZSB0aW1lIHRvIGZhaWwuDQo+Pj4NCj4+PiBbTW9u
IEFwciAyOSAxNDoxNzo1NyAyMDI0XSByY3U6IElORk86IHJjdV9wcmVlbXB0IHNlbGYtZGV0ZWN0
ZWQgc3RhbGwgb24gQ1BVDQo+Pj4gW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gcmN1OiAgICAg
ICAgIDAtLi4uLjogKDE1NjYxIHRpY2tzIHRoaXMgR1ApIGlkbGU9OTM5NC8xLzB4NDAwMDAwMDAw
MDAwMDAwMCBzb2Z0aXJxPTI2OTYxLzI2OTYyIGZxcz03NDk5DQo+Pj4gW01vbiBBcHIgMjkgMTQ6
MTc6NTcgMjAyNF0gcmN1OiAgICAgICAgICh0PTE1MDAwIGppZmZpZXMgZz03ODA5MyBxPTEwNzAg
bmNwdXM9MTYpDQo+Pj4gW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gQ1BVOiAwIFBJRDogMTUg
Q29tbToga3NvZnRpcnFkLzAgVGFpbnRlZDogRyAgICAgICAgICAgICBMICAgICA2LjkuMC1yYzEt
YXRoLW5leHQtajAwMSAjMTENCj4+PiBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBIYXJkd2Fy
ZSBuYW1lOiBUbyBCZSBGaWxsZWQgQnkgTy5FLk0uDQo+Pj4gWjU5ME0gUHJvNC9aNTkwTSBQcm80
LCBCSU9TIFAyLjIwIDA2LzA2LzIwMjIgW01vbiBBcHIgMjkgMTQ6MTc6NTcNCj4+PiAyMDI0XSBS
SVA6IDAwMTA6YXRoMTFrX2hhbF9zcm5nX2RzdF9wZWVrKzB4MTgvMHgzMCBbYXRoMTFrXSBbTW9u
IEFwcg0KPj4+IDI5IDE0OjE3OjU3IDIwMjRdIENvZGU6IDAwIDAwIDkwIDkwIDkwIDkwIDkwIDkw
IDkwIDkwIDkwIDkwIDkwIDkwIDkwDQo+Pj4gOTAgOTAgOTAgNjYgMGYgMWYgMDAgMGYgMWYgNDQg
MDAgMDAgNTUgOGIgNDYgNjAgNDUgMzEgYzAgNDggODkgZTUgM2INCj4+PiA0NiA3MCA3NCAwOCA8
NDg+IDhiIDU2IDEwIDRjIDhkIDA0IDgyIDRjIDg5IGMwIDVkIGMzIGNjIGNjIGNjIGNjIDBmDQo+
Pj4gMWYgODAgMDAgMDAgW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gUlNQOiAwMDE4OmZmZmZi
YTBlODAxMTNiOTANCj4+PiBFRkxBR1M6IDAwMDAwMjgzIFtNb24gQXByIDI5IDE0OjE3OjU3IDIw
MjRdIFJBWDogMDAwMDAwMDAwMDAwMWJmOA0KPj4+IFJCWDogZmZmZjkyNGU0YTgxYTNmOCBSQ1g6
IDAwMDAwMDAwMDAwMDAwMDAgW01vbiBBcHIgMjkgMTQ6MTc6NTcNCj4+PiAyMDI0XSBSRFg6IDAw
MDAwMDAwMDAwMDBjMGEgUlNJOiBmZmZmOTI0ZTQ1MzQ3MDg4IFJESToNCj4+PiBmZmZmOTI0ZTQ1
MzQwMDAwIFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdIFJCUDogZmZmZmJhMGU4MDExM2I5MA0K
Pj4+IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IGZmZmY5MjRlNGE4MWExZDAgW01vbiBBcHIg
MjkgMTQ6MTc6NTcNCj4+PiAyMDI0XSBSMTA6IGZmZmZiYTBlODAxMTNhZTggUjExOiAwMDAwMDAw
MDAwMDBmZmZmIFIxMjoNCj4+PiAwMDAwMDAwMDAwMDAwMDAwIFtNb24gQXByIDI5IDE0OjE3OjU3
IDIwMjRdIFIxMzogZmZmZjkyNGU0YTgxOWZlMCBSMTQ6IGZmZmY5MjRlNGQ1NzVjMDAgUjE1OiBm
ZmZmOTI0ZTQ1MzQ3MDg4IFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdIEZTOiAgMDAwMDAwMDAw
MDAwMDAwMCgwMDAwKSBHUzpmZmZmOTI2ZDFlZTAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAw
MDAwMDAgW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAw
MDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMyBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBDUjI6
IDAwMDA3ZmNjODZkMTY2ZTAgQ1IzOiAwMDAwMDAwODI3MDNjMDAzIENSNDogMDAwMDAwMDAwMDc3
MGVmMCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSBQS1JVOiA1NTU1NTU1NCBbTW9uIEFwciAy
OSAxNDoxNzo1NyAyMDI0XSBDYWxsIFRyYWNlOg0KPj4+IFtNb24gQXByIDI5IDE0OjE3OjU3IDIw
MjRdICA8SVJRPg0KPj4+IFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/IHNob3dfcmVncysw
eDZkLzB4ODAgW01vbiBBcHIgMjkNCj4+PiAxNDoxNzo1NyAyMDI0XSAgPyBkdW1wX2NwdV90YXNr
KzB4NzUvMHg5MCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XQ0KPj4+ID8gcmN1X2R1bXBfY3B1
X3N0YWNrcysweGViLzB4MTgwIFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICA/DQo+Pj4gcmN1
X3NjaGVkX2Nsb2NrX2lycSsweDU3Mi8weDEzMzAgW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0g
ID8NCj4+PiByYXdfbm90aWZpZXJfY2FsbF9jaGFpbisweDFhLzB4MjAgW01vbiBBcHIgMjkgMTQ6
MTc6NTcgMjAyNF0gID8NCj4+PiB0aW1la2VlcGluZ191cGRhdGUrMHhmNy8weDE1MCBbTW9uIEFw
ciAyOSAxNDoxNzo1NyAyMDI0XSAgPw0KPj4+IGFjY291bnRfc3lzdGVtX2luZGV4X3RpbWUrMHg5
Zi8weGMwDQo+Pj4gW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gID8gdXBkYXRlX3Byb2Nlc3Nf
dGltZXMrMHg3NS8weGMwIFtNb24NCj4+PiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gID8gdGlja19u
b2h6X2hhbmRsZXIrMHhkYy8weDE0MCBbTW9uIEFwciAyOQ0KPj4+IDE0OjE3OjU3IDIwMjRdICA/
IF9fcGZ4X3RpY2tfbm9oel9oYW5kbGVyKzB4MTAvMHgxMCBbTW9uIEFwciAyOQ0KPj4+IDE0OjE3
OjU3IDIwMjRdICA/IF9faHJ0aW1lcl9ydW5fcXVldWVzKzB4MTBlLzB4MjkwIFtNb24gQXByIDI5
DQo+Pj4gMTQ6MTc6NTcgMjAyNF0gID8gY2xvY2tldmVudHNfcHJvZ3JhbV9ldmVudCsweGFlLzB4
MTMwDQo+Pj4gW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gID8gaHJ0aW1lcl9pbnRlcnJ1cHQr
MHgxMDgvMHgyNDAgW01vbiBBcHINCj4+PiAyOSAxNDoxNzo1NyAyMDI0XSAgPyBoYW5kbGVfZWRn
ZV9pcnErMHhkZS8weDI0MCBbTW9uIEFwciAyOSAxNDoxNzo1Nw0KPj4+IDIwMjRdICA/IF9fc3lz
dmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzB4NWEvMHgxNTANCj4+PiBbTW9uIEFwciAyOSAxNDox
Nzo1NyAyMDI0XSAgPyBzeXN2ZWNfYXBpY190aW1lcl9pbnRlcnJ1cHQrMHg3Zi8weDkwDQo+Pj4g
W01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gIDwvSVJRPg0KPj4+IFtNb24gQXByIDI5IDE0OjE3
OjU3IDIwMjRdICA8VEFTSz4NCj4+PiBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPw0KPj4+
IGFzbV9zeXN2ZWNfYXBpY190aW1lcl9pbnRlcnJ1cHQrMHgxZi8weDMwDQo+Pj4gW01vbiBBcHIg
MjkgMTQ6MTc6NTcgMjAyNF0gID8gYXRoMTFrX2hhbF9zcm5nX2RzdF9wZWVrKzB4MTgvMHgzMA0K
Pj4+IFthdGgxMWtdIFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdDQo+Pj4gYXRoMTFrX2RwX3J4
X3Byb2Nlc3NfbW9uX3N0YXR1cysweGM0NS8weDExOTAgW2F0aDExa10gW01vbiBBcHIgMjkNCj4+
PiAxNDoxNzo1NyAyMDI0XSAgPyBpZHJfYWxsb2NfdTMyKzB4OTcvMHhkMCBbTW9uIEFwciAyOSAx
NDoxNzo1NyAyMDI0XQ0KPj4+IGF0aDExa19kcF9yeF9wcm9jZXNzX21vbl9yaW5ncysweDMyYS8w
eDU1MCBbYXRoMTFrXSBbTW9uIEFwciAyOQ0KPj4+IDE0OjE3OjU3IDIwMjRdICBhdGgxMWtfZHBf
c2VydmljZV9zcm5nKzB4Mjg5LzB4NWEwIFthdGgxMWtdIFtNb24gQXByDQo+Pj4gMjkgMTQ6MTc6
NTcgMjAyNF0gIGF0aDExa19wY2ljX2V4dF9ncnBfbmFwaV9wb2xsKzB4MzAvMHhkMCBbYXRoMTFr
XQ0KPj4+IFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdICBfX25hcGlfcG9sbCsweDMwLzB4MWYw
IFtNb24gQXByIDI5DQo+Pj4gMTQ6MTc6NTcgMjAyNF0gIG5ldF9yeF9hY3Rpb24rMHgxOTgvMHgz
MjAgW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0NCj4+PiBfX2RvX3NvZnRpcnErMHhkZC8weDMx
OSBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPw0KPj4+IF9fcGZ4X3NtcGJvb3RfdGhyZWFk
X2ZuKzB4MTAvMHgxMCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XQ0KPj4+IHJ1bl9rc29mdGly
cWQrMHgzMS8weDUwIFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdDQo+Pj4gc21wYm9vdF90aHJl
YWRfZm4rMHhlMy8weDFlMCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XQ0KPj4+IGt0aHJlYWQr
MHhmNS8weDEzMCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPw0KPj4+IF9fcGZ4X2t0aHJl
YWQrMHgxMC8weDEwIFtNb24gQXByIDI5IDE0OjE3OjU3IDIwMjRdDQo+Pj4gcmV0X2Zyb21fZm9y
aysweDNkLzB4NjAgW01vbiBBcHIgMjkgMTQ6MTc6NTcgMjAyNF0gID8NCj4+PiBfX3BmeF9rdGhy
ZWFkKzB4MTAvMHgxMCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XQ0KPj4+IHJldF9mcm9tX2Zv
cmtfYXNtKzB4MWEvMHgzMCBbTW9uIEFwciAyOSAxNDoxNzo1NyAyMDI0XSAgPC9UQVNLPg0KPj4+
DQo+Pj4gQW55IGlkZWFzPw0KPj4NCj4+DQo+PiBBZGQgJ3NwaW5fbG9ja19iaCgmc3JuZy0+bG9j
ayknIGFuZCAnc3Bpbl91bmxvY2tfYmgoJnBtb24tPm1vbl9sb2NrKScNCj4+IGluIGF0aDExa19k
cF9yeF9tb25fZGVzdF9wcm9jZXNzKCkuDQo+DQo+IHRoaXMgYWR2aWNlIGxvb2tzIGNvbmZ1c2lu
Zy4NCj4gdGhhdCBmdW5jdGlvbiBhbHJlYWR5IGhhcyBsb2dpYyB0byBsb2NrL3VubG9jayAmcG1v
bi0+bW9uX2xvY2sgc28gSQ0KPiBkb24ndCBzZWUgd2hlcmUgeW91J2QgYWRkIGFub3RoZXIgJ3Nw
aW5fdW5sb2NrX2JoKCZwbW9uLT5tb25fbG9jayknDQoNCg0KU29ycnkuLi5jb3B5IGVycm9yLCBz
aHVvbGQgYmUgJ3NwaW5fbG9ja19iaCgmc3JuZy0+bG9jayk7JyBhbmQgJ3NwaW5fdW5sb2NrX2Jo
KCZzcm5nLT5sb2NrKTsnDQpUaGlzIGxvY2sgaXMgbmVlZGVkIGJ5IGF0aDExa19oYWxfc3JuZ19k
c3RfcGVlaygpLg0KDQoNCj4gYW5kIHlvdSBkb24ndCBzcGVjaWZ5IHdoZXJlIHRvIGFkZCAnc3Bp
bl9sb2NrX2JoKCZzcm5nLT5sb2NrKScsIGFuZCB3aHkgaXNuJ3QNCj4gdGhlcmUgYW4gdW5sb2Nr
IGZvciB0aGF0Pw0KPg0KPiBwZXJoYXBzIHByb3Bvc2UgYW4gYWN0dWFsIHBhdGNoIDopDQoNCldp
bGwgZG8gdGhhdC4NCg0KDQo+DQo+IC9qZWZmDQo+DQoNCg0KVm9yc3RhbmQ6IERpcmsgV2lsaGVs
bSAoViksIFd1bGYgSmFubnNlbg0KQXVmc2ljaHRzcmF0OiBSb24gU2NoZWVwZXJzIChWKQ0KSGFu
ZGVsc3JlZ2lzdGVyOiBIUkIgU2FhcmJyw7xja2VuIE5yLiAxMzIwMQ0KVXN0LklEIE5yLjogREUg
MTUzODA3NjI3DQo=

