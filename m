Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81680C27C53
	for <ath11k@archiver.kernel.org>; Wed, 12 Jun 2024 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XQ81uY437FHGRov8qz+u3pQfV6TVsL6xeCBOx9vQGiM=; b=s2JVQzJM/ExTa3ulikRU8zsRsC
	GPoDR+/WYw1hDqTrzQ7KFZzH0zqLU0CrIOhuL0AFLsxVA5807GBZB9qhQBYZuIfZ3/gIfUeQaJbJE
	NIPuEEgo4kaB780IpEapTsCMLFxBmC3zrja1CWzfbvDDnao+d8CpgQV/8pkYf0aNHChtkTJNP3g4i
	3PSMftN96Y7knXXxxwwzAlQhNJQlBz0IqilLM5dzhFvft712x3JY0UXrVYMIDyKUQwX4ct6SBJLho
	KmgfWx55wABVUFAGyrdMCl68d+ONrfbxmc11R4PG4RMcU8+HVYIcLBDFojzuj+eGJWZ1Rs8Onmlow
	JgB+45vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHMRj-0000000CTy4-1FX7;
	Wed, 12 Jun 2024 11:47:19 +0000
Received: from mx07-00644e02.pphosted.com ([143.55.146.6])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHMRf-0000000CTxD-3Zhq
	for ath11k@lists.infradead.org;
	Wed, 12 Jun 2024 11:47:18 +0000
Received: from pps.filterd (m0327078.ppops.net [127.0.0.1])
	by m0327078.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 45C10msb004984;
	Wed, 12 Jun 2024 13:47:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	external.marelli.com; h=cc:content-transfer-encoding
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pp2022; bh=XQ81uY437FHGRov8qz+u3pQfV6TVsL6xeCBOx9vQGiM=; b=QbWI8
	IkYr+Nz2oAjDyWjS7PgmcHGKrdfBydYQCEChwk07HFZCtFGxyRPFP2FhuDJweYTm
	A02B1NahaFw2kY4s5luu/jACqHTU9N0OsDw7y7hWxTVHH5U8ud3A1PPMoj3twR5A
	cRbisYCf0/E/MEskUnhg2iiT5lxB5RSWwAdsfn+/Am1zHmxESb3VRa08vNRITV8y
	DXXYcpH0ey4QZSg9mQbaToWPW0mflDrzUkXaIxIf112nBFbY/+ePy7F/qj6USTf8
	rBOZZqTMAe4znA1X2nf+3HhjzL2EVHIxigArEIvjTln2R06jB4OsyuHVh9X3HyY/
	o3pD9HdpQV1hK/c6w==
Received: from apc01-tyz-obe.outbound.protection.outlook.com (mail-tyzapc01lp2040.outbound.protection.outlook.com [104.47.110.40])
	by m0327078.ppops.net (PPS) with ESMTPS id 3ymba4guq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 13:47:00 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eylTpW1ckcrwm/lvWmhw7FViu5dO+L8nCG6+mBVXrhvkM5rq0wuewZ/3eH0Xswfg2n0nMlgShLx9QNZnY1q9fL04vv/268vb8hQ/ZgZDadLYE+P65Ki6KN7MsgGcosWZtP6UfWa1cuBjmO4imvZ10b2p5kDI7fI3muAgP75XQCW679UQerwN2MNSakyTkSopiEtZgO4D07ld6WtThQFFAk22mo4JCUUEyvpJJioMFJD6+GjauCZ4liI2PNayShSdY6YPlVZ/CgvxIPy/l760ZCAkyh0nnC/ZqYvmT0v4HuivPHIgSvdWBBXwTMBlI7o6L9A37lIKDBz4wjQVqaYMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ81uY437FHGRov8qz+u3pQfV6TVsL6xeCBOx9vQGiM=;
 b=cRJELx2Tp90L8odavwxt4VNGtLLKrH1RUsfW459+egDnCSCI1MqMeoIfz8gZCF6DEZ68a2Ppcsa+lxQHOdIqoCusInoIALEIDMOl7DNE4BC1h1sHE9u9oNbQf5kpG9SjnmR5xFln4vKL+R7z49WPg3bX2gSv79ckywMZMi/uTyK5EfWdqZ/xSF9p3vPd4U9l9RGHnwY+aXC0cwtmoskgYTVWVioDsVeip6FmALub763TwMzB5tNbJFKLwzktgOmq5gHNlsArbfgsjUp0T2BX3N4a2r6F8lRnvj2P317bsPB4XEm3vbiQHtWKHsh2P8U5Brewqii3iEBmGc2enP5nbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=external.marelli.com; dmarc=pass action=none
 header.from=external.marelli.com; dkim=pass header.d=external.marelli.com;
 arc=none
Received: from TYZPR02MB7247.apcprd02.prod.outlook.com (2603:1096:405:3a::9)
 by SI2PR02MB6085.apcprd02.prod.outlook.com (2603:1096:4:19e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 11:46:56 +0000
Received: from TYZPR02MB7247.apcprd02.prod.outlook.com
 ([fe80::8840:c8f8:f3bc:a79a]) by TYZPR02MB7247.apcprd02.prod.outlook.com
 ([fe80::8840:c8f8:f3bc:a79a%5]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 11:46:55 +0000
From: <andrea.marcer@external.marelli.com>
To: <quic_rajkbhag@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <kvalo@kernel.org>, <quic_gsaminat@quicinc.com>,
        <Dennis.Damore@marelli.com>, <danilo.sabato@external.marelli.com>,
        <giovanni.ciaramitaro@external.marelli.com>
Subject: Re: [PATCH v4 0/4] ath11k: factory test mode support
Thread-Topic: Re: [PATCH v4 0/4] ath11k: factory test mode support
Thread-Index: Adq8vifBUZ1gjoKjRd65F3ksLy0zKg==
Date: Wed, 12 Jun 2024 11:46:55 +0000
Message-ID: <TYZPR02MB7247209AEA8B450DB501972ACDC02@TYZPR02MB7247.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR02MB7247:EE_|SI2PR02MB6085:EE_
x-ms-office365-filtering-correlation-id: 2b44c245-e933-4d72-580f-08dc8ad55bcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|366008|376006|1800799016|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?MwWQe66DYhsd1Wlqj5uGFg5AQ19Wem/PkK0D7v3JItSzWAfi5/ubosejlalF?=
 =?us-ascii?Q?U3RwdG0BiRAWm2KCzROVwtrAAo6PORPujszJXaYJKLEQp04N42AOPkvV3sKz?=
 =?us-ascii?Q?oi8+pK9THcwo7BpcNjUKbZzuExVS6+XuutgOFwduP9/vboaRE3vRal6LnD6+?=
 =?us-ascii?Q?r/FqUnlRwA8O5ZX5eeMVMuLDrc8Ks2HTDztRR4kNN5rZNBmCvK497AuDho4P?=
 =?us-ascii?Q?O5JlKMzHVarxSAjLRL6Zx5VUuP96GBKvQc/vUw+UfB9f7sV8rEPUd4nhPcot?=
 =?us-ascii?Q?HlP4WnFMnHA/957699+/ZQUfJRXhA0qXST+DuGC+de6iqk8Ng3smFkFAXASu?=
 =?us-ascii?Q?wwdnxVAbXaR2WhDI+NjjMnOdsGnvScdQf1IEklv81OJSKHlFiOo6NSk4HkZN?=
 =?us-ascii?Q?lXt6OazPyiNdWUNtCgYxDNKuhD6/9S6xaU0qQ3+Wkb2Powh654Q14Ugl/RFj?=
 =?us-ascii?Q?sFShAomv8QGIqQy+xT1ylaH5D3FvK1xerPSnOZjcOvEzXDgVOxW5xGlvqKZq?=
 =?us-ascii?Q?ueWkUIpA3hUCQnDMLK32+Zpoglz2om5Bi+mh/OLDumqV4R/T+jJlnVfHkVCh?=
 =?us-ascii?Q?yzAA87FBrzuNKtDzzYZuSuOJrLBxIStWYYR8W1vFwb7Ygk2jXZJy5Tf8vZVh?=
 =?us-ascii?Q?KgUXFmzvyPp+pYqbcKxiOCVNtnsc+qTmPXgVJH/lztObS1/7tp/dUm80a9m4?=
 =?us-ascii?Q?1+Xz1Q4nf45RwLCGJ6vIPqGyc089ZjN7mXTct1YfupcnTB5AIKswREfiPy7n?=
 =?us-ascii?Q?1kJexm9WhmgpOSSSyc4NwvRSxEfdPqz8gDO4WcsEplsRtMCVt4axFSPCwbYn?=
 =?us-ascii?Q?Xdw0OgA53KgChDIUCubwaBTxqzK2km1k85jwRGtkUuh3Fmk3diIZ0TlKraj6?=
 =?us-ascii?Q?UL0DIBdR5uJEN1vpYhxzTSSe2KlpxCbBE0MIeODMqEh3G0+M2l4uYxU1bu+2?=
 =?us-ascii?Q?TKWQdunbLpZ+jU0VADRBqs8jJWJORfxOhMnhvj9GYSOaCNgB22q7xFqXe81O?=
 =?us-ascii?Q?IVIcpiKyzkUlaa1jZUMr46/oAR+B2u++p+LvIsbLj/k2qlzS1maNNQ9BBDD9?=
 =?us-ascii?Q?rY63XfW8vRI/CMPHimtzk+86v3xU4RXBvo4XO595JXd1kxy82Jf/olq32weR?=
 =?us-ascii?Q?SLqrx1hcpan7rAd4qxU0fD53Ldg7p6eMbs+r4s2qXLMiTv0Q/Do/P3XJPIr9?=
 =?us-ascii?Q?JdY4UB231CU5HyZMt+1JerOeu3StQTygmbtD7j46b8K66KiQnR4U96FPARKX?=
 =?us-ascii?Q?1wgsgmOT1Y9LBr7RsRTQv1qdCwsmJ8MsH4DPDb+L6NrnpSEJobr4iBU8rEYJ?=
 =?us-ascii?Q?81KvNmk597IkTTPqoeazLgQF4QVphKHLFoHxzVAB+/mnPVsY04lPQNS9pF9I?=
 =?us-ascii?Q?I1E11y0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR02MB7247.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(366008)(376006)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fNrfj8txgz9XAABKa1ZHV5CWBZaUFZSnXWZo3CqJYkyJYC+JIOWn9PT8fLrn?=
 =?us-ascii?Q?a8FhQs86bs3zq/qq3Q8zK4530jv21wi4MnP1fRGCmyksMQkUISwIppPI+/no?=
 =?us-ascii?Q?yCpEBrxKceBSlEnxOxEYzgYHNREsyMRbEUbDwV9FM2o2g4dyt/t4YI9cvAXY?=
 =?us-ascii?Q?zNtYt/x2dr4d1SofkMKmujjFPg8iKUu47jZm3d2jiUJ5nLAzl5S9jol8UyVR?=
 =?us-ascii?Q?zzIhEA8Yp9tX7eMDfQ1jvh48MMq/MC7Z9833+Em0CY5LarIiDqpcLL8zwwzT?=
 =?us-ascii?Q?aAq4FNPmGgRnxvNIwMH2YKzknVecXmpQPUBhdzM+l5lKFGqCYlP+EZqAuh5h?=
 =?us-ascii?Q?Gu2Gh7xmxWyYHSXSNU6SDKg98B62zG6Ynmfphv4WKEOmJL3YOhKFp5iURHE/?=
 =?us-ascii?Q?Z9Ztpv00Di/rdlW+5xMiTVxFcJr1STiBx29UKDvwgo4OGT/feyz4ne1K2kDH?=
 =?us-ascii?Q?C6vvxx/p09mKxqNsfVtOLyTdZ2KYbcrLPHBkfcJ7qDmHJMS6Lzk9TOauh335?=
 =?us-ascii?Q?bwZ1lHs9qBv3edfqZVehiH4tBil52P7Oa1gD2uJsATC7jOafOqj2jTxYPAal?=
 =?us-ascii?Q?9De1qbclI1I0JHHOm+OIhN6XiSMvsHx+MneKIPdlLmsPZqvOnpRV+VjZBf+A?=
 =?us-ascii?Q?6+eK6511O+YhJ16TSiX2miRqkf26oQObcQhFlHKQiB6qs92B+YXVWQwzXCgW?=
 =?us-ascii?Q?PUkz/3G6k4EnsoGk6RpR0mcP6Lfahxeje0pY2g4NyQbMTNIRjRJGRVvqCWmc?=
 =?us-ascii?Q?AohXcTt3UAe7Nem4w9dYmzAo+cUpsTXfcQ5WM5iOf54k8TpeKyYqSr7TWMMJ?=
 =?us-ascii?Q?3R7/YaNWM56Nk/jUd1wdrhRpi+g057sdUlKcDozL1StBYcTujeFXjcS2M+Ge?=
 =?us-ascii?Q?RUchPvIoD9wckNGlxymwEpZxPUi8DRJO/Pwv3AF4ivTBvpjK6dMQOtY4p4eW?=
 =?us-ascii?Q?mmiH02qMLfbGtCf9Ut+R/n9DG+cy1Iqp2kAqvtsH5BK4DYHK418P/+DLSP9b?=
 =?us-ascii?Q?NbksBR0YnNbaYe/ahzFZnhPL/74rFqVgmN6pWaGqjIplCr+rQBfM6JewnCpz?=
 =?us-ascii?Q?wag5vMI8/RFPuUHrHJti54tjq2WRgiEMD+/5dm64KdlCAvfA8nsVnZNt+P75?=
 =?us-ascii?Q?mrqAs2DiIDvteT48bZG7pnAXTMhRCLoRTIbmztWOYc51T/T8pk113Bb25I1a?=
 =?us-ascii?Q?A2rl4E4K0BD5Sjmh2/muP1917doMn8+UOWTv842X8RKV9f5hmX71+LpFDPas?=
 =?us-ascii?Q?+LwA0/795eApQg0GeWXJYpsPTYPGeREFddCsW1hecHIygY+KLWbm8eQY7Pwa?=
 =?us-ascii?Q?kJZODExOuA3kPZt47eoCFTs0A7+T9hx5Pda9x57UoO5EKnslHR6t7wBx76wb?=
 =?us-ascii?Q?Il59d9Ux2wa+pL8UFogkk7f4gtSnYxH4RTpw9P88TPkdgqUcIpmDEIsX3AUD?=
 =?us-ascii?Q?Hv66hsoWSBhI5/Gw5aHUjvQSzeIBjI4wFuQP5fxRQIDZIwCgRdyxaGLPcPC3?=
 =?us-ascii?Q?2OsZCg8QIjLr+T1Q/cfl7q1slcxjN/Uau7GF6vWvlxxuWHf7cG60mDZ7cFuy?=
 =?us-ascii?Q?72UJPdewNQvL30r5+NmS3N2ueflqhQGnJqEcIm4pLDF1y/qkyr+HSYP2NWlW?=
 =?us-ascii?Q?Ydb0AXTeMsQZMHqUCDrDuhk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tTyvfAWnCTXr2pT1uu6vxT/sIPEGA+zn3maayZgIgBzvuRSatTqIeGK+icCgyBj9yjsgvBPkuUbbcmq0U6MmXoZ7NCI59vlxQND6cAen3vzTFCehKtANdQZPUG2CivaMNyCzUPXVLWnVWRuVT/xzggtdmo2pkAjH1YOa01lxY9+B7fKFEWBwLlBepwo20Xx4R8GnU+GZsFyrkmPOxhPYK8h0EphmybM2vL8mrdqoeYSg0YNy2+BBkQNNPWARLhV+tQHaX6KGnitV/DB66zbgIscsYVisI/k80WJs+MMipzttJA794Sm2qNPYKmMl3vH0rJDreKkPlKPHuvZAbzO3Ek9xx0vgzNIqK86yEd1AMnScov3VB0ZOc+OKq01F/a/0UsJTShAyhIm+bNt6gIT/Wz2PQYub/dQIr5fwugDBUl1np/Ms1+Z1fsm5WE3qkKYT+ZZH+MqMAMbIlWQKfBGgkZVHdr8NoCE714IrnCxwPmOOLOLSNJg53UAvhXc6IUvEH8J3O/wDMLgBRKD6V8K9r2pKviYGjBa/40C0hn8P1tqwExtEhsDDdTpK8YalCjN5iWnUePH/iCeBMpZhPCheD/CKdYWt7qce1VUExgUHy/CNauqk1eBPh2BUH0rKtkmq
X-OriginatorOrg: external.marelli.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR02MB7247.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b44c245-e933-4d72-580f-08dc8ad55bcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:46:55.2623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6a681e0-1c24-46eb-a657-e25259ad9536
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYm0Xb+izKpUsYqZPWD5Kco1tPThdGZj0U63CE0jvC8bydpYzWx1tH2Xxlgx1f5AJtd7t+uG/2XSwIWEqyxth9yL3ZIavBD76x7MppG1dPPXc/DCfnC2CBgNBIe9489V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB6085
X-Proofpoint-GUID: dlbghcFTamkfmCuJmrTpHx29aol0Vbln
X-Proofpoint-ORIG-GUID: dlbghcFTamkfmCuJmrTpHx29aol0Vbln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_02,2024-05-17_01
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_044716_515458_F5B66C84 
X-CRM114-Status: UNSURE (   9.43  )
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

> Device is booted in factory test mode to calibrate the board.
> The commands are sent from a userspace application, which is
> sent to firmware using wmi commands. Firmware will send the
> response back to the application which stores the calibration
> data in caldata.bin file. This file will be loaded when the
> device boots up normally next time.

I would like to calibrate and generate test signals on a QCN9074=20
chip using the factory test mode. Which userspace application=20
am I supposed to use to perform the calibration and tests?

QCN9074 PCI WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3=20
Linux Kernel 6.1

