Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA3606A320
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BYhpdGmV;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=CCoomCv9;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=GBaqrfdh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XVH4rcumkVcxDyBkJM1ado6j81XRnWBYfNEvEBiEQ+s=; b=BYhpdGmVykPgGyMrTVzXRqwsX8
	iJMpx4Er+UqFgdwH/98EcMoFq5ZToJojw4X3HKj9Z0MzZceiGn+WWEiaTuyHea2+5SS0CZ7ibW11o
	FyA20fSg8unfnKjjToNDzJnWG+XZmuH3vHIjquOoebxksQbEBK7mpTY7LOpSVbQMR0enr4yDeg9zg
	tQsjpOAOIB46ur1j2/DzyP5Xh+V/FvYM2HuBX0KqhSHsQURgYXlLbVpzlZUZNBpdjhz+sLFP9WZmK
	QGPQ5Yn2MpJI0UcqfmUlW077K8mwraLCYYmcqysFgEB9lFhinNnIW37N8grPSj404AQMsi+H1BhES
	QUpI2B+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyOG-0000000BOFJ-1WKH;
	Thu, 19 Nov 2026 09:25:12 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyNB-0000000BNwK-3a2b
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:25:09 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6vbmN459417;
	Thu, 19 Nov 2026 10:23:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	XVH4rcumkVcxDyBkJM1ado6j81XRnWBYfNEvEBiEQ+s=; b=CCoomCv9zkCxg8KG
	cUioS+TgSfL5VOcELQUEBsSbzHkucFI6ejwoF5h6hjPkW7xsyQMj1YGWMPxekpCE
	BCb/J4CRXiYYqplQ9bfbqbSpjrYxOlK/MxbhWtfv0CvR2OnJIaiGmQQEQmSs8uAs
	FnwA9f/PSOeh4cIXKLcArSakdoohZKaUIePcR3NoD2jxh9lNPlCSWUaSiwED7Fsp
	mxGLzuxty/vGcBx+GiAChWsKN2TP9jTf0CiRlNIdc7mFPx1OOLofpvpMBGVRbYjh
	lhxDm2zLojMS5+72R1wyUnKC8iA1Hf1GCBTTG35sz3CkxCYBJy0ayUkK3rn1toT8
	sULqEA==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022138.outbound.protection.outlook.com [52.101.66.138])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qgbgdfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRlbk58hyuRgYdg25UBYkZAoCCRsJxLucwD/kprqTyMi9bC/4UX1IiZCBho43AZxa9n/dY8UidjwnmKHkkLIg8e6Hq9euOaT/hp5eYOQbsRqi7kiefMSIDcnpIT5k594U91RXnS+HNUFJtDJkNedbQuelSJraPlWvQnXgU4s9v+Jo5m8aRfBDqICIrpN/uphWdnoXzFvG5DFfqnSBod9QW7usnzs2I7wMrLdv3YV7ytH2kf1vKj8wefZgAtOJyeqHucx0xJDD+MR0KSOt25OQkDPhfDiTFFt0fpNxTrJBrDnbD8viR9jMGWvGVoGVjV5lhedE6AsL33rBhB6RKVAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVH4rcumkVcxDyBkJM1ado6j81XRnWBYfNEvEBiEQ+s=;
 b=b5TTNsAeM2KQMtVVuqfJjm73REF/wL/fz0IJqw/oMHFpwKzSBZAE6PN2orLterXqNidCzOP88novOQnrW2jG+auYbScaCVbOVhvMozw9hdkdrkDEbgqK/Sltv47g3L+DJLGeP+0CZyqHFD+vq8zc5Xnb+IfcPevYGDvS2orGy4M1GlZkbX9oNl6t0q7rhwZsgtAZKNyXU3t6Q4EFcQVPJfd4QwR1c8OiM5S9MZ5x0NGhC6MNdHLjzoR1UkK+IknRAaaKjzaN9228ISzhnSYD6d/i4dyXFujfmF3PjGuMnS+t3KHpzK1qtYTwALT7Atkk4w3kIeh1D1le9ZOVPYpM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVH4rcumkVcxDyBkJM1ado6j81XRnWBYfNEvEBiEQ+s=;
 b=GBaqrfdh27/BGJkcWKn7VZr3LXTiXny7ZcxDWeiG8jKezXawdgmUZ5TFY3bV12VqvatoedhNE2//BvoOpMPhSzhVpjctMFYo63X3F5XZsTvViODGh46DcjDvxCOz2fNHdaLRRPvabpsRvZWlDsBzcrPwMDN7oKgrrB35nXXHSKI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:56 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:56 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:58 +0100
Subject: [PATCH RFC 6/7] wifi: ath11k: convert WMI and testmode messages to
 little endian types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-6-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: GV3PEPF0001DBFF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::31a) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b58280-1f37-4ddd-a68d-08df461ed5ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|261022115727099003|4143699003|261026130827099003|261026121527099003|5023799004|11063799006|56012099006|261026140227099003|261026135527099003|261021130227099003|261021123027099003|261022105027099003|261021121427099003|261021133027099003|261022075727099003|261028144727099003|261022113327099003|261021135927099003|261009223027099003|261009221727099003|261009223327099003|261009220027099003|261009221227099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: PwgPepwBVK0eyHbetKUlK4LErdWvQsqjpx+HiEGluSgnajMChfb5asTFbM7r9YDyTdNpa29tkScFYCkbO0kVTd4Ky0gT4wcl0S7WTsYDsAt6OP9HSOgTzZqG5GdwyXimmGtW1isPlFcAcJaQqRWSquZ1HB/ois8/rr1JYLbuNGjUY7to43b2JrPUbvfU8iqYZBAaA4ti4g6A4H/W0D2QnuCno/1W8H5CrKtA96mgNbov1I4NGaN8+yzjGRZZdAjEDeN2mjudYJ2kofRrsoVr+db2xCaLQROSi9UmKArlnyr/qe/dGmhUK+Efj1BjjyuTR6QVgbldHKmPGuqfNbUjJty0UAkTXkrNDPoLKVbGRWTyz6UwttN9PK0q9UfiFPgEUpZxepz41qHDXLmVfiXmD3MPobE7ESxtumcAgzSAcmPOTfGQ6Ajob3THEeNWa/MzEdLut2qc6+FtvPessA3zX+Rd+UbVoTI+E0BH6VrRiQtJNGl1ZEn5DNbP+f6vl73h2k46wfwL+7qF/4kzR/doP5Lbhe+7qR92WP4Wf40y1vzhr7Tyna/hdrz6SygSWepRMRkiJj3LAnLy7kmXyOmC7wC8qutp5lmC/2T16VnqigY7BuMyaTXD/JYjFW/qAPFp+oN/p5Du04FnfemOfHvYWUwbAkZnhn5lha8K8c7SlYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(261022115727099003)(4143699003)(261026130827099003)(261026121527099003)(5023799004)(11063799006)(56012099006)(261026140227099003)(261026135527099003)(261021130227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261021133027099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021135927099003)(261009223027099003)(261009221727099003)(261009223327099003)(261009220027099003)(261009221227099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWxjZFVsZXdzdXErRDU2WmVsbWFUSXpmZXo2NFZqRVhwZjlQeU1NQmE0MlZU?=
 =?utf-8?B?SjBkL3pLcjA2bFF4NEJ6VjNvNWxsUWVxMWpZVTRDKzNxYmxhMFRHZkRUQWNP?=
 =?utf-8?B?REFCYWc5eFQ4RittWm9XOUEyclhFUUkxOCsyT1JiWkxQbzg4c0xUWkRJOVl0?=
 =?utf-8?B?WWczd0NmNzd3TG01TGM4MGpyRWVVaFFBdURoQWY1MTZZaUhIM09ZaEJqSXpK?=
 =?utf-8?B?bVJvTk0xZEJyTE9tcER4b3hqNHFBaG9rOVFTZXphUVNpaEY3aS9XWXArbnFH?=
 =?utf-8?B?Y244NE5pdzhiWC9TWWc0TE0yWVZxMUpsZEwwb2dpUmtJRlZ0L041eVhnTzVn?=
 =?utf-8?B?ZmFtUjRjdWliamZRcHFrbGU5akhQZjJmWU9STnNLVkJKc05DUVVNVXlTQWxh?=
 =?utf-8?B?aFV2Tytqc3h2VStmUUZMdmlGVW1CS2hvalI3RXdBZlJ6Z0ZEUGlEc1dzU1Z0?=
 =?utf-8?B?cGhxaVVpWDNBWFV4dkR1MnpnaVVjWS9UVmZQOWU2WGJNa1lhR1FSR3FqakJN?=
 =?utf-8?B?TkxjYXRWNVJNaXYwL1pSSGxnSWV1eXJiQ3QyQ3V5cjk3V2w0OU5Pcmt2T2d5?=
 =?utf-8?B?czk2OWZkZjRaMTVGeS9uVEptWUVHcmxzMXVPNnM1V1hhc2c3ZXM0djh4M2Fn?=
 =?utf-8?B?Q1M1UG9vN2kvbkRhNldhTG15bXl1M2oxSExDQnpUZlBMSmhreW4rNnVrM09N?=
 =?utf-8?B?MVhwRmdxaW10V3p0WkVkKzFxbVlLL3Azak44VHljYisyWHpQRFgzUkE5ZEdQ?=
 =?utf-8?B?VEdFd3Vqai9leEZENWs1dG5oMDRocjUzT1dRZW52blZ1MmZnN3VUQWFkWVEr?=
 =?utf-8?B?VDQvWU1waUQzWkVaVDI0S2NBU281TGFEbU0rQi9MTnpBWFBreGF3ekhjdDli?=
 =?utf-8?B?N005bHgwVS83ZTVoMnVtcGJhbWhJUVlzRm1uSWxONkY1b3NzdjJ2cndhQWlq?=
 =?utf-8?B?RzY5NTZXQ2VVWmhQZDdvWjdVUXdsMTN5L2xSYjZGdTh5NDBzNDFPQlgwTTQz?=
 =?utf-8?B?NHV3ejlOZ2NnL294UlNSb1ZhT1cvdkhYUU5tVGdidU1sMGk1OE9oTTZKTFN5?=
 =?utf-8?B?SGtUb3F1eE5yVHhUZGcveEdEK2pRWnMrekRFOGhVMjBEMDAvRThnNjlrYVMv?=
 =?utf-8?B?MitGMk0rTUZjWTc1czNxUmNISmgxaXkzWHBCM0FQUU9UWHowajUvUFV1T1Qw?=
 =?utf-8?B?ZU1abmdlR2Erd0lTVHNkNTlNcTQxc2d2Y29YKzFvbU0xL2M4UHZHU3J6TThw?=
 =?utf-8?B?RlpaWDlIS0VOdUZocnZYbUJWVnJDcjErTWJ2YTZHZEVVZEVqbWpZT3JnWmVr?=
 =?utf-8?B?SThTdGdwVEExTGRRc09mTDNLSjQ4Q0xGSGlBbnhHenFsV2RwVyswNlFPSFB0?=
 =?utf-8?B?OXRBSkZzZVY2SU9VZVFaOGx3aUxLU0dleDJiNVNUSmtqb082bUt4KzNZVHVz?=
 =?utf-8?B?VEZyMk5Pek52Z0JJdHdJVVlsRm1kL211MkI1OFJsWHBJd25DTy9oSXRCV0g5?=
 =?utf-8?B?OWh2akJoU05PNjBKWE8yRmx5UDVvQ1hsSGM1RjJSYW02aEUyUy9HQkF4QkxE?=
 =?utf-8?B?THFrZFZHNEsyRE05Z2k1VzcvMnpmUFFGTjBkSkRqS0xkUmp2TzMwdzgxOW9G?=
 =?utf-8?B?ejJzZnlsR1hKS1lXQXJyR1RFSlBPbHoySjFuclBYTGt4anJkQWVJbFlPMmw4?=
 =?utf-8?B?TS9vUmxJVm1yaTIzLzIzUFA0TVpMWnM0dWpGMHhvc0hsQXFmcVovaXF4Z1hp?=
 =?utf-8?B?VDdWVzN0NzRHWm9OUmk0eDFjWjdDVFd2aHhCaWUrRm5FVFAvYmtFaU5PcVFE?=
 =?utf-8?B?Y3NOc2hqaHpRT1V5SXhQamYvLzU4VUw2Qmd3dnQvazVVN0UzaWdYUzdoVTlW?=
 =?utf-8?B?UDAwYzcyQWhaTTZSRklUUTFBTW1HaE4wUlM2aWMwSms5U2RPU3RhSkdTMmp4?=
 =?utf-8?B?ZUpqTzlsRk5zamRBZEdYb3YyZ1dHdE0rU1o4a1ZiMlg3RXR4cXEySHZGMWYw?=
 =?utf-8?B?SVRXenVndXNVWEM3cmVER0o4RHFMaGtGbWFqalp4eG5FVzFvblhhSkFFc1pE?=
 =?utf-8?B?MmdidWpIclFYS3hjM3Y2cnlYa1lpVGFkZGsyZWNlNmFWY0dlLzV1dGpLSXZG?=
 =?utf-8?B?THhwcHZDMkxZS1ZpTEQ5NDQ1KzRscERoN0lDc3F5RDBzRDlMYTM4cmpNSkR1?=
 =?utf-8?B?aVZqM3dZdi82TTY4SWFNSEFsM21LUm1OMmsxV0V2WS94RmdYV1JJQW5XV2NW?=
 =?utf-8?B?YnFuMU9NUDlqNmxhTk1uNmF1cDlldjhjQ0tUNllQNWpCZGFhT01jTWNTbkxz?=
 =?utf-8?B?bkRXVDBCUkJlTHRGVEhCQitkUmdQSldpT3V0TjhGU2Vpb1N4SkYwUT09?=
X-Exchange-RoutingPolicyChecked: lq4xozA5dOTAydbgbC7GkwRkiVxdLOzL+Bx2Wi4HYL5X7mgCDHp4nzqGw5JglFlTh8Sv/1Gfqxfq1U1b+gnQNq21IbBluc9ijV6j2nSpakemsjlqEKxwsCa1bJXgnhogo9yvrFfDfUTAhv07Z9fVX2YACDNTRLvZOXZTByI1zvNLRa/j9rB1tOHncFepUVWMr/obs0UoD4gSco6zQiTwdwsRq3UO5qkfrCF9UN5wungW8oE+SjwTJr9ifyGyCF0PyK0EdhwIufOjiuWXp4dG1U1viwT7nsclphPCjUOUikyM7Q6CwHOFypZOtFy8h+Qvlk91ueV/KnuHQbdoIKnn5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sXEukuiUEVXQtqPD+/HeLUjy0+1imoRGdgeWUaqrolfmlvgP9n8nI7Hz2uiosoMZ2VKB2cRNr13xLUYDMnhvZ0cRLHRRgDDOJIEAJr3zaWCegJdtb8GOTT+sl9qPys8ekGraTu+hWCIqJ+TbmXi/nL5kUp9X0OfHIBdb3EMW5qYwkJtjohvOfUvpSClGuUBy/qdP0Sjo8uEUsCW5DhEPh9oaXmOuxynnYR8PCXhyFk2GMS9rrpGOa6W3QUjjI/bByi03a6NP9TFKesL3jcjfCvZChH+tQhqgB8mE1FY+29ibb/rFazfVCqXFajo8gWN4rpBL5Gj722Ks4YbcqcS9YwqYhLmm2x/lOXUY6Gt8ysIMq3eBuFwcAdt6o6cBn/b73/MBFiXMcOhDF7eI4ULilNBS44WyzGzCyMXnXtoi/po0qnmk4hdT/7HbLBL1ZPYR1SpUPYh6laEj+CilefI6GwyQeOuX5c6P0lL5rFEyqxiaJIkw4X1BcMHLbbWNVOqcouh++gNCHYlsjpqhrCPwb2g/yUrd7jAJtSPYZsheKBsKQDg5JsEhALS5fMKFR7Y4Ye/mWvSphW3gfgzTduWBs+r3smQrXUFMwXPKGYEw21GPy3WKC8sTSeA68/ml58V4
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b58280-1f37-4ddd-a68d-08df461ed5ad
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:56.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1K0g0D4A3AI2/gsFacJE48R/anSmdW73rMVynBxkf1jfFh5fdVOLJJpuIl1/18HMtX/JZQFyG0RClFFTGqmcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0893
X-MS-Exchange-CrossPremises-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission: 
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3P192MB0893.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-GUID: ywElFX_Y9LN3vCrUranIQnyDgiZGZzfC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX2G2Bg/wAeRcR
 j3EvZza/TrP3FnfSZqXGgEg+7GQrqQB9oHPpN2depbAobTCIdnlq/7ePn9z40IT1qkkCIbaTFqo
 GagG9rohYJsCZ5gGnOyZK+LnjJ2o/oM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfXzkSpnNxnDxIR
 H1C1fak9DQ5liqjAEs1wxegYgFIT8CbdH6upTfEaVssUkDVJZ7+nvwNDWjLCN8A+w4p7dmxhn1R
 CBzi2yJBw+yWJpzHRfqc4STJqaAkigbcNyPjfHQSaOztZaR6HcgGotHqx90EQXeAv06bu0Cs7Rh
 89sPRnBmwV+FujbFeQsZhnHZ0Nhq/+DLjjG2m+4qKO/FpWCRZ7GBrUYr0jEExa6qhWS6RG86TTn
 M19tRgsgma525IVZGQVICb0oCb1+hEVXtrpfj2sy33jqCMh/fvQ+597FUTmdXQo/qgxCNTirwV/
 ULPysBfL7WIkNiG3IuAea43p/Ie3jLWMiuqvwyP79RnD6+K9oMALV7T9JahCJKPM4gt7bCXY+eH
 sBtfkL9ZI327djycEn0WL563wwizjql2UDP5RgZKsPL8DICP40x4a5eonZ98RBAIdNcDkpQNAwP
 ZrJ2DGrzBNJ6P71f7Yw==
X-Authority-Analysis: v=2.4 cv=e6KT2qp/ c=1 sm=1 tr=0 ts=6afec02e cx=c_pps
 a=n0CV6lwIq0xLAUNAo2eDXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=53eYuu71KXXmbFgBLSwA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: ywElFX_Y9LN3vCrUranIQnyDgiZGZzfC
X-Spam-Note: CRM114 run bypassed due to message size (306642 bytes)
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All WMI commands and events exchanged with the firmware, including the TLV
headers and the FTM testmode segments, are defined as little endian. The
corresponding structures, however, use host endian u32 fields accessed
directly or with FIELD_PREP()/FIELD_GET(), and some arrays (e.g. HE PPE
thresholds, rate bitmaps, key RSC counters) are copied with memcpy() as a
whole. On big endian hosts this results in wrong command parameters and
misinterpreted events, so the firmware cannot be brought up correctly.

Convert the WMI and testmode structures to __le32 and use cpu_to_le32(),
le32_to_cpu(), le32_encode_bits() and le32_get_bits() for all accesses.
This includes the users of WMI structures outside of wmi.c, i.e. the DMA
buffer ring configuration and release event handling in dbring, the P2P NoA
handling and the spectral scan report processing. Replace the memcpy() of
multi-word values by per-element conversions. Since the HE capability info
fields in struct ath11k_band_cap are passed on unchanged to mac80211 as
byte arrays, keep them as __le32.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/core.h     |    4 +-
 drivers/net/wireless/ath/ath11k/dbring.c   |   44 +-
 drivers/net/wireless/ath/ath11k/p2p.c      |   30 +-
 drivers/net/wireless/ath/ath11k/spectral.c |    8 +-
 drivers/net/wireless/ath/ath11k/testmode.c |   42 +-
 drivers/net/wireless/ath/ath11k/wmi.c      | 2817 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
 drivers/net/wireless/ath/ath11k/wmi.h      | 2013 ++++++++++++++++++++++++++++++++++++++--------------------------------------
 7 files changed, 2571 insertions(+), 2387 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..6e1dd223a48f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -818,9 +818,9 @@ struct ath11k_band_cap {
 	u32 phy_id;
 	u32 max_bw_supported;
 	u32 ht_cap_info;
-	u32 he_cap_info[2];
+	__le32 he_cap_info[2];
 	u32 he_mcs;
-	u32 he_cap_phy_info[PSOC_HOST_MAX_PHY_SIZE];
+	__le32 he_cap_phy_info[PSOC_HOST_MAX_PHY_SIZE];
 	struct ath11k_ppe_threshold he_ppet;
 	u16 he_6ghz_capa;
 };
diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
index 6ac18f8a1e5f..96a9ad1266d2 100644
--- a/drivers/net/wireless/ath/ath11k/dbring.c
+++ b/drivers/net/wireless/ath/ath11k/dbring.c
@@ -162,22 +162,22 @@ int ath11k_dbring_wmi_cfg_setup(struct ath11k *ar,
 	if (id >= WMI_DIRECT_BUF_MAX)
 		return -EINVAL;
 
-	param.module_id		= id;
-	param.base_paddr_lo	= lower_32_bits(ring->refill_srng.paddr);
-	param.base_paddr_hi	= upper_32_bits(ring->refill_srng.paddr);
-	param.head_idx_paddr_lo	= lower_32_bits(ring->hp_addr);
-	param.head_idx_paddr_hi = upper_32_bits(ring->hp_addr);
-	param.tail_idx_paddr_lo = lower_32_bits(ring->tp_addr);
-	param.tail_idx_paddr_hi = upper_32_bits(ring->tp_addr);
-	param.num_elems		= ring->bufs_max;
-	param.buf_size		= ring->buf_sz;
-	param.num_resp_per_event = ring->num_resp_per_event;
-	param.event_timeout_ms	= ring->event_timeout_ms;
+	param.module_id		= cpu_to_le32(id);
+	param.base_paddr_lo	= cpu_to_le32(lower_32_bits(ring->refill_srng.paddr));
+	param.base_paddr_hi	= cpu_to_le32(upper_32_bits(ring->refill_srng.paddr));
+	param.head_idx_paddr_lo	= cpu_to_le32(lower_32_bits(ring->hp_addr));
+	param.head_idx_paddr_hi = cpu_to_le32(upper_32_bits(ring->hp_addr));
+	param.tail_idx_paddr_lo = cpu_to_le32(lower_32_bits(ring->tp_addr));
+	param.tail_idx_paddr_hi = cpu_to_le32(upper_32_bits(ring->tp_addr));
+	param.num_elems		= cpu_to_le32(ring->bufs_max);
+	param.buf_size		= cpu_to_le32(ring->buf_sz);
+	param.num_resp_per_event = cpu_to_le32(ring->num_resp_per_event);
+	param.event_timeout_ms	= cpu_to_le32(ring->event_timeout_ms);
 
 	/* For single pdev, 2GHz and 5GHz use one DBR. */
 	if (ar->ab->hw_params.single_pdev_only) {
 		for (i = 0; i < ar->ab->target_pdev_count; i++) {
-			param.pdev_id = ar->ab->target_pdev_ids[i].pdev_id;
+			param.pdev_id = cpu_to_le32(ar->ab->target_pdev_ids[i].pdev_id);
 			ret = ath11k_wmi_pdev_dma_ring_cfg(ar, &param);
 			if (ret) {
 				ath11k_warn(ar->ab, "failed to setup db ring cfg\n");
@@ -185,7 +185,7 @@ int ath11k_dbring_wmi_cfg_setup(struct ath11k *ar,
 			}
 		}
 	} else {
-		param.pdev_id = DP_SW2HW_MACID(ring->pdev_id);
+		param.pdev_id = cpu_to_le32(DP_SW2HW_MACID(ring->pdev_id));
 		ret = ath11k_wmi_pdev_dma_ring_cfg(ar, &param);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to setup db ring cfg\n");
@@ -297,8 +297,8 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 	int ret = 0;
 	int status;
 
-	pdev_idx = ev->fixed.pdev_id;
-	module_id = ev->fixed.module_id;
+	pdev_idx = le32_to_cpu(ev->fixed.pdev_id);
+	module_id = le32_to_cpu(ev->fixed.module_id);
 
 	if (ab->hw_params.single_pdev_only &&
 	    pdev_idx < ab->target_pdev_count)
@@ -309,11 +309,11 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 		return -EINVAL;
 	}
 
-	if (ev->fixed.num_buf_release_entry !=
-	    ev->fixed.num_meta_data_entry) {
+	if (le32_to_cpu(ev->fixed.num_buf_release_entry) !=
+	    le32_to_cpu(ev->fixed.num_meta_data_entry)) {
 		ath11k_warn(ab, "Buffer entry %d mismatch meta entry %d\n",
-			    ev->fixed.num_buf_release_entry,
-			    ev->fixed.num_meta_data_entry);
+			    le32_to_cpu(ev->fixed.num_buf_release_entry),
+			    le32_to_cpu(ev->fixed.num_meta_data_entry));
 		return -EINVAL;
 	}
 
@@ -325,7 +325,7 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 		goto rcu_unlock;
 	}
 
-	switch (ev->fixed.module_id) {
+	switch (le32_to_cpu(ev->fixed.module_id)) {
 	case WMI_DIRECT_BUF_SPECTRAL:
 		ring = ath11k_spectral_get_dbring(ar);
 		break;
@@ -335,7 +335,7 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 	default:
 		ring = NULL;
 		ath11k_warn(ab, "Recv dma buffer release ev on unsupp module %d\n",
-			    ev->fixed.module_id);
+			    le32_to_cpu(ev->fixed.module_id));
 		break;
 	}
 
@@ -345,7 +345,7 @@ int ath11k_dbring_buffer_release_event(struct ath11k_base *ab,
 	}
 
 	srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
-	num_entry = ev->fixed.num_buf_release_entry;
+	num_entry = le32_to_cpu(ev->fixed.num_buf_release_entry);
 	size = ring->buf_sz + ring->buf_align - 1;
 	num_buff_reaped = 0;
 
diff --git a/drivers/net/wireless/ath/ath11k/p2p.c b/drivers/net/wireless/ath/ath11k/p2p.c
index 77672099c602..2ac1ce800ca2 100644
--- a/drivers/net/wireless/ath/ath11k/p2p.c
+++ b/drivers/net/wireless/ath/ath11k/p2p.c
@@ -18,10 +18,10 @@ static void ath11k_p2p_noa_ie_fill(u8 *data, size_t len,
 	u16 attr_len;
 	int i;
 
-	ctwindow = u32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_CTWIN_TU);
-	oppps = u32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_OPP_PS);
-	noa_descriptors = u32_get_bits(noa->noa_attr,
-				       WMI_P2P_NOA_INFO_DESC_NUM);
+	ctwindow = le32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_CTWIN_TU);
+	oppps = le32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_OPP_PS);
+	noa_descriptors = le32_get_bits(noa->noa_attr,
+					WMI_P2P_NOA_INFO_DESC_NUM);
 
 	/* P2P IE */
 	data[0] = WLAN_EID_VENDOR_SPECIFIC;
@@ -36,20 +36,18 @@ static void ath11k_p2p_noa_ie_fill(u8 *data, size_t len,
 	noa_attr_len = (__le16 *)&data[7]; /* 2 bytes */
 	noa_attr = (struct ieee80211_p2p_noa_attr *)&data[9];
 
-	noa_attr->index = u32_get_bits(noa->noa_attr,
-				       WMI_P2P_NOA_INFO_INDEX);
+	noa_attr->index = le32_get_bits(noa->noa_attr,
+					WMI_P2P_NOA_INFO_INDEX);
 	noa_attr->oppps_ctwindow = ctwindow;
 	if (oppps)
 		noa_attr->oppps_ctwindow |= IEEE80211_P2P_OPPPS_ENABLE_BIT;
 
 	for (i = 0; i < noa_descriptors; i++) {
-		noa_attr->desc[i].count = noa->descriptors[i].type_count;
-		noa_attr->desc[i].duration =
-			cpu_to_le32(noa->descriptors[i].duration);
-		noa_attr->desc[i].interval =
-			cpu_to_le32(noa->descriptors[i].interval);
-		noa_attr->desc[i].start_time =
-			cpu_to_le32(noa->descriptors[i].start_time);
+		noa_attr->desc[i].count =
+			le32_to_cpu(noa->descriptors[i].type_count);
+		noa_attr->desc[i].duration = noa->descriptors[i].duration;
+		noa_attr->desc[i].interval = noa->descriptors[i].interval;
+		noa_attr->desc[i].start_time = noa->descriptors[i].start_time;
 	}
 
 	attr_len = 2; /* index + oppps_ctwindow */
@@ -61,11 +59,11 @@ static size_t
 ath11k_p2p_noa_ie_len_compute(const struct ath11k_wmi_p2p_noa_info *noa)
 {
 	size_t len = 0;
-	u8 noa_descriptors = u32_get_bits(noa->noa_attr,
-					  WMI_P2P_NOA_INFO_DESC_NUM);
+	u8 noa_descriptors = le32_get_bits(noa->noa_attr,
+					   WMI_P2P_NOA_INFO_DESC_NUM);
 
 	if (!(noa_descriptors) &&
-	    !(u32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_OPP_PS)))
+	    !(le32_get_bits(noa->noa_attr, WMI_P2P_NOA_INFO_OPP_PS)))
 		return 0;
 
 	len += 1 + 1 + 4; /* EID + len + OUI */
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 03af39071839..2e00e5cbc352 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -626,7 +626,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 		return ret;
 	}
 
-	chan_width_mhz = summary->meta.ch_width;
+	chan_width_mhz = le32_to_cpu(summary->meta.ch_width);
 
 	switch (chan_width_mhz) {
 	case ATH11K_SPECTRAL_20MHZ:
@@ -657,12 +657,12 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 
 	summary->inb_pwr_db >>= 1;
 	fft_sample->rssi = __cpu_to_be16(summary->inb_pwr_db);
-	fft_sample->noise = __cpu_to_be32(summary->meta.noise_floor[search.chain_idx]);
+	fft_sample->noise = __cpu_to_be32(le32_to_cpu(summary->meta.noise_floor[search.chain_idx]));
 
-	freq = summary->meta.freq1;
+	freq = le32_to_cpu(summary->meta.freq1);
 	fft_sample->freq1 = __cpu_to_be16(freq);
 
-	freq = summary->meta.freq2;
+	freq = le32_to_cpu(summary->meta.freq2);
 	fft_sample->freq2 = __cpu_to_be16(freq);
 
 	/* If freq2 is available then the spectral scan results are fragmented
diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index 21a85301bf9f..0819af403ac2 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -110,7 +110,7 @@ static int ath11k_tm_process_event(struct ath11k_base *ab, u32 cmd_id,
 		   "event wmi cmd_id %d ftm event msg %p datalen %d\n",
 		   cmd_id, ftm_msg, length);
 	ath11k_dbg_dump(ab, ATH11K_DBG_TESTMODE, NULL, "", ftm_msg, length);
-	pdev_id = DP_HW2SW_MACID(ftm_msg->seg_hdr.pdev_id);
+	pdev_id = DP_HW2SW_MACID(le32_to_cpu(ftm_msg->seg_hdr.pdev_id));
 
 	if (pdev_id >= ab->num_radios) {
 		ath11k_warn(ab, "testmode event not handled due to invalid pdev id: %d\n",
@@ -124,10 +124,10 @@ static int ath11k_tm_process_event(struct ath11k_base *ab, u32 cmd_id,
 		return -ENODEV;
 	}
 
-	current_seq = FIELD_GET(ATH11K_FTM_SEGHDR_CURRENT_SEQ,
-				ftm_msg->seg_hdr.segmentinfo);
-	total_segments = FIELD_GET(ATH11K_FTM_SEGHDR_TOTAL_SEGMENTS,
-				   ftm_msg->seg_hdr.segmentinfo);
+	current_seq = le32_get_bits(ftm_msg->seg_hdr.segmentinfo,
+				    ATH11K_FTM_SEGHDR_CURRENT_SEQ);
+	total_segments = le32_get_bits(ftm_msg->seg_hdr.segmentinfo,
+				       ATH11K_FTM_SEGHDR_TOTAL_SEGMENTS);
 	datalen = length - (sizeof(struct wmi_ftm_seg_hdr));
 	buf_pos = ftm_msg->data;
 
@@ -160,7 +160,7 @@ static int ath11k_tm_process_event(struct ath11k_base *ab, u32 cmd_id,
 
 	ath11k_dbg(ab, ATH11K_DBG_TESTMODE,
 		   "total data length pos %d len %d\n",
-		    data_pos, ftm_msg->seg_hdr.len);
+		    data_pos, le32_to_cpu(ftm_msg->seg_hdr.len));
 	nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
 						   2 * nla_total_size(sizeof(u32)) +
 						   nla_total_size(data_pos),
@@ -306,7 +306,7 @@ static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[],
 	u32 cmd_id, buf_len;
 	int ret, tag;
 	void *buf;
-	u32 *ptr;
+	__le32 *ptr;
 
 	mutex_lock(&ar->conf_mutex);
 
@@ -339,19 +339,19 @@ static int ath11k_tm_cmd_wmi(struct ath11k *ar, struct nlattr *tb[],
 	}
 
 	ptr = buf;
-	tag = FIELD_GET(WMI_TLV_TAG, *ptr);
+	tag = le32_get_bits(*ptr, WMI_TLV_TAG);
 
 	/* pdev/vdev id start after TLV header */
 	ptr++;
 
 	if (tag == WMI_TAG_PDEV_SET_PARAM_CMD)
-		*ptr = ar->pdev->pdev_id;
+		*ptr = cpu_to_le32(ar->pdev->pdev_id);
 
 	if (ar->ab->fw_mode != ATH11K_FIRMWARE_MODE_FTM &&
 	    (tag == WMI_TAG_VDEV_SET_PARAM_CMD || tag == WMI_TAG_UNIT_TEST_CMD)) {
 		if (vif) {
 			arvif = ath11k_vif_to_arvif(vif);
-			*ptr = arvif->vdev_id;
+			*ptr = cpu_to_le32(arvif->vdev_id);
 		} else {
 			ret = -EINVAL;
 			goto out;
@@ -392,10 +392,12 @@ static int ath11k_tm_cmd_wmi_ftm(struct ath11k *ar, struct nlattr *tb[])
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct ath11k_base *ab = ar->ab;
 	struct sk_buff *skb;
-	u32 cmd_id, buf_len, hdr_info;
+	u32 cmd_id, buf_len;
+	__le32 hdr_info;
 	int ret;
 	void *buf;
-	u8 segnumber = 0, seginfo;
+	u8 segnumber = 0;
+	__le32 seginfo;
 	u16 chunk_len, total_bytes, num_segments;
 	u8 *bufpos;
 	struct wmi_ftm_cmd *ftm_cmd;
@@ -441,14 +443,16 @@ static int ath11k_tm_cmd_wmi_ftm(struct ath11k *ar, struct nlattr *tb[])
 		}
 
 		ftm_cmd = (struct wmi_ftm_cmd *)skb->data;
-		hdr_info = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-			   FIELD_PREP(WMI_TLV_LEN, (chunk_len +
-				      sizeof(struct wmi_ftm_seg_hdr)));
+		hdr_info = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+			   le32_encode_bits((chunk_len +
+				      sizeof(struct wmi_ftm_seg_hdr)), WMI_TLV_LEN);
 		ftm_cmd->tlv_header = hdr_info;
-		ftm_cmd->seg_hdr.len = total_bytes;
-		ftm_cmd->seg_hdr.msgref = ar->ftm_msgref;
-		seginfo = FIELD_PREP(ATH11K_FTM_SEGHDR_TOTAL_SEGMENTS, num_segments) |
-			  FIELD_PREP(ATH11K_FTM_SEGHDR_CURRENT_SEQ, segnumber);
+		ftm_cmd->seg_hdr.len = cpu_to_le32(total_bytes);
+		ftm_cmd->seg_hdr.msgref = cpu_to_le32(ar->ftm_msgref);
+		seginfo = le32_encode_bits(num_segments,
+					   ATH11K_FTM_SEGHDR_TOTAL_SEGMENTS) |
+			  le32_encode_bits(segnumber,
+					   ATH11K_FTM_SEGHDR_CURRENT_SEQ);
 		ftm_cmd->seg_hdr.segmentinfo = seginfo;
 		segnumber++;
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08babb0cb534..537848c28582 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -196,8 +196,8 @@ ath11k_wmi_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 		}
 
 		tlv = ptr;
-		tlv_tag = FIELD_GET(WMI_TLV_TAG, tlv->header);
-		tlv_len = FIELD_GET(WMI_TLV_LEN, tlv->header);
+		tlv_tag = le32_get_bits(tlv->header, WMI_TLV_TAG);
+		tlv_len = le32_get_bits(tlv->header, WMI_TLV_LEN);
 		ptr += sizeof(*tlv);
 		len -= sizeof(*tlv);
 
@@ -268,7 +268,7 @@ static u32 ath11k_wmi_tlv_data_len(const void *data)
 {
 	const struct wmi_tlv *tlv = (const struct wmi_tlv *)data - 1;
 
-	return FIELD_GET(WMI_TLV_LEN, tlv->header);
+	return le32_get_bits(tlv->header, WMI_TLV_LEN);
 }
 
 static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
@@ -286,7 +286,7 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 	cmd |= FIELD_PREP(WMI_CMD_HDR_CMD_ID, cmd_id);
 
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	cmd_hdr->cmd_id = cmd;
+	cmd_hdr->cmd_id = cpu_to_le32(cmd);
 
 	trace_ath11k_wmi_cmd(ab, cmd_id, skb->data, skb->len);
 
@@ -349,17 +349,22 @@ static int ath11k_pull_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 				     struct ath11k_service_ext_param *param)
 {
 	const struct wmi_service_ready_ext_event *ev = ptr;
+	int i;
 
 	if (!ev)
 		return -EINVAL;
 
 	/* Move this to host based bitmap */
-	param->default_conc_scan_config_bits = ev->default_conc_scan_config_bits;
-	param->default_fw_config_bits =	ev->default_fw_config_bits;
-	param->he_cap_info = ev->he_cap_info;
-	param->mpdu_density = ev->mpdu_density;
-	param->max_bssid_rx_filters = ev->max_bssid_rx_filters;
-	memcpy(&param->ppet, &ev->ppet, sizeof(param->ppet));
+	param->default_conc_scan_config_bits = le32_to_cpu(ev->default_conc_scan_config_bits);
+	param->default_fw_config_bits =	le32_to_cpu(ev->default_fw_config_bits);
+	param->he_cap_info = le32_to_cpu(ev->he_cap_info);
+	param->mpdu_density = le32_to_cpu(ev->mpdu_density);
+	param->max_bssid_rx_filters = le32_to_cpu(ev->max_bssid_rx_filters);
+	param->ppet.numss_m1 = le32_to_cpu(ev->ppet.numss_m1);
+	param->ppet.ru_bit_mask = le32_to_cpu(ev->ppet.ru_mask);
+	for (i = 0; i < ARRAY_SIZE(param->ppet.ppet16_ppet8_ru3_ru0); i++)
+		param->ppet.ppet16_ppet8_ru3_ru0[i] =
+			le32_to_cpu(ev->ppet.ppet16_ppet8_ru3_ru0[i]);
 
 	return 0;
 }
@@ -379,61 +384,63 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	struct ath11k_pdev_cap *pdev_cap = &pdev->cap;
 	u32 phy_map;
 	u32 hw_idx, phy_idx = 0;
+	unsigned long tx_chain_mask, rx_chain_mask;
+	int i;
 
 	if (!hw_caps || !wmi_hw_mode_caps || !hal_reg_caps)
 		return -EINVAL;
 
-	for (hw_idx = 0; hw_idx < hw_caps->num_hw_modes; hw_idx++) {
-		if (hw_mode_id == wmi_hw_mode_caps[hw_idx].hw_mode_id)
+	for (hw_idx = 0; hw_idx < le32_to_cpu(hw_caps->num_hw_modes); hw_idx++) {
+		if (hw_mode_id == le32_to_cpu(wmi_hw_mode_caps[hw_idx].hw_mode_id))
 			break;
 
-		phy_map = wmi_hw_mode_caps[hw_idx].phy_id_map;
+		phy_map = le32_to_cpu(wmi_hw_mode_caps[hw_idx].phy_id_map);
 		while (phy_map) {
 			phy_map >>= 1;
 			phy_idx++;
 		}
 	}
 
-	if (hw_idx == hw_caps->num_hw_modes)
+	if (hw_idx == le32_to_cpu(hw_caps->num_hw_modes))
 		return -EINVAL;
 
 	phy_idx += phy_id;
-	if (phy_id >= hal_reg_caps->num_phy)
+	if (phy_id >= le32_to_cpu(hal_reg_caps->num_phy))
 		return -EINVAL;
 
 	mac_phy_caps = wmi_mac_phy_caps + phy_idx;
 
-	pdev->pdev_id = mac_phy_caps->pdev_id;
-	pdev_cap->supported_bands |= mac_phy_caps->supported_bands;
-	pdev_cap->ampdu_density = mac_phy_caps->ampdu_density;
+	pdev->pdev_id = le32_to_cpu(mac_phy_caps->pdev_id);
+	pdev_cap->supported_bands |= le32_to_cpu(mac_phy_caps->supported_bands);
+	pdev_cap->ampdu_density = le32_to_cpu(mac_phy_caps->ampdu_density);
 	ab->target_pdev_ids[ab->target_pdev_count].supported_bands =
-		mac_phy_caps->supported_bands;
-	ab->target_pdev_ids[ab->target_pdev_count].pdev_id = mac_phy_caps->pdev_id;
+		le32_to_cpu(mac_phy_caps->supported_bands);
+	ab->target_pdev_ids[ab->target_pdev_count].pdev_id = le32_to_cpu(mac_phy_caps->pdev_id);
 	ab->target_pdev_count++;
 
-	if (!(mac_phy_caps->supported_bands & WMI_HOST_WLAN_2G_CAP) &&
-	    !(mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP))
+	if (!(le32_to_cpu(mac_phy_caps->supported_bands) & WMI_HOST_WLAN_2G_CAP) &&
+	    !(le32_to_cpu(mac_phy_caps->supported_bands) & WMI_HOST_WLAN_5G_CAP))
 		return -EINVAL;
 
 	/* Take non-zero tx/rx chainmask. If tx/rx chainmask differs from
 	 * band to band for a single radio, need to see how this should be
 	 * handled.
 	 */
-	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_2G_CAP) {
-		pdev_cap->tx_chain_mask = mac_phy_caps->tx_chain_mask_2g;
-		pdev_cap->rx_chain_mask = mac_phy_caps->rx_chain_mask_2g;
+	if (le32_to_cpu(mac_phy_caps->supported_bands) & WMI_HOST_WLAN_2G_CAP) {
+		pdev_cap->tx_chain_mask = le32_to_cpu(mac_phy_caps->tx_chain_mask_2g);
+		pdev_cap->rx_chain_mask = le32_to_cpu(mac_phy_caps->rx_chain_mask_2g);
 	}
 
-	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
-		pdev_cap->vht_cap = mac_phy_caps->vht_cap_info_5g;
-		pdev_cap->vht_mcs = mac_phy_caps->vht_supp_mcs_5g;
-		pdev_cap->he_mcs = mac_phy_caps->he_supp_mcs_5g;
-		pdev_cap->tx_chain_mask = mac_phy_caps->tx_chain_mask_5g;
-		pdev_cap->rx_chain_mask = mac_phy_caps->rx_chain_mask_5g;
+	if (le32_to_cpu(mac_phy_caps->supported_bands) & WMI_HOST_WLAN_5G_CAP) {
+		pdev_cap->vht_cap = le32_to_cpu(mac_phy_caps->vht_cap_info_5g);
+		pdev_cap->vht_mcs = le32_to_cpu(mac_phy_caps->vht_supp_mcs_5g);
+		pdev_cap->he_mcs = le32_to_cpu(mac_phy_caps->he_supp_mcs_5g);
+		pdev_cap->tx_chain_mask = le32_to_cpu(mac_phy_caps->tx_chain_mask_5g);
+		pdev_cap->rx_chain_mask = le32_to_cpu(mac_phy_caps->rx_chain_mask_5g);
 		pdev_cap->nss_ratio_enabled =
-			WMI_NSS_RATIO_ENABLE_DISABLE_GET(mac_phy_caps->nss_ratio);
+			WMI_NSS_RATIO_ENABLE_DISABLE_GET(le32_to_cpu(mac_phy_caps->nss_ratio));
 		pdev_cap->nss_ratio_info =
-			WMI_NSS_RATIO_INFO_GET(mac_phy_caps->nss_ratio);
+			WMI_NSS_RATIO_INFO_GET(le32_to_cpu(mac_phy_caps->nss_ratio));
 	}
 
 	/* tx/rx chainmask reported from fw depends on the actual hw chains used,
@@ -444,48 +451,57 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	 * for tx/rx chainmask which will be used to advertise supported ht/vht rates to
 	 * mac80211.
 	 */
-	pdev_cap->tx_chain_mask_shift =
-			find_first_bit((unsigned long *)&pdev_cap->tx_chain_mask, 32);
-	pdev_cap->rx_chain_mask_shift =
-			find_first_bit((unsigned long *)&pdev_cap->rx_chain_mask, 32);
+	tx_chain_mask = pdev_cap->tx_chain_mask;
+	rx_chain_mask = pdev_cap->rx_chain_mask;
+	pdev_cap->tx_chain_mask_shift = find_first_bit(&tx_chain_mask, 32);
+	pdev_cap->rx_chain_mask_shift = find_first_bit(&rx_chain_mask, 32);
 
-	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_2G_CAP) {
+	if (le32_to_cpu(mac_phy_caps->supported_bands) & WMI_HOST_WLAN_2G_CAP) {
 		cap_band = &pdev_cap->band[NL80211_BAND_2GHZ];
-		cap_band->phy_id = mac_phy_caps->phy_id;
-		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_2g;
-		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_2g;
+		cap_band->phy_id = le32_to_cpu(mac_phy_caps->phy_id);
+		cap_band->max_bw_supported = le32_to_cpu(mac_phy_caps->max_bw_supported_2g);
+		cap_band->ht_cap_info = le32_to_cpu(mac_phy_caps->ht_cap_info_2g);
 		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_2g;
 		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_2g_ext;
-		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_2g;
+		cap_band->he_mcs = le32_to_cpu(mac_phy_caps->he_supp_mcs_2g);
 		memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_2g,
 		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet2g,
-		       sizeof(struct ath11k_ppe_threshold));
+		cap_band->he_ppet.numss_m1 = le32_to_cpu(mac_phy_caps->he_ppet2g.numss_m1);
+		cap_band->he_ppet.ru_bit_mask = le32_to_cpu(mac_phy_caps->he_ppet2g.ru_mask);
+		for (i = 0; i < ARRAY_SIZE(cap_band->he_ppet.ppet16_ppet8_ru3_ru0); i++)
+			cap_band->he_ppet.ppet16_ppet8_ru3_ru0[i] =
+				le32_to_cpu(mac_phy_caps->he_ppet2g.ppet16_ppet8_ru3_ru0[i]);
 	}
 
-	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
+	if (le32_to_cpu(mac_phy_caps->supported_bands) & WMI_HOST_WLAN_5G_CAP) {
 		cap_band = &pdev_cap->band[NL80211_BAND_5GHZ];
-		cap_band->phy_id = mac_phy_caps->phy_id;
-		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
-		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
+		cap_band->phy_id = le32_to_cpu(mac_phy_caps->phy_id);
+		cap_band->max_bw_supported = le32_to_cpu(mac_phy_caps->max_bw_supported_5g);
+		cap_band->ht_cap_info = le32_to_cpu(mac_phy_caps->ht_cap_info_5g);
 		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
 		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
-		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
+		cap_band->he_mcs = le32_to_cpu(mac_phy_caps->he_supp_mcs_5g);
 		memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
 		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
-		       sizeof(struct ath11k_ppe_threshold));
+		cap_band->he_ppet.numss_m1 = le32_to_cpu(mac_phy_caps->he_ppet5g.numss_m1);
+		cap_band->he_ppet.ru_bit_mask = le32_to_cpu(mac_phy_caps->he_ppet5g.ru_mask);
+		for (i = 0; i < ARRAY_SIZE(cap_band->he_ppet.ppet16_ppet8_ru3_ru0); i++)
+			cap_band->he_ppet.ppet16_ppet8_ru3_ru0[i] =
+				le32_to_cpu(mac_phy_caps->he_ppet5g.ppet16_ppet8_ru3_ru0[i]);
 
 		cap_band = &pdev_cap->band[NL80211_BAND_6GHZ];
-		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
-		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
+		cap_band->max_bw_supported = le32_to_cpu(mac_phy_caps->max_bw_supported_5g);
+		cap_band->ht_cap_info = le32_to_cpu(mac_phy_caps->ht_cap_info_5g);
 		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
 		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
-		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
+		cap_band->he_mcs = le32_to_cpu(mac_phy_caps->he_supp_mcs_5g);
 		memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
 		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
-		       sizeof(struct ath11k_ppe_threshold));
+		cap_band->he_ppet.numss_m1 = le32_to_cpu(mac_phy_caps->he_ppet5g.numss_m1);
+		cap_band->he_ppet.ru_bit_mask = le32_to_cpu(mac_phy_caps->he_ppet5g.ru_mask);
+		for (i = 0; i < ARRAY_SIZE(cap_band->he_ppet.ppet16_ppet8_ru3_ru0); i++)
+			cap_band->he_ppet.ppet16_ppet8_ru3_ru0[i] =
+				le32_to_cpu(mac_phy_caps->he_ppet5g.ppet16_ppet8_ru3_ru0[i]);
 	}
 
 	return 0;
@@ -503,22 +519,22 @@ ath11k_pull_reg_cap_svc_rdy_ext(struct ath11k_pdev_wmi *wmi_handle,
 	if (!reg_caps || !wmi_ext_reg_cap)
 		return -EINVAL;
 
-	if (phy_idx >= reg_caps->num_phy)
+	if (phy_idx >= le32_to_cpu(reg_caps->num_phy))
 		return -EINVAL;
 
 	ext_reg_cap = &wmi_ext_reg_cap[phy_idx];
 
-	param->phy_id = ext_reg_cap->phy_id;
-	param->eeprom_reg_domain = ext_reg_cap->eeprom_reg_domain;
+	param->phy_id = le32_to_cpu(ext_reg_cap->phy_id);
+	param->eeprom_reg_domain = le32_to_cpu(ext_reg_cap->eeprom_reg_domain);
 	param->eeprom_reg_domain_ext =
-			      ext_reg_cap->eeprom_reg_domain_ext;
-	param->regcap1 = ext_reg_cap->regcap1;
-	param->regcap2 = ext_reg_cap->regcap2;
+			      le32_to_cpu(ext_reg_cap->eeprom_reg_domain_ext);
+	param->regcap1 = le32_to_cpu(ext_reg_cap->regcap1);
+	param->regcap2 = le32_to_cpu(ext_reg_cap->regcap2);
 	/* check if param->wireless_mode is needed */
-	param->low_2ghz_chan = ext_reg_cap->low_2ghz_chan;
-	param->high_2ghz_chan = ext_reg_cap->high_2ghz_chan;
-	param->low_5ghz_chan = ext_reg_cap->low_5ghz_chan;
-	param->high_5ghz_chan = ext_reg_cap->high_5ghz_chan;
+	param->low_2ghz_chan = le32_to_cpu(ext_reg_cap->low_2ghz_chan);
+	param->high_2ghz_chan = le32_to_cpu(ext_reg_cap->high_2ghz_chan);
+	param->low_5ghz_chan = le32_to_cpu(ext_reg_cap->low_5ghz_chan);
+	param->high_5ghz_chan = le32_to_cpu(ext_reg_cap->high_5ghz_chan);
 
 	return 0;
 }
@@ -535,23 +551,23 @@ static int ath11k_pull_service_ready_tlv(struct ath11k_base *ab,
 		return -EINVAL;
 	}
 
-	cap->phy_capability = ev->phy_capability;
-	cap->max_frag_entry = ev->max_frag_entry;
-	cap->num_rf_chains = ev->num_rf_chains;
-	cap->ht_cap_info = ev->ht_cap_info;
-	cap->vht_cap_info = ev->vht_cap_info;
-	cap->vht_supp_mcs = ev->vht_supp_mcs;
-	cap->hw_min_tx_power = ev->hw_min_tx_power;
-	cap->hw_max_tx_power = ev->hw_max_tx_power;
-	cap->sys_cap_info = ev->sys_cap_info;
-	cap->min_pkt_size_enable = ev->min_pkt_size_enable;
-	cap->max_bcn_ie_size = ev->max_bcn_ie_size;
-	cap->max_num_scan_channels = ev->max_num_scan_channels;
-	cap->max_supported_macs = ev->max_supported_macs;
-	cap->wmi_fw_sub_feat_caps = ev->wmi_fw_sub_feat_caps;
-	cap->txrx_chainmask = ev->txrx_chainmask;
-	cap->default_dbs_hw_mode_index = ev->default_dbs_hw_mode_index;
-	cap->num_msdu_desc = ev->num_msdu_desc;
+	cap->phy_capability = le32_to_cpu(ev->phy_capability);
+	cap->max_frag_entry = le32_to_cpu(ev->max_frag_entry);
+	cap->num_rf_chains = le32_to_cpu(ev->num_rf_chains);
+	cap->ht_cap_info = le32_to_cpu(ev->ht_cap_info);
+	cap->vht_cap_info = le32_to_cpu(ev->vht_cap_info);
+	cap->vht_supp_mcs = le32_to_cpu(ev->vht_supp_mcs);
+	cap->hw_min_tx_power = le32_to_cpu(ev->hw_min_tx_power);
+	cap->hw_max_tx_power = le32_to_cpu(ev->hw_max_tx_power);
+	cap->sys_cap_info = le32_to_cpu(ev->sys_cap_info);
+	cap->min_pkt_size_enable = le32_to_cpu(ev->min_pkt_size_enable);
+	cap->max_bcn_ie_size = le32_to_cpu(ev->max_bcn_ie_size);
+	cap->max_num_scan_channels = le32_to_cpu(ev->max_num_scan_channels);
+	cap->max_supported_macs = le32_to_cpu(ev->max_supported_macs);
+	cap->wmi_fw_sub_feat_caps = le32_to_cpu(ev->wmi_fw_sub_feat_caps);
+	cap->txrx_chainmask = le32_to_cpu(ev->txrx_chainmask);
+	cap->default_dbs_hw_mode_index = le32_to_cpu(ev->default_dbs_hw_mode_index);
+	cap->num_msdu_desc = le32_to_cpu(ev->num_msdu_desc);
 
 	return 0;
 }
@@ -561,13 +577,13 @@ static int ath11k_pull_service_ready_tlv(struct ath11k_base *ab,
  * 4-byte word.
  */
 static void ath11k_wmi_service_bitmap_copy(struct ath11k_pdev_wmi *wmi,
-					   const u32 *wmi_svc_bm)
+					   const __le32 *wmi_svc_bm)
 {
 	int i, j;
 
 	for (i = 0, j = 0; i < WMI_SERVICE_BM_SIZE && j < WMI_MAX_SERVICE; i++) {
 		do {
-			if (wmi_svc_bm[i] & BIT(j % WMI_SERVICE_BITS_IN_SIZE32))
+			if (le32_to_cpu(wmi_svc_bm[i]) & BIT(j % WMI_SERVICE_BITS_IN_SIZE32))
 				set_bit(j, wmi->wmi_ab->svc_map);
 		} while (++j % WMI_SERVICE_BITS_IN_SIZE32);
 	}
@@ -683,30 +699,32 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_mgmt_send_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_MGMT_TX_SEND_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->desc_id = buf_id;
-	cmd->chanfreq = ath11k_wmi_mgmt_get_freq(ar, info);
-	cmd->paddr_lo = lower_32_bits(ATH11K_SKB_CB(frame)->paddr);
-	cmd->paddr_hi = upper_32_bits(ATH11K_SKB_CB(frame)->paddr);
-	cmd->frame_len = frame->len;
-	cmd->buf_len = buf_len;
-	cmd->tx_params_valid = !!tx_params_valid;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_MGMT_TX_SEND_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->desc_id = cpu_to_le32(buf_id);
+	cmd->chanfreq = cpu_to_le32(ath11k_wmi_mgmt_get_freq(ar, info));
+	cmd->paddr_lo = cpu_to_le32(lower_32_bits(ATH11K_SKB_CB(frame)->paddr));
+	cmd->paddr_hi = cpu_to_le32(upper_32_bits(ATH11K_SKB_CB(frame)->paddr));
+	cmd->frame_len = cpu_to_le32(frame->len);
+	cmd->buf_len = cpu_to_le32(buf_len);
+	cmd->tx_params_valid = cpu_to_le32(!!tx_params_valid);
 
 	frame_tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
-	frame_tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-			    FIELD_PREP(WMI_TLV_LEN, buf_len);
+	frame_tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+			    le32_encode_bits(buf_len, WMI_TLV_LEN);
 
 	memcpy(frame_tlv->value, frame->data, buf_len);
 
 	if (tx_params_valid) {
 		params =
 		(struct wmi_mgmt_send_params *)(skb->data + (len - sizeof(*params)));
-		params->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TX_SEND_PARAMS) |
-				     FIELD_PREP(WMI_TLV_LEN,
-						sizeof(*params) - TLV_HDR_SIZE);
-		params->tx_params_dword1 |= WMI_TX_PARAMS_DWORD1_CFR_CAPTURE;
+		params->tlv_header =
+			le32_encode_bits(WMI_TAG_TX_SEND_PARAMS, WMI_TLV_TAG) |
+			le32_encode_bits(sizeof(*params) - TLV_HDR_SIZE,
+					 WMI_TLV_LEN);
+		params->tx_params_dword1 |=
+			cpu_to_le32(WMI_TX_PARAMS_DWORD1_CFR_CAPTURE);
 	}
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_MGMT_TX_SEND_CMDID);
@@ -744,16 +762,18 @@ int ath11k_wmi_vdev_create(struct ath11k *ar, u8 *macaddr,
 		return -ENOMEM;
 
 	cmd = (struct wmi_vdev_create_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_CREATE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-
-	cmd->vdev_id = param->if_id;
-	cmd->vdev_type = param->type;
-	cmd->vdev_subtype = param->subtype;
-	cmd->num_cfg_txrx_streams = WMI_NUM_SUPPORTED_BAND_MAX;
-	cmd->pdev_id = param->pdev_id;
-	cmd->mbssid_flags = param->mbssid_flags;
-	cmd->mbssid_tx_vdev_id = param->mbssid_tx_vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_CREATE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+
+	cmd->vdev_id = cpu_to_le32(param->if_id);
+	cmd->vdev_type = cpu_to_le32(param->type);
+	cmd->vdev_subtype = cpu_to_le32(param->subtype);
+	cmd->num_cfg_txrx_streams = cpu_to_le32(WMI_NUM_SUPPORTED_BAND_MAX);
+	cmd->pdev_id = cpu_to_le32(param->pdev_id);
+	cmd->mbssid_flags = cpu_to_le32(param->mbssid_flags);
+	cmd->mbssid_tx_vdev_id = cpu_to_le32(param->mbssid_tx_vdev_id);
 
 	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
 
@@ -761,30 +781,30 @@ int ath11k_wmi_vdev_create(struct ath11k *ar, u8 *macaddr,
 	len = WMI_NUM_SUPPORTED_BAND_MAX * sizeof(*txrx_streams);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 	txrx_streams = ptr;
 	len = sizeof(*txrx_streams);
 	txrx_streams->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_TXRX_STREAMS) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+		le32_encode_bits(WMI_TAG_VDEV_TXRX_STREAMS, WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 	txrx_streams->band = WMI_TPC_CHAINMASK_CONFIG_BAND_2G;
 	txrx_streams->supported_tx_streams =
-				 param->chains[NL80211_BAND_2GHZ].tx;
+				 cpu_to_le32(param->chains[NL80211_BAND_2GHZ].tx);
 	txrx_streams->supported_rx_streams =
-				 param->chains[NL80211_BAND_2GHZ].rx;
+				 cpu_to_le32(param->chains[NL80211_BAND_2GHZ].rx);
 
 	txrx_streams++;
 	txrx_streams->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_TXRX_STREAMS) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	txrx_streams->band = WMI_TPC_CHAINMASK_CONFIG_BAND_5G;
+		le32_encode_bits(WMI_TAG_VDEV_TXRX_STREAMS, WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	txrx_streams->band = cpu_to_le32(WMI_TPC_CHAINMASK_CONFIG_BAND_5G);
 	txrx_streams->supported_tx_streams =
-				 param->chains[NL80211_BAND_5GHZ].tx;
+				 cpu_to_le32(param->chains[NL80211_BAND_5GHZ].tx);
 	txrx_streams->supported_rx_streams =
-				 param->chains[NL80211_BAND_5GHZ].rx;
+				 cpu_to_le32(param->chains[NL80211_BAND_5GHZ].rx);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_CREATE_CMDID);
 	if (ret) {
@@ -813,9 +833,11 @@ int ath11k_wmi_vdev_delete(struct ath11k *ar, u8 vdev_id)
 		return -ENOMEM;
 
 	cmd = (struct wmi_vdev_delete_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_DELETE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_DELETE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_DELETE_CMDID);
 	if (ret) {
@@ -841,9 +863,10 @@ int ath11k_wmi_vdev_stop(struct ath11k *ar, u8 vdev_id)
 
 	cmd = (struct wmi_vdev_stop_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_STOP_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_STOP_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_STOP_CMDID);
 	if (ret) {
@@ -869,9 +892,10 @@ int ath11k_wmi_vdev_down(struct ath11k *ar, u8 vdev_id)
 
 	cmd = (struct wmi_vdev_down_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_DOWN_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_DOWN_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_DOWN_CMDID);
 	if (ret) {
@@ -891,51 +915,51 @@ static void ath11k_wmi_put_wmi_channel(struct wmi_channel *chan,
 
 	memset(chan, 0, sizeof(*chan));
 
-	chan->mhz = arg->channel.freq;
-	chan->band_center_freq1 = arg->channel.band_center_freq1;
+	chan->mhz = cpu_to_le32(arg->channel.freq);
+	chan->band_center_freq1 = cpu_to_le32(arg->channel.band_center_freq1);
 
 	if (arg->channel.mode == MODE_11AX_HE160) {
 		if (arg->channel.freq > arg->channel.band_center_freq1)
-			chan->band_center_freq1 = center_freq1 + 40;
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 + 40);
 		else
-			chan->band_center_freq1 = center_freq1 - 40;
+			chan->band_center_freq1 = cpu_to_le32(center_freq1 - 40);
 
-		chan->band_center_freq2 = arg->channel.band_center_freq1;
+		chan->band_center_freq2 = cpu_to_le32(arg->channel.band_center_freq1);
 
 	} else if ((arg->channel.mode == MODE_11AC_VHT80_80) ||
 		   (arg->channel.mode == MODE_11AX_HE80_80)) {
-		chan->band_center_freq2 = arg->channel.band_center_freq2;
+		chan->band_center_freq2 = cpu_to_le32(arg->channel.band_center_freq2);
 	} else {
 		chan->band_center_freq2 = 0;
 	}
 
-	chan->info |= FIELD_PREP(WMI_CHAN_INFO_MODE, arg->channel.mode);
+	chan->info |= le32_encode_bits(arg->channel.mode, WMI_CHAN_INFO_MODE);
 	if (arg->channel.passive)
-		chan->info |= WMI_CHAN_INFO_PASSIVE;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_PASSIVE);
 	if (arg->channel.allow_ibss)
-		chan->info |= WMI_CHAN_INFO_ADHOC_ALLOWED;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_ADHOC_ALLOWED);
 	if (arg->channel.allow_ht)
-		chan->info |= WMI_CHAN_INFO_ALLOW_HT;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_HT);
 	if (arg->channel.allow_vht)
-		chan->info |= WMI_CHAN_INFO_ALLOW_VHT;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_VHT);
 	if (arg->channel.allow_he)
-		chan->info |= WMI_CHAN_INFO_ALLOW_HE;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_HE);
 	if (arg->channel.ht40plus)
-		chan->info |= WMI_CHAN_INFO_HT40_PLUS;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_HT40_PLUS);
 	if (arg->channel.chan_radar)
-		chan->info |= WMI_CHAN_INFO_DFS;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_DFS);
 	if (arg->channel.freq2_radar)
-		chan->info |= WMI_CHAN_INFO_DFS_FREQ2;
+		chan->info |= cpu_to_le32(WMI_CHAN_INFO_DFS_FREQ2);
 
-	chan->reg_info_1 = FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_PWR,
-				      arg->channel.max_power) |
-		FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_REG_PWR,
-			   arg->channel.max_reg_power);
+	chan->reg_info_1 = le32_encode_bits(arg->channel.max_power,
+					    WMI_CHAN_REG_INFO1_MAX_PWR) |
+		le32_encode_bits(arg->channel.max_reg_power,
+				 WMI_CHAN_REG_INFO1_MAX_REG_PWR);
 
-	chan->reg_info_2 = FIELD_PREP(WMI_CHAN_REG_INFO2_ANT_MAX,
-				      arg->channel.max_antenna_gain) |
-		FIELD_PREP(WMI_CHAN_REG_INFO2_MAX_TX_PWR,
-			   arg->channel.max_power);
+	chan->reg_info_2 = le32_encode_bits(arg->channel.max_antenna_gain,
+					    WMI_CHAN_REG_INFO2_ANT_MAX) |
+		le32_encode_bits(arg->channel.max_power,
+				 WMI_CHAN_REG_INFO2_MAX_TX_PWR);
 }
 
 int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
@@ -959,50 +983,51 @@ int ath11k_wmi_vdev_start(struct ath11k *ar, struct wmi_vdev_start_req_arg *arg,
 		return -ENOMEM;
 
 	cmd = (struct wmi_vdev_start_request_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_VDEV_START_REQUEST_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = arg->vdev_id;
-	cmd->beacon_interval = arg->bcn_intval;
-	cmd->bcn_tx_rate = arg->bcn_tx_rate;
-	cmd->dtim_period = arg->dtim_period;
-	cmd->num_noa_descriptors = arg->num_noa_descriptors;
-	cmd->preferred_rx_streams = arg->pref_rx_streams;
-	cmd->preferred_tx_streams = arg->pref_tx_streams;
-	cmd->cac_duration_ms = arg->cac_duration_ms;
-	cmd->regdomain = arg->regdomain;
-	cmd->he_ops = arg->he_ops;
-	cmd->mbssid_flags = arg->mbssid_flags;
-	cmd->mbssid_tx_vdev_id = arg->mbssid_tx_vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_START_REQUEST_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
+	cmd->beacon_interval = cpu_to_le32(arg->bcn_intval);
+	cmd->bcn_tx_rate = cpu_to_le32(arg->bcn_tx_rate);
+	cmd->dtim_period = cpu_to_le32(arg->dtim_period);
+	cmd->num_noa_descriptors = cpu_to_le32(arg->num_noa_descriptors);
+	cmd->preferred_rx_streams = cpu_to_le32(arg->pref_rx_streams);
+	cmd->preferred_tx_streams = cpu_to_le32(arg->pref_tx_streams);
+	cmd->cac_duration_ms = cpu_to_le32(arg->cac_duration_ms);
+	cmd->regdomain = cpu_to_le32(arg->regdomain);
+	cmd->he_ops = cpu_to_le32(arg->he_ops);
+	cmd->mbssid_flags = cpu_to_le32(arg->mbssid_flags);
+	cmd->mbssid_tx_vdev_id = cpu_to_le32(arg->mbssid_tx_vdev_id);
 
 	if (!restart) {
 		if (arg->ssid) {
-			cmd->ssid.ssid_len = arg->ssid_len;
+			cmd->ssid.ssid_len = cpu_to_le32(arg->ssid_len);
 			memcpy(cmd->ssid.ssid, arg->ssid, arg->ssid_len);
 		}
 		if (arg->hidden_ssid)
-			cmd->flags |= WMI_VDEV_START_HIDDEN_SSID;
+			cmd->flags |= cpu_to_le32(WMI_VDEV_START_HIDDEN_SSID);
 		if (arg->pmf_enabled)
-			cmd->flags |= WMI_VDEV_START_PMF_ENABLED;
+			cmd->flags |= cpu_to_le32(WMI_VDEV_START_PMF_ENABLED);
 	}
 
-	cmd->flags |= WMI_VDEV_START_LDPC_RX_ENABLED;
+	cmd->flags |= cpu_to_le32(WMI_VDEV_START_LDPC_RX_ENABLED);
 	if (test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags))
-		cmd->flags |= WMI_VDEV_START_HW_ENCRYPTION_DISABLED;
+		cmd->flags |= cpu_to_le32(WMI_VDEV_START_HW_ENCRYPTION_DISABLED);
 
 	ptr = skb->data + sizeof(*cmd);
 	chan = ptr;
 
 	ath11k_wmi_put_wmi_channel(chan, arg);
 
-	chan->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_CHANNEL) |
-			   FIELD_PREP(WMI_TLV_LEN,
-				      sizeof(*chan) - TLV_HDR_SIZE);
+	chan->tlv_header = le32_encode_bits(WMI_TAG_CHANNEL, WMI_TLV_TAG) |
+			   le32_encode_bits(sizeof(*chan) - TLV_HDR_SIZE,
+					    WMI_TLV_LEN);
 	ptr += sizeof(*chan);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, 0);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(0, WMI_TLV_LEN);
 
 	/* Note: This is a nested TLV containing:
 	 * [wmi_tlv][ath11k_wmi_p2p_noa_descriptor][wmi_tlv]..
@@ -1047,15 +1072,16 @@ int ath11k_wmi_vdev_up(struct ath11k *ar, u32 vdev_id, u32 aid, const u8 *bssid,
 
 	cmd = (struct wmi_vdev_up_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_UP_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->vdev_assoc_id = aid;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_UP_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->vdev_assoc_id = cpu_to_le32(aid);
 
 	ether_addr_copy(cmd->vdev_bssid.addr, bssid);
 
-	cmd->nontx_profile_idx = nontx_profile_idx;
-	cmd->nontx_profile_cnt = nontx_profile_cnt;
+	cmd->nontx_profile_idx = cpu_to_le32(nontx_profile_idx);
+	cmd->nontx_profile_cnt = cpu_to_le32(nontx_profile_cnt);
 	if (tx_bssid)
 		ether_addr_copy(cmd->tx_vdev_bssid.addr, tx_bssid);
 
@@ -1065,8 +1091,8 @@ int ath11k_wmi_vdev_up(struct ath11k *ar, u32 vdev_id, u32 aid, const u8 *bssid,
 		if (bss_conf->nontransmitted) {
 			ether_addr_copy(cmd->tx_vdev_bssid.addr,
 					bss_conf->transmitter_bssid);
-			cmd->nontx_profile_idx = bss_conf->bssid_index;
-			cmd->nontx_profile_cnt = bss_conf->bssid_indicator;
+			cmd->nontx_profile_idx = cpu_to_le32(bss_conf->bssid_index);
+			cmd->nontx_profile_cnt = cpu_to_le32(bss_conf->bssid_indicator);
 		}
 	}
 
@@ -1096,12 +1122,14 @@ int ath11k_wmi_send_peer_create_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_peer_create_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_CREATE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PEER_CREATE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_addr);
-	cmd->peer_type = param->peer_type;
-	cmd->vdev_id = param->vdev_id;
+	cmd->peer_type = cpu_to_le32(param->peer_type);
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PEER_CREATE_CMDID);
 	if (ret) {
@@ -1129,11 +1157,13 @@ int ath11k_wmi_send_peer_delete_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_peer_delete_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_DELETE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PEER_DELETE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
-	cmd->vdev_id = vdev_id;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PEER_DELETE_CMDID);
 	if (ret) {
@@ -1161,17 +1191,18 @@ int ath11k_wmi_send_pdev_set_regdomain(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_pdev_set_regdomain_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_PDEV_SET_REGDOMAIN_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-
-	cmd->reg_domain = param->current_rd_in_use;
-	cmd->reg_domain_2g = param->current_rd_2g;
-	cmd->reg_domain_5g = param->current_rd_5g;
-	cmd->conformance_test_limit_2g = param->ctl_2g;
-	cmd->conformance_test_limit_5g = param->ctl_5g;
-	cmd->dfs_domain = param->dfs_domain;
-	cmd->pdev_id = param->pdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SET_REGDOMAIN_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+
+	cmd->reg_domain = cpu_to_le32(param->current_rd_in_use);
+	cmd->reg_domain_2g = cpu_to_le32(param->current_rd_2g);
+	cmd->reg_domain_5g = cpu_to_le32(param->current_rd_5g);
+	cmd->conformance_test_limit_2g = cpu_to_le32(param->ctl_2g);
+	cmd->conformance_test_limit_5g = cpu_to_le32(param->ctl_5g);
+	cmd->dfs_domain = cpu_to_le32(param->dfs_domain);
+	cmd->pdev_id = cpu_to_le32(param->pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_REGDOMAIN_CMDID);
 	if (ret) {
@@ -1201,12 +1232,14 @@ int ath11k_wmi_set_peer_param(struct ath11k *ar, const u8 *peer_addr,
 		return -ENOMEM;
 
 	cmd = (struct wmi_peer_set_param_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_SET_PARAM_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PEER_SET_PARAM_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
-	cmd->vdev_id = vdev_id;
-	cmd->param_id = param_id;
-	cmd->param_value = param_val;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->param_id = cpu_to_le32(param_id);
+	cmd->param_value = cpu_to_le32(param_val);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PEER_SET_PARAM_CMDID);
 	if (ret) {
@@ -1235,12 +1268,14 @@ int ath11k_wmi_send_peer_flush_tids_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_peer_flush_tids_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PEER_FLUSH_TIDS_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PEER_FLUSH_TIDS_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
-	cmd->peer_tid_bitmap = param->peer_tid_bitmap;
-	cmd->vdev_id = param->vdev_id;
+	cmd->peer_tid_bitmap = cpu_to_le32(param->peer_tid_bitmap);
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PEER_FLUSH_TIDS_CMDID);
 	if (ret) {
@@ -1271,18 +1306,19 @@ int ath11k_wmi_peer_rx_reorder_queue_setup(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_peer_reorder_queue_setup_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_REORDER_QUEUE_SETUP_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_REORDER_QUEUE_SETUP_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ether_addr_copy(cmd->peer_macaddr.addr, addr);
-	cmd->vdev_id = vdev_id;
-	cmd->tid = tid;
-	cmd->queue_ptr_lo = lower_32_bits(paddr);
-	cmd->queue_ptr_hi = upper_32_bits(paddr);
-	cmd->queue_no = tid;
-	cmd->ba_window_size_valid = ba_window_size_valid;
-	cmd->ba_window_size = ba_window_size;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->tid = cpu_to_le32(tid);
+	cmd->queue_ptr_lo = cpu_to_le32(lower_32_bits(paddr));
+	cmd->queue_ptr_hi = cpu_to_le32(upper_32_bits(paddr));
+	cmd->queue_no = cpu_to_le32(tid);
+	cmd->ba_window_size_valid = cpu_to_le32(ba_window_size_valid);
+	cmd->ba_window_size = cpu_to_le32(ba_window_size);
 
 	ret = ath11k_wmi_cmd_send(ar->wmi, skb,
 				  WMI_PEER_REORDER_QUEUE_SETUP_CMDID);
@@ -1313,13 +1349,14 @@ ath11k_wmi_rx_reord_queue_remove(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_peer_reorder_queue_remove_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_REORDER_QUEUE_REMOVE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_REORDER_QUEUE_REMOVE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_macaddr);
-	cmd->vdev_id = param->vdev_id;
-	cmd->tid_mask = param->peer_tid_bitmap;
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
+	cmd->tid_mask = cpu_to_le32(param->peer_tid_bitmap);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PEER_REORDER_QUEUE_REMOVE_CMDID);
@@ -1349,11 +1386,13 @@ int ath11k_wmi_pdev_set_param(struct ath11k *ar, u32 param_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_pdev_set_param_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_PARAM_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->pdev_id = pdev_id;
-	cmd->param_id = param_id;
-	cmd->param_value = param_value;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SET_PARAM_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(pdev_id);
+	cmd->param_id = cpu_to_le32(param_id);
+	cmd->param_value = cpu_to_le32(param_value);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_PARAM_CMDID);
 	if (ret) {
@@ -1381,10 +1420,12 @@ int ath11k_wmi_pdev_set_ps_mode(struct ath11k *ar, int vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_pdev_set_ps_mode_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STA_POWERSAVE_MODE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->sta_ps_mode = psmode;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_STA_POWERSAVE_MODE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->sta_ps_mode = cpu_to_le32(psmode);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_POWERSAVE_MODE_CMDID);
 	if (ret) {
@@ -1413,11 +1454,13 @@ int ath11k_wmi_pdev_suspend(struct ath11k *ar, u32 suspend_opt,
 
 	cmd = (struct wmi_pdev_suspend_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SUSPEND_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SUSPEND_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->suspend_opt = suspend_opt;
-	cmd->pdev_id = pdev_id;
+	cmd->suspend_opt = cpu_to_le32(suspend_opt);
+	cmd->pdev_id = cpu_to_le32(pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SUSPEND_CMDID);
 	if (ret) {
@@ -1444,9 +1487,11 @@ int ath11k_wmi_pdev_resume(struct ath11k *ar, u32 pdev_id)
 
 	cmd = (struct wmi_pdev_resume_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_RESUME_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->pdev_id = pdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_RESUME_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_RESUME_CMDID);
 	if (ret) {
@@ -1478,11 +1523,12 @@ int ath11k_wmi_pdev_bss_chan_info_request(struct ath11k *ar,
 
 	cmd = (struct wmi_pdev_bss_chan_info_req_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_PDEV_BSS_CHAN_INFO_REQUEST) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->req_type = type;
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_BSS_CHAN_INFO_REQUEST,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->req_type = cpu_to_le32(type);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID);
@@ -1511,13 +1557,15 @@ int ath11k_wmi_send_set_ap_ps_param_cmd(struct ath11k *ar, u8 *peer_addr,
 		return -ENOMEM;
 
 	cmd = (struct wmi_ap_ps_peer_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_AP_PS_PEER_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_AP_PS_PEER_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = param->vdev_id;
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, peer_addr);
-	cmd->param = param->param;
-	cmd->value = param->value;
+	cmd->param = cpu_to_le32(param->param);
+	cmd->value = cpu_to_le32(param->value);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_AP_PS_PEER_PARAM_CMDID);
 	if (ret) {
@@ -1546,13 +1594,14 @@ int ath11k_wmi_set_sta_ps_param(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_sta_powersave_param_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_STA_POWERSAVE_PARAM_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_STA_POWERSAVE_PARAM_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->param = param;
-	cmd->value = param_value;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->param = cpu_to_le32(param);
+	cmd->value = cpu_to_le32(param_value);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_POWERSAVE_PARAM_CMDID);
 	if (ret) {
@@ -1581,11 +1630,12 @@ int ath11k_wmi_force_fw_hang_cmd(struct ath11k *ar, u32 type, u32 delay_time_ms)
 		return -ENOMEM;
 
 	cmd = (struct wmi_force_fw_hang_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_FORCE_FW_HANG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_FORCE_FW_HANG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->type = type;
-	cmd->delay_time_ms = delay_time_ms;
+	cmd->type = cpu_to_le32(type);
+	cmd->delay_time_ms = cpu_to_le32(delay_time_ms);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_FORCE_FW_HANG_CMDID);
 
@@ -1612,12 +1662,14 @@ int ath11k_wmi_vdev_set_param_cmd(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_vdev_set_param_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_SET_PARAM_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_SET_PARAM_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->param_id = param_id;
-	cmd->param_value = param_value;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->param_id = cpu_to_le32(param_id);
+	cmd->param_value = cpu_to_le32(param_value);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_VDEV_SET_PARAM_CMDID);
 	if (ret) {
@@ -1646,12 +1698,14 @@ int ath11k_wmi_send_stats_request_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_request_stats_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_REQUEST_STATS_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_REQUEST_STATS_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->stats_id = param->stats_id;
-	cmd->vdev_id = param->vdev_id;
-	cmd->pdev_id = param->pdev_id;
+	cmd->stats_id = cpu_to_le32(param->stats_id);
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
+	cmd->pdev_id = cpu_to_le32(param->pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_REQUEST_STATS_CMDID);
 	if (ret) {
@@ -1678,9 +1732,11 @@ int ath11k_wmi_send_pdev_temperature_cmd(struct ath11k *ar)
 		return -ENOMEM;
 
 	cmd = (struct wmi_get_pdev_temperature_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_GET_TEMPERATURE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_GET_TEMPERATURE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_GET_TEMPERATURE_CMDID);
 	if (ret) {
@@ -1707,12 +1763,13 @@ int ath11k_wmi_send_bcn_offload_control_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_bcn_offload_ctrl_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_BCN_OFFLOAD_CTRL_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_BCN_OFFLOAD_CTRL_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->bcn_ctrl_op = bcn_ctrl_op;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->bcn_ctrl_op = cpu_to_le32(bcn_ctrl_op);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_BCN_OFFLOAD_CTRL_CMDID);
 	if (ret) {
@@ -1748,14 +1805,16 @@ int ath11k_wmi_p2p_go_bcn_ie(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_p2p_go_set_beacon_ie_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_P2P_GO_SET_BEACON_IE) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->ie_buf_len = p2p_ie_len;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_P2P_GO_SET_BEACON_IE,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->ie_buf_len = cpu_to_le32(p2p_ie_len);
 
 	tlv = (struct wmi_tlv *)cmd->tlv;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, aligned_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(aligned_len, WMI_TLV_LEN);
 	memcpy(tlv->value, p2p_ie, p2p_ie_len);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_P2P_GO_SET_BEACON_IE);
@@ -1796,35 +1855,37 @@ int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_bcn_tmpl_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_BCN_TMPL_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->tim_ie_offset = offs->tim_offset;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_BCN_TMPL_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->tim_ie_offset = cpu_to_le32(offs->tim_offset);
 
 	if (vif->bss_conf.csa_active) {
-		cmd->csa_switch_count_offset = offs->cntdwn_counter_offs[0];
-		cmd->ext_csa_switch_count_offset = offs->cntdwn_counter_offs[1];
+		cmd->csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[0]);
+		cmd->ext_csa_switch_count_offset = cpu_to_le32(offs->cntdwn_counter_offs[1]);
 	}
 
-	cmd->buf_len = bcn->len;
-	cmd->mbssid_ie_offset = offs->mbssid_off;
-	cmd->ema_params = ema_params;
+	cmd->buf_len = cpu_to_le32(bcn->len);
+	cmd->mbssid_ie_offset = cpu_to_le32(offs->mbssid_off);
+	cmd->ema_params = cpu_to_le32(ema_params);
 
 	ptr = skb->data + sizeof(*cmd);
 
 	bcn_prb_info = ptr;
 	len = sizeof(*bcn_prb_info);
-	bcn_prb_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-					      WMI_TAG_BCN_PRB_INFO) |
-				   FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	bcn_prb_info->tlv_header = le32_encode_bits(WMI_TAG_BCN_PRB_INFO,
+						    WMI_TLV_TAG) |
+				   le32_encode_bits(len - TLV_HDR_SIZE,
+						    WMI_TLV_LEN);
 	bcn_prb_info->caps = 0;
 	bcn_prb_info->erp = 0;
 
 	ptr += sizeof(*bcn_prb_info);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, aligned_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(aligned_len, WMI_TLV_LEN);
 	memcpy(tlv->value, bcn->data, bcn->len);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_BCN_TMPL_CMDID);
@@ -1855,24 +1916,29 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_vdev_install_key_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_INSTALL_KEY_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = arg->vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_INSTALL_KEY_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, arg->macaddr);
-	cmd->key_idx = arg->key_idx;
-	cmd->key_flags = arg->key_flags;
-	cmd->key_cipher = arg->key_cipher;
-	cmd->key_len = arg->key_len;
-	cmd->key_txmic_len = arg->key_txmic_len;
-	cmd->key_rxmic_len = arg->key_rxmic_len;
+	cmd->key_idx = cpu_to_le32(arg->key_idx);
+	cmd->key_flags = cpu_to_le32(arg->key_flags);
+	cmd->key_cipher = cpu_to_le32(arg->key_cipher);
+	cmd->key_len = cpu_to_le32(arg->key_len);
+	cmd->key_txmic_len = cpu_to_le32(arg->key_txmic_len);
+	cmd->key_rxmic_len = cpu_to_le32(arg->key_rxmic_len);
 
-	if (arg->key_rsc_counter)
-		memcpy(&cmd->key_rsc_counter, &arg->key_rsc_counter,
-		       sizeof(struct wmi_key_seq_counter));
+	if (arg->key_rsc_counter) {
+		cmd->key_rsc_counter.key_seq_counter_l =
+			cpu_to_le32(lower_32_bits(arg->key_rsc_counter));
+		cmd->key_rsc_counter.key_seq_counter_h =
+			cpu_to_le32(upper_32_bits(arg->key_rsc_counter));
+	}
 
 	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, key_len_aligned);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(key_len_aligned, WMI_TLV_LEN);
 	if (arg->key_data)
 		memcpy(tlv->value, (u8 *)arg->key_data, key_len_aligned);
 
@@ -1899,44 +1965,44 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 
 	if (param->is_wme_set) {
 		if (param->qos_flag)
-			cmd->peer_flags |= WMI_PEER_QOS;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_QOS);
 		if (param->apsd_flag)
-			cmd->peer_flags |= WMI_PEER_APSD;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_APSD);
 		if (param->ht_flag)
-			cmd->peer_flags |= WMI_PEER_HT;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_HT);
 		if (param->bw_40)
-			cmd->peer_flags |= WMI_PEER_40MHZ;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_40MHZ);
 		if (param->bw_80)
-			cmd->peer_flags |= WMI_PEER_80MHZ;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_80MHZ);
 		if (param->bw_160)
-			cmd->peer_flags |= WMI_PEER_160MHZ;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_160MHZ);
 
 		/* Typically if STBC is enabled for VHT it should be enabled
 		 * for HT as well
 		 **/
 		if (param->stbc_flag)
-			cmd->peer_flags |= WMI_PEER_STBC;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_STBC);
 
 		/* Typically if LDPC is enabled for VHT it should be enabled
 		 * for HT as well
 		 **/
 		if (param->ldpc_flag)
-			cmd->peer_flags |= WMI_PEER_LDPC;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_LDPC);
 
 		if (param->static_mimops_flag)
-			cmd->peer_flags |= WMI_PEER_STATIC_MIMOPS;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_STATIC_MIMOPS);
 		if (param->dynamic_mimops_flag)
-			cmd->peer_flags |= WMI_PEER_DYN_MIMOPS;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_DYN_MIMOPS);
 		if (param->spatial_mux_flag)
-			cmd->peer_flags |= WMI_PEER_SPATIAL_MUX;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_SPATIAL_MUX);
 		if (param->vht_flag)
-			cmd->peer_flags |= WMI_PEER_VHT;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_VHT);
 		if (param->he_flag)
-			cmd->peer_flags |= WMI_PEER_HE;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_HE);
 		if (param->twt_requester)
-			cmd->peer_flags |= WMI_PEER_TWT_REQ;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_TWT_REQ);
 		if (param->twt_responder)
-			cmd->peer_flags |= WMI_PEER_TWT_RESP;
+			cmd->peer_flags |= cpu_to_le32(WMI_PEER_TWT_RESP);
 	}
 
 	/* Suppress authorization for all AUTH modes that need 4-way handshake
@@ -1944,21 +2010,21 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 	 * Authorization will be done for these modes on key installation.
 	 */
 	if (param->auth_flag)
-		cmd->peer_flags |= WMI_PEER_AUTH;
+		cmd->peer_flags |= cpu_to_le32(WMI_PEER_AUTH);
 	if (param->need_ptk_4_way) {
-		cmd->peer_flags |= WMI_PEER_NEED_PTK_4_WAY;
+		cmd->peer_flags |= cpu_to_le32(WMI_PEER_NEED_PTK_4_WAY);
 		if (!hw_crypto_disabled && param->is_assoc)
-			cmd->peer_flags &= ~WMI_PEER_AUTH;
+			cmd->peer_flags &= cpu_to_le32(~WMI_PEER_AUTH);
 	}
 	if (param->need_gtk_2_way)
-		cmd->peer_flags |= WMI_PEER_NEED_GTK_2_WAY;
+		cmd->peer_flags |= cpu_to_le32(WMI_PEER_NEED_GTK_2_WAY);
 	/* safe mode bypass the 4-way handshake */
 	if (param->safe_mode_enabled)
-		cmd->peer_flags &= ~(WMI_PEER_NEED_PTK_4_WAY |
-				     WMI_PEER_NEED_GTK_2_WAY);
+		cmd->peer_flags &= cpu_to_le32(~(WMI_PEER_NEED_PTK_4_WAY |
+				     WMI_PEER_NEED_GTK_2_WAY));
 
 	if (param->is_pmf_enabled)
-		cmd->peer_flags |= WMI_PEER_PMF;
+		cmd->peer_flags |= cpu_to_le32(WMI_PEER_PMF);
 
 	/* Disable AMSDU for station transmit, if user configures it */
 	/* Disable AMSDU for AP transmit to 11n Stations, if user configures
@@ -1971,7 +2037,7 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 	 * iwpriv
 	 **/
 	if (param->peer_ht_rates.num_rates == 0)
-		cmd->peer_flags &= ~WMI_PEER_HT;
+		cmd->peer_flags &= cpu_to_le32(~WMI_PEER_HT);
 }
 
 int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
@@ -2006,14 +2072,15 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	ptr = skb->data;
 
 	cmd = ptr;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_PEER_ASSOC_COMPLETE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PEER_ASSOC_COMPLETE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = param->vdev_id;
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
 
-	cmd->peer_new_assoc = param->peer_new_assoc;
-	cmd->peer_associd = param->peer_associd;
+	cmd->peer_new_assoc = cpu_to_le32(param->peer_new_assoc);
+	cmd->peer_associd = cpu_to_le32(param->peer_associd);
 
 	ath11k_wmi_copy_peer_flags(cmd, param,
 				   test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED,
@@ -2021,36 +2088,39 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 
 	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_mac);
 
-	cmd->peer_rate_caps = param->peer_rate_caps;
-	cmd->peer_caps = param->peer_caps;
-	cmd->peer_listen_intval = param->peer_listen_intval;
-	cmd->peer_ht_caps = param->peer_ht_caps;
-	cmd->peer_max_mpdu = param->peer_max_mpdu;
-	cmd->peer_mpdu_density = param->peer_mpdu_density;
-	cmd->peer_vht_caps = param->peer_vht_caps;
-	cmd->peer_phymode = param->peer_phymode;
+	cmd->peer_rate_caps = cpu_to_le32(param->peer_rate_caps);
+	cmd->peer_caps = cpu_to_le32(param->peer_caps);
+	cmd->peer_listen_intval = cpu_to_le32(param->peer_listen_intval);
+	cmd->peer_ht_caps = cpu_to_le32(param->peer_ht_caps);
+	cmd->peer_max_mpdu = cpu_to_le32(param->peer_max_mpdu);
+	cmd->peer_mpdu_density = cpu_to_le32(param->peer_mpdu_density);
+	cmd->peer_vht_caps = cpu_to_le32(param->peer_vht_caps);
+	cmd->peer_phymode = cpu_to_le32(param->peer_phymode);
 
 	/* Update 11ax capabilities */
 	cmd->peer_he_cap_info = param->peer_he_cap_macinfo[0];
 	cmd->peer_he_cap_info_ext = param->peer_he_cap_macinfo[1];
-	cmd->peer_he_cap_info_internal = param->peer_he_cap_macinfo_internal;
-	cmd->peer_he_caps_6ghz = param->peer_he_caps_6ghz;
-	cmd->peer_he_ops = param->peer_he_ops;
+	cmd->peer_he_cap_info_internal = cpu_to_le32(param->peer_he_cap_macinfo_internal);
+	cmd->peer_he_caps_6ghz = cpu_to_le32(param->peer_he_caps_6ghz);
+	cmd->peer_he_ops = cpu_to_le32(param->peer_he_ops);
 	memcpy(&cmd->peer_he_cap_phy, &param->peer_he_cap_phyinfo,
 	       sizeof(param->peer_he_cap_phyinfo));
-	memcpy(&cmd->peer_ppet, &param->peer_ppet,
-	       sizeof(param->peer_ppet));
+	cmd->peer_ppet.numss_m1 = cpu_to_le32(param->peer_ppet.numss_m1);
+	cmd->peer_ppet.ru_mask = cpu_to_le32(param->peer_ppet.ru_bit_mask);
+	for (i = 0; i < ARRAY_SIZE(cmd->peer_ppet.ppet16_ppet8_ru3_ru0); i++)
+		cmd->peer_ppet.ppet16_ppet8_ru3_ru0[i] =
+			cpu_to_le32(param->peer_ppet.ppet16_ppet8_ru3_ru0[i]);
 
 	/* Update peer legacy rate information */
 	ptr += sizeof(*cmd);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, peer_legacy_rates_align);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(peer_legacy_rates_align, WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 
-	cmd->num_peer_legacy_rates = param->peer_legacy_rates.num_rates;
+	cmd->num_peer_legacy_rates = cpu_to_le32(param->peer_legacy_rates.num_rates);
 	memcpy(ptr, param->peer_legacy_rates.rates,
 	       param->peer_legacy_rates.num_rates);
 
@@ -2058,10 +2128,10 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	ptr += peer_legacy_rates_align;
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, peer_ht_rates_align);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(peer_ht_rates_align, WMI_TLV_LEN);
 	ptr += TLV_HDR_SIZE;
-	cmd->num_peer_ht_rates = param->peer_ht_rates.num_rates;
+	cmd->num_peer_ht_rates = cpu_to_le32(param->peer_ht_rates.num_rates);
 	memcpy(ptr, param->peer_ht_rates.rates,
 	       param->peer_ht_rates.num_rates);
 
@@ -2070,51 +2140,52 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 
 	mcs = ptr;
 
-	mcs->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VHT_RATE_SET) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*mcs) - TLV_HDR_SIZE);
+	mcs->tlv_header = le32_encode_bits(WMI_TAG_VHT_RATE_SET, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*mcs) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->peer_nss = param->peer_nss;
+	cmd->peer_nss = cpu_to_le32(param->peer_nss);
 
 	/* Update bandwidth-NSS mapping */
 	cmd->peer_bw_rxnss_override = 0;
-	cmd->peer_bw_rxnss_override |= param->peer_bw_rxnss_override;
+	cmd->peer_bw_rxnss_override |= cpu_to_le32(param->peer_bw_rxnss_override);
 
 	if (param->vht_capable) {
 		/* firmware interprets mcs->tx_mcs_set field as peer's
 		 * RX capability
 		 */
-		mcs->tx_max_rate = param->rx_max_rate;
-		mcs->tx_mcs_set = param->rx_mcs_set;
-		mcs->rx_max_rate = param->tx_max_rate;
-		mcs->rx_mcs_set = param->tx_mcs_set;
+		mcs->tx_max_rate = cpu_to_le32(param->rx_max_rate);
+		mcs->tx_mcs_set = cpu_to_le32(param->rx_mcs_set);
+		mcs->rx_max_rate = cpu_to_le32(param->tx_max_rate);
+		mcs->rx_mcs_set = cpu_to_le32(param->tx_mcs_set);
 	}
 
 	/* HE Rates */
-	cmd->peer_he_mcs = param->peer_he_mcs_count;
-	cmd->min_data_rate = param->min_data_rate;
+	cmd->peer_he_mcs = cpu_to_le32(param->peer_he_mcs_count);
+	cmd->min_data_rate = cpu_to_le32(param->min_data_rate);
 
 	ptr += sizeof(*mcs);
 
 	len = param->peer_he_mcs_count * sizeof(*he_mcs);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 	ptr += TLV_HDR_SIZE;
 
 	/* Loop through the HE rate set */
 	for (i = 0; i < param->peer_he_mcs_count; i++) {
 		he_mcs = ptr;
-		he_mcs->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-						WMI_TAG_HE_RATE_SET) |
-				     FIELD_PREP(WMI_TLV_LEN,
-						sizeof(*he_mcs) - TLV_HDR_SIZE);
+		he_mcs->tlv_header = le32_encode_bits(WMI_TAG_HE_RATE_SET,
+						      WMI_TLV_TAG) |
+				     le32_encode_bits(sizeof(*he_mcs) - TLV_HDR_SIZE,
+						      WMI_TLV_LEN);
 
 		/* firmware interprets mcs->rx_mcs_set field as peer's
 		 * RX capability
 		 */
-		he_mcs->rx_mcs_set = param->peer_he_rx_mcs_set[i];
-		he_mcs->tx_mcs_set = param->peer_he_tx_mcs_set[i];
+		he_mcs->rx_mcs_set = cpu_to_le32(param->peer_he_rx_mcs_set[i]);
+		he_mcs->tx_mcs_set = cpu_to_le32(param->peer_he_tx_mcs_set[i]);
 		ptr += sizeof(*he_mcs);
 	}
 
@@ -2188,75 +2259,76 @@ ath11k_wmi_copy_scan_event_cntrl_flags(struct wmi_start_scan_cmd *cmd,
 {
 	/* Scan events subscription */
 	if (param->scan_ev_started)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_STARTED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_STARTED);
 	if (param->scan_ev_completed)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_COMPLETED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_COMPLETED);
 	if (param->scan_ev_bss_chan)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_BSS_CHANNEL;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_BSS_CHANNEL);
 	if (param->scan_ev_foreign_chan)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_FOREIGN_CHAN;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_FOREIGN_CHAN);
 	if (param->scan_ev_dequeued)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_DEQUEUED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_DEQUEUED);
 	if (param->scan_ev_preempted)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_PREEMPTED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_PREEMPTED);
 	if (param->scan_ev_start_failed)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_START_FAILED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_START_FAILED);
 	if (param->scan_ev_restarted)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_RESTARTED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_RESTARTED);
 	if (param->scan_ev_foreign_chn_exit)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_FOREIGN_CHAN_EXIT;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_FOREIGN_CHAN_EXIT);
 	if (param->scan_ev_suspended)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_SUSPENDED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_SUSPENDED);
 	if (param->scan_ev_resumed)
-		cmd->notify_scan_events |=  WMI_SCAN_EVENT_RESUMED;
+		cmd->notify_scan_events |=  cpu_to_le32(WMI_SCAN_EVENT_RESUMED);
 
 	/** Set scan control flags */
 	cmd->scan_ctrl_flags = 0;
 	if (param->scan_f_passive)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FLAG_PASSIVE;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FLAG_PASSIVE);
 	if (param->scan_f_strict_passive_pch)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FLAG_STRICT_PASSIVE_ON_PCHN;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FLAG_STRICT_PASSIVE_ON_PCHN);
 	if (param->scan_f_promisc_mode)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FILTER_PROMISCUOS;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FILTER_PROMISCUOS);
 	if (param->scan_f_capture_phy_err)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_CAPTURE_PHY_ERROR;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_CAPTURE_PHY_ERROR);
 	if (param->scan_f_half_rate)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FLAG_HALF_RATE_SUPPORT;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FLAG_HALF_RATE_SUPPORT);
 	if (param->scan_f_quarter_rate)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FLAG_QUARTER_RATE_SUPPORT;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FLAG_QUARTER_RATE_SUPPORT);
 	if (param->scan_f_cck_rates)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_ADD_CCK_RATES;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_ADD_CCK_RATES);
 	if (param->scan_f_ofdm_rates)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_ADD_OFDM_RATES;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_ADD_OFDM_RATES);
 	if (param->scan_f_chan_stat_evnt)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_CHAN_STAT_EVENT;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_CHAN_STAT_EVENT);
 	if (param->scan_f_filter_prb_req)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FILTER_PROBE_REQ;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FILTER_PROBE_REQ);
 	if (param->scan_f_bcast_probe)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_ADD_BCAST_PROBE_REQ;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_ADD_BCAST_PROBE_REQ);
 	if (param->scan_f_offchan_mgmt_tx)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_OFFCHAN_MGMT_TX;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_OFFCHAN_MGMT_TX);
 	if (param->scan_f_offchan_data_tx)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_OFFCHAN_DATA_TX;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_OFFCHAN_DATA_TX);
 	if (param->scan_f_force_active_dfs_chn)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_FLAG_FORCE_ACTIVE_ON_DFS);
 	if (param->scan_f_add_tpc_ie_in_probe)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_ADD_TPC_IE_IN_PROBE_REQ;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_ADD_TPC_IE_IN_PROBE_REQ);
 	if (param->scan_f_add_ds_ie_in_probe)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_ADD_DS_IE_IN_PROBE_REQ;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_ADD_DS_IE_IN_PROBE_REQ);
 	if (param->scan_f_add_spoofed_mac_in_probe)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_ADD_SPOOF_MAC_IN_PROBE_REQ;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_ADD_SPOOF_MAC_IN_PROBE_REQ);
 	if (param->scan_f_add_rand_seq_in_probe)
-		cmd->scan_ctrl_flags |=  WMI_SCAN_RANDOM_SEQ_NO_IN_PROBE_REQ;
+		cmd->scan_ctrl_flags |=  cpu_to_le32(WMI_SCAN_RANDOM_SEQ_NO_IN_PROBE_REQ);
 	if (param->scan_f_en_ie_whitelist_in_probe)
 		cmd->scan_ctrl_flags |=
-			 WMI_SCAN_ENABLE_IE_WHTELIST_IN_PROBE_REQ;
+			 cpu_to_le32(WMI_SCAN_ENABLE_IE_WHTELIST_IN_PROBE_REQ);
 
 	/* for adaptive scan mode using 3 bits (21 - 23 bits) */
-	WMI_SCAN_SET_DWELL_MODE(cmd->scan_ctrl_flags,
-				param->adaptive_dwell_time_mode);
+	cmd->scan_ctrl_flags |=
+		cpu_to_le32((param->adaptive_dwell_time_mode <<
+			     WMI_SCAN_DWELL_MODE_SHIFT) & WMI_SCAN_DWELL_MODE_MASK);
 
-	cmd->scan_ctrl_flags_ext = param->scan_ctrl_flags_ext;
+	cmd->scan_ctrl_flags_ext = cpu_to_le32(param->scan_ctrl_flags_ext);
 }
 
 int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
@@ -2264,13 +2336,13 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 {
 	struct ath11k_pdev_wmi *wmi = ar->wmi;
 	struct wmi_start_scan_cmd *cmd;
-	struct wmi_ssid *ssid = NULL;
+	struct wmi_ssid_params *ssid = NULL;
 	struct wmi_mac_addr *bssid;
 	struct sk_buff *skb;
 	struct wmi_tlv *tlv;
 	void *ptr;
 	int i, ret, len;
-	u32 *tmp_ptr;
+	__le32 *tmp_ptr;
 	u16 extraie_len_with_pad = 0;
 	struct hint_short_ssid *s_ssid = NULL;
 	struct hint_bssid *hint_bssid = NULL;
@@ -2310,35 +2382,37 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	ptr = skb->data;
 
 	cmd = ptr;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_START_SCAN_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_START_SCAN_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->scan_id = params->scan_id;
-	cmd->scan_req_id = params->scan_req_id;
-	cmd->vdev_id = params->vdev_id;
-	cmd->scan_priority = params->scan_priority;
-	cmd->notify_scan_events = params->notify_scan_events;
+	cmd->scan_id = cpu_to_le32(params->scan_id);
+	cmd->scan_req_id = cpu_to_le32(params->scan_req_id);
+	cmd->vdev_id = cpu_to_le32(params->vdev_id);
+	cmd->scan_priority = cpu_to_le32(params->scan_priority);
+	cmd->notify_scan_events = cpu_to_le32(params->notify_scan_events);
 
 	ath11k_wmi_copy_scan_event_cntrl_flags(cmd, params);
 
-	cmd->dwell_time_active = params->dwell_time_active;
-	cmd->dwell_time_active_2g = params->dwell_time_active_2g;
-	cmd->dwell_time_passive = params->dwell_time_passive;
-	cmd->dwell_time_active_6g = params->dwell_time_active_6g;
-	cmd->dwell_time_passive_6g = params->dwell_time_passive_6g;
-	cmd->min_rest_time = params->min_rest_time;
-	cmd->max_rest_time = params->max_rest_time;
-	cmd->repeat_probe_time = params->repeat_probe_time;
-	cmd->probe_spacing_time = params->probe_spacing_time;
-	cmd->idle_time = params->idle_time;
-	cmd->max_scan_time = params->max_scan_time;
-	cmd->probe_delay = params->probe_delay;
-	cmd->burst_duration = params->burst_duration;
-	cmd->num_chan = params->num_chan;
-	cmd->num_bssid = params->num_bssid;
-	cmd->num_ssids = params->num_ssids;
-	cmd->ie_len = params->extraie.len;
-	cmd->n_probes = params->n_probes;
+	cmd->dwell_time_active = cpu_to_le32(params->dwell_time_active);
+	cmd->dwell_time_active_2g = cpu_to_le32(params->dwell_time_active_2g);
+	cmd->dwell_time_passive = cpu_to_le32(params->dwell_time_passive);
+	cmd->dwell_time_active_6g = cpu_to_le32(params->dwell_time_active_6g);
+	cmd->dwell_time_passive_6g = cpu_to_le32(params->dwell_time_passive_6g);
+	cmd->min_rest_time = cpu_to_le32(params->min_rest_time);
+	cmd->max_rest_time = cpu_to_le32(params->max_rest_time);
+	cmd->repeat_probe_time = cpu_to_le32(params->repeat_probe_time);
+	cmd->probe_spacing_time = cpu_to_le32(params->probe_spacing_time);
+	cmd->idle_time = cpu_to_le32(params->idle_time);
+	cmd->max_scan_time = cpu_to_le32(params->max_scan_time);
+	cmd->probe_delay = cpu_to_le32(params->probe_delay);
+	cmd->burst_duration = cpu_to_le32(params->burst_duration);
+	cmd->num_chan = cpu_to_le32(params->num_chan);
+	cmd->num_bssid = cpu_to_le32(params->num_bssid);
+	cmd->num_ssids = cpu_to_le32(params->num_ssids);
+	cmd->ie_len = cpu_to_le32(params->extraie.len);
+	cmd->n_probes = cpu_to_le32(params->n_probes);
 	ether_addr_copy(cmd->mac_addr.addr, params->mac_addr.addr);
 	ether_addr_copy(cmd->mac_mask.addr, params->mac_mask.addr);
 
@@ -2347,27 +2421,28 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	len = params->num_chan * sizeof(u32);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_UINT32) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_UINT32, WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 	ptr += TLV_HDR_SIZE;
 	tmp_ptr = ptr;
 
 	for (i = 0; i < params->num_chan; ++i)
-		tmp_ptr[i] = params->chan_list[i];
+		tmp_ptr[i] = cpu_to_le32(params->chan_list[i]);
 
 	ptr += len;
 
 	len = params->num_ssids * sizeof(*ssid);
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_FIXED_STRUCT,
+				       WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 
 	if (params->num_ssids) {
 		ssid = ptr;
 		for (i = 0; i < params->num_ssids; ++i) {
-			ssid->ssid_len = params->ssid[i].length;
+			ssid->ssid_len = cpu_to_le32(params->ssid[i].length);
 			memcpy(ssid->ssid, params->ssid[i].ssid,
 			       params->ssid[i].length);
 			ssid++;
@@ -2377,8 +2452,9 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	ptr += (params->num_ssids * sizeof(*ssid));
 	len = params->num_bssid * sizeof(*bssid);
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_FIXED_STRUCT,
+				       WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 	bssid = ptr;
@@ -2395,8 +2471,8 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 
 	len = extraie_len_with_pad;
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 	ptr += TLV_HDR_SIZE;
 
 	if (extraie_len_with_pad)
@@ -2408,8 +2484,9 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	if (params->num_hint_s_ssid) {
 		len = params->num_hint_s_ssid * sizeof(struct hint_short_ssid);
 		tlv = ptr;
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
-			      FIELD_PREP(WMI_TLV_LEN, len);
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_FIXED_STRUCT,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(len, WMI_TLV_LEN);
 		ptr += TLV_HDR_SIZE;
 		s_ssid = ptr;
 		for (i = 0; i < params->num_hint_s_ssid; ++i) {
@@ -2423,8 +2500,9 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	if (params->num_hint_bssid) {
 		len = params->num_hint_bssid * sizeof(struct hint_bssid);
 		tlv = ptr;
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_FIXED_STRUCT) |
-			      FIELD_PREP(WMI_TLV_LEN, len);
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_FIXED_STRUCT,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(len, WMI_TLV_LEN);
 		ptr += TLV_HDR_SIZE;
 		hint_bssid = ptr;
 		for (i = 0; i < params->num_hint_bssid; ++i) {
@@ -2470,12 +2548,14 @@ int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
 	ptr = skb->data;
 
 	cmd = (struct wmi_vdev_set_tpc_power_cmd *)ptr;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_SET_TPC_POWER_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->psd_power = param->is_psd_power;
-	cmd->eirp_power = param->eirp_power;
-	cmd->power_type_6ghz = param->ap_power_type;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_SET_TPC_POWER_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->psd_power = cpu_to_le32(param->is_psd_power);
+	cmd->eirp_power = cpu_to_le32(param->eirp_power);
+	cmd->power_type_6ghz = cpu_to_le32(param->ap_power_type);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "tpc vdev id %d is psd power %d eirp power %d 6 ghz power type %d\n",
@@ -2483,20 +2563,20 @@ int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
 
 	ptr += sizeof(*cmd);
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, array_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(array_len, WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 	ch = (struct wmi_vdev_ch_power_info *)ptr;
 
 	for (i = 0; i < param->num_pwr_levels; i++, ch++) {
-		ch->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-					    WMI_TAG_VDEV_CH_POWER_INFO) |
-				FIELD_PREP(WMI_TLV_LEN,
-					   sizeof(*ch) - TLV_HDR_SIZE);
+		ch->tlv_header = le32_encode_bits(WMI_TAG_VDEV_CH_POWER_INFO,
+						  WMI_TLV_TAG) |
+				le32_encode_bits(sizeof(*ch) - TLV_HDR_SIZE,
+						 WMI_TLV_LEN);
 
-		ch->chan_cfreq = param->chan_power_info[i].chan_cfreq;
-		ch->tx_power = param->chan_power_info[i].tx_power;
+		ch->chan_cfreq = cpu_to_le32(param->chan_power_info[i].chan_cfreq);
+		ch->tx_power = cpu_to_le32(param->chan_power_info[i].tx_power);
 
 		ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tpc chan freq %d TX power %d\n",
 			   ch->chan_cfreq, ch->tx_power);
@@ -2526,20 +2606,21 @@ int ath11k_wmi_send_scan_stop_cmd(struct ath11k *ar,
 
 	cmd = (struct wmi_stop_scan_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_STOP_SCAN_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_STOP_SCAN_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = param->vdev_id;
-	cmd->requestor = param->requester;
-	cmd->scan_id = param->scan_id;
-	cmd->pdev_id = param->pdev_id;
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
+	cmd->requestor = cpu_to_le32(param->requester);
+	cmd->scan_id = cpu_to_le32(param->scan_id);
+	cmd->pdev_id = cpu_to_le32(param->pdev_id);
 	/* stop the scan with the corresponding scan_id */
 	if (param->req_type == WLAN_SCAN_CANCEL_PDEV_ALL) {
 		/* Cancelling all scans */
-		cmd->req_type =  WMI_SCAN_STOP_ALL;
+		cmd->req_type =  cpu_to_le32(WMI_SCAN_STOP_ALL);
 	} else if (param->req_type == WLAN_SCAN_CANCEL_VDEV_ALL) {
 		/* Cancelling VAP scans */
-		cmd->req_type =  WMI_SCN_STOP_VAP_ALL;
+		cmd->req_type =  cpu_to_le32(WMI_SCN_STOP_VAP_ALL);
 	} else if (param->req_type == WLAN_SCAN_CANCEL_SINGLE) {
 		/* Cancelling specific scan */
 		cmd->req_type =  WMI_SCAN_STOP_ONE;
@@ -2574,7 +2655,7 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 	void *ptr;
 	int i, ret, len;
 	u16 num_send_chans, num_sends = 0, max_chan_limit = 0;
-	u32 *reg1, *reg2;
+	__le32 *reg1, *reg2;
 
 	tchan_info = chan_list->ch_param;
 	while (chan_list->nallchans) {
@@ -2595,12 +2676,14 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 			return -ENOMEM;
 
 		cmd = (struct wmi_scan_chan_list_cmd *)skb->data;
-		cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_SCAN_CHAN_LIST_CMD) |
-			FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-		cmd->pdev_id = chan_list->pdev_id;
-		cmd->num_scan_chans = num_send_chans;
+		cmd->tlv_header = le32_encode_bits(WMI_TAG_SCAN_CHAN_LIST_CMD,
+						   WMI_TLV_TAG) |
+			le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					 WMI_TLV_LEN);
+		cmd->pdev_id = cpu_to_le32(chan_list->pdev_id);
+		cmd->num_scan_chans = cpu_to_le32(num_send_chans);
 		if (num_sends)
-			cmd->flags |= WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG;
+			cmd->flags |= cpu_to_le32(WMI_APPEND_TO_EXISTING_CHAN_LIST_FLAG);
 
 		ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 			   "no.of chan = %d len = %d pdev_id = %d num_sends = %d\n",
@@ -2610,56 +2693,57 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 
 		len = sizeof(*chan_info) * num_send_chans;
 		tlv = ptr;
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-			      FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 		ptr += TLV_HDR_SIZE;
 
 		for (i = 0; i < num_send_chans; ++i) {
 			chan_info = ptr;
 			memset(chan_info, 0, sizeof(*chan_info));
 			len = sizeof(*chan_info);
-			chan_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-							   WMI_TAG_CHANNEL) |
-						FIELD_PREP(WMI_TLV_LEN,
-							   len - TLV_HDR_SIZE);
+			chan_info->tlv_header = le32_encode_bits(WMI_TAG_CHANNEL,
+								 WMI_TLV_TAG) |
+						le32_encode_bits(len - TLV_HDR_SIZE,
+								 WMI_TLV_LEN);
 
 			reg1 = &chan_info->reg_info_1;
 			reg2 = &chan_info->reg_info_2;
-			chan_info->mhz = tchan_info->mhz;
-			chan_info->band_center_freq1 = tchan_info->cfreq1;
-			chan_info->band_center_freq2 = tchan_info->cfreq2;
+			chan_info->mhz = cpu_to_le32(tchan_info->mhz);
+			chan_info->band_center_freq1 = cpu_to_le32(tchan_info->cfreq1);
+			chan_info->band_center_freq2 = cpu_to_le32(tchan_info->cfreq2);
 
 			if (tchan_info->is_chan_passive)
-				chan_info->info |= WMI_CHAN_INFO_PASSIVE;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_PASSIVE);
 			if (tchan_info->allow_he)
-				chan_info->info |= WMI_CHAN_INFO_ALLOW_HE;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_HE);
 			else if (tchan_info->allow_vht)
-				chan_info->info |= WMI_CHAN_INFO_ALLOW_VHT;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_VHT);
 			else if (tchan_info->allow_ht)
-				chan_info->info |= WMI_CHAN_INFO_ALLOW_HT;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_HT);
 			if (tchan_info->half_rate)
-				chan_info->info |= WMI_CHAN_INFO_HALF_RATE;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_HALF_RATE);
 			if (tchan_info->quarter_rate)
-				chan_info->info |= WMI_CHAN_INFO_QUARTER_RATE;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_QUARTER_RATE);
 			if (tchan_info->psc_channel)
-				chan_info->info |= WMI_CHAN_INFO_PSC;
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_PSC);
 			if (tchan_info->dfs_set)
-				chan_info->info |= WMI_CHAN_INFO_DFS;
-
-			chan_info->info |= FIELD_PREP(WMI_CHAN_INFO_MODE,
-						      tchan_info->phy_mode);
-			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MIN_PWR,
-					    tchan_info->minpower);
-			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_PWR,
-					    tchan_info->maxpower);
-			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_MAX_REG_PWR,
-					    tchan_info->maxregpower);
-			*reg1 |= FIELD_PREP(WMI_CHAN_REG_INFO1_REG_CLS,
-					    tchan_info->reg_class_id);
-			*reg2 |= FIELD_PREP(WMI_CHAN_REG_INFO2_ANT_MAX,
-					    tchan_info->antennamax);
-			*reg2 |= FIELD_PREP(WMI_CHAN_REG_INFO2_MAX_TX_PWR,
-					    tchan_info->maxregpower);
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_DFS);
+
+			chan_info->info |= le32_encode_bits(tchan_info->phy_mode,
+							    WMI_CHAN_INFO_MODE);
+			*reg1 |= le32_encode_bits(tchan_info->minpower,
+						  WMI_CHAN_REG_INFO1_MIN_PWR);
+			*reg1 |= le32_encode_bits(tchan_info->maxpower,
+						  WMI_CHAN_REG_INFO1_MAX_PWR);
+			*reg1 |= le32_encode_bits(tchan_info->maxregpower,
+						  WMI_CHAN_REG_INFO1_MAX_REG_PWR);
+			*reg1 |= le32_encode_bits(tchan_info->reg_class_id,
+						  WMI_CHAN_REG_INFO1_REG_CLS);
+			*reg2 |= le32_encode_bits(tchan_info->antennamax,
+						  WMI_CHAN_REG_INFO2_ANT_MAX);
+			*reg2 |= le32_encode_bits(tchan_info->maxregpower,
+						  WMI_CHAN_REG_INFO2_MAX_TX_PWR);
 
 			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 				   "chan scan list chan[%d] = %u, chan_info->info %8x\n",
@@ -2702,12 +2786,11 @@ int ath11k_wmi_send_wmm_update_cmd_tlv(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_vdev_set_wmm_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_VDEV_SET_WMM_PARAMS_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_SET_WMM_PARAMS_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->wmm_param_type = wmm_param_type;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->wmm_param_type = cpu_to_le32(wmm_param_type);
 
 	for (ac = 0; ac < WME_NUM_AC; ac++) {
 		switch (ac) {
@@ -2727,17 +2810,17 @@ int ath11k_wmi_send_wmm_update_cmd_tlv(struct ath11k *ar, u32 vdev_id,
 
 		wmm_param = (struct wmi_wmm_params *)&cmd->wmm_params[ac];
 		wmm_param->tlv_header =
-				FIELD_PREP(WMI_TLV_TAG,
-					   WMI_TAG_VDEV_SET_WMM_PARAMS_CMD) |
-				FIELD_PREP(WMI_TLV_LEN,
-					   sizeof(*wmm_param) - TLV_HDR_SIZE);
-
-		wmm_param->aifs = wmi_wmm_arg->aifs;
-		wmm_param->cwmin = wmi_wmm_arg->cwmin;
-		wmm_param->cwmax = wmi_wmm_arg->cwmax;
-		wmm_param->txoplimit = wmi_wmm_arg->txop;
-		wmm_param->acm = wmi_wmm_arg->acm;
-		wmm_param->no_ack = wmi_wmm_arg->no_ack;
+				le32_encode_bits(WMI_TAG_VDEV_SET_WMM_PARAMS_CMD,
+						 WMI_TLV_TAG) |
+				le32_encode_bits(sizeof(*wmm_param) - TLV_HDR_SIZE,
+						 WMI_TLV_LEN);
+
+		wmm_param->aifs = cpu_to_le32(wmi_wmm_arg->aifs);
+		wmm_param->cwmin = cpu_to_le32(wmi_wmm_arg->cwmin);
+		wmm_param->cwmax = cpu_to_le32(wmi_wmm_arg->cwmax);
+		wmm_param->txoplimit = cpu_to_le32(wmi_wmm_arg->txop);
+		wmm_param->acm = cpu_to_le32(wmi_wmm_arg->acm);
+		wmm_param->no_ack = cpu_to_le32(wmi_wmm_arg->no_ack);
 
 		ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 			   "wmm set type %d ac %d aifs %d cwmin %d cwmax %d txop %d acm %d no_ack %d\n",
@@ -2772,11 +2855,11 @@ int ath11k_wmi_send_dfs_phyerr_offload_enable_cmd(struct ath11k *ar,
 
 	cmd = (struct wmi_dfs_phyerr_offload_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_PDEV_DFS_PHYERR_OFFLOAD_ENABLE_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+		le32_encode_bits(WMI_TAG_PDEV_DFS_PHYERR_OFFLOAD_ENABLE_CMD,
+				 WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->pdev_id = pdev_id;
+	cmd->pdev_id = cpu_to_le32(pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_DFS_PHYERR_OFFLOAD_ENABLE_CMDID);
@@ -2805,13 +2888,15 @@ int ath11k_wmi_delba_send(struct ath11k *ar, u32 vdev_id, const u8 *mac,
 		return -ENOMEM;
 
 	cmd = (struct wmi_delba_send_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_DELBA_SEND_CMD) |
-			FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_DELBA_SEND_CMD,
+					   WMI_TLV_TAG) |
+			le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					 WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, mac);
-	cmd->tid = tid;
-	cmd->initiator = initiator;
-	cmd->reasoncode = reason;
+	cmd->tid = cpu_to_le32(tid);
+	cmd->initiator = cpu_to_le32(initiator);
+	cmd->reasoncode = cpu_to_le32(reason);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_DELBA_SEND_CMDID);
 
@@ -2842,12 +2927,12 @@ int ath11k_wmi_addba_set_resp(struct ath11k *ar, u32 vdev_id, const u8 *mac,
 
 	cmd = (struct wmi_addba_setresponse_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ADDBA_SETRESPONSE_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+		le32_encode_bits(WMI_TAG_ADDBA_SETRESPONSE_CMD, WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, mac);
-	cmd->tid = tid;
-	cmd->statuscode = status;
+	cmd->tid = cpu_to_le32(tid);
+	cmd->statuscode = cpu_to_le32(status);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_ADDBA_SET_RESP_CMDID);
 
@@ -2877,12 +2962,13 @@ int ath11k_wmi_addba_send(struct ath11k *ar, u32 vdev_id, const u8 *mac,
 		return -ENOMEM;
 
 	cmd = (struct wmi_addba_send_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ADDBA_SEND_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_ADDBA_SEND_CMD,
+					   WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, mac);
-	cmd->tid = tid;
-	cmd->buffersize = buf_size;
+	cmd->tid = cpu_to_le32(tid);
+	cmd->buffersize = cpu_to_le32(buf_size);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_ADDBA_SEND_CMDID);
 
@@ -2912,9 +2998,9 @@ int ath11k_wmi_addba_clear_resp(struct ath11k *ar, u32 vdev_id, const u8 *mac)
 
 	cmd = (struct wmi_addba_clear_resp_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ADDBA_CLEAR_RESP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
+		le32_encode_bits(WMI_TAG_ADDBA_CLEAR_RESP_CMD, WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, mac);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_ADDBA_CLEAR_RESP_CMDID);
@@ -2949,26 +3035,29 @@ int ath11k_wmi_pdev_peer_pktlog_filter(struct ath11k *ar, u8 *addr, u8 enable)
 
 	cmd = (struct wmi_pdev_pktlog_filter_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PEER_PKTLOG_FILTER_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_PEER_PKTLOG_FILTER_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->pdev_id = DP_HW2SW_MACID(ar->pdev->pdev_id);
-	cmd->num_mac = 1;
-	cmd->enable = enable;
+	cmd->pdev_id = cpu_to_le32(DP_HW2SW_MACID(ar->pdev->pdev_id));
+	cmd->num_mac = cpu_to_le32(1);
+	cmd->enable = cpu_to_le32(enable);
 
 	ptr = skb->data + sizeof(*cmd);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, sizeof(*info));
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(sizeof(*info), WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 	info = ptr;
 
 	ether_addr_copy(info->peer_macaddr.addr, addr);
-	info->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO) |
-			   FIELD_PREP(WMI_TLV_LEN,
-				      sizeof(*info) - TLV_HDR_SIZE);
+	info->tlv_header = le32_encode_bits(WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO,
+					    WMI_TLV_TAG) |
+			   le32_encode_bits(sizeof(*info) - TLV_HDR_SIZE,
+					    WMI_TLV_LEN);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_PKTLOG_FILTER_CMDID);
@@ -2997,11 +3086,10 @@ ath11k_wmi_send_init_country_cmd(struct ath11k *ar,
 
 	cmd = (struct wmi_init_country_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_SET_INIT_COUNTRY_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+		le32_encode_bits(WMI_TAG_SET_INIT_COUNTRY_CMD, WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
 
 	switch (init_cc_params.flags) {
 	case ALPHA_IS_SET:
@@ -3010,12 +3098,12 @@ ath11k_wmi_send_init_country_cmd(struct ath11k *ar,
 		       init_cc_params.cc_info.alpha2, 3);
 		break;
 	case CC_IS_SET:
-		cmd->init_cc_type = WMI_COUNTRY_INFO_TYPE_COUNTRY_CODE;
-		cmd->cc_info.country_code = init_cc_params.cc_info.country_code;
+		cmd->init_cc_type = cpu_to_le32(WMI_COUNTRY_INFO_TYPE_COUNTRY_CODE);
+		cmd->cc_info.country_code = cpu_to_le32(init_cc_params.cc_info.country_code);
 		break;
 	case REGDMN_IS_SET:
-		cmd->init_cc_type = WMI_COUNTRY_INFO_TYPE_REGDOMAIN;
-		cmd->cc_info.regdom_id = init_cc_params.cc_info.regdom_id;
+		cmd->init_cc_type = cpu_to_le32(WMI_COUNTRY_INFO_TYPE_REGDOMAIN);
+		cmd->cc_info.regdom_id = cpu_to_le32(init_cc_params.cc_info.regdom_id);
 		break;
 	default:
 		ath11k_warn(ar->ab, "unknown cc params flags: 0x%x",
@@ -3056,10 +3144,10 @@ int ath11k_wmi_send_set_current_country_cmd(struct ath11k *ar,
 
 	cmd = (struct wmi_set_current_country_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_SET_CURRENT_COUNTRY_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+		le32_encode_bits(WMI_TAG_SET_CURRENT_COUNTRY_CMD, WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->pdev_id = ar->pdev->pdev_id;
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
 	memcpy(&cmd->new_alpha2, &param->alpha2, 3);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_SET_CURRENT_COUNTRY_CMDID);
@@ -3098,33 +3186,36 @@ ath11k_wmi_send_thermal_mitigation_param_cmd(struct ath11k *ar,
 
 	cmd = (struct wmi_therm_throt_config_request_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_THERM_THROT_CONFIG_REQUEST) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_THERM_THROT_CONFIG_REQUEST,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->pdev_id = ar->pdev->pdev_id;
-	cmd->enable = param->enable;
-	cmd->dc = param->dc;
-	cmd->dc_per_event = param->dc_per_event;
-	cmd->therm_throt_levels = THERMAL_LEVELS;
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->enable = cpu_to_le32(param->enable);
+	cmd->dc = cpu_to_le32(param->dc);
+	cmd->dc_per_event = cpu_to_le32(param->dc_per_event);
+	cmd->therm_throt_levels = cpu_to_le32(THERMAL_LEVELS);
 
 	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN,
-				 (THERMAL_LEVELS *
-				  sizeof(struct wmi_therm_throt_level_config_info)));
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits((THERMAL_LEVELS *
+				  sizeof(struct wmi_therm_throt_level_config_info)), WMI_TLV_LEN);
 
 	lvl_conf = (struct wmi_therm_throt_level_config_info *)(skb->data +
 								sizeof(*cmd) +
 								TLV_HDR_SIZE);
 	for (i = 0; i < THERMAL_LEVELS; i++) {
 		lvl_conf->tlv_header =
-			FIELD_PREP(WMI_TLV_TAG, WMI_TAG_THERM_THROT_LEVEL_CONFIG_INFO) |
-			FIELD_PREP(WMI_TLV_LEN, sizeof(*lvl_conf) - TLV_HDR_SIZE);
-
-		lvl_conf->temp_lwm = param->levelconf[i].tmplwm;
-		lvl_conf->temp_hwm = param->levelconf[i].tmphwm;
-		lvl_conf->dc_off_percent = param->levelconf[i].dcoffpercent;
-		lvl_conf->prio = param->levelconf[i].priority;
+			le32_encode_bits(WMI_TAG_THERM_THROT_LEVEL_CONFIG_INFO,
+					 WMI_TLV_TAG) |
+			le32_encode_bits(sizeof(*lvl_conf) - TLV_HDR_SIZE,
+					 WMI_TLV_LEN);
+
+		lvl_conf->temp_lwm = cpu_to_le32(param->levelconf[i].tmplwm);
+		lvl_conf->temp_hwm = cpu_to_le32(param->levelconf[i].tmphwm);
+		lvl_conf->dc_off_percent = cpu_to_le32(param->levelconf[i].dcoffpercent);
+		lvl_conf->prio = cpu_to_le32(param->levelconf[i].priority);
 		lvl_conf++;
 	}
 
@@ -3156,12 +3247,12 @@ int ath11k_wmi_send_11d_scan_start_cmd(struct ath11k *ar,
 
 	cmd = (struct wmi_11d_scan_start_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_11D_SCAN_START_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+		le32_encode_bits(WMI_TAG_11D_SCAN_START_CMD, WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = param->vdev_id;
-	cmd->scan_period_msec = param->scan_period_msec;
-	cmd->start_interval_msec = param->start_interval_msec;
+	cmd->vdev_id = cpu_to_le32(param->vdev_id);
+	cmd->scan_period_msec = cpu_to_le32(param->scan_period_msec);
+	cmd->start_interval_msec = cpu_to_le32(param->start_interval_msec);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_11D_SCAN_START_CMDID);
 	if (ret) {
@@ -3192,10 +3283,10 @@ int ath11k_wmi_send_11d_scan_stop_cmd(struct ath11k *ar, u32 vdev_id)
 
 	cmd = (struct wmi_11d_scan_stop_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG, WMI_TAG_11D_SCAN_STOP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+		le32_encode_bits(WMI_TAG_11D_SCAN_STOP_CMD, WMI_TLV_TAG) |
+		le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_11D_SCAN_STOP_CMDID);
 	if (ret) {
@@ -3224,12 +3315,14 @@ int ath11k_wmi_pdev_pktlog_enable(struct ath11k *ar, u32 pktlog_filter)
 
 	cmd = (struct wmi_pktlog_enable_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PKTLOG_ENABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_PKTLOG_ENABLE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->pdev_id = DP_HW2SW_MACID(ar->pdev->pdev_id);
-	cmd->evlist = pktlog_filter;
-	cmd->enable = ATH11K_WMI_PKTLOG_ENABLE_FORCE;
+	cmd->pdev_id = cpu_to_le32(DP_HW2SW_MACID(ar->pdev->pdev_id));
+	cmd->evlist = cpu_to_le32(pktlog_filter);
+	cmd->enable = cpu_to_le32(ATH11K_WMI_PKTLOG_ENABLE_FORCE);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_PKTLOG_ENABLE_CMDID);
@@ -3256,10 +3349,12 @@ int ath11k_wmi_pdev_pktlog_disable(struct ath11k *ar)
 
 	cmd = (struct wmi_pktlog_disable_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_PKTLOG_DISABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_PKTLOG_DISABLE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->pdev_id = DP_HW2SW_MACID(ar->pdev->pdev_id);
+	cmd->pdev_id = cpu_to_le32(DP_HW2SW_MACID(ar->pdev->pdev_id));
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_PKTLOG_DISABLE_CMDID);
@@ -3315,25 +3410,26 @@ int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_twt_enable_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_ENABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = pdev_id;
-	cmd->sta_cong_timer_ms = params->sta_cong_timer_ms;
-	cmd->default_slot_size = params->default_slot_size;
-	cmd->congestion_thresh_setup = params->congestion_thresh_setup;
-	cmd->congestion_thresh_teardown = params->congestion_thresh_teardown;
-	cmd->congestion_thresh_critical = params->congestion_thresh_critical;
-	cmd->interference_thresh_teardown = params->interference_thresh_teardown;
-	cmd->interference_thresh_setup = params->interference_thresh_setup;
-	cmd->min_no_sta_setup = params->min_no_sta_setup;
-	cmd->min_no_sta_teardown = params->min_no_sta_teardown;
-	cmd->no_of_bcast_mcast_slots = params->no_of_bcast_mcast_slots;
-	cmd->min_no_twt_slots = params->min_no_twt_slots;
-	cmd->max_no_sta_twt = params->max_no_sta_twt;
-	cmd->mode_check_interval = params->mode_check_interval;
-	cmd->add_sta_slot_interval = params->add_sta_slot_interval;
-	cmd->remove_sta_slot_interval = params->remove_sta_slot_interval;
-	cmd->mbss_support = params->mbss_support;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_TWT_ENABLE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(pdev_id);
+	cmd->sta_cong_timer_ms = cpu_to_le32(params->sta_cong_timer_ms);
+	cmd->default_slot_size = cpu_to_le32(params->default_slot_size);
+	cmd->congestion_thresh_setup = cpu_to_le32(params->congestion_thresh_setup);
+	cmd->congestion_thresh_teardown = cpu_to_le32(params->congestion_thresh_teardown);
+	cmd->congestion_thresh_critical = cpu_to_le32(params->congestion_thresh_critical);
+	cmd->interference_thresh_teardown = cpu_to_le32(params->interference_thresh_teardown);
+	cmd->interference_thresh_setup = cpu_to_le32(params->interference_thresh_setup);
+	cmd->min_no_sta_setup = cpu_to_le32(params->min_no_sta_setup);
+	cmd->min_no_sta_teardown = cpu_to_le32(params->min_no_sta_teardown);
+	cmd->no_of_bcast_mcast_slots = cpu_to_le32(params->no_of_bcast_mcast_slots);
+	cmd->min_no_twt_slots = cpu_to_le32(params->min_no_twt_slots);
+	cmd->max_no_sta_twt = cpu_to_le32(params->max_no_sta_twt);
+	cmd->mode_check_interval = cpu_to_le32(params->mode_check_interval);
+	cmd->add_sta_slot_interval = cpu_to_le32(params->add_sta_slot_interval);
+	cmd->remove_sta_slot_interval = cpu_to_le32(params->remove_sta_slot_interval);
+	cmd->mbss_support = cpu_to_le32(params->mbss_support);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_ENABLE_CMDID);
 	if (ret) {
@@ -3365,9 +3461,10 @@ ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id)
 		return -ENOMEM;
 
 	cmd = (struct wmi_twt_disable_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_DISABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = pdev_id;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_TWT_DISABLE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(pdev_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_DISABLE_CMDID);
 	if (ret) {
@@ -3399,25 +3496,26 @@ int ath11k_wmi_send_twt_add_dialog_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_twt_add_dialog_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_ADD_DIALOG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_TWT_ADD_DIALOG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = params->vdev_id;
+	cmd->vdev_id = cpu_to_le32(params->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
-	cmd->dialog_id = params->dialog_id;
-	cmd->wake_intvl_us = params->wake_intvl_us;
-	cmd->wake_intvl_mantis = params->wake_intvl_mantis;
-	cmd->wake_dura_us = params->wake_dura_us;
-	cmd->sp_offset_us = params->sp_offset_us;
-	cmd->flags = params->twt_cmd;
+	cmd->dialog_id = cpu_to_le32(params->dialog_id);
+	cmd->wake_intvl_us = cpu_to_le32(params->wake_intvl_us);
+	cmd->wake_intvl_mantis = cpu_to_le32(params->wake_intvl_mantis);
+	cmd->wake_dura_us = cpu_to_le32(params->wake_dura_us);
+	cmd->sp_offset_us = cpu_to_le32(params->sp_offset_us);
+	cmd->flags = cpu_to_le32(params->twt_cmd);
 	if (params->flag_bcast)
-		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_BCAST;
+		cmd->flags |= cpu_to_le32(WMI_TWT_ADD_DIALOG_FLAG_BCAST);
 	if (params->flag_trigger)
-		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_TRIGGER;
+		cmd->flags |= cpu_to_le32(WMI_TWT_ADD_DIALOG_FLAG_TRIGGER);
 	if (params->flag_flow_type)
-		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_FLOW_TYPE;
+		cmd->flags |= cpu_to_le32(WMI_TWT_ADD_DIALOG_FLAG_FLOW_TYPE);
 	if (params->flag_protection)
-		cmd->flags |= WMI_TWT_ADD_DIALOG_FLAG_PROTECTION;
+		cmd->flags |= cpu_to_le32(WMI_TWT_ADD_DIALOG_FLAG_PROTECTION);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_ADD_DIALOG_CMDID);
 	if (ret) {
@@ -3453,12 +3551,13 @@ int ath11k_wmi_send_twt_del_dialog_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_twt_del_dialog_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_DEL_DIALOG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_TWT_DEL_DIALOG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = params->vdev_id;
+	cmd->vdev_id = cpu_to_le32(params->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
-	cmd->dialog_id = params->dialog_id;
+	cmd->dialog_id = cpu_to_le32(params->dialog_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_DEL_DIALOG_CMDID);
 	if (ret) {
@@ -3492,13 +3591,13 @@ int ath11k_wmi_send_twt_pause_dialog_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_twt_pause_dialog_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_TWT_PAUSE_DIALOG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_TWT_PAUSE_DIALOG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = params->vdev_id;
+	cmd->vdev_id = cpu_to_le32(params->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
-	cmd->dialog_id = params->dialog_id;
+	cmd->dialog_id = cpu_to_le32(params->dialog_id);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_PAUSE_DIALOG_CMDID);
 	if (ret) {
@@ -3532,15 +3631,15 @@ int ath11k_wmi_send_twt_resume_dialog_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_twt_resume_dialog_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_TWT_RESUME_DIALOG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_TWT_RESUME_DIALOG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = params->vdev_id;
+	cmd->vdev_id = cpu_to_le32(params->vdev_id);
 	ether_addr_copy(cmd->peer_macaddr.addr, params->peer_macaddr);
-	cmd->dialog_id = params->dialog_id;
-	cmd->sp_offset_us = params->sp_offset_us;
-	cmd->next_twt_size = params->next_twt_size;
+	cmd->dialog_id = cpu_to_le32(params->dialog_id);
+	cmd->sp_offset_us = cpu_to_le32(params->sp_offset_us);
+	cmd->next_twt_size = cpu_to_le32(params->next_twt_size);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_TWT_RESUME_DIALOG_CMDID);
 	if (ret) {
@@ -3576,13 +3675,13 @@ ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_obss_spatial_reuse_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_OBSS_SPATIAL_REUSE_SET_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->enable = he_obss_pd->enable;
-	cmd->obss_min = he_obss_pd->min_offset;
-	cmd->obss_max = he_obss_pd->max_offset;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_OBSS_SPATIAL_REUSE_SET_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->enable = cpu_to_le32(he_obss_pd->enable);
+	cmd->obss_min = cpu_to_le32((u32)he_obss_pd->min_offset);
+	cmd->obss_max = cpu_to_le32((u32)he_obss_pd->max_offset);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_OBSS_PD_SPATIAL_REUSE_CMDID);
@@ -3614,11 +3713,12 @@ ath11k_wmi_pdev_set_srg_bss_color_bitmap(struct ath11k *ar, u32 *bitmap)
 		return -ENOMEM;
 
 	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->bitmap[0] = cpu_to_le32(bitmap[0]);
+	cmd->bitmap[1] = cpu_to_le32(bitmap[1]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID);
@@ -3653,11 +3753,12 @@ ath11k_wmi_pdev_set_srg_patial_bssid_bitmap(struct ath11k *ar, u32 *bitmap)
 
 	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+		le32_encode_bits(WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD,
+				 WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->bitmap[0] = cpu_to_le32(bitmap[0]);
+	cmd->bitmap[1] = cpu_to_le32(bitmap[1]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID);
@@ -3692,11 +3793,12 @@ ath11k_wmi_pdev_srg_obss_color_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 
 	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_PDEV_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+		le32_encode_bits(WMI_TAG_PDEV_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
+				 WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->bitmap[0] = cpu_to_le32(bitmap[0]);
+	cmd->bitmap[1] = cpu_to_le32(bitmap[1]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID);
@@ -3731,11 +3833,12 @@ ath11k_wmi_pdev_srg_obss_bssid_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 
 	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+		le32_encode_bits(WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+				 WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->bitmap[0] = cpu_to_le32(bitmap[0]);
+	cmd->bitmap[1] = cpu_to_le32(bitmap[1]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID);
@@ -3770,11 +3873,12 @@ ath11k_wmi_pdev_non_srg_obss_color_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 
 	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+		le32_encode_bits(WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
+				 WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->bitmap[0] = cpu_to_le32(bitmap[0]);
+	cmd->bitmap[1] = cpu_to_le32(bitmap[1]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID);
@@ -3809,11 +3913,12 @@ ath11k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(struct ath11k *ar, u32 *bitmap)
 
 	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
 	cmd->tlv_header =
-		FIELD_PREP(WMI_TLV_TAG,
-			   WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD) |
-		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+		le32_encode_bits(WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+				 WMI_TLV_TAG) |
+		le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->bitmap[0] = cpu_to_le32(bitmap[0]);
+	cmd->bitmap[1] = cpu_to_le32(bitmap[1]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID);
@@ -3849,15 +3954,15 @@ ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_obss_color_collision_cfg_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_OBSS_COLOR_COLLISION_DET_CONFIG) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->evt_type = enable ? ATH11K_OBSS_COLOR_COLLISION_DETECTION :
-				 ATH11K_OBSS_COLOR_COLLISION_DETECTION_DISABLE;
-	cmd->current_bss_color = bss_color;
-	cmd->detection_period_ms = period;
-	cmd->scan_period_ms = ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_OBSS_COLOR_COLLISION_DET_CONFIG,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->evt_type = cpu_to_le32(enable ? ATH11K_OBSS_COLOR_COLLISION_DETECTION :
+				 ATH11K_OBSS_COLOR_COLLISION_DETECTION_DISABLE);
+	cmd->current_bss_color = cpu_to_le32(bss_color);
+	cmd->detection_period_ms = cpu_to_le32(period);
+	cmd->scan_period_ms = cpu_to_le32(ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS);
 	cmd->free_slot_expiry_time_ms = 0;
 	cmd->flags = 0;
 
@@ -3893,10 +3998,11 @@ int ath11k_wmi_send_bss_color_change_enable_cmd(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_bss_color_change_enable_params_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_BSS_COLOR_CHANGE_ENABLE) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->enable = enable ? 1 : 0;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_BSS_COLOR_CHANGE_ENABLE,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->enable = cpu_to_le32(enable ? 1 : 0);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb,
 				  WMI_BSS_COLOR_CHANGE_ENABLE_CMDID);
@@ -3934,16 +4040,17 @@ int ath11k_wmi_fils_discovery_tmpl(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_fils_discovery_tmpl_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_FILS_DISCOVERY_TMPL_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->buf_len = tmpl->len;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_FILS_DISCOVERY_TMPL_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->buf_len = cpu_to_le32(tmpl->len);
 	ptr = skb->data + sizeof(*cmd);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, aligned_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(aligned_len, WMI_TLV_LEN);
 	memcpy(tlv->value, tmpl->data, tmpl->len);
 
 	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_FILS_DISCOVERY_TMPL_CMDID);
@@ -4022,26 +4129,28 @@ int ath11k_wmi_probe_resp_tmpl(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_probe_tmpl_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PRB_TMPL_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->buf_len = tmpl->len;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PRB_TMPL_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->buf_len = cpu_to_le32(tmpl->len);
 
 	ptr = skb->data + sizeof(*cmd);
 
 	probe_info = ptr;
 	len = sizeof(*probe_info);
-	probe_info->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-					    WMI_TAG_BCN_PRB_INFO) |
-				 FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	probe_info->tlv_header = le32_encode_bits(WMI_TAG_BCN_PRB_INFO,
+						  WMI_TLV_TAG) |
+				 le32_encode_bits(len - TLV_HDR_SIZE,
+						  WMI_TLV_LEN);
 	probe_info->caps = 0;
 	probe_info->erp = 0;
 
 	ptr += sizeof(*probe_info);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, aligned_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(aligned_len, WMI_TLV_LEN);
 	memcpy(tlv->value, tmpl->data, tmpl->len);
 
 	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_PRB_TMPL_CMDID);
@@ -4077,11 +4186,12 @@ int ath11k_wmi_fils_discovery(struct ath11k *ar, u32 vdev_id, u32 interval,
 		return -ENOMEM;
 
 	cmd = (struct wmi_fils_discovery_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ENABLE_FILS_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-	cmd->vdev_id = vdev_id;
-	cmd->interval = interval;
-	cmd->config = unsol_bcast_probe_resp_enabled;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_ENABLE_FILS_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->interval = cpu_to_le32(interval);
+	cmd->config = cpu_to_le32(unsol_bcast_probe_resp_enabled);
 
 	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_ENABLE_FILS_CMDID);
 	if (ret) {
@@ -4122,20 +4232,23 @@ ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct sk_buff *sk
 		goto exit;
 	}
 
-	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, ev->vdev_id);
+	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, le32_to_cpu(ev->vdev_id));
 	if (!arvif) {
-		ath11k_warn(ab, "failed to find arvif with vedv id %d in obss_color_collision_event\n",
-			    ev->vdev_id);
+		ath11k_warn(ab,
+			    "failed to find arvif with vedv id %d in obss_color_collision_event\n",
+			    le32_to_cpu(ev->vdev_id));
 		goto exit;
 	}
 
-	switch (ev->evt_type) {
+	switch (le32_to_cpu(ev->evt_type)) {
 	case WMI_BSS_COLOR_COLLISION_DETECTION:
-		ieee80211_obss_color_collision_notify(arvif->vif, ev->obss_color_bitmap,
+		ieee80211_obss_color_collision_notify(arvif->vif,
+						      le64_to_cpu(ev->obss_color_bitmap),
 						      0);
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "OBSS color collision detected vdev:%d, event:%d, bitmap:%08llx\n",
-			   ev->vdev_id, ev->evt_type, ev->obss_color_bitmap);
+			   le32_to_cpu(ev->vdev_id), le32_to_cpu(ev->evt_type),
+			   le64_to_cpu(ev->obss_color_bitmap));
 		break;
 	case WMI_BSS_COLOR_COLLISION_DISABLE:
 	case WMI_BSS_COLOR_FREE_SLOT_TIMER_EXPIRY:
@@ -4186,71 +4299,71 @@ static void
 ath11k_wmi_copy_resource_config(struct wmi_resource_config *wmi_cfg,
 				struct target_resource_config *tg_cfg)
 {
-	wmi_cfg->num_vdevs = tg_cfg->num_vdevs;
-	wmi_cfg->num_peers = tg_cfg->num_peers;
-	wmi_cfg->num_offload_peers = tg_cfg->num_offload_peers;
-	wmi_cfg->num_offload_reorder_buffs = tg_cfg->num_offload_reorder_buffs;
-	wmi_cfg->num_peer_keys = tg_cfg->num_peer_keys;
-	wmi_cfg->num_tids = tg_cfg->num_tids;
-	wmi_cfg->ast_skid_limit = tg_cfg->ast_skid_limit;
-	wmi_cfg->tx_chain_mask = tg_cfg->tx_chain_mask;
-	wmi_cfg->rx_chain_mask = tg_cfg->rx_chain_mask;
-	wmi_cfg->rx_timeout_pri[0] = tg_cfg->rx_timeout_pri[0];
-	wmi_cfg->rx_timeout_pri[1] = tg_cfg->rx_timeout_pri[1];
-	wmi_cfg->rx_timeout_pri[2] = tg_cfg->rx_timeout_pri[2];
-	wmi_cfg->rx_timeout_pri[3] = tg_cfg->rx_timeout_pri[3];
-	wmi_cfg->rx_decap_mode = tg_cfg->rx_decap_mode;
-	wmi_cfg->scan_max_pending_req = tg_cfg->scan_max_pending_req;
-	wmi_cfg->bmiss_offload_max_vdev = tg_cfg->bmiss_offload_max_vdev;
-	wmi_cfg->roam_offload_max_vdev = tg_cfg->roam_offload_max_vdev;
+	wmi_cfg->num_vdevs = cpu_to_le32(tg_cfg->num_vdevs);
+	wmi_cfg->num_peers = cpu_to_le32(tg_cfg->num_peers);
+	wmi_cfg->num_offload_peers = cpu_to_le32(tg_cfg->num_offload_peers);
+	wmi_cfg->num_offload_reorder_buffs = cpu_to_le32(tg_cfg->num_offload_reorder_buffs);
+	wmi_cfg->num_peer_keys = cpu_to_le32(tg_cfg->num_peer_keys);
+	wmi_cfg->num_tids = cpu_to_le32(tg_cfg->num_tids);
+	wmi_cfg->ast_skid_limit = cpu_to_le32(tg_cfg->ast_skid_limit);
+	wmi_cfg->tx_chain_mask = cpu_to_le32(tg_cfg->tx_chain_mask);
+	wmi_cfg->rx_chain_mask = cpu_to_le32(tg_cfg->rx_chain_mask);
+	wmi_cfg->rx_timeout_pri[0] = cpu_to_le32(tg_cfg->rx_timeout_pri[0]);
+	wmi_cfg->rx_timeout_pri[1] = cpu_to_le32(tg_cfg->rx_timeout_pri[1]);
+	wmi_cfg->rx_timeout_pri[2] = cpu_to_le32(tg_cfg->rx_timeout_pri[2]);
+	wmi_cfg->rx_timeout_pri[3] = cpu_to_le32(tg_cfg->rx_timeout_pri[3]);
+	wmi_cfg->rx_decap_mode = cpu_to_le32(tg_cfg->rx_decap_mode);
+	wmi_cfg->scan_max_pending_req = cpu_to_le32(tg_cfg->scan_max_pending_req);
+	wmi_cfg->bmiss_offload_max_vdev = cpu_to_le32(tg_cfg->bmiss_offload_max_vdev);
+	wmi_cfg->roam_offload_max_vdev = cpu_to_le32(tg_cfg->roam_offload_max_vdev);
 	wmi_cfg->roam_offload_max_ap_profiles =
-		tg_cfg->roam_offload_max_ap_profiles;
-	wmi_cfg->num_mcast_groups = tg_cfg->num_mcast_groups;
-	wmi_cfg->num_mcast_table_elems = tg_cfg->num_mcast_table_elems;
-	wmi_cfg->mcast2ucast_mode = tg_cfg->mcast2ucast_mode;
-	wmi_cfg->tx_dbg_log_size = tg_cfg->tx_dbg_log_size;
-	wmi_cfg->num_wds_entries = tg_cfg->num_wds_entries;
-	wmi_cfg->dma_burst_size = tg_cfg->dma_burst_size;
-	wmi_cfg->mac_aggr_delim = tg_cfg->mac_aggr_delim;
+		cpu_to_le32(tg_cfg->roam_offload_max_ap_profiles);
+	wmi_cfg->num_mcast_groups = cpu_to_le32(tg_cfg->num_mcast_groups);
+	wmi_cfg->num_mcast_table_elems = cpu_to_le32(tg_cfg->num_mcast_table_elems);
+	wmi_cfg->mcast2ucast_mode = cpu_to_le32(tg_cfg->mcast2ucast_mode);
+	wmi_cfg->tx_dbg_log_size = cpu_to_le32(tg_cfg->tx_dbg_log_size);
+	wmi_cfg->num_wds_entries = cpu_to_le32(tg_cfg->num_wds_entries);
+	wmi_cfg->dma_burst_size = cpu_to_le32(tg_cfg->dma_burst_size);
+	wmi_cfg->mac_aggr_delim = cpu_to_le32(tg_cfg->mac_aggr_delim);
 	wmi_cfg->rx_skip_defrag_timeout_dup_detection_check =
-		tg_cfg->rx_skip_defrag_timeout_dup_detection_check;
-	wmi_cfg->vow_config = tg_cfg->vow_config;
-	wmi_cfg->gtk_offload_max_vdev = tg_cfg->gtk_offload_max_vdev;
-	wmi_cfg->num_msdu_desc = tg_cfg->num_msdu_desc;
-	wmi_cfg->max_frag_entries = tg_cfg->max_frag_entries;
-	wmi_cfg->num_tdls_vdevs = tg_cfg->num_tdls_vdevs;
+		cpu_to_le32(tg_cfg->rx_skip_defrag_timeout_dup_detection_check);
+	wmi_cfg->vow_config = cpu_to_le32(tg_cfg->vow_config);
+	wmi_cfg->gtk_offload_max_vdev = cpu_to_le32(tg_cfg->gtk_offload_max_vdev);
+	wmi_cfg->num_msdu_desc = cpu_to_le32(tg_cfg->num_msdu_desc);
+	wmi_cfg->max_frag_entries = cpu_to_le32(tg_cfg->max_frag_entries);
+	wmi_cfg->num_tdls_vdevs = cpu_to_le32(tg_cfg->num_tdls_vdevs);
 	wmi_cfg->num_tdls_conn_table_entries =
-		tg_cfg->num_tdls_conn_table_entries;
+		cpu_to_le32(tg_cfg->num_tdls_conn_table_entries);
 	wmi_cfg->beacon_tx_offload_max_vdev =
-		tg_cfg->beacon_tx_offload_max_vdev;
+		cpu_to_le32(tg_cfg->beacon_tx_offload_max_vdev);
 	wmi_cfg->num_multicast_filter_entries =
-		tg_cfg->num_multicast_filter_entries;
-	wmi_cfg->num_wow_filters = tg_cfg->num_wow_filters;
-	wmi_cfg->num_keep_alive_pattern = tg_cfg->num_keep_alive_pattern;
-	wmi_cfg->keep_alive_pattern_size = tg_cfg->keep_alive_pattern_size;
+		cpu_to_le32(tg_cfg->num_multicast_filter_entries);
+	wmi_cfg->num_wow_filters = cpu_to_le32(tg_cfg->num_wow_filters);
+	wmi_cfg->num_keep_alive_pattern = cpu_to_le32(tg_cfg->num_keep_alive_pattern);
+	wmi_cfg->keep_alive_pattern_size = cpu_to_le32(tg_cfg->keep_alive_pattern_size);
 	wmi_cfg->max_tdls_concurrent_sleep_sta =
-		tg_cfg->max_tdls_concurrent_sleep_sta;
+		cpu_to_le32(tg_cfg->max_tdls_concurrent_sleep_sta);
 	wmi_cfg->max_tdls_concurrent_buffer_sta =
-		tg_cfg->max_tdls_concurrent_buffer_sta;
-	wmi_cfg->wmi_send_separate = tg_cfg->wmi_send_separate;
-	wmi_cfg->num_ocb_vdevs = tg_cfg->num_ocb_vdevs;
-	wmi_cfg->num_ocb_channels = tg_cfg->num_ocb_channels;
-	wmi_cfg->num_ocb_schedules = tg_cfg->num_ocb_schedules;
-	wmi_cfg->bpf_instruction_size = tg_cfg->bpf_instruction_size;
-	wmi_cfg->max_bssid_rx_filters = tg_cfg->max_bssid_rx_filters;
-	wmi_cfg->use_pdev_id = tg_cfg->use_pdev_id;
-	wmi_cfg->flag1 = tg_cfg->flag1;
-	wmi_cfg->peer_map_unmap_v2_support = tg_cfg->peer_map_unmap_v2_support;
-	wmi_cfg->sched_params = tg_cfg->sched_params;
-	wmi_cfg->twt_ap_pdev_count = tg_cfg->twt_ap_pdev_count;
-	wmi_cfg->twt_ap_sta_count = tg_cfg->twt_ap_sta_count;
+		cpu_to_le32(tg_cfg->max_tdls_concurrent_buffer_sta);
+	wmi_cfg->wmi_send_separate = cpu_to_le32(tg_cfg->wmi_send_separate);
+	wmi_cfg->num_ocb_vdevs = cpu_to_le32(tg_cfg->num_ocb_vdevs);
+	wmi_cfg->num_ocb_channels = cpu_to_le32(tg_cfg->num_ocb_channels);
+	wmi_cfg->num_ocb_schedules = cpu_to_le32(tg_cfg->num_ocb_schedules);
+	wmi_cfg->bpf_instruction_size = cpu_to_le32(tg_cfg->bpf_instruction_size);
+	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
+	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
+	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->flag1);
+	wmi_cfg->peer_map_unmap_v2_support = cpu_to_le32(tg_cfg->peer_map_unmap_v2_support);
+	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
+	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
+	wmi_cfg->twt_ap_sta_count = cpu_to_le32(tg_cfg->twt_ap_sta_count);
 	wmi_cfg->host_service_flags &=
-		~(1 << WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT);
-	wmi_cfg->host_service_flags |= (tg_cfg->is_reg_cc_ext_event_supported <<
-					WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT);
-	wmi_cfg->flags2 = WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET;
-	wmi_cfg->ema_max_vap_cnt = tg_cfg->ema_max_vap_cnt;
-	wmi_cfg->ema_max_profile_period = tg_cfg->ema_max_profile_period;
+		cpu_to_le32(~(1 << WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT));
+	wmi_cfg->host_service_flags |= cpu_to_le32((tg_cfg->is_reg_cc_ext_event_supported <<
+					WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT));
+	wmi_cfg->flags2 = cpu_to_le32(WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET);
+	wmi_cfg->ema_max_vap_cnt = cpu_to_le32(tg_cfg->ema_max_vap_cnt);
+	wmi_cfg->ema_max_profile_period = cpu_to_le32(tg_cfg->ema_max_profile_period);
 }
 
 static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
@@ -4269,9 +4382,9 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 	u32 hw_mode_len = 0;
 	u16 idx;
 
-	if (param->hw_mode_id != WMI_HOST_HW_MODE_MAX)
+	if (le32_to_cpu(param->hw_mode_id) != WMI_HOST_HW_MODE_MAX)
 		hw_mode_len = sizeof(*hw_mode) + TLV_HDR_SIZE +
-			      (param->num_band_to_mac * sizeof(*band_to_mac));
+			      (le32_to_cpu(param->num_band_to_mac) * sizeof(*band_to_mac));
 
 	len = sizeof(*cmd) + TLV_HDR_SIZE + sizeof(*cfg) + hw_mode_len +
 	      (param->num_mem_chunks ? (sizeof(*host_mem_chunks) * WMI_MAX_MEM_REQS) : 0);
@@ -4282,16 +4395,19 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 
 	cmd = (struct wmi_init_cmd *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_INIT_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_INIT_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ptr = skb->data + sizeof(*cmd);
 	cfg = ptr;
 
 	ath11k_wmi_copy_resource_config(cfg, param->res_cfg);
 
-	cfg->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_RESOURCE_CONFIG) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cfg) - TLV_HDR_SIZE);
+	cfg->tlv_header = le32_encode_bits(WMI_TAG_RESOURCE_CONFIG,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cfg) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ptr += sizeof(*cfg);
 	host_mem_chunks = ptr + TLV_HDR_SIZE;
@@ -4299,13 +4415,13 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 
 	for (idx = 0; idx < param->num_mem_chunks; ++idx) {
 		host_mem_chunks[idx].tlv_header =
-				FIELD_PREP(WMI_TLV_TAG,
-					   WMI_TAG_WLAN_HOST_MEMORY_CHUNK) |
-				FIELD_PREP(WMI_TLV_LEN, len);
+				le32_encode_bits(WMI_TAG_WLAN_HOST_MEMORY_CHUNK,
+						 WMI_TLV_TAG) |
+				le32_encode_bits(len, WMI_TLV_LEN);
 
-		host_mem_chunks[idx].ptr = param->mem_chunks[idx].paddr;
-		host_mem_chunks[idx].size = param->mem_chunks[idx].len;
-		host_mem_chunks[idx].req_id = param->mem_chunks[idx].req_id;
+		host_mem_chunks[idx].ptr = cpu_to_le32(param->mem_chunks[idx].paddr);
+		host_mem_chunks[idx].size = cpu_to_le32(param->mem_chunks[idx].len);
+		host_mem_chunks[idx].req_id = cpu_to_le32(param->mem_chunks[idx].req_id);
 
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "host mem chunk req_id %d paddr 0x%llx len %d\n",
@@ -4313,47 +4429,48 @@ static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
 			   (u64)param->mem_chunks[idx].paddr,
 			   param->mem_chunks[idx].len);
 	}
-	cmd->num_host_mem_chunks = param->num_mem_chunks;
+	cmd->num_host_mem_chunks = cpu_to_le32(param->num_mem_chunks);
 	len = sizeof(struct wlan_host_mem_chunk) * param->num_mem_chunks;
 
 	/* num_mem_chunks is zero */
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(len, WMI_TLV_LEN);
 	ptr += TLV_HDR_SIZE + len;
 
-	if (param->hw_mode_id != WMI_HOST_HW_MODE_MAX) {
+	if (le32_to_cpu(param->hw_mode_id) != WMI_HOST_HW_MODE_MAX) {
 		hw_mode = ptr;
-		hw_mode->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-						 WMI_TAG_PDEV_SET_HW_MODE_CMD) |
-				      FIELD_PREP(WMI_TLV_LEN,
-						 sizeof(*hw_mode) - TLV_HDR_SIZE);
+		hw_mode->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SET_HW_MODE_CMD,
+						       WMI_TLV_TAG) |
+				      le32_encode_bits(sizeof(*hw_mode) - TLV_HDR_SIZE,
+						       WMI_TLV_LEN);
 
 		hw_mode->hw_mode_index = param->hw_mode_id;
 		hw_mode->num_band_to_mac = param->num_band_to_mac;
 
 		ptr += sizeof(*hw_mode);
 
-		len = param->num_band_to_mac * sizeof(*band_to_mac);
+		len = le32_to_cpu(param->num_band_to_mac) * sizeof(*band_to_mac);
 		tlv = ptr;
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-			      FIELD_PREP(WMI_TLV_LEN, len);
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(len, WMI_TLV_LEN);
 
 		ptr += TLV_HDR_SIZE;
 		len = sizeof(*band_to_mac);
 
-		for (idx = 0; idx < param->num_band_to_mac; idx++) {
+		for (idx = 0; idx < le32_to_cpu(param->num_band_to_mac); idx++) {
 			band_to_mac = ptr;
 
-			band_to_mac->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-							     WMI_TAG_PDEV_BAND_TO_MAC) |
-						  FIELD_PREP(WMI_TLV_LEN,
-							     len - TLV_HDR_SIZE);
-			band_to_mac->pdev_id = param->band_to_mac[idx].pdev_id;
+			band_to_mac->tlv_header = le32_encode_bits(WMI_TAG_PDEV_BAND_TO_MAC,
+								   WMI_TLV_TAG) |
+						  le32_encode_bits(len - TLV_HDR_SIZE,
+								   WMI_TLV_LEN);
+			band_to_mac->pdev_id = cpu_to_le32(param->band_to_mac[idx].pdev_id);
 			band_to_mac->start_freq =
-				param->band_to_mac[idx].start_freq;
+				cpu_to_le32(param->band_to_mac[idx].start_freq);
 			band_to_mac->end_freq =
-				param->band_to_mac[idx].end_freq;
+				cpu_to_le32(param->band_to_mac[idx].end_freq);
 			ptr += sizeof(*band_to_mac);
 		}
 	}
@@ -4382,13 +4499,14 @@ int ath11k_wmi_pdev_lro_cfg(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct ath11k_wmi_pdev_lro_config_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_LRO_INFO_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_LRO_INFO_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	get_random_bytes(cmd->th_4, sizeof(uint32_t) * ATH11K_IPV4_TH_SEED_SIZE);
 	get_random_bytes(cmd->th_6, sizeof(uint32_t) * ATH11K_IPV6_TH_SEED_SIZE);
 
-	cmd->pdev_id = pdev_id;
+	cmd->pdev_id = cpu_to_le32(pdev_id);
 
 	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_LRO_CONFIG_CMDID);
 	if (ret) {
@@ -4446,11 +4564,13 @@ int ath11k_wmi_set_hw_mode(struct ath11k_base *ab,
 
 	cmd = (struct wmi_pdev_set_hw_mode_cmd_param *)skb->data;
 
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_HW_MODE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SET_HW_MODE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	cmd->pdev_id = WMI_PDEV_ID_SOC;
-	cmd->hw_mode_index = mode;
+	cmd->hw_mode_index = cpu_to_le32(mode);
 
 	ret = ath11k_wmi_cmd_send(&wmi_ab->wmi[0], skb, WMI_PDEV_SET_HW_MODE_CMDID);
 	if (ret) {
@@ -4483,13 +4603,13 @@ int ath11k_wmi_cmd_init(struct ath11k_base *ab)
 
 	init_param.res_cfg = &wmi_ab->wlan_resource_config;
 	init_param.num_mem_chunks = wmi_ab->num_mem_chunks;
-	init_param.hw_mode_id = wmi_ab->preferred_hw_mode;
+	init_param.hw_mode_id = cpu_to_le32(wmi_ab->preferred_hw_mode);
 	init_param.mem_chunks = wmi_ab->mem_chunks;
 
 	if (ab->hw_params.single_pdev_only)
-		init_param.hw_mode_id = WMI_HOST_HW_MODE_MAX;
+		init_param.hw_mode_id = cpu_to_le32(WMI_HOST_HW_MODE_MAX);
 
-	init_param.num_band_to_mac = ab->num_radios;
+	init_param.num_band_to_mac = cpu_to_le32(ab->num_radios);
 	ath11k_fill_band_to_mac_param(ab, init_param.band_to_mac);
 
 	return ath11k_init_cmd_send(&wmi_ab->wmi[0], &init_param);
@@ -4507,9 +4627,10 @@ int ath11k_wmi_vdev_spectral_conf(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct ath11k_wmi_vdev_spectral_conf_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_VDEV_SPECTRAL_CONFIGURE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_SPECTRAL_CONFIGURE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	memcpy(&cmd->param, param, sizeof(*param));
 
@@ -4543,13 +4664,14 @@ int ath11k_wmi_vdev_spectral_enable(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct ath11k_wmi_vdev_spectral_enable_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_VDEV_SPECTRAL_ENABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_VDEV_SPECTRAL_ENABLE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->trigger_cmd = trigger;
-	cmd->enable_cmd = enable;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->trigger_cmd = cpu_to_le32(trigger);
+	cmd->enable_cmd = cpu_to_le32(enable);
 
 	ret = ath11k_wmi_cmd_send(ar->wmi, skb,
 				  WMI_VDEV_SPECTRAL_SCAN_ENABLE_CMDID);
@@ -4581,8 +4703,10 @@ int ath11k_wmi_pdev_dma_ring_cfg(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct ath11k_wmi_pdev_dma_ring_cfg_req_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_DMA_RING_CFG_REQ) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_DMA_RING_CFG_REQ,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	cmd->pdev_id		= param->pdev_id;
 	cmd->module_id		= param->module_id;
@@ -4624,7 +4748,7 @@ static int ath11k_wmi_tlv_dma_buf_entry_parse(struct ath11k_base *soc,
 	if (tag != WMI_TAG_DMA_BUF_RELEASE_ENTRY)
 		return -EPROTO;
 
-	if (parse->num_buf_entry >= parse->fixed.num_buf_release_entry)
+	if (parse->num_buf_entry >= le32_to_cpu(parse->fixed.num_buf_release_entry))
 		return -ENOBUFS;
 
 	parse->num_buf_entry++;
@@ -4640,7 +4764,7 @@ static int ath11k_wmi_tlv_dma_buf_meta_parse(struct ath11k_base *soc,
 	if (tag != WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA)
 		return -EPROTO;
 
-	if (parse->num_meta >= parse->fixed.num_meta_data_entry)
+	if (parse->num_meta >= le32_to_cpu(parse->fixed.num_meta_data_entry))
 		return -ENOBUFS;
 
 	parse->num_meta++;
@@ -4658,7 +4782,8 @@ static int ath11k_wmi_tlv_dma_buf_parse(struct ath11k_base *ab,
 	case WMI_TAG_DMA_BUF_RELEASE:
 		memcpy(&parse->fixed, ptr,
 		       sizeof(struct ath11k_wmi_dma_buf_release_fixed_param));
-		parse->fixed.pdev_id = DP_HW2SW_MACID(parse->fixed.pdev_id);
+		parse->fixed.pdev_id =
+			cpu_to_le32(DP_HW2SW_MACID(le32_to_cpu(parse->fixed.pdev_id)));
 		break;
 	case WMI_TAG_ARRAY_STRUCT:
 		if (!parse->buf_entry_done) {
@@ -4745,7 +4870,7 @@ static int ath11k_wmi_tlv_hw_mode_caps_parse(struct ath11k_base *soc,
 				   hw_mode_id);
 	svc_rdy_ext->n_hw_mode_caps++;
 
-	phy_map = hw_mode_cap->phy_id_map;
+	phy_map = le32_to_cpu(hw_mode_cap->phy_id_map);
 	while (phy_map) {
 		svc_rdy_ext->tot_phy_id++;
 		phy_map = phy_map >> 1;
@@ -4777,7 +4902,7 @@ static int ath11k_wmi_tlv_hw_mode_caps(struct ath11k_base *soc,
 	i = 0;
 	while (i < svc_rdy_ext->n_hw_mode_caps) {
 		hw_mode_caps = &svc_rdy_ext->hw_mode_caps[i];
-		mode = hw_mode_caps->hw_mode_id;
+		mode = le32_to_cpu(hw_mode_caps->hw_mode_id);
 		pref = soc->wmi_ab.preferred_hw_mode;
 
 		if (ath11k_hw_mode_pri_map[mode] < ath11k_hw_mode_pri_map[pref]) {
@@ -4885,17 +5010,17 @@ static int ath11k_wmi_tlv_ext_soc_hal_reg_caps_parse(struct ath11k_base *soc,
 {
 	struct ath11k_pdev_wmi *wmi_handle = &soc->wmi_ab.wmi[0];
 	struct wmi_tlv_svc_rdy_ext_parse *svc_rdy_ext = data;
-	u8 hw_mode_id = svc_rdy_ext->pref_hw_mode_caps.hw_mode_id;
+	u8 hw_mode_id = le32_to_cpu(svc_rdy_ext->pref_hw_mode_caps.hw_mode_id);
 	u32 phy_id_map;
 	int pdev_index = 0;
 	int ret;
 
 	svc_rdy_ext->soc_hal_reg_caps = (struct wmi_soc_hal_reg_capabilities *)ptr;
-	svc_rdy_ext->param.num_phy = svc_rdy_ext->soc_hal_reg_caps->num_phy;
+	svc_rdy_ext->param.num_phy = le32_to_cpu(svc_rdy_ext->soc_hal_reg_caps->num_phy);
 
 	soc->num_radios = 0;
 	soc->target_pdev_count = 0;
-	phy_id_map = svc_rdy_ext->pref_hw_mode_caps.phy_id_map;
+	phy_id_map = le32_to_cpu(svc_rdy_ext->pref_hw_mode_caps.phy_id_map);
 
 	while (phy_id_map && soc->num_radios < MAX_RADIOS) {
 		ret = ath11k_pull_mac_phy_cap_svc_ready_ext(wmi_handle,
@@ -5012,17 +5137,18 @@ static int ath11k_wmi_tlv_dma_ring_caps(struct ath11k_base *ab,
 
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
-		if (dma_caps[i].module_id >= WMI_DIRECT_BUF_MAX) {
-			ath11k_warn(ab, "Invalid module id %d\n", dma_caps[i].module_id);
+		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
+			ath11k_warn(ab, "Invalid module id %d\n",
+				    dma_caps[i].module_id);
 			ret = -EINVAL;
 			goto free_dir_buff;
 		}
 
-		dir_buff_caps[i].id = dma_caps[i].module_id;
-		dir_buff_caps[i].pdev_id = DP_HW2SW_MACID(dma_caps[i].pdev_id);
-		dir_buff_caps[i].min_elem = dma_caps[i].min_elem;
-		dir_buff_caps[i].min_buf_sz = dma_caps[i].min_buf_sz;
-		dir_buff_caps[i].min_buf_align = dma_caps[i].min_buf_align;
+		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
+		dir_buff_caps[i].pdev_id = DP_HW2SW_MACID(le32_to_cpu(dma_caps[i].pdev_id));
+		dir_buff_caps[i].min_elem = le32_to_cpu(dma_caps[i].min_elem);
+		dir_buff_caps[i].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
+		dir_buff_caps[i].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
 	}
 
 	return 0;
@@ -5052,7 +5178,7 @@ static int ath11k_wmi_tlv_svc_rdy_ext_parse(struct ath11k_base *ab,
 
 	case WMI_TAG_SOC_MAC_PHY_HW_MODE_CAPS:
 		svc_rdy_ext->hw_caps = (struct wmi_soc_mac_phy_hw_mode_caps *)ptr;
-		svc_rdy_ext->param.num_hw_modes = svc_rdy_ext->hw_caps->num_hw_modes;
+		svc_rdy_ext->param.num_hw_modes = le32_to_cpu(svc_rdy_ext->hw_caps->num_hw_modes);
 		break;
 
 	case WMI_TAG_SOC_HAL_REG_CAPABILITIES:
@@ -5269,23 +5395,23 @@ static struct cur_reg_rule
 
 	for (count = 0; count < num_reg_rules; count++) {
 		reg_rule_ptr[count].start_freq =
-			FIELD_GET(REG_RULE_START_FREQ,
-				  wmi_reg_rule[count].freq_info);
+			le32_get_bits(wmi_reg_rule[count].freq_info,
+				      REG_RULE_START_FREQ);
 		reg_rule_ptr[count].end_freq =
-			FIELD_GET(REG_RULE_END_FREQ,
-				  wmi_reg_rule[count].freq_info);
+			le32_get_bits(wmi_reg_rule[count].freq_info,
+				      REG_RULE_END_FREQ);
 		reg_rule_ptr[count].max_bw =
-			FIELD_GET(REG_RULE_MAX_BW,
-				  wmi_reg_rule[count].bw_pwr_info);
+			le32_get_bits(wmi_reg_rule[count].bw_pwr_info,
+				      REG_RULE_MAX_BW);
 		reg_rule_ptr[count].reg_power =
-			FIELD_GET(REG_RULE_REG_PWR,
-				  wmi_reg_rule[count].bw_pwr_info);
+			le32_get_bits(wmi_reg_rule[count].bw_pwr_info,
+				      REG_RULE_REG_PWR);
 		reg_rule_ptr[count].ant_gain =
-			FIELD_GET(REG_RULE_ANT_GAIN,
-				  wmi_reg_rule[count].bw_pwr_info);
+			le32_get_bits(wmi_reg_rule[count].bw_pwr_info,
+				      REG_RULE_ANT_GAIN);
 		reg_rule_ptr[count].flags =
-			FIELD_GET(REG_RULE_FLAGS,
-				  wmi_reg_rule[count].flag_info);
+			le32_get_bits(wmi_reg_rule[count].flag_info,
+				      REG_RULE_FLAGS);
 	}
 
 	return reg_rule_ptr;
@@ -5317,8 +5443,8 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 		return -EPROTO;
 	}
 
-	reg_info->num_2ghz_reg_rules = chan_list_event_hdr->num_2ghz_reg_rules;
-	reg_info->num_5ghz_reg_rules = chan_list_event_hdr->num_5ghz_reg_rules;
+	reg_info->num_2ghz_reg_rules = le32_to_cpu(chan_list_event_hdr->num_2ghz_reg_rules);
+	reg_info->num_5ghz_reg_rules = le32_to_cpu(chan_list_event_hdr->num_5ghz_reg_rules);
 
 	if (!(reg_info->num_2ghz_reg_rules + reg_info->num_5ghz_reg_rules)) {
 		ath11k_warn(ab, "No regulatory rules available in the event info\n");
@@ -5328,26 +5454,26 @@ static int ath11k_pull_reg_chan_list_update_ev(struct ath11k_base *ab,
 
 	memcpy(reg_info->alpha2, &chan_list_event_hdr->alpha2,
 	       REG_ALPHA2_LEN);
-	reg_info->dfs_region = chan_list_event_hdr->dfs_region;
-	reg_info->phybitmap = chan_list_event_hdr->phybitmap;
-	reg_info->num_phy = chan_list_event_hdr->num_phy;
-	reg_info->phy_id = chan_list_event_hdr->phy_id;
-	reg_info->ctry_code = chan_list_event_hdr->country_id;
-	reg_info->reg_dmn_pair = chan_list_event_hdr->domain_code;
+	reg_info->dfs_region = le32_to_cpu(chan_list_event_hdr->dfs_region);
+	reg_info->phybitmap = le32_to_cpu(chan_list_event_hdr->phybitmap);
+	reg_info->num_phy = le32_to_cpu(chan_list_event_hdr->num_phy);
+	reg_info->phy_id = le32_to_cpu(chan_list_event_hdr->phy_id);
+	reg_info->ctry_code = le32_to_cpu(chan_list_event_hdr->country_id);
+	reg_info->reg_dmn_pair = le32_to_cpu(chan_list_event_hdr->domain_code);
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "status_code %s",
 		   ath11k_cc_status_to_str(reg_info->status_code));
 
 	reg_info->status_code =
-		ath11k_wmi_cc_setting_code_to_reg(chan_list_event_hdr->status_code);
+		ath11k_wmi_cc_setting_code_to_reg(le32_to_cpu(chan_list_event_hdr->status_code));
 
 	reg_info->is_ext_reg_event = false;
 
-	reg_info->min_bw_2ghz = chan_list_event_hdr->min_bw_2ghz;
-	reg_info->max_bw_2ghz = chan_list_event_hdr->max_bw_2ghz;
-	reg_info->min_bw_5ghz = chan_list_event_hdr->min_bw_5ghz;
-	reg_info->max_bw_5ghz = chan_list_event_hdr->max_bw_5ghz;
+	reg_info->min_bw_2ghz = le32_to_cpu(chan_list_event_hdr->min_bw_2ghz);
+	reg_info->max_bw_2ghz = le32_to_cpu(chan_list_event_hdr->max_bw_2ghz);
+	reg_info->min_bw_5ghz = le32_to_cpu(chan_list_event_hdr->min_bw_5ghz);
+	reg_info->max_bw_5ghz = le32_to_cpu(chan_list_event_hdr->max_bw_5ghz);
 
 	num_2ghz_reg_rules = reg_info->num_2ghz_reg_rules;
 	num_5ghz_reg_rules = reg_info->num_5ghz_reg_rules;
@@ -5418,29 +5544,29 @@ static struct cur_reg_rule
 
 	for (count = 0; count < num_reg_rules; count++) {
 		reg_rule_ptr[count].start_freq =
-			u32_get_bits(wmi_reg_rule[count].freq_info,
-				     REG_RULE_START_FREQ);
+			le32_get_bits(wmi_reg_rule[count].freq_info,
+				      REG_RULE_START_FREQ);
 		reg_rule_ptr[count].end_freq =
-			u32_get_bits(wmi_reg_rule[count].freq_info,
-				     REG_RULE_END_FREQ);
+			le32_get_bits(wmi_reg_rule[count].freq_info,
+				      REG_RULE_END_FREQ);
 		reg_rule_ptr[count].max_bw =
-			u32_get_bits(wmi_reg_rule[count].bw_pwr_info,
-				     REG_RULE_MAX_BW);
+			le32_get_bits(wmi_reg_rule[count].bw_pwr_info,
+				      REG_RULE_MAX_BW);
 		reg_rule_ptr[count].reg_power =
-			u32_get_bits(wmi_reg_rule[count].bw_pwr_info,
-				     REG_RULE_REG_PWR);
+			le32_get_bits(wmi_reg_rule[count].bw_pwr_info,
+				      REG_RULE_REG_PWR);
 		reg_rule_ptr[count].ant_gain =
-			u32_get_bits(wmi_reg_rule[count].bw_pwr_info,
-				     REG_RULE_ANT_GAIN);
+			le32_get_bits(wmi_reg_rule[count].bw_pwr_info,
+				      REG_RULE_ANT_GAIN);
 		reg_rule_ptr[count].flags =
-			u32_get_bits(wmi_reg_rule[count].flag_info,
-				     REG_RULE_FLAGS);
+			le32_get_bits(wmi_reg_rule[count].flag_info,
+				      REG_RULE_FLAGS);
 		reg_rule_ptr[count].psd_flag =
-			u32_get_bits(wmi_reg_rule[count].psd_power_info,
-				     REG_RULE_PSD_INFO);
+			le32_get_bits(wmi_reg_rule[count].psd_power_info,
+				      REG_RULE_PSD_INFO);
 		reg_rule_ptr[count].psd_eirp =
-			u32_get_bits(wmi_reg_rule[count].psd_power_info,
-				     REG_RULE_PSD_EIRP);
+			le32_get_bits(wmi_reg_rule[count].psd_power_info,
+				      REG_RULE_PSD_EIRP);
 	}
 
 	return reg_rule_ptr;
@@ -5454,8 +5580,8 @@ ath11k_invalid_5ghz_reg_ext_rules_from_wmi(u32 num_reg_rules,
 	u32 count, start_freq;
 
 	for (count = 0; count < num_reg_rules; count++) {
-		start_freq = u32_get_bits(rule[count].freq_info,
-					  REG_RULE_START_FREQ);
+		start_freq = le32_get_bits(rule[count].freq_info,
+					   REG_RULE_START_FREQ);
 
 		if (start_freq >= ATH11K_MIN_6G_FREQ)
 			num_invalid_5ghz_rules++;
@@ -5493,22 +5619,22 @@ static int ath11k_pull_reg_chan_list_ext_update_ev(struct ath11k_base *ab,
 		return -EPROTO;
 	}
 
-	reg_info->num_2ghz_reg_rules = ev->num_2ghz_reg_rules;
-	reg_info->num_5ghz_reg_rules = ev->num_5ghz_reg_rules;
+	reg_info->num_2ghz_reg_rules = le32_to_cpu(ev->num_2ghz_reg_rules);
+	reg_info->num_5ghz_reg_rules = le32_to_cpu(ev->num_5ghz_reg_rules);
 	reg_info->num_6ghz_rules_ap[WMI_REG_INDOOR_AP] =
-			ev->num_6ghz_reg_rules_ap_lpi;
+			le32_to_cpu(ev->num_6ghz_reg_rules_ap_lpi);
 	reg_info->num_6ghz_rules_ap[WMI_REG_STANDARD_POWER_AP] =
-			ev->num_6ghz_reg_rules_ap_sp;
+			le32_to_cpu(ev->num_6ghz_reg_rules_ap_sp);
 	reg_info->num_6ghz_rules_ap[WMI_REG_VERY_LOW_POWER_AP] =
-			ev->num_6ghz_reg_rules_ap_vlp;
+			le32_to_cpu(ev->num_6ghz_reg_rules_ap_vlp);
 
 	for (i = 0; i < WMI_REG_MAX_CLIENT_TYPE; i++) {
 		reg_info->num_6ghz_rules_client[WMI_REG_INDOOR_AP][i] =
-			ev->num_6ghz_reg_rules_client_lpi[i];
+			le32_to_cpu(ev->num_6ghz_reg_rules_client_lpi[i]);
 		reg_info->num_6ghz_rules_client[WMI_REG_STANDARD_POWER_AP][i] =
-			ev->num_6ghz_reg_rules_client_sp[i];
+			le32_to_cpu(ev->num_6ghz_reg_rules_client_sp[i]);
 		reg_info->num_6ghz_rules_client[WMI_REG_VERY_LOW_POWER_AP][i] =
-			ev->num_6ghz_reg_rules_client_vlp[i];
+			le32_to_cpu(ev->num_6ghz_reg_rules_client_vlp[i]);
 	}
 
 	num_2ghz_reg_rules = reg_info->num_2ghz_reg_rules;
@@ -5572,39 +5698,39 @@ static int ath11k_pull_reg_chan_list_ext_update_ev(struct ath11k_base *ab,
 
 	memcpy(reg_info->alpha2, &ev->alpha2, REG_ALPHA2_LEN);
 
-	reg_info->dfs_region = ev->dfs_region;
-	reg_info->phybitmap = ev->phybitmap;
-	reg_info->num_phy = ev->num_phy;
-	reg_info->phy_id = ev->phy_id;
-	reg_info->ctry_code = ev->country_id;
-	reg_info->reg_dmn_pair = ev->domain_code;
+	reg_info->dfs_region = le32_to_cpu(ev->dfs_region);
+	reg_info->phybitmap = le32_to_cpu(ev->phybitmap);
+	reg_info->num_phy = le32_to_cpu(ev->num_phy);
+	reg_info->phy_id = le32_to_cpu(ev->phy_id);
+	reg_info->ctry_code = le32_to_cpu(ev->country_id);
+	reg_info->reg_dmn_pair = le32_to_cpu(ev->domain_code);
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "status_code %s",
 		   ath11k_cc_status_to_str(reg_info->status_code));
 
 	reg_info->status_code =
-		ath11k_wmi_cc_setting_code_to_reg(ev->status_code);
+		ath11k_wmi_cc_setting_code_to_reg(le32_to_cpu(ev->status_code));
 
 	reg_info->is_ext_reg_event = true;
 
-	reg_info->min_bw_2ghz = ev->min_bw_2ghz;
-	reg_info->max_bw_2ghz = ev->max_bw_2ghz;
-	reg_info->min_bw_5ghz = ev->min_bw_5ghz;
-	reg_info->max_bw_5ghz = ev->max_bw_5ghz;
+	reg_info->min_bw_2ghz = le32_to_cpu(ev->min_bw_2ghz);
+	reg_info->max_bw_2ghz = le32_to_cpu(ev->max_bw_2ghz);
+	reg_info->min_bw_5ghz = le32_to_cpu(ev->min_bw_5ghz);
+	reg_info->max_bw_5ghz = le32_to_cpu(ev->max_bw_5ghz);
 
 	reg_info->min_bw_6ghz_ap[WMI_REG_INDOOR_AP] =
-			ev->min_bw_6ghz_ap_lpi;
+			le32_to_cpu(ev->min_bw_6ghz_ap_lpi);
 	reg_info->max_bw_6ghz_ap[WMI_REG_INDOOR_AP] =
-			ev->max_bw_6ghz_ap_lpi;
+			le32_to_cpu(ev->max_bw_6ghz_ap_lpi);
 	reg_info->min_bw_6ghz_ap[WMI_REG_STANDARD_POWER_AP] =
-			ev->min_bw_6ghz_ap_sp;
+			le32_to_cpu(ev->min_bw_6ghz_ap_sp);
 	reg_info->max_bw_6ghz_ap[WMI_REG_STANDARD_POWER_AP] =
-			ev->max_bw_6ghz_ap_sp;
+			le32_to_cpu(ev->max_bw_6ghz_ap_sp);
 	reg_info->min_bw_6ghz_ap[WMI_REG_VERY_LOW_POWER_AP] =
-			ev->min_bw_6ghz_ap_vlp;
+			le32_to_cpu(ev->min_bw_6ghz_ap_vlp);
 	reg_info->max_bw_6ghz_ap[WMI_REG_VERY_LOW_POWER_AP] =
-			ev->max_bw_6ghz_ap_vlp;
+			le32_to_cpu(ev->max_bw_6ghz_ap_vlp);
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "6 GHz AP BW: LPI (%d - %d), SP (%d - %d), VLP (%d - %d)\n",
@@ -5617,17 +5743,17 @@ static int ath11k_pull_reg_chan_list_ext_update_ev(struct ath11k_base *ab,
 
 	for (i = 0; i < WMI_REG_MAX_CLIENT_TYPE; i++) {
 		reg_info->min_bw_6ghz_client[WMI_REG_INDOOR_AP][i] =
-				ev->min_bw_6ghz_client_lpi[i];
+				le32_to_cpu(ev->min_bw_6ghz_client_lpi[i]);
 		reg_info->max_bw_6ghz_client[WMI_REG_INDOOR_AP][i] =
-				ev->max_bw_6ghz_client_lpi[i];
+				le32_to_cpu(ev->max_bw_6ghz_client_lpi[i]);
 		reg_info->min_bw_6ghz_client[WMI_REG_STANDARD_POWER_AP][i] =
-				ev->min_bw_6ghz_client_sp[i];
+				le32_to_cpu(ev->min_bw_6ghz_client_sp[i]);
 		reg_info->max_bw_6ghz_client[WMI_REG_STANDARD_POWER_AP][i] =
-				ev->max_bw_6ghz_client_sp[i];
+				le32_to_cpu(ev->max_bw_6ghz_client_sp[i]);
 		reg_info->min_bw_6ghz_client[WMI_REG_VERY_LOW_POWER_AP][i] =
-				ev->min_bw_6ghz_client_vlp[i];
+				le32_to_cpu(ev->min_bw_6ghz_client_vlp[i]);
 		reg_info->max_bw_6ghz_client[WMI_REG_VERY_LOW_POWER_AP][i] =
-				ev->max_bw_6ghz_client_vlp[i];
+				le32_to_cpu(ev->max_bw_6ghz_client_vlp[i]);
 
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "6 GHz %s BW: LPI (%d - %d), SP (%d - %d), VLP (%d - %d)\n",
@@ -5778,44 +5904,44 @@ static int ath11k_pull_reg_chan_list_ext_update_ev(struct ath11k_base *ab,
 		}
 	}
 
-	reg_info->client_type = ev->client_type;
+	reg_info->client_type = le32_to_cpu(ev->client_type);
 	reg_info->rnr_tpe_usable = ev->rnr_tpe_usable;
 	reg_info->unspecified_ap_usable =
 			ev->unspecified_ap_usable;
 	reg_info->domain_code_6ghz_ap[WMI_REG_INDOOR_AP] =
-			ev->domain_code_6ghz_ap_lpi;
+			le32_to_cpu(ev->domain_code_6ghz_ap_lpi);
 	reg_info->domain_code_6ghz_ap[WMI_REG_STANDARD_POWER_AP] =
-			ev->domain_code_6ghz_ap_sp;
+			le32_to_cpu(ev->domain_code_6ghz_ap_sp);
 	reg_info->domain_code_6ghz_ap[WMI_REG_VERY_LOW_POWER_AP] =
-			ev->domain_code_6ghz_ap_vlp;
+			le32_to_cpu(ev->domain_code_6ghz_ap_vlp);
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "6 GHz reg info client type %s rnr_tpe_usable %d unspecified_ap_usable %d AP sub domain: lpi %s, sp %s, vlp %s\n",
 		   ath11k_6ghz_client_type_to_str(reg_info->client_type),
 		   reg_info->rnr_tpe_usable,
 		   reg_info->unspecified_ap_usable,
-		   ath11k_sub_reg_6ghz_to_str(ev->domain_code_6ghz_ap_lpi),
-		   ath11k_sub_reg_6ghz_to_str(ev->domain_code_6ghz_ap_sp),
-		   ath11k_sub_reg_6ghz_to_str(ev->domain_code_6ghz_ap_vlp));
+		   ath11k_sub_reg_6ghz_to_str(le32_to_cpu(ev->domain_code_6ghz_ap_lpi)),
+		   ath11k_sub_reg_6ghz_to_str(le32_to_cpu(ev->domain_code_6ghz_ap_sp)),
+		   ath11k_sub_reg_6ghz_to_str(le32_to_cpu(ev->domain_code_6ghz_ap_vlp)));
 
 	for (i = 0; i < WMI_REG_MAX_CLIENT_TYPE; i++) {
-		reg_info->domain_code_6ghz_client[WMI_REG_INDOOR_AP][i] =
-				ev->domain_code_6ghz_client_lpi[i];
-		reg_info->domain_code_6ghz_client[WMI_REG_STANDARD_POWER_AP][i] =
-				ev->domain_code_6ghz_client_sp[i];
-		reg_info->domain_code_6ghz_client[WMI_REG_VERY_LOW_POWER_AP][i] =
-				ev->domain_code_6ghz_client_vlp[i];
+		u32 lpi = le32_to_cpu(ev->domain_code_6ghz_client_lpi[i]);
+		u32 sp = le32_to_cpu(ev->domain_code_6ghz_client_sp[i]);
+		u32 vlp = le32_to_cpu(ev->domain_code_6ghz_client_vlp[i]);
+
+		reg_info->domain_code_6ghz_client[WMI_REG_INDOOR_AP][i] = lpi;
+		reg_info->domain_code_6ghz_client[WMI_REG_STANDARD_POWER_AP][i] = sp;
+		reg_info->domain_code_6ghz_client[WMI_REG_VERY_LOW_POWER_AP][i] = vlp;
 
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "6 GHz client type %s client sub domain: lpi %s, sp %s, vlp %s\n",
 			   ath11k_6ghz_client_type_to_str(i),
-			   ath11k_sub_reg_6ghz_to_str(ev->domain_code_6ghz_client_lpi[i]),
-			   ath11k_sub_reg_6ghz_to_str(ev->domain_code_6ghz_client_sp[i]),
-			   ath11k_sub_reg_6ghz_to_str(ev->domain_code_6ghz_client_vlp[i])
-			  );
+			   ath11k_sub_reg_6ghz_to_str(lpi),
+			   ath11k_sub_reg_6ghz_to_str(sp),
+			   ath11k_sub_reg_6ghz_to_str(vlp));
 	}
 
-	reg_info->domain_code_6ghz_super_id = ev->domain_code_6ghz_super_id;
+	reg_info->domain_code_6ghz_super_id = le32_to_cpu(ev->domain_code_6ghz_super_id);
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "6 GHz client_type %s 6 GHz super domain %s",
@@ -5881,7 +6007,7 @@ static int ath11k_pull_vdev_del_resp_ev(struct ath11k_base *ab,
 		return -EPROTO;
 	}
 
-	*vdev_id = ev->vdev_id;
+	*vdev_id = le32_to_cpu(ev->vdev_id);
 
 	kfree(tb);
 	return 0;
@@ -5909,8 +6035,8 @@ static int ath11k_pull_bcn_tx_status_ev(struct ath11k_base *ab,
 		return -EPROTO;
 	}
 
-	*vdev_id   = ev->vdev_id;
-	*tx_status = ev->tx_status;
+	*vdev_id   = le32_to_cpu(ev->vdev_id);
+	*tx_status = le32_to_cpu(ev->tx_status);
 
 	kfree(tb);
 	return 0;
@@ -5937,7 +6063,7 @@ static int ath11k_pull_vdev_stopped_param_tlv(struct ath11k_base *ab, struct sk_
 		return -EPROTO;
 	}
 
-	*vdev_id =  ev->vdev_id;
+	*vdev_id =  le32_to_cpu(ev->vdev_id);
 
 	kfree(tb);
 	return 0;
@@ -5989,17 +6115,17 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
 		return -EPROTO;
 	}
 
-	hdr->pdev_id =  ev->pdev_id;
-	hdr->chan_freq = ev->chan_freq;
-	hdr->channel =  ev->channel;
-	hdr->snr =  ev->snr;
-	hdr->rate =  ev->rate;
-	hdr->phy_mode =  ev->phy_mode;
-	hdr->buf_len =  ev->buf_len;
-	hdr->status =  ev->status;
-	hdr->flags =  ev->flags;
-	hdr->rssi =  ev->rssi;
-	hdr->tsf_delta =  ev->tsf_delta;
+	hdr->pdev_id = le32_to_cpu(ev->pdev_id);
+	hdr->chan_freq = le32_to_cpu(ev->chan_freq);
+	hdr->channel = le32_to_cpu(ev->channel);
+	hdr->snr = le32_to_cpu(ev->snr);
+	hdr->rate = le32_to_cpu(ev->rate);
+	hdr->phy_mode = le32_to_cpu(ev->phy_mode);
+	hdr->buf_len = le32_to_cpu(ev->buf_len);
+	hdr->status = le32_to_cpu(ev->status);
+	hdr->flags = le32_to_cpu(ev->flags);
+	hdr->rssi = le32_to_cpu(ev->rssi);
+	hdr->tsf_delta = le32_to_cpu(ev->tsf_delta);
 	memcpy(hdr->rssi_ctl, ev->rssi_ctl, sizeof(hdr->rssi_ctl));
 
 	if (hdr->buf_len < sizeof(struct ieee80211_hdr_3addr) ||
@@ -6026,7 +6152,7 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar,
 	int num_mgmt;
 
 	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_find(&ar->txmgmt_idr, tx_compl_param->desc_id);
+	msdu = idr_find(&ar->txmgmt_idr, le32_to_cpu(tx_compl_param->desc_id));
 
 	if (!msdu) {
 		ath11k_warn(ar->ab, "received mgmt tx compl for invalid msdu_id: %d\n",
@@ -6035,7 +6161,7 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar,
 		return -ENOENT;
 	}
 
-	idr_remove(&ar->txmgmt_idr, tx_compl_param->desc_id);
+	idr_remove(&ar->txmgmt_idr, le32_to_cpu(tx_compl_param->desc_id));
 	spin_unlock_bh(&ar->txmgmt_idr_lock);
 
 	skb_cb = ATH11K_SKB_CB(msdu);
@@ -6050,7 +6176,7 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar,
 		info->flags |= IEEE80211_TX_STAT_ACK;
 		if (test_bit(WMI_TLV_SERVICE_TX_DATA_MGMT_ACK_RSSI,
 			     ar->ab->wmi_ab.svc_map))
-			info->status.ack_signal = tx_compl_param->ack_rssi;
+			info->status.ack_signal = le32_to_cpu(tx_compl_param->ack_rssi);
 	}
 
 	ieee80211_tx_status_irqsafe(ar->hw, msdu);
@@ -6456,11 +6582,11 @@ ath11k_pull_vdev_install_key_compl_ev(struct ath11k_base *ab, struct sk_buff *sk
 		return -EPROTO;
 	}
 
-	arg->vdev_id = ev->vdev_id;
+	arg->vdev_id = le32_to_cpu(ev->vdev_id);
 	arg->macaddr = ev->peer_macaddr.addr;
-	arg->key_idx = ev->key_idx;
-	arg->key_flags = ev->key_flags;
-	arg->status = ev->status;
+	arg->key_idx = le32_to_cpu(ev->key_idx);
+	arg->key_flags = le32_to_cpu(ev->key_flags);
+	arg->status = le32_to_cpu(ev->status);
 
 	kfree(tb);
 	return 0;
@@ -6487,7 +6613,7 @@ static int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, struct sk_buff
 		return -EPROTO;
 	}
 
-	peer_assoc_conf->vdev_id = ev->vdev_id;
+	peer_assoc_conf->vdev_id = le32_to_cpu(ev->vdev_id);
 	peer_assoc_conf->macaddr = ev->peer_macaddr.addr;
 
 	kfree(tb);
@@ -6497,74 +6623,74 @@ static int ath11k_pull_peer_assoc_conf_ev(struct ath11k_base *ab, struct sk_buff
 static void ath11k_wmi_pull_pdev_stats_base(const struct wmi_pdev_stats_base *src,
 					    struct ath11k_fw_stats_pdev *dst)
 {
-	dst->ch_noise_floor = src->chan_nf;
-	dst->tx_frame_count = src->tx_frame_count;
-	dst->rx_frame_count = src->rx_frame_count;
-	dst->rx_clear_count = src->rx_clear_count;
-	dst->cycle_count = src->cycle_count;
-	dst->phy_err_count = src->phy_err_count;
-	dst->chan_tx_power = src->chan_tx_pwr;
+	dst->ch_noise_floor = le32_to_cpu(src->chan_nf);
+	dst->tx_frame_count = le32_to_cpu(src->tx_frame_count);
+	dst->rx_frame_count = le32_to_cpu(src->rx_frame_count);
+	dst->rx_clear_count = le32_to_cpu(src->rx_clear_count);
+	dst->cycle_count = le32_to_cpu(src->cycle_count);
+	dst->phy_err_count = le32_to_cpu(src->phy_err_count);
+	dst->chan_tx_power = le32_to_cpu(src->chan_tx_pwr);
 }
 
 static void
 ath11k_wmi_pull_pdev_stats_tx(const struct wmi_pdev_stats_tx *src,
 			      struct ath11k_fw_stats_pdev *dst)
 {
-	dst->comp_queued = src->comp_queued;
-	dst->comp_delivered = src->comp_delivered;
-	dst->msdu_enqued = src->msdu_enqued;
-	dst->mpdu_enqued = src->mpdu_enqued;
-	dst->wmm_drop = src->wmm_drop;
-	dst->local_enqued = src->local_enqued;
-	dst->local_freed = src->local_freed;
-	dst->hw_queued = src->hw_queued;
-	dst->hw_reaped = src->hw_reaped;
-	dst->underrun = src->underrun;
-	dst->hw_paused = src->hw_paused;
-	dst->tx_abort = src->tx_abort;
-	dst->mpdus_requeued = src->mpdus_requeued;
-	dst->tx_ko = src->tx_ko;
-	dst->tx_xretry = src->tx_xretry;
-	dst->data_rc = src->data_rc;
-	dst->self_triggers = src->self_triggers;
-	dst->sw_retry_failure = src->sw_retry_failure;
-	dst->illgl_rate_phy_err = src->illgl_rate_phy_err;
-	dst->pdev_cont_xretry = src->pdev_cont_xretry;
-	dst->pdev_tx_timeout = src->pdev_tx_timeout;
-	dst->pdev_resets = src->pdev_resets;
-	dst->stateless_tid_alloc_failure = src->stateless_tid_alloc_failure;
-	dst->phy_underrun = src->phy_underrun;
-	dst->txop_ovf = src->txop_ovf;
-	dst->seq_posted = src->seq_posted;
-	dst->seq_failed_queueing = src->seq_failed_queueing;
-	dst->seq_completed = src->seq_completed;
-	dst->seq_restarted = src->seq_restarted;
-	dst->mu_seq_posted = src->mu_seq_posted;
-	dst->mpdus_sw_flush = src->mpdus_sw_flush;
-	dst->mpdus_hw_filter = src->mpdus_hw_filter;
-	dst->mpdus_truncated = src->mpdus_truncated;
-	dst->mpdus_ack_failed = src->mpdus_ack_failed;
-	dst->mpdus_expired = src->mpdus_expired;
+	dst->comp_queued = le32_to_cpu(src->comp_queued);
+	dst->comp_delivered = le32_to_cpu(src->comp_delivered);
+	dst->msdu_enqued = le32_to_cpu(src->msdu_enqued);
+	dst->mpdu_enqued = le32_to_cpu(src->mpdu_enqued);
+	dst->wmm_drop = le32_to_cpu(src->wmm_drop);
+	dst->local_enqued = le32_to_cpu(src->local_enqued);
+	dst->local_freed = le32_to_cpu(src->local_freed);
+	dst->hw_queued = le32_to_cpu(src->hw_queued);
+	dst->hw_reaped = le32_to_cpu(src->hw_reaped);
+	dst->underrun = le32_to_cpu(src->underrun);
+	dst->hw_paused = le32_to_cpu(src->hw_paused);
+	dst->tx_abort = le32_to_cpu(src->tx_abort);
+	dst->mpdus_requeued = le32_to_cpu(src->mpdus_requeued);
+	dst->tx_ko = le32_to_cpu(src->tx_ko);
+	dst->tx_xretry = le32_to_cpu(src->tx_xretry);
+	dst->data_rc = le32_to_cpu(src->data_rc);
+	dst->self_triggers = le32_to_cpu(src->self_triggers);
+	dst->sw_retry_failure = le32_to_cpu(src->sw_retry_failure);
+	dst->illgl_rate_phy_err = le32_to_cpu(src->illgl_rate_phy_err);
+	dst->pdev_cont_xretry = le32_to_cpu(src->pdev_cont_xretry);
+	dst->pdev_tx_timeout = le32_to_cpu(src->pdev_tx_timeout);
+	dst->pdev_resets = le32_to_cpu(src->pdev_resets);
+	dst->stateless_tid_alloc_failure = le32_to_cpu(src->stateless_tid_alloc_failure);
+	dst->phy_underrun = le32_to_cpu(src->phy_underrun);
+	dst->txop_ovf = le32_to_cpu(src->txop_ovf);
+	dst->seq_posted = le32_to_cpu(src->seq_posted);
+	dst->seq_failed_queueing = le32_to_cpu(src->seq_failed_queueing);
+	dst->seq_completed = le32_to_cpu(src->seq_completed);
+	dst->seq_restarted = le32_to_cpu(src->seq_restarted);
+	dst->mu_seq_posted = le32_to_cpu(src->mu_seq_posted);
+	dst->mpdus_sw_flush = le32_to_cpu(src->mpdus_sw_flush);
+	dst->mpdus_hw_filter = le32_to_cpu(src->mpdus_hw_filter);
+	dst->mpdus_truncated = le32_to_cpu(src->mpdus_truncated);
+	dst->mpdus_ack_failed = le32_to_cpu(src->mpdus_ack_failed);
+	dst->mpdus_expired = le32_to_cpu(src->mpdus_expired);
 }
 
 static void ath11k_wmi_pull_pdev_stats_rx(const struct wmi_pdev_stats_rx *src,
 					  struct ath11k_fw_stats_pdev *dst)
 {
-	dst->mid_ppdu_route_change = src->mid_ppdu_route_change;
-	dst->status_rcvd = src->status_rcvd;
-	dst->r0_frags = src->r0_frags;
-	dst->r1_frags = src->r1_frags;
-	dst->r2_frags = src->r2_frags;
-	dst->r3_frags = src->r3_frags;
-	dst->htt_msdus = src->htt_msdus;
-	dst->htt_mpdus = src->htt_mpdus;
-	dst->loc_msdus = src->loc_msdus;
-	dst->loc_mpdus = src->loc_mpdus;
-	dst->oversize_amsdu = src->oversize_amsdu;
-	dst->phy_errs = src->phy_errs;
-	dst->phy_err_drop = src->phy_err_drop;
-	dst->mpdu_errs = src->mpdu_errs;
-	dst->rx_ovfl_errs = src->rx_ovfl_errs;
+	dst->mid_ppdu_route_change = le32_to_cpu(src->mid_ppdu_route_change);
+	dst->status_rcvd = le32_to_cpu(src->status_rcvd);
+	dst->r0_frags = le32_to_cpu(src->r0_frags);
+	dst->r1_frags = le32_to_cpu(src->r1_frags);
+	dst->r2_frags = le32_to_cpu(src->r2_frags);
+	dst->r3_frags = le32_to_cpu(src->r3_frags);
+	dst->htt_msdus = le32_to_cpu(src->htt_msdus);
+	dst->htt_mpdus = le32_to_cpu(src->htt_mpdus);
+	dst->loc_msdus = le32_to_cpu(src->loc_msdus);
+	dst->loc_mpdus = le32_to_cpu(src->loc_mpdus);
+	dst->oversize_amsdu = le32_to_cpu(src->oversize_amsdu);
+	dst->phy_errs = le32_to_cpu(src->phy_errs);
+	dst->phy_err_drop = le32_to_cpu(src->phy_err_drop);
+	dst->mpdu_errs = le32_to_cpu(src->mpdu_errs);
+	dst->rx_ovfl_errs = le32_to_cpu(src->rx_ovfl_errs);
 }
 
 static void
@@ -6573,39 +6699,39 @@ ath11k_wmi_pull_vdev_stats(const struct wmi_vdev_stats *src,
 {
 	int i;
 
-	dst->vdev_id = src->vdev_id;
-	dst->beacon_snr = src->beacon_snr;
-	dst->data_snr = src->data_snr;
-	dst->num_rx_frames = src->num_rx_frames;
-	dst->num_rts_fail = src->num_rts_fail;
-	dst->num_rts_success = src->num_rts_success;
-	dst->num_rx_err = src->num_rx_err;
-	dst->num_rx_discard = src->num_rx_discard;
-	dst->num_tx_not_acked = src->num_tx_not_acked;
+	dst->vdev_id = le32_to_cpu(src->vdev_id);
+	dst->beacon_snr = le32_to_cpu(src->beacon_snr);
+	dst->data_snr = le32_to_cpu(src->data_snr);
+	dst->num_rx_frames = le32_to_cpu(src->num_rx_frames);
+	dst->num_rts_fail = le32_to_cpu(src->num_rts_fail);
+	dst->num_rts_success = le32_to_cpu(src->num_rts_success);
+	dst->num_rx_err = le32_to_cpu(src->num_rx_err);
+	dst->num_rx_discard = le32_to_cpu(src->num_rx_discard);
+	dst->num_tx_not_acked = le32_to_cpu(src->num_tx_not_acked);
 
 	for (i = 0; i < ARRAY_SIZE(src->num_tx_frames); i++)
-		dst->num_tx_frames[i] = src->num_tx_frames[i];
+		dst->num_tx_frames[i] = le32_to_cpu(src->num_tx_frames[i]);
 
 	for (i = 0; i < ARRAY_SIZE(src->num_tx_frames_retries); i++)
-		dst->num_tx_frames_retries[i] = src->num_tx_frames_retries[i];
+		dst->num_tx_frames_retries[i] = le32_to_cpu(src->num_tx_frames_retries[i]);
 
 	for (i = 0; i < ARRAY_SIZE(src->num_tx_frames_failures); i++)
-		dst->num_tx_frames_failures[i] = src->num_tx_frames_failures[i];
+		dst->num_tx_frames_failures[i] = le32_to_cpu(src->num_tx_frames_failures[i]);
 
 	for (i = 0; i < ARRAY_SIZE(src->tx_rate_history); i++)
-		dst->tx_rate_history[i] = src->tx_rate_history[i];
+		dst->tx_rate_history[i] = le32_to_cpu(src->tx_rate_history[i]);
 
 	for (i = 0; i < ARRAY_SIZE(src->beacon_rssi_history); i++)
-		dst->beacon_rssi_history[i] = src->beacon_rssi_history[i];
+		dst->beacon_rssi_history[i] = le32_to_cpu(src->beacon_rssi_history[i]);
 }
 
 static void
 ath11k_wmi_pull_bcn_stats(const struct wmi_bcn_stats *src,
 			  struct ath11k_fw_stats_bcn *dst)
 {
-	dst->vdev_id = src->vdev_id;
-	dst->tx_bcn_succ_cnt = src->tx_bcn_succ_cnt;
-	dst->tx_bcn_outage_cnt = src->tx_bcn_outage_cnt;
+	dst->vdev_id = le32_to_cpu(src->vdev_id);
+	dst->tx_bcn_succ_cnt = le32_to_cpu(src->tx_bcn_succ_cnt);
+	dst->tx_bcn_outage_cnt = le32_to_cpu(src->tx_bcn_outage_cnt);
 }
 
 static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
@@ -6627,17 +6753,17 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
 
 	rcu_read_lock();
 
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
 	stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "stats vdev id %d mac %pM\n",
-		   stats_rssi->vdev_id, stats_rssi->peer_macaddr.addr);
+		   le32_to_cpu(stats_rssi->vdev_id), stats_rssi->peer_macaddr.addr);
 
-	arvif = ath11k_mac_get_arvif(ar, stats_rssi->vdev_id);
+	arvif = ath11k_mac_get_arvif(ar, le32_to_cpu(stats_rssi->vdev_id));
 	if (!arvif) {
 		ath11k_warn(ab, "not found vif for vdev id %d\n",
-			    stats_rssi->vdev_id);
+			    le32_to_cpu(stats_rssi->vdev_id));
 		ret = -EPROTO;
 		goto exit;
 	}
@@ -6662,13 +6788,13 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
 		     ARRAY_SIZE(stats_rssi->rssi_avg_beacon));
 
 	for (j = 0; j < ARRAY_SIZE(arsta->chain_signal); j++) {
-		arsta->chain_signal[j] = stats_rssi->rssi_avg_beacon[j];
+		arsta->chain_signal[j] = le32_to_cpu(stats_rssi->rssi_avg_beacon[j]);
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "stats beacon rssi[%d] %d data rssi[%d] %d\n",
 			   j,
-			   stats_rssi->rssi_avg_beacon[j],
+			   le32_to_cpu(stats_rssi->rssi_avg_beacon[j]),
 			   j,
-			   stats_rssi->rssi_avg_data[j]);
+			   le32_to_cpu(stats_rssi->rssi_avg_data[j]));
 	}
 
 exit:
@@ -6699,9 +6825,9 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 
 	rcu_read_lock();
 
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
 
-	for (i = 0; i < ev->num_pdev_stats; i++) {
+	for (i = 0; i < le32_to_cpu(ev->num_pdev_stats); i++) {
 		const struct wmi_pdev_stats *src;
 		struct ath11k_fw_stats_pdev *dst;
 
@@ -6726,7 +6852,7 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 		list_add_tail(&dst->list, &stats->pdevs);
 	}
 
-	for (i = 0; i < ev->num_vdev_stats; i++) {
+	for (i = 0; i < le32_to_cpu(ev->num_vdev_stats); i++) {
 		const struct wmi_vdev_stats *src;
 		struct ath11k_fw_stats_vdev *dst;
 
@@ -6738,17 +6864,18 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 
 		stats->stats_id = WMI_REQUEST_VDEV_STAT;
 
-		arvif = ath11k_mac_get_arvif(ar, src->vdev_id);
+		arvif = ath11k_mac_get_arvif(ar, le32_to_cpu(src->vdev_id));
 		if (arvif) {
 			sta = ieee80211_find_sta_by_ifaddr(ar->hw,
 							   arvif->bssid,
 							   NULL);
 			if (sta) {
 				arsta = ath11k_sta_to_arsta(sta);
-				arsta->rssi_beacon = src->beacon_snr;
+				arsta->rssi_beacon = le32_to_cpu(src->beacon_snr);
 				ath11k_dbg(ab, ATH11K_DBG_WMI,
 					   "stats vdev id %d snr %d\n",
-					   src->vdev_id, src->beacon_snr);
+					   le32_to_cpu(src->vdev_id),
+					   le32_to_cpu(src->beacon_snr));
 			} else {
 				ath11k_dbg(ab, ATH11K_DBG_WMI,
 					   "not found station of bssid %pM for vdev stat\n",
@@ -6767,7 +6894,7 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 		list_add_tail(&dst->list, &stats->vdevs);
 	}
 
-	for (i = 0; i < ev->num_bcn_stats; i++) {
+	for (i = 0; i < le32_to_cpu(ev->num_bcn_stats); i++) {
 		const struct wmi_bcn_stats *src;
 		struct ath11k_fw_stats_bcn *dst;
 
@@ -6805,7 +6932,7 @@ static int ath11k_wmi_tlv_fw_stats_parse(struct ath11k_base *ab,
 	switch (tag) {
 	case WMI_TAG_STATS_EVENT:
 		parse->ev = (struct wmi_stats_event *)ptr;
-		parse->stats->pdev_id = parse->ev->pdev_id;
+		parse->stats->pdev_id = le32_to_cpu(parse->ev->pdev_id);
 		break;
 	case WMI_TAG_ARRAY_BYTE:
 		ret = ath11k_wmi_tlv_fw_stats_data_parse(ab, parse, ptr, len);
@@ -6813,12 +6940,12 @@ static int ath11k_wmi_tlv_fw_stats_parse(struct ath11k_base *ab,
 	case WMI_TAG_PER_CHAIN_RSSI_STATS:
 		parse->rssi = (struct wmi_per_chain_rssi_stats *)ptr;
 
-		if (parse->ev->stats_id & WMI_REQUEST_RSSI_PER_CHAIN_STAT)
-			parse->rssi_num = parse->rssi->num_per_chain_rssi_stats;
+		if (le32_to_cpu(parse->ev->stats_id) & WMI_REQUEST_RSSI_PER_CHAIN_STAT)
+			parse->rssi_num = le32_to_cpu(parse->rssi->num_per_chain_rssi_stats);
 
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "stats id 0x%x num chain %d\n",
-			   parse->ev->stats_id,
+			   le32_to_cpu(parse->ev->stats_id),
 			   parse->rssi_num);
 		break;
 	case WMI_TAG_ARRAY_STRUCT:
@@ -7314,11 +7441,11 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 		memcpy(&fixed_param, (struct wmi_ready_event *)ptr,
 		       min_t(u16, sizeof(fixed_param), len));
 		rdy_parse->num_extra_mac_addr =
-			fixed_param.ready_event_min.num_extra_mac_addr;
+			le32_to_cpu(fixed_param.ready_event_min.num_extra_mac_addr);
 
 		ether_addr_copy(ab->mac_addr,
 				fixed_param.ready_event_min.mac_addr.addr);
-		ab->pktlog_defs_checksum = fixed_param.pktlog_defs_checksum;
+		ab->pktlog_defs_checksum = le32_to_cpu(fixed_param.pktlog_defs_checksum);
 		break;
 	case WMI_TAG_ARRAY_FIXED_STRUCT:
 		addr_list = (struct wmi_mac_addr *)ptr;
@@ -7371,7 +7498,8 @@ static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, struct sk_buff
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event peer delete resp");
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_vdev_id(ab, peer_del_resp.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab,
+					  le32_to_cpu(peer_del_resp.vdev_id));
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in peer delete resp ev %d",
 			    peer_del_resp.vdev_id);
@@ -7443,17 +7571,18 @@ static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, struct sk_buff
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event start resp event");
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_vdev_id(ab, vdev_start_resp.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab,
+					  le32_to_cpu(vdev_start_resp.vdev_id));
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in vdev start resp ev %d",
-			    vdev_start_resp.vdev_id);
+			    le32_to_cpu(vdev_start_resp.vdev_id));
 		rcu_read_unlock();
 		return;
 	}
 
 	ar->last_wmi_vdev_start_status = 0;
-	ar->max_allowed_tx_power = vdev_start_resp.max_allowed_tx_power;
-	status = vdev_start_resp.status;
+	ar->max_allowed_tx_power = (s32)le32_to_cpu(vdev_start_resp.max_allowed_tx_power);
+	status = le32_to_cpu(vdev_start_resp.status);
 
 	if (WARN_ON_ONCE(status)) {
 		ath11k_warn(ab, "vdev start resp error status %d (%s)\n",
@@ -7466,7 +7595,7 @@ static void ath11k_vdev_start_resp_event(struct ath11k_base *ab, struct sk_buff
 	rcu_read_unlock();
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "vdev start resp for vdev id %d",
-		   vdev_start_resp.vdev_id);
+		   le32_to_cpu(vdev_start_resp.vdev_id));
 }
 
 static void ath11k_bcn_tx_status_event(struct ath11k_base *ab, struct sk_buff *skb)
@@ -7523,9 +7652,10 @@ static void ath11k_wmi_event_peer_sta_ps_state_chg(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "event peer sta ps change ev addr %pM state %u sup_bitmap %x ps_valid %u ts %u\n",
-		   ev->peer_macaddr.addr, ev->peer_ps_state,
-		   ev->ps_supported_bitmap, ev->peer_ps_valid,
-		   ev->peer_ps_timestamp);
+		   ev->peer_macaddr.addr, le32_to_cpu(ev->peer_ps_state),
+		   le32_to_cpu(ev->ps_supported_bitmap),
+		   le32_to_cpu(ev->peer_ps_valid),
+		   le32_to_cpu(ev->peer_ps_timestamp));
 
 	rcu_read_lock();
 
@@ -7564,28 +7694,28 @@ static void ath11k_wmi_event_peer_sta_ps_state_chg(struct ath11k_base *ab,
 	spin_lock_bh(&ar->data_lock);
 
 	peer_previous_ps_state = arsta->peer_ps_state;
-	arsta->peer_ps_state = ev->peer_ps_state;
-	arsta->peer_current_ps_valid = !!ev->peer_ps_valid;
+	arsta->peer_ps_state = le32_to_cpu(ev->peer_ps_state);
+	arsta->peer_current_ps_valid = !!le32_to_cpu(ev->peer_ps_valid);
 
 	if (test_bit(WMI_TLV_SERVICE_PEER_POWER_SAVE_DURATION_SUPPORT,
 		     ar->ab->wmi_ab.svc_map)) {
-		if (!(ev->ps_supported_bitmap & WMI_PEER_PS_VALID) ||
-		    !(ev->ps_supported_bitmap & WMI_PEER_PS_STATE_TIMESTAMP) ||
-		    !ev->peer_ps_valid)
+		if (!(le32_to_cpu(ev->ps_supported_bitmap) & WMI_PEER_PS_VALID) ||
+		    !(le32_to_cpu(ev->ps_supported_bitmap) & WMI_PEER_PS_STATE_TIMESTAMP) ||
+		    !le32_to_cpu(ev->peer_ps_valid))
 			goto out;
 
 		if (arsta->peer_ps_state == WMI_PEER_PS_STATE_ON) {
-			arsta->ps_start_time = ev->peer_ps_timestamp;
+			arsta->ps_start_time = le32_to_cpu(ev->peer_ps_timestamp);
 			arsta->ps_start_jiffies = jiffies;
 		} else if (arsta->peer_ps_state == WMI_PEER_PS_STATE_OFF &&
 			   peer_previous_ps_state == WMI_PEER_PS_STATE_ON) {
 			arsta->ps_total_duration = arsta->ps_total_duration +
-					(ev->peer_ps_timestamp - arsta->ps_start_time);
+					(le32_to_cpu(ev->peer_ps_timestamp) - arsta->ps_start_time);
 		}
 
 		if (ar->ps_timekeeper_enable)
 			trace_ath11k_ps_timekeeper(ar, ev->peer_macaddr.addr,
-						   ev->peer_ps_timestamp,
+						   le32_to_cpu(ev->peer_ps_timestamp),
 						   arsta->peer_ps_state);
 	}
 
@@ -7750,7 +7880,8 @@ static void ath11k_mgmt_tx_compl_event(struct ath11k_base *ab, struct sk_buff *s
 	}
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, tx_compl_param.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab,
+					  le32_to_cpu(tx_compl_param.pdev_id));
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id %d in mgmt_tx_compl_event\n",
 			    tx_compl_param.pdev_id);
@@ -7811,15 +7942,18 @@ static void ath11k_scan_event(struct ath11k_base *ab, struct sk_buff *skb)
 	 * search 'ar' if the corresponding 'ar' scan is ABORTING and the
 	 * aborting scan's vdev id matches this event info.
 	 */
-	if (scan_ev.event_type == WMI_SCAN_EVENT_COMPLETED &&
-	    scan_ev.reason == WMI_SCAN_REASON_CANCELLED) {
-		ar = ath11k_get_ar_on_scan_state(ab, scan_ev.vdev_id,
+	if (le32_to_cpu(scan_ev.event_type) == WMI_SCAN_EVENT_COMPLETED &&
+	    le32_to_cpu(scan_ev.reason) == WMI_SCAN_REASON_CANCELLED) {
+		ar = ath11k_get_ar_on_scan_state(ab,
+						 le32_to_cpu(scan_ev.vdev_id),
 						 ATH11K_SCAN_ABORTING);
 		if (!ar)
-			ar = ath11k_get_ar_on_scan_state(ab, scan_ev.vdev_id,
+			ar = ath11k_get_ar_on_scan_state(ab,
+							 le32_to_cpu(scan_ev.vdev_id),
 							 ATH11K_SCAN_RUNNING);
 	} else {
-		ar = ath11k_mac_get_ar_by_vdev_id(ab, scan_ev.vdev_id);
+		ar = ath11k_mac_get_ar_by_vdev_id(ab,
+						  le32_to_cpu(scan_ev.vdev_id));
 	}
 
 	if (!ar) {
@@ -7832,12 +7966,14 @@ static void ath11k_scan_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "event scan %s type %d reason %d freq %d req_id %d scan_id %d vdev_id %d state %s (%d)\n",
-		   ath11k_wmi_event_scan_type_str(scan_ev.event_type, scan_ev.reason),
-		   scan_ev.event_type, scan_ev.reason, scan_ev.channel_freq,
-		   scan_ev.scan_req_id, scan_ev.scan_id, scan_ev.vdev_id,
+		   ath11k_wmi_event_scan_type_str(le32_to_cpu(scan_ev.event_type),
+						  le32_to_cpu(scan_ev.reason)),
+		   le32_to_cpu(scan_ev.event_type), le32_to_cpu(scan_ev.reason),
+		   le32_to_cpu(scan_ev.channel_freq), le32_to_cpu(scan_ev.scan_req_id),
+		   le32_to_cpu(scan_ev.scan_id), le32_to_cpu(scan_ev.vdev_id),
 		   ath11k_scan_state_str(ar->scan.state), ar->scan.state);
 
-	switch (scan_ev.event_type) {
+	switch (le32_to_cpu(scan_ev.event_type)) {
 	case WMI_SCAN_EVENT_STARTED:
 		ath11k_wmi_event_scan_started(ar);
 		break;
@@ -7848,7 +7984,8 @@ static void ath11k_scan_event(struct ath11k_base *ab, struct sk_buff *skb)
 		ath11k_wmi_event_scan_bss_chan(ar);
 		break;
 	case WMI_SCAN_EVENT_FOREIGN_CHAN:
-		ath11k_wmi_event_scan_foreign_chan(ar, scan_ev.channel_freq);
+		ath11k_wmi_event_scan_foreign_chan(ar,
+						   le32_to_cpu(scan_ev.channel_freq));
 		break;
 	case WMI_SCAN_EVENT_START_FAILED:
 		ath11k_warn(ab, "received scan start failure event\n");
@@ -7938,7 +8075,7 @@ static void ath11k_roam_event(struct ath11k_base *ab, struct sk_buff *skb)
 		   roam_ev.vdev_id, roam_ev.reason, roam_ev.rssi);
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_vdev_id(ab, roam_ev.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, le32_to_cpu(roam_ev.vdev_id));
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in roam ev %d",
 			    roam_ev.vdev_id);
@@ -7946,13 +8083,14 @@ static void ath11k_roam_event(struct ath11k_base *ab, struct sk_buff *skb)
 		return;
 	}
 
-	if (roam_ev.reason >= WMI_ROAM_REASON_MAX)
-		ath11k_warn(ab, "ignoring unknown roam event reason %d on vdev %i\n",
+	if (le32_to_cpu(roam_ev.reason) >= WMI_ROAM_REASON_MAX)
+		ath11k_warn(ab,
+			    "ignoring unknown roam event reason %d on vdev %i\n",
 			    roam_ev.reason, roam_ev.vdev_id);
 
-	switch (roam_ev.reason) {
+	switch (le32_to_cpu(roam_ev.reason)) {
 	case WMI_ROAM_REASON_BEACON_MISS:
-		ath11k_mac_handle_beacon_miss(ar, roam_ev.vdev_id);
+		ath11k_mac_handle_beacon_miss(ar, le32_to_cpu(roam_ev.vdev_id));
 		break;
 	case WMI_ROAM_REASON_BETTER_AP:
 	case WMI_ROAM_REASON_LOW_RSSI:
@@ -7987,13 +8125,13 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 		   ch_info_ev.rx_clear_count, ch_info_ev.cycle_count,
 		   ch_info_ev.mac_clk_mhz);
 
-	if (ch_info_ev.cmd_flags == WMI_CHAN_INFO_END_RESP) {
+	if (le32_to_cpu(ch_info_ev.cmd_flags) == WMI_CHAN_INFO_END_RESP) {
 		ath11k_dbg(ab, ATH11K_DBG_WMI, "chan info report completed\n");
 		return;
 	}
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_vdev_id(ab, ch_info_ev.vdev_id);
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, le32_to_cpu(ch_info_ev.vdev_id));
 	if (!ar) {
 		ath11k_warn(ab, "invalid vdev id in chan info ev %d",
 			    ch_info_ev.vdev_id);
@@ -8012,7 +8150,7 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 		break;
 	}
 
-	idx = freq_to_idx(ar, ch_info_ev.freq);
+	idx = freq_to_idx(ar, le32_to_cpu(ch_info_ev.freq));
 	if (idx >= ARRAY_SIZE(ar->survey)) {
 		ath11k_warn(ab, "chan info: invalid frequency %d (idx %d out of bounds)\n",
 			    ch_info_ev.freq, idx);
@@ -8023,16 +8161,18 @@ static void ath11k_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 	 * HW channel counters frequency value
 	 */
 	if (ch_info_ev.mac_clk_mhz)
-		cc_freq_hz = (ch_info_ev.mac_clk_mhz * 1000);
+		cc_freq_hz = (le32_to_cpu(ch_info_ev.mac_clk_mhz) * 1000);
 
-	if (ch_info_ev.cmd_flags == WMI_CHAN_INFO_START_RESP) {
+	if (le32_to_cpu(ch_info_ev.cmd_flags) == WMI_CHAN_INFO_START_RESP) {
 		survey = &ar->survey[idx];
 		memset(survey, 0, sizeof(*survey));
-		survey->noise = ch_info_ev.noise_floor;
+		survey->noise = le32_to_cpu(ch_info_ev.noise_floor);
 		survey->filled = SURVEY_INFO_NOISE_DBM | SURVEY_INFO_TIME |
 				 SURVEY_INFO_TIME_BUSY;
-		survey->time = div_u64(ch_info_ev.cycle_count, cc_freq_hz);
-		survey->time_busy = div_u64(ch_info_ev.rx_clear_count, cc_freq_hz);
+		survey->time = div_u64(le32_to_cpu(ch_info_ev.cycle_count),
+				       cc_freq_hz);
+		survey->time_busy = div_u64(le32_to_cpu(ch_info_ev.rx_clear_count),
+					    cc_freq_hz);
 	}
 exit:
 	spin_unlock_bh(&ar->data_lock);
@@ -8054,20 +8194,20 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 		return;
 	}
 
-	busy = (u64)(bss_ch_info_ev.rx_clear_count_high) << 32 |
-			bss_ch_info_ev.rx_clear_count_low;
+	busy = (u64)le32_to_cpu(bss_ch_info_ev.rx_clear_count_high) << 32 |
+			le32_to_cpu(bss_ch_info_ev.rx_clear_count_low);
 
-	total = (u64)(bss_ch_info_ev.cycle_count_high) << 32 |
-			bss_ch_info_ev.cycle_count_low;
+	total = (u64)le32_to_cpu(bss_ch_info_ev.cycle_count_high) << 32 |
+			le32_to_cpu(bss_ch_info_ev.cycle_count_low);
 
-	tx = (u64)(bss_ch_info_ev.tx_cycle_count_high) << 32 |
-			bss_ch_info_ev.tx_cycle_count_low;
+	tx = (u64)le32_to_cpu(bss_ch_info_ev.tx_cycle_count_high) << 32 |
+			le32_to_cpu(bss_ch_info_ev.tx_cycle_count_low);
 
-	rx = (u64)(bss_ch_info_ev.rx_cycle_count_high) << 32 |
-			bss_ch_info_ev.rx_cycle_count_low;
+	rx = (u64)le32_to_cpu(bss_ch_info_ev.rx_cycle_count_high) << 32 |
+			le32_to_cpu(bss_ch_info_ev.rx_cycle_count_low);
 
-	rx_bss = (u64)(bss_ch_info_ev.rx_bss_cycle_count_high) << 32 |
-			bss_ch_info_ev.rx_bss_cycle_count_low;
+	rx_bss = (u64)le32_to_cpu(bss_ch_info_ev.rx_bss_cycle_count_high) << 32 |
+			le32_to_cpu(bss_ch_info_ev.rx_bss_cycle_count_low);
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "event pdev bss chan info:\n pdev_id: %d freq: %d noise: %d cycle: busy %llu total %llu tx %llu rx %llu rx_bss %llu\n",
@@ -8076,7 +8216,8 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 		   tx, rx, rx_bss);
 
 	rcu_read_lock();
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, bss_ch_info_ev.pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab,
+					  le32_to_cpu(bss_ch_info_ev.pdev_id));
 
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id %d in bss_chan_info event\n",
@@ -8086,7 +8227,7 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 	}
 
 	spin_lock_bh(&ar->data_lock);
-	idx = freq_to_idx(ar, bss_ch_info_ev.freq);
+	idx = freq_to_idx(ar, le32_to_cpu(bss_ch_info_ev.freq));
 	if (idx >= ARRAY_SIZE(ar->survey)) {
 		ath11k_warn(ab, "bss chan info: invalid frequency %d (idx %d out of bounds)\n",
 			    bss_ch_info_ev.freq, idx);
@@ -8095,7 +8236,7 @@ ath11k_pdev_bss_chan_info_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	survey = &ar->survey[idx];
 
-	survey->noise     = bss_ch_info_ev.noise_floor;
+	survey->noise     = le32_to_cpu(bss_ch_info_ev.noise_floor);
 	survey->time      = div_u64(total, cc_freq_hz);
 	survey->time_busy = div_u64(busy, cc_freq_hz);
 	survey->time_rx   = div_u64(rx_bss, cc_freq_hz);
@@ -8154,7 +8295,7 @@ static int  ath11k_wmi_tlv_services_parser(struct ath11k_base *ab,
 					   const void *ptr, void *data)
 {
 	const struct wmi_service_available_event *ev;
-	u32 *wmi_ext2_service_bitmap;
+	__le32 *wmi_ext2_service_bitmap;
 	int i, j;
 
 	switch (tag) {
@@ -8164,7 +8305,7 @@ static int  ath11k_wmi_tlv_services_parser(struct ath11k_base *ab,
 			i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
 			i++) {
 			do {
-				if (ev->wmi_service_segment_bitmap[i] &
+				if (le32_to_cpu(ev->wmi_service_segment_bitmap[i]) &
 				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
 					set_bit(j, ab->wmi_ab.svc_map);
 			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
@@ -8172,18 +8313,18 @@ static int  ath11k_wmi_tlv_services_parser(struct ath11k_base *ab,
 
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "wmi_ext_service_bitmap 0:0x%04x, 1:0x%04x, 2:0x%04x, 3:0x%04x",
-			   ev->wmi_service_segment_bitmap[0],
-			   ev->wmi_service_segment_bitmap[1],
-			   ev->wmi_service_segment_bitmap[2],
-			   ev->wmi_service_segment_bitmap[3]);
+			   le32_to_cpu(ev->wmi_service_segment_bitmap[0]),
+			   le32_to_cpu(ev->wmi_service_segment_bitmap[1]),
+			   le32_to_cpu(ev->wmi_service_segment_bitmap[2]),
+			   le32_to_cpu(ev->wmi_service_segment_bitmap[3]));
 		break;
 	case WMI_TAG_ARRAY_UINT32:
-		wmi_ext2_service_bitmap = (u32 *)ptr;
+		wmi_ext2_service_bitmap = (__le32 *)ptr;
 		for (i = 0, j = WMI_MAX_EXT_SERVICE;
 			i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT2_SERVICE;
 			i++) {
 			do {
-				if (wmi_ext2_service_bitmap[i] &
+				if (le32_to_cpu(wmi_ext2_service_bitmap[i]) &
 				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
 					set_bit(j, ab->wmi_ab.svc_map);
 			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
@@ -8191,8 +8332,10 @@ static int  ath11k_wmi_tlv_services_parser(struct ath11k_base *ab,
 
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "wmi_ext2_service__bitmap  0:0x%04x, 1:0x%04x, 2:0x%04x, 3:0x%04x",
-			   wmi_ext2_service_bitmap[0], wmi_ext2_service_bitmap[1],
-			   wmi_ext2_service_bitmap[2], wmi_ext2_service_bitmap[3]);
+			   le32_to_cpu(wmi_ext2_service_bitmap[0]),
+			   le32_to_cpu(wmi_ext2_service_bitmap[1]),
+			   le32_to_cpu(wmi_ext2_service_bitmap[2]),
+			   le32_to_cpu(wmi_ext2_service_bitmap[3]));
 		break;
 	}
 	return 0;
@@ -8378,12 +8521,12 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 					  const u32 *vdev_ids)
 {
 	u32 vdev_ids_len = ath11k_wmi_tlv_data_len(vdev_ids);
-	u32 num_vdevs = ev->num_vdevs;
+	u32 num_vdevs = le32_to_cpu(ev->num_vdevs);
 	struct ath11k_vif *arvif;
 	int i;
 
 	/* Finish CSA once the switch count becomes NULL */
-	if (ev->current_switch_count)
+	if (le32_to_cpu(ev->current_switch_count))
 		return;
 
 	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
@@ -8435,8 +8578,9 @@ ath11k_wmi_pdev_csa_switch_count_status_event(struct ath11k_base *ab,
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "event pdev csa switch count %d for pdev %d, num_vdevs %d",
-		   ev->current_switch_count, ev->pdev_id,
-		   ev->num_vdevs);
+		   le32_to_cpu(ev->current_switch_count),
+		   le32_to_cpu(ev->pdev_id),
+		   le32_to_cpu(ev->num_vdevs));
 
 	ath11k_wmi_process_csa_switch_count_event(ab, ev, vdev_ids);
 
@@ -8468,22 +8612,25 @@ ath11k_wmi_pdev_dfs_radar_detected_event(struct ath11k_base *ab, struct sk_buff
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
 		   "event pdev dfs radar detected on pdev %d, detection mode %d, chan freq %d, chan_width %d, detector id %d, seg id %d, timestamp %d, chirp %d, freq offset %d, sidx %d",
-		   ev->pdev_id, ev->detection_mode, ev->chan_freq, ev->chan_width,
-		   ev->detector_id, ev->segment_id, ev->timestamp, ev->is_chirp,
-		   ev->freq_offset, ev->sidx);
+		   le32_to_cpu(ev->pdev_id), le32_to_cpu(ev->detection_mode),
+		   le32_to_cpu(ev->chan_freq), le32_to_cpu(ev->chan_width),
+		   le32_to_cpu(ev->detector_id), le32_to_cpu(ev->segment_id),
+		   le32_to_cpu(ev->timestamp), le32_to_cpu(ev->is_chirp),
+		   (s32)le32_to_cpu(ev->freq_offset),
+		   (s32)le32_to_cpu(ev->sidx));
 
 	rcu_read_lock();
 
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
 
 	if (!ar) {
 		ath11k_warn(ab, "radar detected in invalid pdev %d\n",
-			    ev->pdev_id);
+			    le32_to_cpu(ev->pdev_id));
 		goto exit;
 	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "DFS Radar Detected in pdev %d\n",
-		   ev->pdev_id);
+		   le32_to_cpu(ev->pdev_id));
 
 	if (ar->dfs_block_radar_events)
 		ath11k_info(ab, "DFS Radar detected, but ignored as requested\n");
@@ -8520,17 +8667,18 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event pdev temperature ev temp %d pdev_id %d\n",
-		   ev->temp, ev->pdev_id);
+		   (s32)le32_to_cpu(ev->temp), le32_to_cpu(ev->pdev_id));
 
 	rcu_read_lock();
 
-	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	ar = ath11k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
 	if (!ar) {
-		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);
+		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d",
+			    le32_to_cpu(ev->pdev_id));
 		goto exit;
 	}
 
-	ath11k_thermal_event_temperature(ar, ev->temp);
+	ath11k_thermal_event_temperature(ar, (s32)le32_to_cpu(ev->temp));
 
 exit:
 	rcu_read_unlock();
@@ -8720,11 +8868,11 @@ static void ath11k_wmi_twt_add_dialog_event(struct ath11k_base *ab,
 		goto exit;
 	}
 
-	if (ev->status)
+	if (le32_to_cpu(ev->status))
 		ath11k_warn(ab,
 			    "wmi add twt dialog event vdev %d dialog id %d status %s\n",
-			    ev->vdev_id, ev->dialog_id,
-			    ath11k_wmi_twt_add_dialog_event_status(ev->status));
+			    le32_to_cpu(ev->vdev_id), le32_to_cpu(ev->dialog_id),
+			    ath11k_wmi_twt_add_dialog_event_status(le32_to_cpu(ev->status)));
 
 exit:
 	kfree(tb);
@@ -8756,7 +8904,7 @@ static void ath11k_wmi_gtk_offload_status_event(struct ath11k_base *ab,
 
 	rcu_read_lock();
 
-	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, ev->vdev_id);
+	arvif = ath11k_mac_get_arvif_by_vdev_id(ab, le32_to_cpu(ev->vdev_id));
 	if (!arvif) {
 		ath11k_warn(ab, "failed to get arvif for vdev_id:%d\n",
 			    ev->vdev_id);
@@ -8805,8 +8953,8 @@ static void ath11k_wmi_p2p_noa_event(struct ath11k_base *ab,
 	if (!ev || !noa)
 		goto out;
 
-	vdev_id = ev->vdev_id;
-	noa_descriptors = u32_get_bits(noa->noa_attr,
+	vdev_id = le32_to_cpu(ev->vdev_id);
+	noa_descriptors = u32_get_bits(le32_to_cpu(noa->noa_attr),
 				       WMI_P2P_NOA_INFO_DESC_NUM);
 
 	if (noa_descriptors > WMI_P2P_MAX_NOA_DESCRIPTORS) {
@@ -8931,7 +9079,7 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 		goto out;
 
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
+	id = le32_get_bits((cmd_hdr->cmd_id), WMI_CMD_HDR_CMD_ID);
 
 	trace_ath11k_wmi_event(ab, id, skb->data, skb->len);
 
@@ -9113,12 +9261,12 @@ ath11k_wmi_send_unit_test_cmd(struct ath11k *ar,
 	struct sk_buff *skb;
 	struct wmi_tlv *tlv;
 	void *ptr;
-	u32 *ut_cmd_args;
+	__le32 *ut_cmd_args;
 	int buf_len, arg_len;
 	int ret;
 	int i;
 
-	arg_len = sizeof(u32) * ut_cmd.num_args;
+	arg_len = sizeof(u32) * le32_to_cpu(ut_cmd.num_args);
 	buf_len = sizeof(ut_cmd) + arg_len + TLV_HDR_SIZE;
 
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, buf_len);
@@ -9126,8 +9274,9 @@ ath11k_wmi_send_unit_test_cmd(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_unit_test_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_UNIT_TEST_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(ut_cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_UNIT_TEST_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(ut_cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	cmd->vdev_id = ut_cmd.vdev_id;
 	cmd->module_id = ut_cmd.module_id;
@@ -9137,14 +9286,14 @@ ath11k_wmi_send_unit_test_cmd(struct ath11k *ar,
 	ptr = skb->data + sizeof(ut_cmd);
 
 	tlv = ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_UINT32) |
-		      FIELD_PREP(WMI_TLV_LEN, arg_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_UINT32, WMI_TLV_TAG) |
+		      le32_encode_bits(arg_len, WMI_TLV_LEN);
 
 	ptr += TLV_HDR_SIZE;
 
 	ut_cmd_args = ptr;
-	for (i = 0; i < ut_cmd.num_args; i++)
-		ut_cmd_args[i] = test_args[i];
+	for (i = 0; i < le32_to_cpu(ut_cmd.num_args); i++)
+		ut_cmd_args[i] = cpu_to_le32(test_args[i]);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_UNIT_TEST_CMDID);
 
@@ -9187,10 +9336,10 @@ int ath11k_wmi_simulate_radar(struct ath11k *ar)
 	 */
 	dfs_args[DFS_TEST_RADAR_PARAM] = 0;
 
-	wmi_ut.vdev_id = arvif->vdev_id;
-	wmi_ut.module_id = DFS_UNIT_TEST_MODULE;
-	wmi_ut.num_args = DFS_MAX_TEST_ARGS;
-	wmi_ut.diag_token = DFS_UNIT_TEST_TOKEN;
+	wmi_ut.vdev_id = cpu_to_le32(arvif->vdev_id);
+	wmi_ut.module_id = cpu_to_le32(DFS_UNIT_TEST_MODULE);
+	wmi_ut.num_args = cpu_to_le32(DFS_MAX_TEST_ARGS);
+	wmi_ut.diag_token = cpu_to_le32(DFS_UNIT_TEST_TOKEN);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_REG, "Triggering Radar Simulation\n");
 
@@ -9212,24 +9361,27 @@ int ath11k_wmi_fw_dbglog_cfg(struct ath11k *ar, u32 *module_id_bitmap,
 		return -ENOMEM;
 
 	cmd = (struct wmi_debug_log_config_cmd_fixed_param *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_DEBUG_LOG_CONFIG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->dbg_log_param = dbglog->param;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_DEBUG_LOG_CONFIG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->dbg_log_param = cpu_to_le32(dbglog->param);
 
 	tlv = (struct wmi_tlv *)((u8 *)cmd + sizeof(*cmd));
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_UINT32) |
-		      FIELD_PREP(WMI_TLV_LEN, MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32));
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_UINT32, WMI_TLV_TAG) |
+		      le32_encode_bits(MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32),
+				       WMI_TLV_LEN);
 
 	switch (dbglog->param) {
 	case WMI_DEBUG_LOG_PARAM_LOG_LEVEL:
 	case WMI_DEBUG_LOG_PARAM_VDEV_ENABLE:
 	case WMI_DEBUG_LOG_PARAM_VDEV_DISABLE:
 	case WMI_DEBUG_LOG_PARAM_VDEV_ENABLE_BITMAP:
-		cmd->value = dbglog->value;
+		cmd->value = cpu_to_le32(dbglog->value);
 		break;
 	case WMI_DEBUG_LOG_PARAM_MOD_ENABLE_BITMAP:
 	case WMI_DEBUG_LOG_PARAM_WOW_MOD_ENABLE_BITMAP:
-		cmd->value = dbglog->value;
+		cmd->value = cpu_to_le32(dbglog->value);
 		memcpy(tlv->value, module_id_bitmap,
 		       MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32));
 		/* clear current config to be used for next user config */
@@ -9342,17 +9494,19 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_hw_data_filter_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_HW_DATA_FILTER_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_HW_DATA_FILTER_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->enable = enable;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->enable = cpu_to_le32(enable);
 
 	/* Set all modes in case of disable */
 	if (cmd->enable)
-		cmd->hw_filter_bitmap = filter_bitmap;
+		cmd->hw_filter_bitmap = cpu_to_le32(filter_bitmap);
 	else
-		cmd->hw_filter_bitmap = ((u32)~0U);
+		cmd->hw_filter_bitmap = cpu_to_le32(((u32)~0U));
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "hw data filter enable %d filter_bitmap 0x%x\n",
@@ -9380,9 +9534,10 @@ int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
 		return -ENOMEM;
 
 	cmd = (struct wmi_wow_host_wakeup_ind *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_WOW_HOSTWAKEUP_FROM_SLEEP_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_WOW_HOSTWAKEUP_FROM_SLEEP_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow host wakeup ind\n");
 
@@ -9407,10 +9562,12 @@ int ath11k_wmi_wow_enable(struct ath11k *ar)
 		return -ENOMEM;
 
 	cmd = (struct wmi_wow_enable_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_WOW_ENABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_WOW_ENABLE_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->enable = 1;
+	cmd->enable = cpu_to_le32(1);
 	cmd->pause_iface_config = WOW_IFACE_PAUSE_ENABLED;
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow enable\n");
 
@@ -9440,10 +9597,11 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_scan_prob_req_oui_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_SCAN_PROB_REQ_OUI_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->prob_req_oui = prob_req_oui;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_SCAN_PROB_REQ_OUI_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
+	cmd->prob_req_oui = cpu_to_le32(prob_req_oui);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "scan prob req oui %d\n",
 		   prob_req_oui);
@@ -9472,12 +9630,14 @@ int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 		return -ENOMEM;
 
 	cmd = (struct wmi_wow_add_del_event_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_WOW_ADD_DEL_EVT_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_WOW_ADD_DEL_EVT_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->is_add = enable;
-	cmd->event_bitmap = (1 << event);
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->is_add = cpu_to_le32(enable);
+	cmd->event_bitmap = cpu_to_le32((1 << event));
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow add wakeup event %s enable %d vdev_id %d\n",
 		   wow_wakeup_event(event), enable, vdev_id);
@@ -9519,75 +9679,71 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 	/* cmd */
 	ptr = (u8 *)skb->data;
 	cmd = (struct wmi_wow_add_pattern_cmd *)ptr;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_WOW_ADD_PATTERN_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_WOW_ADD_PATTERN_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->pattern_id = pattern_id;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->pattern_id = cpu_to_le32(pattern_id);
 	cmd->pattern_type = WOW_BITMAP_PATTERN;
 
 	ptr += sizeof(*cmd);
 
 	/* bitmap */
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, sizeof(*bitmap));
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(sizeof(*bitmap), WMI_TLV_LEN);
 
 	ptr += sizeof(*tlv);
 
 	bitmap = (struct wmi_wow_bitmap_pattern *)ptr;
-	bitmap->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-					WMI_TAG_WOW_BITMAP_PATTERN_T) |
-			     FIELD_PREP(WMI_TLV_LEN, sizeof(*bitmap) - TLV_HDR_SIZE);
+	bitmap->tlv_header = le32_encode_bits(WMI_TAG_WOW_BITMAP_PATTERN_T,
+					      WMI_TLV_TAG) |
+			     le32_encode_bits(sizeof(*bitmap) - TLV_HDR_SIZE,
+					      WMI_TLV_LEN);
 
 	memcpy(bitmap->patternbuf, pattern, pattern_len);
 	memcpy(bitmap->bitmaskbuf, mask, pattern_len);
-	bitmap->pattern_offset = pattern_offset;
-	bitmap->pattern_len = pattern_len;
-	bitmap->bitmask_len = pattern_len;
-	bitmap->pattern_id = pattern_id;
+	bitmap->pattern_offset = cpu_to_le32(pattern_offset);
+	bitmap->pattern_len = cpu_to_le32(pattern_len);
+	bitmap->bitmask_len = cpu_to_le32(pattern_len);
+	bitmap->pattern_id = cpu_to_le32(pattern_id);
 
 	ptr += sizeof(*bitmap);
 
 	/* ipv4 sync */
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, 0);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(0, WMI_TLV_LEN);
 
 	ptr += sizeof(*tlv);
 
 	/* ipv6 sync */
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, 0);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(0, WMI_TLV_LEN);
 
 	ptr += sizeof(*tlv);
 
 	/* magic */
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, 0);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(0, WMI_TLV_LEN);
 
 	ptr += sizeof(*tlv);
 
 	/* pattern info timeout */
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_UINT32) |
-		      FIELD_PREP(WMI_TLV_LEN, 0);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_UINT32, WMI_TLV_TAG) |
+		      le32_encode_bits(0, WMI_TLV_LEN);
 
 	ptr += sizeof(*tlv);
 
 	/* ratelimit interval */
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_UINT32) |
-		      FIELD_PREP(WMI_TLV_LEN, sizeof(u32));
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_UINT32, WMI_TLV_TAG) |
+		      le32_encode_bits(sizeof(u32), WMI_TLV_LEN);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow add pattern vdev_id %d pattern_id %d pattern_offset %d\n",
 		   vdev_id, pattern_id, pattern_offset);
@@ -9614,12 +9770,13 @@ int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
 		return -ENOMEM;
 
 	cmd = (struct wmi_wow_del_pattern_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_WOW_DEL_PATTERN_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_WOW_DEL_PATTERN_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->pattern_id = pattern_id;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->pattern_id = cpu_to_le32(pattern_id);
 	cmd->pattern_type = WOW_BITMAP_PATTERN;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow del pattern vdev_id %d pattern_id %d\n",
@@ -9643,7 +9800,7 @@ ath11k_wmi_op_gen_config_pno_start(struct ath11k *ar,
 	struct wmi_wow_nlo_config_cmd *cmd;
 	struct wmi_tlv *tlv;
 	struct sk_buff *skb;
-	u32 *channel_list;
+	__le32 *channel_list;
 	size_t len, nlo_list_len, channel_list_len;
 	u8 *ptr;
 	u32 i;
@@ -9668,27 +9825,29 @@ ath11k_wmi_op_gen_config_pno_start(struct ath11k *ar,
 
 	ptr = (u8 *)skb->data;
 	cmd = (struct wmi_wow_nlo_config_cmd *)ptr;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_NLO_CONFIG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_NLO_CONFIG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = pno->vdev_id;
-	cmd->flags = WMI_NLO_CONFIG_START | WMI_NLO_CONFIG_SSID_HIDE_EN;
+	cmd->vdev_id = cpu_to_le32(pno->vdev_id);
+	cmd->flags = cpu_to_le32(WMI_NLO_CONFIG_START | WMI_NLO_CONFIG_SSID_HIDE_EN);
 
 	/* current FW does not support min-max range for dwell time */
-	cmd->active_dwell_time = pno->active_max_time;
-	cmd->passive_dwell_time = pno->passive_max_time;
+	cmd->active_dwell_time = cpu_to_le32(pno->active_max_time);
+	cmd->passive_dwell_time = cpu_to_le32(pno->passive_max_time);
 
 	if (pno->do_passive_scan)
-		cmd->flags |= WMI_NLO_CONFIG_SCAN_PASSIVE;
+		cmd->flags |= cpu_to_le32(WMI_NLO_CONFIG_SCAN_PASSIVE);
 
-	cmd->fast_scan_period = pno->fast_scan_period;
-	cmd->slow_scan_period = pno->slow_scan_period;
-	cmd->fast_scan_max_cycles = pno->fast_scan_max_cycles;
-	cmd->delay_start_time = pno->delay_start_time;
+	cmd->fast_scan_period = cpu_to_le32(pno->fast_scan_period);
+	cmd->slow_scan_period = cpu_to_le32(pno->slow_scan_period);
+	cmd->fast_scan_max_cycles = cpu_to_le32(pno->fast_scan_max_cycles);
+	cmd->delay_start_time = cpu_to_le32(pno->delay_start_time);
 
 	if (pno->enable_pno_scan_randomization) {
-		cmd->flags |= WMI_NLO_CONFIG_SPOOFED_MAC_IN_PROBE_REQ |
-				WMI_NLO_CONFIG_RANDOM_SEQ_NO_IN_PROBE_REQ;
+		cmd->flags |= cpu_to_le32(WMI_NLO_CONFIG_SPOOFED_MAC_IN_PROBE_REQ |
+				WMI_NLO_CONFIG_RANDOM_SEQ_NO_IN_PROBE_REQ);
 		ether_addr_copy(cmd->mac_addr.addr, pno->mac_addr);
 		ether_addr_copy(cmd->mac_mask.addr, pno->mac_addr_mask);
 	}
@@ -9696,24 +9855,25 @@ ath11k_wmi_op_gen_config_pno_start(struct ath11k *ar,
 	ptr += sizeof(*cmd);
 
 	/* nlo_configured_parameters(nlo_list) */
-	cmd->no_of_ssids = pno->uc_networks_count;
+	cmd->no_of_ssids = cpu_to_le32(pno->uc_networks_count);
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG,
-				 WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, nlo_list_len);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(nlo_list_len, WMI_TLV_LEN);
 
 	ptr += sizeof(*tlv);
 	nlo_list = (struct nlo_configured_parameters *)ptr;
-	for (i = 0; i < cmd->no_of_ssids; i++) {
+	for (i = 0; i < le32_to_cpu(cmd->no_of_ssids); i++) {
 		tlv = (struct wmi_tlv *)(&nlo_list[i].tlv_header);
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-			      FIELD_PREP(WMI_TLV_LEN, sizeof(*nlo_list) - sizeof(*tlv));
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(sizeof(*nlo_list) - sizeof(*tlv),
+					       WMI_TLV_LEN);
 
 		nlo_list[i].ssid.valid = true;
-		nlo_list[i].ssid.ssid.ssid_len = pno->a_networks[i].ssid.ssid_len;
+		nlo_list[i].ssid.ssid.ssid_len = cpu_to_le32(pno->a_networks[i].ssid.ssid_len);
 		memcpy(nlo_list[i].ssid.ssid.ssid,
 		       pno->a_networks[i].ssid.ssid,
-		       nlo_list[i].ssid.ssid.ssid_len);
+		       pno->a_networks[i].ssid.ssid_len);
 
 		if (pno->a_networks[i].rssi_threshold &&
 		    pno->a_networks[i].rssi_threshold > -300) {
@@ -9728,14 +9888,14 @@ ath11k_wmi_op_gen_config_pno_start(struct ath11k *ar,
 	}
 
 	ptr += nlo_list_len;
-	cmd->num_of_channels = pno->a_networks[0].channel_count;
+	cmd->num_of_channels = cpu_to_le32(pno->a_networks[0].channel_count);
 	tlv = (struct wmi_tlv *)ptr;
-	tlv->header =  FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_UINT32) |
-		       FIELD_PREP(WMI_TLV_LEN, channel_list_len);
+	tlv->header =  le32_encode_bits(WMI_TAG_ARRAY_UINT32, WMI_TLV_TAG) |
+		       le32_encode_bits(channel_list_len, WMI_TLV_LEN);
 	ptr += sizeof(*tlv);
-	channel_list = (u32 *)ptr;
-	for (i = 0; i < cmd->num_of_channels; i++)
-		channel_list[i] = pno->a_networks[0].channels[i];
+	channel_list = (__le32 *)ptr;
+	for (i = 0; i < le32_to_cpu(cmd->num_of_channels); i++)
+		channel_list[i] = cpu_to_le32(pno->a_networks[0].channels[i]);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv start pno config vdev_id %d\n",
 		   vdev_id);
@@ -9756,11 +9916,12 @@ static struct sk_buff *ath11k_wmi_op_gen_config_pno_stop(struct ath11k *ar,
 		return ERR_PTR(-ENOMEM);
 
 	cmd = (struct wmi_wow_nlo_config_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_NLO_CONFIG_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_NLO_CONFIG_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(len - TLV_HDR_SIZE, WMI_TLV_LEN);
 
-	cmd->vdev_id = vdev_id;
-	cmd->flags = WMI_NLO_CONFIG_STOP;
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->flags = cpu_to_le32(WMI_NLO_CONFIG_STOP);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "tlv stop pno config vdev_id %d\n", vdev_id);
@@ -9808,13 +9969,17 @@ static void ath11k_wmi_fill_ns_offload(struct ath11k *ar,
 
 	if (ext) {
 		ns_ext_tuples = offload->ipv6_count - WMI_MAX_NS_OFFLOADS;
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-			      FIELD_PREP(WMI_TLV_LEN, ns_ext_tuples * sizeof(*ns));
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(ns_ext_tuples * sizeof(*ns),
+					       WMI_TLV_LEN);
 		i = WMI_MAX_NS_OFFLOADS;
 		max_offloads = offload->ipv6_count;
 	} else {
-		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-			      FIELD_PREP(WMI_TLV_LEN, WMI_MAX_NS_OFFLOADS * sizeof(*ns));
+		tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT,
+					       WMI_TLV_TAG) |
+			      le32_encode_bits(WMI_MAX_NS_OFFLOADS * sizeof(*ns),
+					       WMI_TLV_LEN);
 		i = 0;
 		max_offloads = WMI_MAX_NS_OFFLOADS;
 	}
@@ -9823,24 +9988,26 @@ static void ath11k_wmi_fill_ns_offload(struct ath11k *ar,
 
 	for (; i < max_offloads; i++) {
 		ns = (struct wmi_ns_offload_tuple *)buf_ptr;
-		ns->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_NS_OFFLOAD_TUPLE) |
-				 FIELD_PREP(WMI_TLV_LEN, sizeof(*ns) - TLV_HDR_SIZE);
+		ns->tlv_header = le32_encode_bits(WMI_TAG_NS_OFFLOAD_TUPLE,
+						  WMI_TLV_TAG) |
+				 le32_encode_bits(sizeof(*ns) - TLV_HDR_SIZE,
+						  WMI_TLV_LEN);
 
 		if (enable) {
 			if (i < ns_cnt)
-				ns->flags |= WMI_NSOL_FLAGS_VALID;
+				ns->flags |= cpu_to_le32(WMI_NSOL_FLAGS_VALID);
 
 			memcpy(ns->target_ipaddr[0], offload->ipv6_addr[i], 16);
 			memcpy(ns->solicitation_ipaddr, offload->self_ipv6_addr[i], 16);
 
 			if (offload->ipv6_type[i])
-				ns->flags |= WMI_NSOL_FLAGS_IS_IPV6_ANYCAST;
+				ns->flags |= cpu_to_le32(WMI_NSOL_FLAGS_IS_IPV6_ANYCAST);
 
 			memcpy(ns->target_mac.addr, offload->mac_addr, ETH_ALEN);
 
 			if (ns->target_mac.word0 != 0 ||
 			    ns->target_mac.word1 != 0) {
-				ns->flags |= WMI_NSOL_FLAGS_MAC_VALID;
+				ns->flags |= cpu_to_le32(WMI_NSOL_FLAGS_MAC_VALID);
 			}
 
 			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
@@ -9867,18 +10034,21 @@ static void ath11k_wmi_fill_arp_offload(struct ath11k *ar,
 
 	/* fill arp tuple */
 	tlv = (struct wmi_tlv *)buf_ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
-		      FIELD_PREP(WMI_TLV_LEN, WMI_MAX_ARP_OFFLOADS * sizeof(*arp));
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_STRUCT, WMI_TLV_TAG) |
+		      le32_encode_bits(WMI_MAX_ARP_OFFLOADS * sizeof(*arp),
+				       WMI_TLV_LEN);
 	buf_ptr += sizeof(*tlv);
 
 	for (i = 0; i < WMI_MAX_ARP_OFFLOADS; i++) {
 		arp = (struct wmi_arp_offload_tuple *)buf_ptr;
-		arp->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARP_OFFLOAD_TUPLE) |
-				  FIELD_PREP(WMI_TLV_LEN, sizeof(*arp) - TLV_HDR_SIZE);
+		arp->tlv_header = le32_encode_bits(WMI_TAG_ARP_OFFLOAD_TUPLE,
+						   WMI_TLV_TAG) |
+				  le32_encode_bits(sizeof(*arp) - TLV_HDR_SIZE,
+						   WMI_TLV_LEN);
 
 		if (enable && i < offload->ipv4_count) {
 			/* Copy the target ip addr and flags */
-			arp->flags = WMI_ARPOL_FLAGS_VALID;
+			arp->flags = cpu_to_le32(WMI_ARPOL_FLAGS_VALID);
 			memcpy(arp->target_ipaddr, offload->ipv4_addr[i], 4);
 
 			ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "arp offload address %pI4",
@@ -9924,13 +10094,14 @@ int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 
 	buf_ptr = skb->data;
 	cmd = (struct wmi_set_arp_ns_offload_cmd *)buf_ptr;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_SET_ARP_NS_OFFLOAD_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_SET_ARP_NS_OFFLOAD_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
 	cmd->flags = 0;
-	cmd->vdev_id = arvif->vdev_id;
-	cmd->num_ns_ext_tuples = ns_ext_tuples;
+	cmd->vdev_id = cpu_to_le32(arvif->vdev_id);
+	cmd->num_ns_ext_tuples = cpu_to_le32(ns_ext_tuples);
 
 	buf_ptr += sizeof(*cmd);
 
@@ -9964,13 +10135,15 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_gtk_rekey_offload_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_GTK_OFFLOAD_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_GTK_OFFLOAD_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = arvif->vdev_id;
+	cmd->vdev_id = cpu_to_le32(arvif->vdev_id);
 
 	if (enable) {
-		cmd->flags = GTK_OFFLOAD_ENABLE_OPCODE;
+		cmd->flags = cpu_to_le32(GTK_OFFLOAD_ENABLE_OPCODE);
 
 		/* the length in rekey_data and cmd is equal */
 		memcpy(cmd->kck, rekey_data->kck, sizeof(cmd->kck));
@@ -9980,7 +10153,7 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 		memcpy(cmd->replay_ctr, &replay_ctr,
 		       sizeof(replay_ctr));
 	} else {
-		cmd->flags = GTK_OFFLOAD_DISABLE_OPCODE;
+		cmd->flags = cpu_to_le32(GTK_OFFLOAD_DISABLE_OPCODE);
 	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "offload gtk rekey vdev: %d %d\n",
@@ -10007,11 +10180,13 @@ int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_gtk_rekey_offload_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_GTK_OFFLOAD_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_GTK_OFFLOAD_CMD,
+					   WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+					   WMI_TLV_LEN);
 
-	cmd->vdev_id = arvif->vdev_id;
-	cmd->flags = GTK_OFFLOAD_REQUEST_STATUS_OPCODE;
+	cmd->vdev_id = cpu_to_le32(arvif->vdev_id);
+	cmd->flags = cpu_to_le32(GTK_OFFLOAD_REQUEST_STATUS_OPCODE);
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "get gtk rekey vdev_id: %d\n",
 		   arvif->vdev_id);
@@ -10044,23 +10219,23 @@ int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_va
 		return -ENOMEM;
 
 	cmd = (struct wmi_pdev_set_sar_table_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	cmd->sar_len = BIOS_SAR_TABLE_LEN;
-	cmd->rsvd_len = BIOS_SAR_RSVD1_LEN;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->sar_len = cpu_to_le32(BIOS_SAR_TABLE_LEN);
+	cmd->rsvd_len = cpu_to_le32(BIOS_SAR_RSVD1_LEN);
 
 	buf_ptr = skb->data + sizeof(*cmd);
 	tlv = (struct wmi_tlv *)buf_ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, sar_len_aligned);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(sar_len_aligned, WMI_TLV_LEN);
 	buf_ptr += TLV_HDR_SIZE;
 	memcpy(buf_ptr, sar_val, BIOS_SAR_TABLE_LEN);
 
 	buf_ptr += sar_len_aligned;
 	tlv = (struct wmi_tlv *)buf_ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(rsvd_len_aligned, WMI_TLV_LEN);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID);
 	if (ret) {
@@ -10089,15 +10264,15 @@ int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
 		return -ENOMEM;
 
 	cmd = (struct wmi_pdev_set_geo_table_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD) |
-			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->pdev_id = ar->pdev->pdev_id;
-	cmd->rsvd_len = BIOS_SAR_RSVD2_LEN;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD, WMI_TLV_TAG) |
+			  le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE, WMI_TLV_LEN);
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->rsvd_len = cpu_to_le32(BIOS_SAR_RSVD2_LEN);
 
 	buf_ptr = skb->data + sizeof(*cmd);
 	tlv = (struct wmi_tlv *)buf_ptr;
-	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
-		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
+	tlv->header = le32_encode_bits(WMI_TAG_ARRAY_BYTE, WMI_TLV_TAG) |
+		      le32_encode_bits(rsvd_len_aligned, WMI_TLV_LEN);
 
 	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
 	if (ret) {
@@ -10124,23 +10299,25 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 		return -ENOMEM;
 
 	cmd = (struct wmi_sta_keepalive_cmd *)skb->data;
-	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_STA_KEEPALIVE_CMD) |
-				     FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
-	cmd->vdev_id = arg->vdev_id;
-	cmd->enabled = arg->enabled;
-	cmd->interval = arg->interval;
-	cmd->method = arg->method;
+	cmd->tlv_header = le32_encode_bits(WMI_TAG_STA_KEEPALIVE_CMD,
+					   WMI_TLV_TAG) |
+				     le32_encode_bits(sizeof(*cmd) - TLV_HDR_SIZE,
+						      WMI_TLV_LEN);
+	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
+	cmd->enabled = cpu_to_le32(arg->enabled);
+	cmd->interval = cpu_to_le32(arg->interval);
+	cmd->method = cpu_to_le32(arg->method);
 
 	arp = (struct wmi_sta_keepalive_arp_resp *)(cmd + 1);
-	arp->tlv_header = FIELD_PREP(WMI_TLV_TAG,
-				     WMI_TAG_STA_KEEPALIVE_ARP_RESPONSE) |
-			 FIELD_PREP(WMI_TLV_LEN, sizeof(*arp) - TLV_HDR_SIZE);
+	arp->tlv_header = le32_encode_bits(WMI_TAG_STA_KEEPALIVE_ARP_RESPONSE,
+					   WMI_TLV_TAG) |
+			 le32_encode_bits(sizeof(*arp) - TLV_HDR_SIZE,
+					  WMI_TLV_LEN);
 
 	if (arg->method == WMI_STA_KEEPALIVE_METHOD_UNSOLICITED_ARP_RESPONSE ||
 	    arg->method == WMI_STA_KEEPALIVE_METHOD_GRATUITOUS_ARP_REQUEST) {
-		arp->src_ip4_addr = arg->src_ip4_addr;
-		arp->dest_ip4_addr = arg->dest_ip4_addr;
+		arp->src_ip4_addr = cpu_to_le32(arg->src_ip4_addr);
+		arp->dest_ip4_addr = cpu_to_le32(arg->dest_ip4_addr);
 		ether_addr_copy(arp->dest_mac_addr.addr, arg->dest_mac_addr);
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b2dade0516ac..7ceb8decc169 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -40,11 +40,11 @@ struct ath11k_reg_tpc_power_info;
 #define WMI_TLV_VDEV_PARAM_UNSUPPORTED 0
 
 struct wmi_cmd_hdr {
-	u32 cmd_id;
+	__le32 cmd_id;
 } __packed;
 
 struct wmi_tlv {
-	u32 header;
+	__le32 header;
 	u8 value[];
 } __packed;
 
@@ -2289,10 +2289,10 @@ struct ath11k_hal_reg_capabilities_ext {
 #define WMI_HOST_MAX_PDEV 3
 
 struct wlan_host_mem_chunk {
-	u32 tlv_header;
-	u32 req_id;
-	u32 ptr;
-	u32 size;
+	__le32 tlv_header;
+	__le32 req_id;
+	__le32 ptr;
+	__le32 size;
 } __packed;
 
 struct wmi_host_mem_chunk {
@@ -2303,36 +2303,36 @@ struct wmi_host_mem_chunk {
 };
 
 struct wmi_init_cmd_param {
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct target_resource_config *res_cfg;
 	u8 num_mem_chunks;
 	struct wmi_host_mem_chunk *mem_chunks;
-	u32 hw_mode_id;
-	u32 num_band_to_mac;
+	__le32 hw_mode_id;
+	__le32 num_band_to_mac;
 	struct wmi_host_pdev_band_to_mac band_to_mac[WMI_HOST_MAX_PDEV];
 };
 
 struct wmi_pdev_band_to_mac {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 start_freq;
-	u32 end_freq;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 start_freq;
+	__le32 end_freq;
 } __packed;
 
 struct wmi_pdev_set_hw_mode_cmd_param {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 hw_mode_index;
-	u32 num_band_to_mac;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 hw_mode_index;
+	__le32 num_band_to_mac;
 } __packed;
 
 struct wmi_ppe_threshold {
-	u32 numss_m1; /** NSS - 1*/
+	__le32 numss_m1; /** NSS - 1*/
 	union {
-		u32 ru_count;
-		u32 ru_mask;
+		__le32 ru_count;
+		__le32 ru_mask;
 	} __packed;
-	u32 ppet16_ppet8_ru3_ru0[WMI_MAX_NUM_SS];
+	__le32 ppet16_ppet8_ru3_ru0[WMI_MAX_NUM_SS];
 } __packed;
 
 #define HW_BD_INFO_SIZE       5
@@ -2347,9 +2347,9 @@ struct wmi_abi_version {
 } __packed;
 
 struct wmi_init_cmd {
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct wmi_abi_version host_abi_vers;
-	u32 num_host_mem_chunks;
+	__le32 num_host_mem_chunks;
 } __packed;
 
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 BIT(5)
@@ -2359,108 +2359,108 @@ struct wmi_init_cmd {
 #define WMI_CFG_HOST_SERVICE_FLAG_REG_CC_EXT 4
 
 struct wmi_resource_config {
-	u32 tlv_header;
-	u32 num_vdevs;
-	u32 num_peers;
-	u32 num_offload_peers;
-	u32 num_offload_reorder_buffs;
-	u32 num_peer_keys;
-	u32 num_tids;
-	u32 ast_skid_limit;
-	u32 tx_chain_mask;
-	u32 rx_chain_mask;
-	u32 rx_timeout_pri[4];
-	u32 rx_decap_mode;
-	u32 scan_max_pending_req;
-	u32 bmiss_offload_max_vdev;
-	u32 roam_offload_max_vdev;
-	u32 roam_offload_max_ap_profiles;
-	u32 num_mcast_groups;
-	u32 num_mcast_table_elems;
-	u32 mcast2ucast_mode;
-	u32 tx_dbg_log_size;
-	u32 num_wds_entries;
-	u32 dma_burst_size;
-	u32 mac_aggr_delim;
-	u32 rx_skip_defrag_timeout_dup_detection_check;
-	u32 vow_config;
-	u32 gtk_offload_max_vdev;
-	u32 num_msdu_desc;
-	u32 max_frag_entries;
-	u32 num_tdls_vdevs;
-	u32 num_tdls_conn_table_entries;
-	u32 beacon_tx_offload_max_vdev;
-	u32 num_multicast_filter_entries;
-	u32 num_wow_filters;
-	u32 num_keep_alive_pattern;
-	u32 keep_alive_pattern_size;
-	u32 max_tdls_concurrent_sleep_sta;
-	u32 max_tdls_concurrent_buffer_sta;
-	u32 wmi_send_separate;
-	u32 num_ocb_vdevs;
-	u32 num_ocb_channels;
-	u32 num_ocb_schedules;
-	u32 flag1;
-	u32 smart_ant_cap;
-	u32 bk_minfree;
-	u32 be_minfree;
-	u32 vi_minfree;
-	u32 vo_minfree;
-	u32 alloc_frag_desc_for_data_pkt;
-	u32 num_ns_ext_tuples_cfg;
-	u32 bpf_instruction_size;
-	u32 max_bssid_rx_filters;
-	u32 use_pdev_id;
-	u32 max_num_dbs_scan_duty_cycle;
-	u32 max_num_group_keys;
-	u32 peer_map_unmap_v2_support;
-	u32 sched_params;
-	u32 twt_ap_pdev_count;
-	u32 twt_ap_sta_count;
-	u32 max_nlo_ssids;
-	u32 num_pkt_filters;
-	u32 num_max_sta_vdevs;
-	u32 max_bssid_indicator;
-	u32 ul_resp_config;
-	u32 msdu_flow_override_config0;
-	u32 msdu_flow_override_config1;
-	u32 flags2;
-	u32 host_service_flags;
-	u32 max_rnr_neighbours;
-	u32 ema_max_vap_cnt;
-	u32 ema_max_profile_period;
+	__le32 tlv_header;
+	__le32 num_vdevs;
+	__le32 num_peers;
+	__le32 num_offload_peers;
+	__le32 num_offload_reorder_buffs;
+	__le32 num_peer_keys;
+	__le32 num_tids;
+	__le32 ast_skid_limit;
+	__le32 tx_chain_mask;
+	__le32 rx_chain_mask;
+	__le32 rx_timeout_pri[4];
+	__le32 rx_decap_mode;
+	__le32 scan_max_pending_req;
+	__le32 bmiss_offload_max_vdev;
+	__le32 roam_offload_max_vdev;
+	__le32 roam_offload_max_ap_profiles;
+	__le32 num_mcast_groups;
+	__le32 num_mcast_table_elems;
+	__le32 mcast2ucast_mode;
+	__le32 tx_dbg_log_size;
+	__le32 num_wds_entries;
+	__le32 dma_burst_size;
+	__le32 mac_aggr_delim;
+	__le32 rx_skip_defrag_timeout_dup_detection_check;
+	__le32 vow_config;
+	__le32 gtk_offload_max_vdev;
+	__le32 num_msdu_desc;
+	__le32 max_frag_entries;
+	__le32 num_tdls_vdevs;
+	__le32 num_tdls_conn_table_entries;
+	__le32 beacon_tx_offload_max_vdev;
+	__le32 num_multicast_filter_entries;
+	__le32 num_wow_filters;
+	__le32 num_keep_alive_pattern;
+	__le32 keep_alive_pattern_size;
+	__le32 max_tdls_concurrent_sleep_sta;
+	__le32 max_tdls_concurrent_buffer_sta;
+	__le32 wmi_send_separate;
+	__le32 num_ocb_vdevs;
+	__le32 num_ocb_channels;
+	__le32 num_ocb_schedules;
+	__le32 flag1;
+	__le32 smart_ant_cap;
+	__le32 bk_minfree;
+	__le32 be_minfree;
+	__le32 vi_minfree;
+	__le32 vo_minfree;
+	__le32 alloc_frag_desc_for_data_pkt;
+	__le32 num_ns_ext_tuples_cfg;
+	__le32 bpf_instruction_size;
+	__le32 max_bssid_rx_filters;
+	__le32 use_pdev_id;
+	__le32 max_num_dbs_scan_duty_cycle;
+	__le32 max_num_group_keys;
+	__le32 peer_map_unmap_v2_support;
+	__le32 sched_params;
+	__le32 twt_ap_pdev_count;
+	__le32 twt_ap_sta_count;
+	__le32 max_nlo_ssids;
+	__le32 num_pkt_filters;
+	__le32 num_max_sta_vdevs;
+	__le32 max_bssid_indicator;
+	__le32 ul_resp_config;
+	__le32 msdu_flow_override_config0;
+	__le32 msdu_flow_override_config1;
+	__le32 flags2;
+	__le32 host_service_flags;
+	__le32 max_rnr_neighbours;
+	__le32 ema_max_vap_cnt;
+	__le32 ema_max_profile_period;
 } __packed;
 
 struct wmi_service_ready_event {
-	u32 fw_build_vers;
+	__le32 fw_build_vers;
 	struct wmi_abi_version fw_abi_vers;
-	u32 phy_capability;
-	u32 max_frag_entry;
-	u32 num_rf_chains;
-	u32 ht_cap_info;
-	u32 vht_cap_info;
-	u32 vht_supp_mcs;
-	u32 hw_min_tx_power;
-	u32 hw_max_tx_power;
-	u32 sys_cap_info;
-	u32 min_pkt_size_enable;
-	u32 max_bcn_ie_size;
-	u32 num_mem_reqs;
-	u32 max_num_scan_channels;
-	u32 hw_bd_id;
-	u32 hw_bd_info[HW_BD_INFO_SIZE];
-	u32 max_supported_macs;
-	u32 wmi_fw_sub_feat_caps;
-	u32 num_dbs_hw_modes;
+	__le32 phy_capability;
+	__le32 max_frag_entry;
+	__le32 num_rf_chains;
+	__le32 ht_cap_info;
+	__le32 vht_cap_info;
+	__le32 vht_supp_mcs;
+	__le32 hw_min_tx_power;
+	__le32 hw_max_tx_power;
+	__le32 sys_cap_info;
+	__le32 min_pkt_size_enable;
+	__le32 max_bcn_ie_size;
+	__le32 num_mem_reqs;
+	__le32 max_num_scan_channels;
+	__le32 hw_bd_id;
+	__le32 hw_bd_info[HW_BD_INFO_SIZE];
+	__le32 max_supported_macs;
+	__le32 wmi_fw_sub_feat_caps;
+	__le32 num_dbs_hw_modes;
 	/* txrx_chainmask
 	 *    [7:0]   - 2G band tx chain mask
 	 *    [15:8]  - 2G band rx chain mask
 	 *    [23:16] - 5G band tx chain mask
 	 *    [31:24] - 5G band rx chain mask
 	 */
-	u32 txrx_chainmask;
-	u32 default_dbs_hw_mode_index;
-	u32 num_msdu_desc;
+	__le32 txrx_chainmask;
+	__le32 default_dbs_hw_mode_index;
+	__le32 num_msdu_desc;
 } __packed;
 
 #define WMI_SERVICE_BM_SIZE	((WMI_MAX_SERVICE + sizeof(u32) - 1) / sizeof(u32))
@@ -2471,28 +2471,28 @@ struct wmi_service_ready_event {
 #define WMI_SERVICE_BITS_IN_SIZE32 4
 
 struct wmi_service_ready_ext_event {
-	u32 default_conc_scan_config_bits;
-	u32 default_fw_config_bits;
+	__le32 default_conc_scan_config_bits;
+	__le32 default_fw_config_bits;
 	struct wmi_ppe_threshold ppet;
-	u32 he_cap_info;
-	u32 mpdu_density;
-	u32 max_bssid_rx_filters;
-	u32 fw_build_vers_ext;
-	u32 max_nlo_ssids;
-	u32 max_bssid_indicator;
-	u32 he_cap_info_ext;
+	__le32 he_cap_info;
+	__le32 mpdu_density;
+	__le32 max_bssid_rx_filters;
+	__le32 fw_build_vers_ext;
+	__le32 max_nlo_ssids;
+	__le32 max_bssid_indicator;
+	__le32 he_cap_info_ext;
 } __packed;
 
 struct wmi_soc_mac_phy_hw_mode_caps {
-	u32 num_hw_modes;
-	u32 num_chainmask_tables;
+	__le32 num_hw_modes;
+	__le32 num_chainmask_tables;
 } __packed;
 
 struct wmi_hw_mode_capabilities {
-	u32 tlv_header;
-	u32 hw_mode_id;
-	u32 phy_id_map;
-	u32 hw_mode_config_type;
+	__le32 tlv_header;
+	__le32 hw_mode_id;
+	__le32 phy_id_map;
+	__le32 hw_mode_config_type;
 } __packed;
 
 #define WMI_MAX_HECAP_PHY_SIZE                 (3)
@@ -2504,61 +2504,61 @@ struct wmi_hw_mode_capabilities {
 	FIELD_GET(WMI_NSS_RATIO_INFO_BITPOS, _val)
 
 struct wmi_mac_phy_capabilities {
-	u32 hw_mode_id;
-	u32 pdev_id;
-	u32 phy_id;
-	u32 supported_flags;
-	u32 supported_bands;
-	u32 ampdu_density;
-	u32 max_bw_supported_2g;
-	u32 ht_cap_info_2g;
-	u32 vht_cap_info_2g;
-	u32 vht_supp_mcs_2g;
-	u32 he_cap_info_2g;
-	u32 he_supp_mcs_2g;
-	u32 tx_chain_mask_2g;
-	u32 rx_chain_mask_2g;
-	u32 max_bw_supported_5g;
-	u32 ht_cap_info_5g;
-	u32 vht_cap_info_5g;
-	u32 vht_supp_mcs_5g;
-	u32 he_cap_info_5g;
-	u32 he_supp_mcs_5g;
-	u32 tx_chain_mask_5g;
-	u32 rx_chain_mask_5g;
-	u32 he_cap_phy_info_2g[WMI_MAX_HECAP_PHY_SIZE];
-	u32 he_cap_phy_info_5g[WMI_MAX_HECAP_PHY_SIZE];
+	__le32 hw_mode_id;
+	__le32 pdev_id;
+	__le32 phy_id;
+	__le32 supported_flags;
+	__le32 supported_bands;
+	__le32 ampdu_density;
+	__le32 max_bw_supported_2g;
+	__le32 ht_cap_info_2g;
+	__le32 vht_cap_info_2g;
+	__le32 vht_supp_mcs_2g;
+	__le32 he_cap_info_2g;
+	__le32 he_supp_mcs_2g;
+	__le32 tx_chain_mask_2g;
+	__le32 rx_chain_mask_2g;
+	__le32 max_bw_supported_5g;
+	__le32 ht_cap_info_5g;
+	__le32 vht_cap_info_5g;
+	__le32 vht_supp_mcs_5g;
+	__le32 he_cap_info_5g;
+	__le32 he_supp_mcs_5g;
+	__le32 tx_chain_mask_5g;
+	__le32 rx_chain_mask_5g;
+	__le32 he_cap_phy_info_2g[WMI_MAX_HECAP_PHY_SIZE];
+	__le32 he_cap_phy_info_5g[WMI_MAX_HECAP_PHY_SIZE];
 	struct wmi_ppe_threshold he_ppet2g;
 	struct wmi_ppe_threshold he_ppet5g;
-	u32 chainmask_table_id;
-	u32 lmac_id;
-	u32 he_cap_info_2g_ext;
-	u32 he_cap_info_5g_ext;
-	u32 he_cap_info_internal;
-	u32 wireless_modes;
-	u32 low_2ghz_chan_freq;
-	u32 high_2ghz_chan_freq;
-	u32 low_5ghz_chan_freq;
-	u32 high_5ghz_chan_freq;
-	u32 nss_ratio;
+	__le32 chainmask_table_id;
+	__le32 lmac_id;
+	__le32 he_cap_info_2g_ext;
+	__le32 he_cap_info_5g_ext;
+	__le32 he_cap_info_internal;
+	__le32 wireless_modes;
+	__le32 low_2ghz_chan_freq;
+	__le32 high_2ghz_chan_freq;
+	__le32 low_5ghz_chan_freq;
+	__le32 high_5ghz_chan_freq;
+	__le32 nss_ratio;
 } __packed;
 
 struct wmi_hal_reg_capabilities_ext {
-	u32 tlv_header;
-	u32 phy_id;
-	u32 eeprom_reg_domain;
-	u32 eeprom_reg_domain_ext;
-	u32 regcap1;
-	u32 regcap2;
-	u32 wireless_modes;
-	u32 low_2ghz_chan;
-	u32 high_2ghz_chan;
-	u32 low_5ghz_chan;
-	u32 high_5ghz_chan;
+	__le32 tlv_header;
+	__le32 phy_id;
+	__le32 eeprom_reg_domain;
+	__le32 eeprom_reg_domain_ext;
+	__le32 regcap1;
+	__le32 regcap2;
+	__le32 wireless_modes;
+	__le32 low_2ghz_chan;
+	__le32 high_2ghz_chan;
+	__le32 low_5ghz_chan;
+	__le32 high_5ghz_chan;
 } __packed;
 
 struct wmi_soc_hal_reg_capabilities {
-	u32 num_phy;
+	__le32 num_phy;
 } __packed;
 
 /* 2 word representation of MAC addr */
@@ -2573,33 +2573,33 @@ struct wmi_mac_addr {
 } __packed;
 
 struct wmi_dma_ring_capabilities {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 module_id;
-	u32 min_elem;
-	u32 min_buf_sz;
-	u32 min_buf_align;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 module_id;
+	__le32 min_elem;
+	__le32 min_buf_sz;
+	__le32 min_buf_align;
 } __packed;
 
 struct wmi_ready_event_min {
 	struct wmi_abi_version fw_abi_vers;
 	struct wmi_mac_addr mac_addr;
-	u32 status;
-	u32 num_dscp_table;
-	u32 num_extra_mac_addr;
-	u32 num_total_peers;
-	u32 num_extra_peers;
+	__le32 status;
+	__le32 num_dscp_table;
+	__le32 num_extra_mac_addr;
+	__le32 num_total_peers;
+	__le32 num_extra_peers;
 } __packed;
 
 struct wmi_ready_event {
 	struct wmi_ready_event_min ready_event_min;
-	u32 max_ast_index;
-	u32 pktlog_defs_checksum;
+	__le32 max_ast_index;
+	__le32 pktlog_defs_checksum;
 } __packed;
 
 struct wmi_service_available_event {
-	u32 wmi_service_segment_offset;
-	u32 wmi_service_segment_bitmap[WMI_SERVICE_SEGMENT_BM_SIZE32];
+	__le32 wmi_service_segment_offset;
+	__le32 wmi_service_segment_bitmap[WMI_SERVICE_SEGMENT_BM_SIZE32];
 } __packed;
 
 struct ath11k_pdev_wmi {
@@ -2623,47 +2623,47 @@ struct vdev_create_params {
 };
 
 struct wmi_vdev_create_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 vdev_type;
-	u32 vdev_subtype;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 vdev_type;
+	__le32 vdev_subtype;
 	struct wmi_mac_addr vdev_macaddr;
-	u32 num_cfg_txrx_streams;
-	u32 pdev_id;
-	u32 mbssid_flags;
-	u32 mbssid_tx_vdev_id;
+	__le32 num_cfg_txrx_streams;
+	__le32 pdev_id;
+	__le32 mbssid_flags;
+	__le32 mbssid_tx_vdev_id;
 } __packed;
 
 struct wmi_vdev_txrx_streams {
-	u32 tlv_header;
-	u32 band;
-	u32 supported_tx_streams;
-	u32 supported_rx_streams;
+	__le32 tlv_header;
+	__le32 band;
+	__le32 supported_tx_streams;
+	__le32 supported_rx_streams;
 } __packed;
 
 struct wmi_vdev_delete_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 } __packed;
 
 struct wmi_vdev_up_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 vdev_assoc_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 vdev_assoc_id;
 	struct wmi_mac_addr vdev_bssid;
 	struct wmi_mac_addr tx_vdev_bssid;
-	u32 nontx_profile_idx;
-	u32 nontx_profile_cnt;
+	__le32 nontx_profile_idx;
+	__le32 nontx_profile_cnt;
 } __packed;
 
 struct wmi_vdev_stop_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 } __packed;
 
 struct wmi_vdev_down_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 } __packed;
 
 #define WMI_VDEV_START_HIDDEN_SSID  BIT(0)
@@ -2676,28 +2676,33 @@ struct wmi_ssid {
 	u32 ssid[8];
 } __packed;
 
+struct wmi_ssid_params {
+	__le32 ssid_len;
+	u32 ssid[8];
+} __packed;
+
 #define ATH11K_VDEV_SETUP_TIMEOUT_HZ (1 * HZ)
 
 struct wmi_vdev_start_request_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 requestor_id;
-	u32 beacon_interval;
-	u32 dtim_period;
-	u32 flags;
-	struct wmi_ssid ssid;
-	u32 bcn_tx_rate;
-	u32 bcn_txpower;
-	u32 num_noa_descriptors;
-	u32 disable_hw_ack;
-	u32 preferred_tx_streams;
-	u32 preferred_rx_streams;
-	u32 he_ops;
-	u32 cac_duration_ms;
-	u32 regdomain;
-	u32 min_data_rate;
-	u32 mbssid_flags;
-	u32 mbssid_tx_vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 requestor_id;
+	__le32 beacon_interval;
+	__le32 dtim_period;
+	__le32 flags;
+	struct wmi_ssid_params ssid;
+	__le32 bcn_tx_rate;
+	__le32 bcn_txpower;
+	__le32 num_noa_descriptors;
+	__le32 disable_hw_ack;
+	__le32 preferred_tx_streams;
+	__le32 preferred_rx_streams;
+	__le32 he_ops;
+	__le32 cac_duration_ms;
+	__le32 regdomain;
+	__le32 min_data_rate;
+	__le32 mbssid_flags;
+	__le32 mbssid_tx_vdev_id;
 } __packed;
 
 #define MGMT_TX_DL_FRM_LEN		     64
@@ -3000,35 +3005,35 @@ enum wmi_peer_type {
 };
 
 struct wmi_peer_create_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 peer_type;
+	__le32 peer_type;
 } __packed;
 
 struct wmi_peer_delete_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
 struct wmi_peer_reorder_queue_setup_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 tid;
-	u32 queue_ptr_lo;
-	u32 queue_ptr_hi;
-	u32 queue_no;
-	u32 ba_window_size_valid;
-	u32 ba_window_size;
+	__le32 tid;
+	__le32 queue_ptr_lo;
+	__le32 queue_ptr_hi;
+	__le32 queue_no;
+	__le32 ba_window_size_valid;
+	__le32 ba_window_size;
 } __packed;
 
 struct wmi_peer_reorder_queue_remove_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 tid_mask;
+	__le32 tid_mask;
 } __packed;
 
 struct gpio_config_params {
@@ -3059,11 +3064,11 @@ enum wmi_bss_chan_info_req_type {
 };
 
 struct wmi_gpio_config_cmd_param {
-	u32 tlv_header;
-	u32 gpio_num;
-	u32 input;
-	u32 pull_type;
-	u32 intr_mode;
+	__le32 tlv_header;
+	__le32 gpio_num;
+	__le32 input;
+	__le32 pull_type;
+	__le32 intr_mode;
 };
 
 struct gpio_output_params {
@@ -3072,9 +3077,9 @@ struct gpio_output_params {
 };
 
 struct wmi_gpio_output_cmd_param {
-	u32 tlv_header;
-	u32 gpio_num;
-	u32 set;
+	__le32 tlv_header;
+	__le32 gpio_num;
+	__le32 set;
 };
 
 struct set_fwtest_params {
@@ -3083,92 +3088,92 @@ struct set_fwtest_params {
 };
 
 struct wmi_fwtest_set_param_cmd_param {
-	u32 tlv_header;
-	u32 param_id;
-	u32 param_value;
+	__le32 tlv_header;
+	__le32 param_id;
+	__le32 param_value;
 };
 
 struct wmi_pdev_set_param_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 param_id;
-	u32 param_value;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 param_id;
+	__le32 param_value;
 } __packed;
 
 struct wmi_pdev_set_ps_mode_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 sta_ps_mode;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 sta_ps_mode;
 } __packed;
 
 struct wmi_pdev_suspend_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 suspend_opt;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 suspend_opt;
 } __packed;
 
 struct wmi_pdev_resume_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_pdev_bss_chan_info_req_cmd {
-	u32 tlv_header;
+	__le32 tlv_header;
 	/* ref wmi_bss_chan_info_req_type */
-	u32 req_type;
-	u32 pdev_id;
+	__le32 req_type;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_ap_ps_peer_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 param;
-	u32 value;
+	__le32 param;
+	__le32 value;
 } __packed;
 
 struct wmi_sta_powersave_param_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 param;
-	u32 value;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 param;
+	__le32 value;
 } __packed;
 
 struct wmi_pdev_set_regdomain_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 reg_domain;
-	u32 reg_domain_2g;
-	u32 reg_domain_5g;
-	u32 conformance_test_limit_2g;
-	u32 conformance_test_limit_5g;
-	u32 dfs_domain;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 reg_domain;
+	__le32 reg_domain_2g;
+	__le32 reg_domain_5g;
+	__le32 conformance_test_limit_2g;
+	__le32 conformance_test_limit_5g;
+	__le32 dfs_domain;
 } __packed;
 
 struct wmi_peer_set_param_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 param_id;
-	u32 param_value;
+	__le32 param_id;
+	__le32 param_value;
 } __packed;
 
 struct wmi_peer_flush_tids_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 peer_tid_bitmap;
+	__le32 peer_tid_bitmap;
 } __packed;
 
 struct wmi_dfs_phyerr_offload_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_bcn_offload_ctrl_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 bcn_ctrl_op;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 bcn_ctrl_op;
 } __packed;
 
 enum scan_dwelltime_adaptive_mode {
@@ -3192,29 +3197,29 @@ struct wlan_ssid {
 };
 
 struct wmi_vdev_ch_power_info {
-	u32 tlv_header;
+	__le32 tlv_header;
 
 	/* Channel center frequency (MHz) */
-	u32 chan_cfreq;
+	__le32 chan_cfreq;
 
 	/* Unit: dBm, either PSD/EIRP power for this frequency or
 	 * incremental for non-PSD BW
 	 */
-	u32 tx_power;
+	__le32 tx_power;
 } __packed;
 
 struct wmi_vdev_set_tpc_power_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 
 	/* Value: 0 or 1, is PSD power or not */
-	u32 psd_power;
+	__le32 psd_power;
 
 	 /* Maximum EIRP power (dBm units), valid only if power is PSD */
-	u32 eirp_power;
+	__le32 eirp_power;
 
 	/* Type: WMI_6GHZ_REG_TYPE, used for halphy CTL lookup */
-	u32 power_type_6ghz;
+	__le32 power_type_6ghz;
 
 	/* This fixed_param TLV is followed by the below TLVs:
 	 * num_pwr_levels of wmi_vdev_ch_power_info
@@ -3276,37 +3281,37 @@ enum wmi_scan_completion_reason {
 };
 
 struct  wmi_start_scan_cmd {
-	u32 tlv_header;
-	u32 scan_id;
-	u32 scan_req_id;
-	u32 vdev_id;
-	u32 scan_priority;
-	u32 notify_scan_events;
-	u32 dwell_time_active;
-	u32 dwell_time_passive;
-	u32 min_rest_time;
-	u32 max_rest_time;
-	u32 repeat_probe_time;
-	u32 probe_spacing_time;
-	u32 idle_time;
-	u32 max_scan_time;
-	u32 probe_delay;
-	u32 scan_ctrl_flags;
-	u32 burst_duration;
-	u32 num_chan;
-	u32 num_bssid;
-	u32 num_ssids;
-	u32 ie_len;
-	u32 n_probes;
+	__le32 tlv_header;
+	__le32 scan_id;
+	__le32 scan_req_id;
+	__le32 vdev_id;
+	__le32 scan_priority;
+	__le32 notify_scan_events;
+	__le32 dwell_time_active;
+	__le32 dwell_time_passive;
+	__le32 min_rest_time;
+	__le32 max_rest_time;
+	__le32 repeat_probe_time;
+	__le32 probe_spacing_time;
+	__le32 idle_time;
+	__le32 max_scan_time;
+	__le32 probe_delay;
+	__le32 scan_ctrl_flags;
+	__le32 burst_duration;
+	__le32 num_chan;
+	__le32 num_bssid;
+	__le32 num_ssids;
+	__le32 ie_len;
+	__le32 n_probes;
 	struct wmi_mac_addr mac_addr;
 	struct wmi_mac_addr mac_mask;
-	u32 ie_bitmap[WMI_IE_BITMAP_SIZE];
-	u32 num_vendor_oui;
-	u32 scan_ctrl_flags_ext;
-	u32 dwell_time_active_2g;
-	u32 dwell_time_active_6g;
-	u32 dwell_time_passive_6g;
-	u32 scan_start_offset;
+	__le32 ie_bitmap[WMI_IE_BITMAP_SIZE];
+	__le32 num_vendor_oui;
+	__le32 scan_ctrl_flags_ext;
+	__le32 dwell_time_active_2g;
+	__le32 dwell_time_active_6g;
+	__le32 dwell_time_passive_6g;
+	__le32 scan_start_offset;
 } __packed;
 
 #define WMI_SCAN_FLAG_PASSIVE        0x1
@@ -3494,13 +3499,13 @@ struct scan_cancel_param {
 #define WMI_CHAN_REG_INFO2_MAX_TX_PWR	GENMASK(15, 8)
 
 struct wmi_channel {
-	u32 tlv_header;
-	u32 mhz;
-	u32 band_center_freq1;
-	u32 band_center_freq2;
-	u32 info;
-	u32 reg_info_1;
-	u32 reg_info_2;
+	__le32 tlv_header;
+	__le32 mhz;
+	__le32 band_center_freq1;
+	__le32 band_center_freq2;
+	__le32 info;
+	__le32 reg_info_1;
+	__le32 reg_info_2;
 } __packed;
 
 struct wmi_mgmt_params {
@@ -3530,16 +3535,16 @@ enum wmi_sta_ps_mode {
  */
 
 struct wmi_force_fw_hang_cmd {
-	u32 tlv_header;
-	u32 type;
-	u32 delay_time_ms;
+	__le32 tlv_header;
+	__le32 type;
+	__le32 delay_time_ms;
 };
 
 struct wmi_vdev_set_param_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 param_id;
-	u32 param_value;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 param_id;
+	__le32 param_value;
 } __packed;
 
 enum wmi_stats_id {
@@ -3560,28 +3565,28 @@ enum wmi_stats_id {
 };
 
 struct wmi_request_stats_cmd {
-	u32 tlv_header;
-	enum wmi_stats_id stats_id;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 stats_id;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 pdev_id;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_get_pdev_temperature_cmd {
-	u32 tlv_header;
-	u32 param;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 param;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_ftm_seg_hdr {
-	u32 len;
-	u32 msgref;
-	u32 segmentinfo;
-	u32 pdev_id;
+	__le32 len;
+	__le32 msgref;
+	__le32 segmentinfo;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_ftm_cmd {
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct wmi_ftm_seg_hdr seg_hdr;
 	u8 data[];
 } __packed;
@@ -3594,14 +3599,14 @@ struct wmi_ftm_event_msg {
 #define WMI_P2P_MAX_NOA_DESCRIPTORS		4
 
 struct wmi_p2p_noa_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 } __packed;
 
 struct ath11k_wmi_p2p_noa_descriptor {
-	u32 type_count; /* 255: continuous schedule, 0: reserved */
-	u32 duration;  /* Absent period duration in micro seconds */
-	u32 interval;   /* Absent period interval in micro seconds */
-	u32 start_time; /* 32 bit tsf time when in starts */
+	__le32 type_count; /* 255: continuous schedule, 0: reserved */
+	__le32 duration;  /* Absent period duration in micro seconds */
+	__le32 interval;   /* Absent period interval in micro seconds */
+	__le32 start_time; /* 32 bit tsf time when in starts */
 } __packed;
 
 #define WMI_P2P_NOA_INFO_CHANGED_FLAG		BIT(0)
@@ -3618,7 +3623,7 @@ struct ath11k_wmi_p2p_noa_info {
 	 * Bits 23-17 -  Ctwindow in TUs
 	 * Bits 31-24 -  Number of NOA descriptors
 	 */
-	u32 noa_attr;
+	__le32 noa_attr;
 	struct ath11k_wmi_p2p_noa_descriptor descriptors[WMI_P2P_MAX_NOA_DESCRIPTORS];
 } __packed;
 
@@ -3629,51 +3634,51 @@ struct ath11k_wmi_p2p_noa_info {
 #define WMI_EMA_LAST_TMPL_SHIFT           24
 
 struct wmi_bcn_tmpl_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 tim_ie_offset;
-	u32 buf_len;
-	u32 csa_switch_count_offset;
-	u32 ext_csa_switch_count_offset;
-	u32 csa_event_bitmap;
-	u32 mbssid_ie_offset;
-	u32 esp_ie_offset;
-	u32 csc_switch_count_offset;
-	u32 csc_event_bitmap;
-	u32 mu_edca_ie_offset;
-	u32 feature_enable_bitmap;
-	u32 ema_params;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 tim_ie_offset;
+	__le32 buf_len;
+	__le32 csa_switch_count_offset;
+	__le32 ext_csa_switch_count_offset;
+	__le32 csa_event_bitmap;
+	__le32 mbssid_ie_offset;
+	__le32 esp_ie_offset;
+	__le32 csc_switch_count_offset;
+	__le32 csc_event_bitmap;
+	__le32 mu_edca_ie_offset;
+	__le32 feature_enable_bitmap;
+	__le32 ema_params;
 } __packed;
 
 struct wmi_p2p_go_set_beacon_ie_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 ie_buf_len;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 ie_buf_len;
 	u8 tlv[];
 } __packed;
 
 struct wmi_key_seq_counter {
-	u32 key_seq_counter_l;
-	u32 key_seq_counter_h;
+	__le32 key_seq_counter_l;
+	__le32 key_seq_counter_h;
 } __packed;
 
 struct wmi_vdev_install_key_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 key_idx;
-	u32 key_flags;
-	u32 key_cipher;
+	__le32 key_idx;
+	__le32 key_flags;
+	__le32 key_cipher;
 	struct wmi_key_seq_counter key_rsc_counter;
 	struct wmi_key_seq_counter key_global_rsc_counter;
 	struct wmi_key_seq_counter key_tsc_counter;
 	u8 wpi_key_rsc_counter[16];
 	u8 wpi_key_tsc_counter[16];
-	u32 key_len;
-	u32 key_txmic_len;
-	u32 key_rxmic_len;
-	u32 is_group_key_id_valid;
-	u32 group_key_id;
+	__le32 key_len;
+	__le32 key_txmic_len;
+	__le32 key_rxmic_len;
+	__le32 is_group_key_id_valid;
+	__le32 group_key_id;
 
 	/* Followed by key_data containing key followed by
 	 * tx mic and then rx mic
@@ -3755,11 +3760,11 @@ struct peer_assoc_params {
 	u8 peer_mac[ETH_ALEN];
 
 	bool he_flag;
-	u32 peer_he_cap_macinfo[2];
+	__le32 peer_he_cap_macinfo[2];
 	u32 peer_he_cap_macinfo_internal;
 	u32 peer_he_caps_6ghz;
 	u32 peer_he_ops;
-	u32 peer_he_cap_phyinfo[WMI_HOST_MAX_HECAP_PHY_SIZE];
+	__le32 peer_he_cap_phyinfo[WMI_HOST_MAX_HECAP_PHY_SIZE];
 	u32 peer_he_mcs_count;
 	u32 peer_he_rx_mcs_set[WMI_HOST_MAX_HE_RATE_SET];
 	u32 peer_he_tx_mcs_set[WMI_HOST_MAX_HE_RATE_SET];
@@ -3770,43 +3775,43 @@ struct peer_assoc_params {
 };
 
 struct  wmi_peer_assoc_complete_cmd {
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct wmi_mac_addr peer_macaddr;
-	u32 vdev_id;
-	u32 peer_new_assoc;
-	u32 peer_associd;
-	u32 peer_flags;
-	u32 peer_caps;
-	u32 peer_listen_intval;
-	u32 peer_ht_caps;
-	u32 peer_max_mpdu;
-	u32 peer_mpdu_density;
-	u32 peer_rate_caps;
-	u32 peer_nss;
-	u32 peer_vht_caps;
-	u32 peer_phymode;
-	u32 peer_ht_info[2];
-	u32 num_peer_legacy_rates;
-	u32 num_peer_ht_rates;
-	u32 peer_bw_rxnss_override;
+	__le32 vdev_id;
+	__le32 peer_new_assoc;
+	__le32 peer_associd;
+	__le32 peer_flags;
+	__le32 peer_caps;
+	__le32 peer_listen_intval;
+	__le32 peer_ht_caps;
+	__le32 peer_max_mpdu;
+	__le32 peer_mpdu_density;
+	__le32 peer_rate_caps;
+	__le32 peer_nss;
+	__le32 peer_vht_caps;
+	__le32 peer_phymode;
+	__le32 peer_ht_info[2];
+	__le32 num_peer_legacy_rates;
+	__le32 num_peer_ht_rates;
+	__le32 peer_bw_rxnss_override;
 	struct  wmi_ppe_threshold peer_ppet;
-	u32 peer_he_cap_info;
-	u32 peer_he_ops;
-	u32 peer_he_cap_phy[WMI_MAX_HECAP_PHY_SIZE];
-	u32 peer_he_mcs;
-	u32 peer_he_cap_info_ext;
-	u32 peer_he_cap_info_internal;
-	u32 min_data_rate;
-	u32 peer_he_caps_6ghz;
+	__le32 peer_he_cap_info;
+	__le32 peer_he_ops;
+	__le32 peer_he_cap_phy[WMI_MAX_HECAP_PHY_SIZE];
+	__le32 peer_he_mcs;
+	__le32 peer_he_cap_info_ext;
+	__le32 peer_he_cap_info_internal;
+	__le32 min_data_rate;
+	__le32 peer_he_caps_6ghz;
 } __packed;
 
 struct wmi_stop_scan_cmd {
-	u32 tlv_header;
-	u32 requestor;
-	u32 scan_id;
-	u32 req_type;
-	u32 vdev_id;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 requestor;
+	__le32 scan_id;
+	__le32 req_type;
+	__le32 vdev_id;
+	__le32 pdev_id;
 };
 
 struct scan_chan_list_params {
@@ -3817,15 +3822,15 @@ struct scan_chan_list_params {
 };
 
 struct wmi_scan_chan_list_cmd {
-	u32 tlv_header;
-	u32 num_scan_chans;
-	u32 flags;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 num_scan_chans;
+	__le32 flags;
+	__le32 pdev_id;
 } __packed;
 
 struct wmi_scan_prob_req_oui_cmd {
-	u32 tlv_header;
-	u32 prob_req_oui;
+	__le32 tlv_header;
+	__le32 prob_req_oui;
 }  __packed;
 
 #define WMI_MGMT_SEND_DOWNLD_LEN	64
@@ -3843,21 +3848,21 @@ struct wmi_scan_prob_req_oui_cmd {
 #define WMI_TX_PARAMS_DWORD1_RSVD		GENMASK(31, 22)
 
 struct wmi_mgmt_send_params {
-	u32 tlv_header;
-	u32 tx_params_dword0;
-	u32 tx_params_dword1;
+	__le32 tlv_header;
+	__le32 tx_params_dword0;
+	__le32 tx_params_dword1;
 };
 
 struct wmi_mgmt_send_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 desc_id;
-	u32 chanfreq;
-	u32 paddr_lo;
-	u32 paddr_hi;
-	u32 frame_len;
-	u32 buf_len;
-	u32 tx_params_valid;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 desc_id;
+	__le32 chanfreq;
+	__le32 paddr_lo;
+	__le32 paddr_hi;
+	__le32 frame_len;
+	__le32 buf_len;
+	__le32 tx_params_valid;
 
 	/* This TLV is followed by struct wmi_mgmt_frame */
 
@@ -3865,28 +3870,28 @@ struct wmi_mgmt_send_cmd {
 } __packed;
 
 struct wmi_sta_powersave_mode_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 sta_ps_mode;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 sta_ps_mode;
 };
 
 struct wmi_sta_smps_force_mode_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 forced_mode;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 forced_mode;
 };
 
 struct wmi_sta_smps_param_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 param;
-	u32 value;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 param;
+	__le32 value;
 };
 
 struct wmi_bcn_prb_info {
-	u32 tlv_header;
-	u32 caps;
-	u32 erp;
+	__le32 tlv_header;
+	__le32 caps;
+	__le32 erp;
 } __packed;
 
 enum {
@@ -3899,9 +3904,9 @@ struct green_ap_ps_params {
 };
 
 struct wmi_pdev_green_ap_ps_enable_cmd_param {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 enable;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 enable;
 };
 
 struct ap_ps_params {
@@ -3927,9 +3932,9 @@ struct wmi_set_current_country_params {
 };
 
 struct wmi_set_current_country_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 new_alpha2;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 new_alpha2;
 } __packed;
 
 enum set_init_cc_type {
@@ -3955,13 +3960,13 @@ struct wmi_init_country_params {
 };
 
 struct wmi_init_country_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 init_cc_type;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 init_cc_type;
 	union {
-		u32 country_code;
-		u32 regdom_id;
-		u32 alpha2;
+		__le32 country_code;
+		__le32 regdom_id;
+		__le32 alpha2;
 	} cc_info;
 } __packed;
 
@@ -3972,19 +3977,19 @@ struct wmi_11d_scan_start_params {
 };
 
 struct wmi_11d_scan_start_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 scan_period_msec;
-	u32 start_interval_msec;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 scan_period_msec;
+	__le32 start_interval_msec;
 } __packed;
 
 struct wmi_11d_scan_stop_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 } __packed;
 
 struct wmi_11d_new_cc_ev {
-	u32 new_alpha2;
+	__le32 new_alpha2;
 } __packed;
 
 #define THERMAL_LEVELS  1
@@ -4004,64 +4009,64 @@ struct thermal_mitigation_params {
 };
 
 struct wmi_therm_throt_config_request_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 enable;
-	u32 dc;
-	u32 dc_per_event;
-	u32 therm_throt_levels;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 enable;
+	__le32 dc;
+	__le32 dc_per_event;
+	__le32 therm_throt_levels;
 } __packed;
 
 struct wmi_therm_throt_level_config_info {
-	u32 tlv_header;
-	u32 temp_lwm;
-	u32 temp_hwm;
-	u32 dc_off_percent;
-	u32 prio;
+	__le32 tlv_header;
+	__le32 temp_lwm;
+	__le32 temp_hwm;
+	__le32 dc_off_percent;
+	__le32 prio;
 } __packed;
 
 struct wmi_delba_send_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 tid;
-	u32 initiator;
-	u32 reasoncode;
+	__le32 tid;
+	__le32 initiator;
+	__le32 reasoncode;
 } __packed;
 
 struct wmi_addba_setresponse_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 tid;
-	u32 statuscode;
+	__le32 tid;
+	__le32 statuscode;
 } __packed;
 
 struct wmi_addba_send_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 tid;
-	u32 buffersize;
+	__le32 tid;
+	__le32 buffersize;
 } __packed;
 
 struct wmi_addba_clear_resp_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
 struct wmi_pdev_pktlog_filter_info {
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
 struct wmi_pdev_pktlog_filter_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 enable;
-	u32 filter_type;
-	u32 num_mac;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 enable;
+	__le32 filter_type;
+	__le32 num_mac;
 } __packed;
 
 enum ath11k_wmi_pktlog_enable {
@@ -4070,15 +4075,15 @@ enum ath11k_wmi_pktlog_enable {
 };
 
 struct wmi_pktlog_enable_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 evlist; /* WMI_PKTLOG_EVENT */
-	u32 enable;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 evlist; /* WMI_PKTLOG_EVENT */
+	__le32 enable;
 } __packed;
 
 struct wmi_pktlog_disable_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 pdev_id;
 } __packed;
 
 #define DFS_PHYERR_UNIT_TEST_CMD 0
@@ -4099,11 +4104,11 @@ struct wmi_dfs_unit_test_arg {
 };
 
 struct wmi_unit_test_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 module_id;
-	u32 num_args;
-	u32 diag_token;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 module_id;
+	__le32 num_args;
+	__le32 diag_token;
 	/* Followed by test args*/
 } __packed;
 
@@ -4125,24 +4130,24 @@ struct wmi_rate_set {
 };
 
 struct wmi_vht_rate_set {
-	u32 tlv_header;
-	u32 rx_max_rate;
+	__le32 tlv_header;
+	__le32 rx_max_rate;
 	/* MCS at which the peer can transmit */
-	u32 rx_mcs_set;
-	u32 tx_max_rate;
+	__le32 rx_mcs_set;
+	__le32 tx_max_rate;
 	/* MCS at which the peer can receive */
-	u32 tx_mcs_set;
-	u32 tx_max_mcs_nss;
+	__le32 tx_mcs_set;
+	__le32 tx_max_mcs_nss;
 } __packed;
 
 struct wmi_he_rate_set {
-	u32 tlv_header;
+	__le32 tlv_header;
 
 	/* MCS at which the peer can receive */
-	u32 rx_mcs_set;
+	__le32 rx_mcs_set;
 
 	/* MCS at which the peer can transmit */
-	u32 tx_mcs_set;
+	__le32 tx_mcs_set;
 } __packed;
 
 #define MAX_REG_RULES 10
@@ -4155,19 +4160,19 @@ enum wmi_start_event_param {
 };
 
 struct wmi_vdev_start_resp_event {
-	u32 vdev_id;
-	u32 requestor_id;
-	enum wmi_start_event_param resp_type;
-	u32 status;
-	u32 chain_mask;
-	u32 smps_mode;
+	__le32 vdev_id;
+	__le32 requestor_id;
+	__le32 resp_type;
+	__le32 status;
+	__le32 chain_mask;
+	__le32 smps_mode;
 	union {
-		u32 mac_id;
-		u32 pdev_id;
+		__le32 mac_id;
+		__le32 pdev_id;
 	};
-	u32 cfgd_tx_streams;
-	u32 cfgd_rx_streams;
-	s32 max_allowed_tx_power;
+	__le32 cfgd_tx_streams;
+	__le32 cfgd_rx_streams;
+	__le32 max_allowed_tx_power;
 } __packed;
 
 /* VDEV start response status codes */
@@ -4530,131 +4535,131 @@ struct cur_regulatory_info {
 };
 
 struct wmi_reg_chan_list_cc_event {
-	u32 status_code;
-	u32 phy_id;
-	u32 alpha2;
-	u32 num_phy;
-	u32 country_id;
-	u32 domain_code;
-	u32 dfs_region;
-	u32 phybitmap;
-	u32 min_bw_2ghz;
-	u32 max_bw_2ghz;
-	u32 min_bw_5ghz;
-	u32 max_bw_5ghz;
-	u32 num_2ghz_reg_rules;
-	u32 num_5ghz_reg_rules;
+	__le32 status_code;
+	__le32 phy_id;
+	__le32 alpha2;
+	__le32 num_phy;
+	__le32 country_id;
+	__le32 domain_code;
+	__le32 dfs_region;
+	__le32 phybitmap;
+	__le32 min_bw_2ghz;
+	__le32 max_bw_2ghz;
+	__le32 min_bw_5ghz;
+	__le32 max_bw_5ghz;
+	__le32 num_2ghz_reg_rules;
+	__le32 num_5ghz_reg_rules;
 } __packed;
 
 struct wmi_regulatory_rule_struct {
-	u32  tlv_header;
-	u32  freq_info;
-	u32  bw_pwr_info;
-	u32  flag_info;
+	__le32  tlv_header;
+	__le32  freq_info;
+	__le32  bw_pwr_info;
+	__le32  flag_info;
 };
 
 #define WMI_REG_CLIENT_MAX 4
 
 struct wmi_reg_chan_list_cc_ext_event {
-	u32 status_code;
-	u32 phy_id;
-	u32 alpha2;
-	u32 num_phy;
-	u32 country_id;
-	u32 domain_code;
-	u32 dfs_region;
-	u32 phybitmap;
-	u32 min_bw_2ghz;
-	u32 max_bw_2ghz;
-	u32 min_bw_5ghz;
-	u32 max_bw_5ghz;
-	u32 num_2ghz_reg_rules;
-	u32 num_5ghz_reg_rules;
-	u32 client_type;
-	u32 rnr_tpe_usable;
-	u32 unspecified_ap_usable;
-	u32 domain_code_6ghz_ap_lpi;
-	u32 domain_code_6ghz_ap_sp;
-	u32 domain_code_6ghz_ap_vlp;
-	u32 domain_code_6ghz_client_lpi[WMI_REG_CLIENT_MAX];
-	u32 domain_code_6ghz_client_sp[WMI_REG_CLIENT_MAX];
-	u32 domain_code_6ghz_client_vlp[WMI_REG_CLIENT_MAX];
-	u32 domain_code_6ghz_super_id;
-	u32 min_bw_6ghz_ap_sp;
-	u32 max_bw_6ghz_ap_sp;
-	u32 min_bw_6ghz_ap_lpi;
-	u32 max_bw_6ghz_ap_lpi;
-	u32 min_bw_6ghz_ap_vlp;
-	u32 max_bw_6ghz_ap_vlp;
-	u32 min_bw_6ghz_client_sp[WMI_REG_CLIENT_MAX];
-	u32 max_bw_6ghz_client_sp[WMI_REG_CLIENT_MAX];
-	u32 min_bw_6ghz_client_lpi[WMI_REG_CLIENT_MAX];
-	u32 max_bw_6ghz_client_lpi[WMI_REG_CLIENT_MAX];
-	u32 min_bw_6ghz_client_vlp[WMI_REG_CLIENT_MAX];
-	u32 max_bw_6ghz_client_vlp[WMI_REG_CLIENT_MAX];
-	u32 num_6ghz_reg_rules_ap_sp;
-	u32 num_6ghz_reg_rules_ap_lpi;
-	u32 num_6ghz_reg_rules_ap_vlp;
-	u32 num_6ghz_reg_rules_client_sp[WMI_REG_CLIENT_MAX];
-	u32 num_6ghz_reg_rules_client_lpi[WMI_REG_CLIENT_MAX];
-	u32 num_6ghz_reg_rules_client_vlp[WMI_REG_CLIENT_MAX];
+	__le32 status_code;
+	__le32 phy_id;
+	__le32 alpha2;
+	__le32 num_phy;
+	__le32 country_id;
+	__le32 domain_code;
+	__le32 dfs_region;
+	__le32 phybitmap;
+	__le32 min_bw_2ghz;
+	__le32 max_bw_2ghz;
+	__le32 min_bw_5ghz;
+	__le32 max_bw_5ghz;
+	__le32 num_2ghz_reg_rules;
+	__le32 num_5ghz_reg_rules;
+	__le32 client_type;
+	__le32 rnr_tpe_usable;
+	__le32 unspecified_ap_usable;
+	__le32 domain_code_6ghz_ap_lpi;
+	__le32 domain_code_6ghz_ap_sp;
+	__le32 domain_code_6ghz_ap_vlp;
+	__le32 domain_code_6ghz_client_lpi[WMI_REG_CLIENT_MAX];
+	__le32 domain_code_6ghz_client_sp[WMI_REG_CLIENT_MAX];
+	__le32 domain_code_6ghz_client_vlp[WMI_REG_CLIENT_MAX];
+	__le32 domain_code_6ghz_super_id;
+	__le32 min_bw_6ghz_ap_sp;
+	__le32 max_bw_6ghz_ap_sp;
+	__le32 min_bw_6ghz_ap_lpi;
+	__le32 max_bw_6ghz_ap_lpi;
+	__le32 min_bw_6ghz_ap_vlp;
+	__le32 max_bw_6ghz_ap_vlp;
+	__le32 min_bw_6ghz_client_sp[WMI_REG_CLIENT_MAX];
+	__le32 max_bw_6ghz_client_sp[WMI_REG_CLIENT_MAX];
+	__le32 min_bw_6ghz_client_lpi[WMI_REG_CLIENT_MAX];
+	__le32 max_bw_6ghz_client_lpi[WMI_REG_CLIENT_MAX];
+	__le32 min_bw_6ghz_client_vlp[WMI_REG_CLIENT_MAX];
+	__le32 max_bw_6ghz_client_vlp[WMI_REG_CLIENT_MAX];
+	__le32 num_6ghz_reg_rules_ap_sp;
+	__le32 num_6ghz_reg_rules_ap_lpi;
+	__le32 num_6ghz_reg_rules_ap_vlp;
+	__le32 num_6ghz_reg_rules_client_sp[WMI_REG_CLIENT_MAX];
+	__le32 num_6ghz_reg_rules_client_lpi[WMI_REG_CLIENT_MAX];
+	__le32 num_6ghz_reg_rules_client_vlp[WMI_REG_CLIENT_MAX];
 } __packed;
 
 struct wmi_regulatory_ext_rule {
-	u32 tlv_header;
-	u32 freq_info;
-	u32 bw_pwr_info;
-	u32 flag_info;
-	u32 psd_power_info;
+	__le32 tlv_header;
+	__le32 freq_info;
+	__le32 bw_pwr_info;
+	__le32 flag_info;
+	__le32 psd_power_info;
 } __packed;
 
 struct wmi_vdev_delete_resp_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 } __packed;
 
 struct wmi_peer_delete_resp_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
 struct wmi_bcn_tx_status_event {
-	u32 vdev_id;
-	u32 tx_status;
+	__le32 vdev_id;
+	__le32 tx_status;
 } __packed;
 
 struct wmi_vdev_stopped_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 } __packed;
 
 struct wmi_pdev_bss_chan_info_event {
-	u32 freq;	/* Units in MHz */
-	u32 noise_floor;	/* units are dBm */
+	__le32 freq;	/* Units in MHz */
+	__le32 noise_floor;	/* units are dBm */
 	/* rx clear - how often the channel was unused */
-	u32 rx_clear_count_low;
-	u32 rx_clear_count_high;
+	__le32 rx_clear_count_low;
+	__le32 rx_clear_count_high;
 	/* cycle count - elapsed time during measured period, in clock ticks */
-	u32 cycle_count_low;
-	u32 cycle_count_high;
+	__le32 cycle_count_low;
+	__le32 cycle_count_high;
 	/* tx cycle count - elapsed time spent in tx, in clock ticks */
-	u32 tx_cycle_count_low;
-	u32 tx_cycle_count_high;
+	__le32 tx_cycle_count_low;
+	__le32 tx_cycle_count_high;
 	/* rx cycle count - elapsed time spent in rx, in clock ticks */
-	u32 rx_cycle_count_low;
-	u32 rx_cycle_count_high;
+	__le32 rx_cycle_count_low;
+	__le32 rx_cycle_count_high;
 	/*rx_cycle cnt for my bss in 64bits format */
-	u32 rx_bss_cycle_count_low;
-	u32 rx_bss_cycle_count_high;
-	u32 pdev_id;
+	__le32 rx_bss_cycle_count_low;
+	__le32 rx_bss_cycle_count_high;
+	__le32 pdev_id;
 } __packed;
 
 #define WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS 0
 
 struct wmi_vdev_install_key_compl_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 key_idx;
-	u32 key_flags;
-	u32 status;
+	__le32 key_idx;
+	__le32 key_flags;
+	__le32 status;
 } __packed;
 
 struct wmi_vdev_install_key_complete_arg {
@@ -4666,7 +4671,7 @@ struct wmi_vdev_install_key_complete_arg {
 };
 
 struct wmi_peer_assoc_conf_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
@@ -4676,183 +4681,183 @@ struct wmi_peer_assoc_conf_arg {
 };
 
 struct wmi_fils_discovery_event {
-	u32 vdev_id;
-	u32 fils_tt;
-	u32 tbtt;
+	__le32 vdev_id;
+	__le32 fils_tt;
+	__le32 tbtt;
 } __packed;
 
 struct wmi_probe_resp_tx_status_event {
-	u32 vdev_id;
-	u32 tx_status;
+	__le32 vdev_id;
+	__le32 tx_status;
 } __packed;
 
 /*
  * PDEV statistics
  */
 struct wmi_pdev_stats_base {
-	s32 chan_nf;
-	u32 tx_frame_count; /* Cycles spent transmitting frames */
-	u32 rx_frame_count; /* Cycles spent receiving frames */
-	u32 rx_clear_count; /* Total channel busy time, evidently */
-	u32 cycle_count; /* Total on-channel time */
-	u32 phy_err_count;
-	u32 chan_tx_pwr;
+	__le32 chan_nf;
+	__le32 tx_frame_count; /* Cycles spent transmitting frames */
+	__le32 rx_frame_count; /* Cycles spent receiving frames */
+	__le32 rx_clear_count; /* Total channel busy time, evidently */
+	__le32 cycle_count; /* Total on-channel time */
+	__le32 phy_err_count;
+	__le32 chan_tx_pwr;
 } __packed;
 
 struct wmi_pdev_stats_extra {
-	u32 ack_rx_bad;
-	u32 rts_bad;
-	u32 rts_good;
-	u32 fcs_bad;
-	u32 no_beacons;
-	u32 mib_int_count;
+	__le32 ack_rx_bad;
+	__le32 rts_bad;
+	__le32 rts_good;
+	__le32 fcs_bad;
+	__le32 no_beacons;
+	__le32 mib_int_count;
 } __packed;
 
 struct wmi_pdev_stats_tx {
 	/* Num HTT cookies queued to dispatch list */
-	s32 comp_queued;
+	__le32 comp_queued;
 
 	/* Num HTT cookies dispatched */
-	s32 comp_delivered;
+	__le32 comp_delivered;
 
 	/* Num MSDU queued to WAL */
-	s32 msdu_enqued;
+	__le32 msdu_enqued;
 
 	/* Num MPDU queue to WAL */
-	s32 mpdu_enqued;
+	__le32 mpdu_enqued;
 
 	/* Num MSDUs dropped by WMM limit */
-	s32 wmm_drop;
+	__le32 wmm_drop;
 
 	/* Num Local frames queued */
-	s32 local_enqued;
+	__le32 local_enqued;
 
 	/* Num Local frames done */
-	s32 local_freed;
+	__le32 local_freed;
 
 	/* Num queued to HW */
-	s32 hw_queued;
+	__le32 hw_queued;
 
 	/* Num PPDU reaped from HW */
-	s32 hw_reaped;
+	__le32 hw_reaped;
 
 	/* Num underruns */
-	s32 underrun;
+	__le32 underrun;
 
 	/* Num hw paused */
-	u32 hw_paused;
+	__le32 hw_paused;
 
 	/* Num PPDUs cleaned up in TX abort */
-	s32 tx_abort;
+	__le32 tx_abort;
 
 	/* Num MPDUs requeued by SW */
-	s32 mpdus_requeued;
+	__le32 mpdus_requeued;
 
 	/* excessive retries */
-	u32 tx_ko;
+	__le32 tx_ko;
 
-	u32 tx_xretry;
+	__le32 tx_xretry;
 
 	/* data hw rate code */
-	u32 data_rc;
+	__le32 data_rc;
 
 	/* Scheduler self triggers */
-	u32 self_triggers;
+	__le32 self_triggers;
 
 	/* frames dropped due to excessive sw retries */
-	u32 sw_retry_failure;
+	__le32 sw_retry_failure;
 
 	/* illegal rate phy errors  */
-	u32 illgl_rate_phy_err;
+	__le32 illgl_rate_phy_err;
 
 	/* wal pdev continuous xretry */
-	u32 pdev_cont_xretry;
+	__le32 pdev_cont_xretry;
 
 	/* wal pdev tx timeouts */
-	u32 pdev_tx_timeout;
+	__le32 pdev_tx_timeout;
 
 	/* wal pdev resets  */
-	u32 pdev_resets;
+	__le32 pdev_resets;
 
 	/* frames dropped due to non-availability of stateless TIDs */
-	u32 stateless_tid_alloc_failure;
+	__le32 stateless_tid_alloc_failure;
 
 	/* PhY/BB underrun */
-	u32 phy_underrun;
+	__le32 phy_underrun;
 
 	/* MPDU is more than txop limit */
-	u32 txop_ovf;
+	__le32 txop_ovf;
 
 	/* Num sequences posted */
-	u32 seq_posted;
+	__le32 seq_posted;
 
 	/* Num sequences failed in queueing */
-	u32 seq_failed_queueing;
+	__le32 seq_failed_queueing;
 
 	/* Num sequences completed */
-	u32 seq_completed;
+	__le32 seq_completed;
 
 	/* Num sequences restarted */
-	u32 seq_restarted;
+	__le32 seq_restarted;
 
 	/* Num of MU sequences posted */
-	u32 mu_seq_posted;
+	__le32 mu_seq_posted;
 
 	/* Num MPDUs flushed by SW, HWPAUSED, SW TXABORT
 	 * (Reset,channel change)
 	 */
-	s32 mpdus_sw_flush;
+	__le32 mpdus_sw_flush;
 
 	/* Num MPDUs filtered by HW, all filter condition (TTL expired) */
-	s32 mpdus_hw_filter;
+	__le32 mpdus_hw_filter;
 
 	/* Num MPDUs truncated by PDG (TXOP, TBTT,
 	 * PPDU_duration based on rate, dyn_bw)
 	 */
-	s32 mpdus_truncated;
+	__le32 mpdus_truncated;
 
 	/* Num MPDUs that was tried but didn't receive ACK or BA */
-	s32 mpdus_ack_failed;
+	__le32 mpdus_ack_failed;
 
 	/* Num MPDUs that was dropped du to expiry. */
-	s32 mpdus_expired;
+	__le32 mpdus_expired;
 } __packed;
 
 struct wmi_pdev_stats_rx {
 	/* Cnts any change in ring routing mid-ppdu */
-	s32 mid_ppdu_route_change;
+	__le32 mid_ppdu_route_change;
 
 	/* Total number of statuses processed */
-	s32 status_rcvd;
+	__le32 status_rcvd;
 
 	/* Extra frags on rings 0-3 */
-	s32 r0_frags;
-	s32 r1_frags;
-	s32 r2_frags;
-	s32 r3_frags;
+	__le32 r0_frags;
+	__le32 r1_frags;
+	__le32 r2_frags;
+	__le32 r3_frags;
 
 	/* MSDUs / MPDUs delivered to HTT */
-	s32 htt_msdus;
-	s32 htt_mpdus;
+	__le32 htt_msdus;
+	__le32 htt_mpdus;
 
 	/* MSDUs / MPDUs delivered to local stack */
-	s32 loc_msdus;
-	s32 loc_mpdus;
+	__le32 loc_msdus;
+	__le32 loc_mpdus;
 
 	/* AMSDUs that have more MSDUs than the status ring size */
-	s32 oversize_amsdu;
+	__le32 oversize_amsdu;
 
 	/* Number of PHY errors */
-	s32 phy_errs;
+	__le32 phy_errs;
 
 	/* Number of PHY errors drops */
-	s32 phy_err_drop;
+	__le32 phy_err_drop;
 
 	/* Number of mpdu errors - FCS, MIC, ENC etc. */
-	s32 mpdu_errs;
+	__le32 mpdu_errs;
 
 	/* Num overflow errors */
-	s32 rx_ovfl_errs;
+	__le32 rx_ovfl_errs;
 } __packed;
 
 struct wmi_pdev_stats {
@@ -4866,81 +4871,81 @@ struct wmi_pdev_stats {
 #define MAX_TX_RATE_VALUES 10
 
 struct wmi_vdev_stats {
-	u32 vdev_id;
-	u32 beacon_snr;
-	u32 data_snr;
-	u32 num_tx_frames[WLAN_MAX_AC];
-	u32 num_rx_frames;
-	u32 num_tx_frames_retries[WLAN_MAX_AC];
-	u32 num_tx_frames_failures[WLAN_MAX_AC];
-	u32 num_rts_fail;
-	u32 num_rts_success;
-	u32 num_rx_err;
-	u32 num_rx_discard;
-	u32 num_tx_not_acked;
-	u32 tx_rate_history[MAX_TX_RATE_VALUES];
-	u32 beacon_rssi_history[MAX_TX_RATE_VALUES];
+	__le32 vdev_id;
+	__le32 beacon_snr;
+	__le32 data_snr;
+	__le32 num_tx_frames[WLAN_MAX_AC];
+	__le32 num_rx_frames;
+	__le32 num_tx_frames_retries[WLAN_MAX_AC];
+	__le32 num_tx_frames_failures[WLAN_MAX_AC];
+	__le32 num_rts_fail;
+	__le32 num_rts_success;
+	__le32 num_rx_err;
+	__le32 num_rx_discard;
+	__le32 num_tx_not_acked;
+	__le32 tx_rate_history[MAX_TX_RATE_VALUES];
+	__le32 beacon_rssi_history[MAX_TX_RATE_VALUES];
 } __packed;
 
 struct wmi_bcn_stats {
-	u32 vdev_id;
-	u32 tx_bcn_succ_cnt;
-	u32 tx_bcn_outage_cnt;
+	__le32 vdev_id;
+	__le32 tx_bcn_succ_cnt;
+	__le32 tx_bcn_outage_cnt;
 } __packed;
 
 struct wmi_stats_event {
-	u32 stats_id;
-	u32 num_pdev_stats;
-	u32 num_vdev_stats;
-	u32 num_peer_stats;
-	u32 num_bcnflt_stats;
-	u32 num_chan_stats;
-	u32 num_mib_stats;
-	u32 pdev_id;
-	u32 num_bcn_stats;
-	u32 num_peer_extd_stats;
-	u32 num_peer_extd2_stats;
+	__le32 stats_id;
+	__le32 num_pdev_stats;
+	__le32 num_vdev_stats;
+	__le32 num_peer_stats;
+	__le32 num_bcnflt_stats;
+	__le32 num_chan_stats;
+	__le32 num_mib_stats;
+	__le32 pdev_id;
+	__le32 num_bcn_stats;
+	__le32 num_peer_extd_stats;
+	__le32 num_peer_extd2_stats;
 } __packed;
 
 struct wmi_rssi_stats {
-	u32 vdev_id;
-	u32 rssi_avg_beacon[WMI_MAX_CHAINS];
-	u32 rssi_avg_data[WMI_MAX_CHAINS];
+	__le32 vdev_id;
+	__le32 rssi_avg_beacon[WMI_MAX_CHAINS];
+	__le32 rssi_avg_data[WMI_MAX_CHAINS];
 	struct wmi_mac_addr peer_macaddr;
 } __packed;
 
 struct wmi_per_chain_rssi_stats {
-	u32 num_per_chain_rssi_stats;
+	__le32 num_per_chain_rssi_stats;
 } __packed;
 
 struct wmi_pdev_ctl_failsafe_chk_event {
-	u32 pdev_id;
-	u32 ctl_failsafe_status;
+	__le32 pdev_id;
+	__le32 ctl_failsafe_status;
 } __packed;
 
 struct wmi_pdev_csa_switch_ev {
-	u32 pdev_id;
-	u32 current_switch_count;
-	u32 num_vdevs;
+	__le32 pdev_id;
+	__le32 current_switch_count;
+	__le32 num_vdevs;
 } __packed;
 
 struct wmi_pdev_radar_ev {
-	u32 pdev_id;
-	u32 detection_mode;
-	u32 chan_freq;
-	u32 chan_width;
-	u32 detector_id;
-	u32 segment_id;
-	u32 timestamp;
-	u32 is_chirp;
-	s32 freq_offset;
-	s32 sidx;
+	__le32 pdev_id;
+	__le32 detection_mode;
+	__le32 chan_freq;
+	__le32 chan_width;
+	__le32 detector_id;
+	__le32 segment_id;
+	__le32 timestamp;
+	__le32 is_chirp;
+	__le32 freq_offset;
+	__le32 sidx;
 } __packed;
 
 struct wmi_pdev_temperature_event {
 	/* temperature value in Celsius degree */
-	s32 temp;
-	u32 pdev_id;
+	__le32 temp;
+	__le32 pdev_id;
 } __packed;
 
 #define WMI_RX_STATUS_OK			0x00
@@ -4969,50 +4974,50 @@ struct mgmt_rx_event_params {
 #define ATH_MAX_ANTENNA 4
 
 struct wmi_mgmt_rx_hdr {
-	u32 channel;
-	u32 snr;
-	u32 rate;
-	u32 phy_mode;
-	u32 buf_len;
-	u32 status;
-	u32 rssi_ctl[ATH_MAX_ANTENNA];
-	u32 flags;
-	int rssi;
-	u32 tsf_delta;
-	u32 rx_tsf_l32;
-	u32 rx_tsf_u32;
-	u32 pdev_id;
-	u32 chan_freq;
+	__le32 channel;
+	__le32 snr;
+	__le32 rate;
+	__le32 phy_mode;
+	__le32 buf_len;
+	__le32 status;
+	__le32 rssi_ctl[ATH_MAX_ANTENNA];
+	__le32 flags;
+	__le32 rssi;
+	__le32 tsf_delta;
+	__le32 rx_tsf_l32;
+	__le32 rx_tsf_u32;
+	__le32 pdev_id;
+	__le32 chan_freq;
 } __packed;
 
 #define MAX_ANTENNA_EIGHT 8
 
 struct wmi_rssi_ctl_ext {
-	u32 tlv_header;
-	u32 rssi_ctl_ext[MAX_ANTENNA_EIGHT - ATH_MAX_ANTENNA];
+	__le32 tlv_header;
+	__le32 rssi_ctl_ext[MAX_ANTENNA_EIGHT - ATH_MAX_ANTENNA];
 };
 
 struct wmi_mgmt_tx_compl_event {
-	u32 desc_id;
-	u32 status;
-	u32 pdev_id;
-	u32 ppdu_id;
-	u32 ack_rssi;
+	__le32 desc_id;
+	__le32 status;
+	__le32 pdev_id;
+	__le32 ppdu_id;
+	__le32 ack_rssi;
 } __packed;
 
 struct wmi_scan_event {
-	u32 event_type; /* %WMI_SCAN_EVENT_ */
-	u32 reason; /* %WMI_SCAN_REASON_ */
-	u32 channel_freq; /* only valid for WMI_SCAN_EVENT_FOREIGN_CHANNEL */
-	u32 scan_req_id;
-	u32 scan_id;
-	u32 vdev_id;
+	__le32 event_type; /* %WMI_SCAN_EVENT_ */
+	__le32 reason; /* %WMI_SCAN_REASON_ */
+	__le32 channel_freq; /* only valid for WMI_SCAN_EVENT_FOREIGN_CHANNEL */
+	__le32 scan_req_id;
+	__le32 scan_id;
+	__le32 vdev_id;
 	/* TSF Timestamp when the scan event (%WMI_SCAN_EVENT_) is completed
 	 * In case of AP it is TSF of the AP vdev
 	 * In case of STA connected state, this is the TSF of the AP
 	 * In case of STA not connected, it will be the free running HW timer
 	 */
-	u32 tsf_timestamp;
+	__le32 tsf_timestamp;
 } __packed;
 
 struct wmi_peer_sta_kickout_arg {
@@ -5035,29 +5040,29 @@ enum wmi_roam_reason {
 };
 
 struct wmi_roam_event {
-	u32 vdev_id;
-	u32 reason;
-	u32 rssi;
+	__le32 vdev_id;
+	__le32 reason;
+	__le32 rssi;
 } __packed;
 
 #define WMI_CHAN_INFO_START_RESP 0
 #define WMI_CHAN_INFO_END_RESP 1
 
 struct wmi_chan_info_event {
-	u32 err_code;
-	u32 freq;
-	u32 cmd_flags;
-	u32 noise_floor;
-	u32 rx_clear_count;
-	u32 cycle_count;
-	u32 chan_tx_pwr_range;
-	u32 chan_tx_pwr_tp;
-	u32 rx_frame_count;
-	u32 my_bss_rx_cycle_count;
-	u32 rx_11b_mode_data_duration;
-	u32 tx_frame_cnt;
-	u32 mac_clk_mhz;
-	u32 vdev_id;
+	__le32 err_code;
+	__le32 freq;
+	__le32 cmd_flags;
+	__le32 noise_floor;
+	__le32 rx_clear_count;
+	__le32 cycle_count;
+	__le32 chan_tx_pwr_range;
+	__le32 chan_tx_pwr_tp;
+	__le32 rx_frame_count;
+	__le32 my_bss_rx_cycle_count;
+	__le32 rx_11b_mode_data_duration;
+	__le32 tx_frame_cnt;
+	__le32 mac_clk_mhz;
+	__le32 vdev_id;
 } __packed;
 
 struct ath11k_targ_cap {
@@ -5344,13 +5349,13 @@ enum ath11k_hw_txrx_mode {
 };
 
 struct wmi_wmm_params {
-	u32 tlv_header;
-	u32 cwmin;
-	u32 cwmax;
-	u32 aifs;
-	u32 txoplimit;
-	u32 acm;
-	u32 no_ack;
+	__le32 tlv_header;
+	__le32 cwmin;
+	__le32 cwmax;
+	__le32 aifs;
+	__le32 txoplimit;
+	__le32 acm;
+	__le32 no_ack;
 } __packed;
 
 struct wmi_wmm_params_arg {
@@ -5363,10 +5368,10 @@ struct wmi_wmm_params_arg {
 };
 
 struct wmi_vdev_set_wmm_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_wmm_params wmm_params[4];
-	u32 wmm_param_type;
+	__le32 wmm_param_type;
 } __packed;
 
 struct wmi_wmm_params_all_arg {
@@ -5412,29 +5417,29 @@ struct wmi_twt_enable_params {
 };
 
 struct wmi_twt_enable_params_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 sta_cong_timer_ms;
-	u32 mbss_support;
-	u32 default_slot_size;
-	u32 congestion_thresh_setup;
-	u32 congestion_thresh_teardown;
-	u32 congestion_thresh_critical;
-	u32 interference_thresh_teardown;
-	u32 interference_thresh_setup;
-	u32 min_no_sta_setup;
-	u32 min_no_sta_teardown;
-	u32 no_of_bcast_mcast_slots;
-	u32 min_no_twt_slots;
-	u32 max_no_sta_twt;
-	u32 mode_check_interval;
-	u32 add_sta_slot_interval;
-	u32 remove_sta_slot_interval;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 sta_cong_timer_ms;
+	__le32 mbss_support;
+	__le32 default_slot_size;
+	__le32 congestion_thresh_setup;
+	__le32 congestion_thresh_teardown;
+	__le32 congestion_thresh_critical;
+	__le32 interference_thresh_teardown;
+	__le32 interference_thresh_setup;
+	__le32 min_no_sta_setup;
+	__le32 min_no_sta_teardown;
+	__le32 no_of_bcast_mcast_slots;
+	__le32 min_no_twt_slots;
+	__le32 max_no_sta_twt;
+	__le32 mode_check_interval;
+	__le32 add_sta_slot_interval;
+	__le32 remove_sta_slot_interval;
 } __packed;
 
 struct wmi_twt_disable_params_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 pdev_id;
 } __packed;
 
 enum WMI_HOST_TWT_COMMAND {
@@ -5454,15 +5459,15 @@ enum WMI_HOST_TWT_COMMAND {
 #define WMI_TWT_ADD_DIALOG_FLAG_PROTECTION      BIT(11)
 
 struct wmi_twt_add_dialog_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 dialog_id;
-	u32 wake_intvl_us;
-	u32 wake_intvl_mantis;
-	u32 wake_dura_us;
-	u32 sp_offset_us;
-	u32 flags;
+	__le32 dialog_id;
+	__le32 wake_intvl_us;
+	__le32 wake_intvl_mantis;
+	__le32 wake_dura_us;
+	__le32 sp_offset_us;
+	__le32 flags;
 } __packed;
 
 struct wmi_twt_add_dialog_params {
@@ -5494,10 +5499,10 @@ enum  wmi_twt_add_dialog_status {
 };
 
 struct wmi_twt_add_dialog_event {
-	u32 vdev_id;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 dialog_id;
-	u32 status;
+	__le32 dialog_id;
+	__le32 status;
 } __packed;
 
 struct wmi_twt_del_dialog_params {
@@ -5507,10 +5512,10 @@ struct wmi_twt_del_dialog_params {
 } __packed;
 
 struct wmi_twt_del_dialog_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 dialog_id;
+	__le32 dialog_id;
 } __packed;
 
 struct wmi_twt_pause_dialog_params {
@@ -5520,10 +5525,10 @@ struct wmi_twt_pause_dialog_params {
 } __packed;
 
 struct wmi_twt_pause_dialog_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 dialog_id;
+	__le32 dialog_id;
 } __packed;
 
 struct wmi_twt_resume_dialog_params {
@@ -5535,27 +5540,27 @@ struct wmi_twt_resume_dialog_params {
 } __packed;
 
 struct wmi_twt_resume_dialog_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 vdev_id;
 	struct wmi_mac_addr peer_macaddr;
-	u32 dialog_id;
-	u32 sp_offset_us;
-	u32 next_twt_size;
+	__le32 dialog_id;
+	__le32 sp_offset_us;
+	__le32 next_twt_size;
 } __packed;
 
 struct wmi_obss_spatial_reuse_params_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 enable;
-	s32 obss_min;
-	s32 obss_max;
-	u32 vdev_id;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 enable;
+	__le32 obss_min;
+	__le32 obss_max;
+	__le32 vdev_id;
 } __packed;
 
 struct wmi_pdev_obss_pd_bitmap_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 bitmap[2];
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 bitmap[2];
 } __packed;
 
 #define ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS		200
@@ -5573,38 +5578,38 @@ enum wmi_bss_color_collision {
 };
 
 struct wmi_obss_color_collision_cfg_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 flags;
-	u32 evt_type;
-	u32 current_bss_color;
-	u32 detection_period_ms;
-	u32 scan_period_ms;
-	u32 free_slot_expiry_time_ms;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 flags;
+	__le32 evt_type;
+	__le32 current_bss_color;
+	__le32 detection_period_ms;
+	__le32 scan_period_ms;
+	__le32 free_slot_expiry_time_ms;
 } __packed;
 
 struct wmi_bss_color_change_enable_params_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 enable;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 enable;
 } __packed;
 
 struct wmi_obss_color_collision_event {
-	u32 vdev_id;
-	u32 evt_type;
-	u64 obss_color_bitmap;
+	__le32 vdev_id;
+	__le32 evt_type;
+	__le64 obss_color_bitmap;
 } __packed;
 
 #define ATH11K_IPV4_TH_SEED_SIZE 5
 #define ATH11K_IPV6_TH_SEED_SIZE 11
 
 struct ath11k_wmi_pdev_lro_config_cmd {
-	u32 tlv_header;
-	u32 lro_enable;
-	u32 res;
-	u32 th_4[ATH11K_IPV4_TH_SEED_SIZE];
-	u32 th_6[ATH11K_IPV6_TH_SEED_SIZE];
-	u32 pdev_id;
+	__le32 tlv_header;
+	__le32 lro_enable;
+	__le32 res;
+	__le32 th_4[ATH11K_IPV4_TH_SEED_SIZE];
+	__le32 th_6[ATH11K_IPV6_TH_SEED_SIZE];
+	__le32 pdev_id;
 } __packed;
 
 #define ATH11K_WMI_SPECTRAL_COUNT_DEFAULT                 0
@@ -5649,7 +5654,7 @@ struct ath11k_wmi_vdev_spectral_conf_param {
 } __packed;
 
 struct ath11k_wmi_vdev_spectral_conf_cmd {
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct ath11k_wmi_vdev_spectral_conf_param param;
 } __packed;
 
@@ -5659,49 +5664,49 @@ struct ath11k_wmi_vdev_spectral_conf_cmd {
 #define ATH11K_WMI_SPECTRAL_ENABLE_CMD_DISABLE   2
 
 struct ath11k_wmi_vdev_spectral_enable_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 trigger_cmd;
-	u32 enable_cmd;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 trigger_cmd;
+	__le32 enable_cmd;
 } __packed;
 
 struct ath11k_wmi_pdev_dma_ring_cfg_req_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 module_id;		/* see enum wmi_direct_buffer_module */
-	u32 base_paddr_lo;
-	u32 base_paddr_hi;
-	u32 head_idx_paddr_lo;
-	u32 head_idx_paddr_hi;
-	u32 tail_idx_paddr_lo;
-	u32 tail_idx_paddr_hi;
-	u32 num_elems;		/* Number of elems in the ring */
-	u32 buf_size;		/* size of allocated buffer in bytes */
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 module_id;		/* see enum wmi_direct_buffer_module */
+	__le32 base_paddr_lo;
+	__le32 base_paddr_hi;
+	__le32 head_idx_paddr_lo;
+	__le32 head_idx_paddr_hi;
+	__le32 tail_idx_paddr_lo;
+	__le32 tail_idx_paddr_hi;
+	__le32 num_elems;		/* Number of elems in the ring */
+	__le32 buf_size;		/* size of allocated buffer in bytes */
 
 	/* Number of wmi_dma_buf_release_entry packed together */
-	u32 num_resp_per_event;
+	__le32 num_resp_per_event;
 
 	/* Target should timeout and send whatever resp
 	 * it has if this time expires, units in milliseconds
 	 */
-	u32 event_timeout_ms;
+	__le32 event_timeout_ms;
 } __packed;
 
 struct ath11k_wmi_dma_buf_release_fixed_param {
-	u32 pdev_id;
-	u32 module_id;
-	u32 num_buf_release_entry;
-	u32 num_meta_data_entry;
+	__le32 pdev_id;
+	__le32 module_id;
+	__le32 num_buf_release_entry;
+	__le32 num_meta_data_entry;
 } __packed;
 
 struct wmi_dma_buf_release_entry {
-	u32 tlv_header;
-	u32 paddr_lo;
+	__le32 tlv_header;
+	__le32 paddr_lo;
 
 	/* Bits 11:0:   address of data
 	 * Bits 31:12:  host context data
 	 */
-	u32 paddr_hi;
+	__le32 paddr_hi;
 } __packed;
 
 #define WMI_SPECTRAL_META_INFO1_FREQ1		GENMASK(15, 0)
@@ -5710,12 +5715,12 @@ struct wmi_dma_buf_release_entry {
 #define WMI_SPECTRAL_META_INFO2_CHN_WIDTH	GENMASK(7, 0)
 
 struct wmi_dma_buf_release_meta_data {
-	u32 tlv_header;
-	s32 noise_floor[WMI_MAX_CHAINS];
-	u32 reset_delay;
-	u32 freq1;
-	u32 freq2;
-	u32 ch_width;
+	__le32 tlv_header;
+	__le32 noise_floor[WMI_MAX_CHAINS];
+	__le32 reset_delay;
+	__le32 freq1;
+	__le32 freq2;
+	__le32 ch_width;
 } __packed;
 
 enum wmi_fils_discovery_cmd_type {
@@ -5724,22 +5729,22 @@ enum wmi_fils_discovery_cmd_type {
 };
 
 struct wmi_fils_discovery_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 interval;
-	u32 config; /* enum wmi_fils_discovery_cmd_type */
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 interval;
+	__le32 config; /* enum wmi_fils_discovery_cmd_type */
 } __packed;
 
 struct wmi_fils_discovery_tmpl_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 buf_len;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 buf_len;
 } __packed;
 
 struct wmi_probe_tmpl_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 buf_len;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 buf_len;
 } __packed;
 
 struct target_resource_config {
@@ -5819,9 +5824,9 @@ enum wmi_debug_log_param {
 };
 
 struct wmi_debug_log_config_cmd_fixed_param {
-	u32 tlv_header;
-	u32 dbg_log_param;
-	u32 value;
+	__le32 tlv_header;
+	__le32 dbg_log_param;
+	__le32 value;
 } __packed;
 
 #define MAX_RADIOS 3
@@ -5843,10 +5848,10 @@ enum wmi_peer_ps_supported_bitmap {
 
 struct wmi_peer_sta_ps_state_chg_event {
 	struct wmi_mac_addr peer_macaddr;
-	u32 peer_ps_state;
-	u32 ps_supported_bitmap;
-	u32 peer_ps_valid;
-	u32 peer_ps_timestamp;
+	__le32 peer_ps_state;
+	__le32 ps_supported_bitmap;
+	__le32 peer_ps_valid;
+	__le32 peer_ps_timestamp;
 } __packed;
 
 struct ath11k_wmi_base {
@@ -5876,10 +5881,10 @@ enum hw_data_filter_type {
 };
 
 struct wmi_hw_data_filter_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 enable;
-	u32 hw_filter_bitmap;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 enable;
+	__le32 hw_filter_bitmap;
 } __packed;
 
 /* WOW structures */
@@ -6059,22 +6064,22 @@ enum wmi_tlv_pattern_type {
 	offsetof(struct ieee80211_hdr_3addr, addr1))
 
 struct wmi_wow_add_del_event_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 is_add;
-	u32 event_bitmap;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 is_add;
+	__le32 event_bitmap;
 } __packed;
 
 struct wmi_wow_enable_cmd {
-	u32 tlv_header;
-	u32 enable;
-	u32 pause_iface_config;
-	u32 flags;
+	__le32 tlv_header;
+	__le32 enable;
+	__le32 pause_iface_config;
+	__le32 flags;
 }  __packed;
 
 struct wmi_wow_host_wakeup_ind {
-	u32 tlv_header;
-	u32 reserved;
+	__le32 tlv_header;
+	__le32 reserved;
 } __packed;
 
 struct wmi_tlv_wow_event_info {
@@ -6085,27 +6090,27 @@ struct wmi_tlv_wow_event_info {
 } __packed;
 
 struct wmi_wow_bitmap_pattern {
-	u32 tlv_header;
+	__le32 tlv_header;
 	u8 patternbuf[WOW_DEFAULT_BITMAP_PATTERN_SIZE];
 	u8 bitmaskbuf[WOW_DEFAULT_BITMASK_SIZE];
-	u32 pattern_offset;
-	u32 pattern_len;
-	u32 bitmask_len;
-	u32 pattern_id;
+	__le32 pattern_offset;
+	__le32 pattern_len;
+	__le32 bitmask_len;
+	__le32 pattern_id;
 } __packed;
 
 struct wmi_wow_add_pattern_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 pattern_id;
-	u32 pattern_type;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 pattern_id;
+	__le32 pattern_type;
 } __packed;
 
 struct wmi_wow_del_pattern_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 pattern_id;
-	u32 pattern_type;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 pattern_id;
+	__le32 pattern_type;
 } __packed;
 
 #define WMI_PNO_MAX_SCHED_SCAN_PLANS      2
@@ -6155,7 +6160,7 @@ enum wmi_ssid_bcast_type {
 
 struct wmi_nlo_ssid_param {
 	u32 valid;
-	struct wmi_ssid ssid;
+	struct wmi_ssid_params ssid;
 } __packed;
 
 struct wmi_nlo_enc_param {
@@ -6180,7 +6185,7 @@ struct wmi_nlo_rssi_param {
 
 struct nlo_configured_parameters {
 	/* TLV tag and len;*/
-	u32 tlv_header;
+	__le32 tlv_header;
 	struct wmi_nlo_ssid_param ssid;
 	struct wmi_nlo_enc_param enc_type;
 	struct wmi_nlo_auth_param auth_type;
@@ -6224,35 +6229,35 @@ struct wmi_pno_scan_req {
 };
 
 struct wmi_wow_nlo_config_cmd {
-	u32 tlv_header;
-	u32 flags;
-	u32 vdev_id;
-	u32 fast_scan_max_cycles;
-	u32 active_dwell_time;
-	u32 passive_dwell_time;
-	u32 probe_bundle_size;
+	__le32 tlv_header;
+	__le32 flags;
+	__le32 vdev_id;
+	__le32 fast_scan_max_cycles;
+	__le32 active_dwell_time;
+	__le32 passive_dwell_time;
+	__le32 probe_bundle_size;
 
 	/* ART = IRT */
-	u32 rest_time;
+	__le32 rest_time;
 
 	/* Max value that can be reached after SBM */
-	u32 max_rest_time;
+	__le32 max_rest_time;
 
 	/* SBM */
-	u32 scan_backoff_multiplier;
+	__le32 scan_backoff_multiplier;
 
 	/* SCBM */
-	u32 fast_scan_period;
+	__le32 fast_scan_period;
 
 	/* specific to windows */
-	u32 slow_scan_period;
+	__le32 slow_scan_period;
 
-	u32 no_of_ssids;
+	__le32 no_of_ssids;
 
-	u32 num_of_channels;
+	__le32 num_of_channels;
 
 	/* NLO scan start delay time in milliseconds */
-	u32 delay_start_time;
+	__le32 delay_start_time;
 
 	/* MAC Address to use in Probe Req as SA */
 	struct wmi_mac_addr mac_addr;
@@ -6261,13 +6266,13 @@ struct wmi_wow_nlo_config_cmd {
 	struct wmi_mac_addr mac_mask;
 
 	/* IE bitmap to use in Probe Req */
-	u32 ie_bitmap[8];
+	__le32 ie_bitmap[8];
 
 	/* Number of vendor OUIs. In the TLV vendor_oui[] */
-	u32 num_vendor_oui;
+	__le32 num_vendor_oui;
 
 	/* Number of connected NLO band preferences */
-	u32 num_cnlo_band_pref;
+	__le32 num_cnlo_band_pref;
 
 	/* The TLVs will follow.
 	 * nlo_configured_parameters nlo_list[];
@@ -6283,8 +6288,8 @@ struct wmi_wow_nlo_config_cmd {
 #define WMI_ARPOL_FLAGS_REMOTE_IP_VALID    BIT(2)
 
 struct wmi_arp_offload_tuple {
-	u32 tlv_header;
-	u32 flags;
+	__le32 tlv_header;
+	__le32 flags;
 	u8 target_ipaddr[4];
 	u8 remote_ipaddr[4];
 	struct wmi_mac_addr target_mac;
@@ -6298,8 +6303,8 @@ struct wmi_arp_offload_tuple {
 #define WMI_NSOL_MAX_TARGET_IPS    2
 
 struct wmi_ns_offload_tuple {
-	u32 tlv_header;
-	u32 flags;
+	__le32 tlv_header;
+	__le32 flags;
 	u8 target_ipaddr[WMI_NSOL_MAX_TARGET_IPS][16];
 	u8 solicitation_ipaddr[16];
 	u8 remote_ipaddr[16];
@@ -6307,10 +6312,10 @@ struct wmi_ns_offload_tuple {
 } __packed;
 
 struct wmi_set_arp_ns_offload_cmd {
-	u32 tlv_header;
-	u32 flags;
-	u32 vdev_id;
-	u32 num_ns_ext_tuples;
+	__le32 tlv_header;
+	__le32 flags;
+	__le32 vdev_id;
+	__le32 num_ns_ext_tuples;
 	/* The TLVs follow:
 	 * wmi_ns_offload_tuple  ns_tuples[WMI_MAX_NS_OFFLOADS];
 	 * wmi_arp_offload_tuple arp_tuples[WMI_MAX_ARP_OFFLOADS];
@@ -6340,9 +6345,9 @@ struct wmi_replayc_cnt {
 } __packed;
 
 struct wmi_gtk_offload_status_event {
-	u32 vdev_id;
-	u32 flags;
-	u32 refresh_cnt;
+	__le32 vdev_id;
+	__le32 flags;
+	__le32 refresh_cnt;
 	struct wmi_replayc_cnt replay_ctr;
 	u8 igtk_key_index;
 	u8 igtk_key_length;
@@ -6355,9 +6360,9 @@ struct wmi_gtk_offload_status_event {
 } __packed;
 
 struct wmi_gtk_rekey_offload_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 flags;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 flags;
 	u8 kek[GTK_OFFLOAD_KEK_BYTES];
 	u8 kck[GTK_OFFLOAD_KCK_BYTES];
 	u8 replay_ctr[GTK_REPLAY_COUNTER_BYTES];
@@ -6368,28 +6373,28 @@ struct wmi_gtk_rekey_offload_cmd {
 #define BIOS_SAR_RSVD2_LEN	(18)
 
 struct wmi_pdev_set_sar_table_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 sar_len;
-	u32 rsvd_len;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 sar_len;
+	__le32 rsvd_len;
 } __packed;
 
 struct wmi_pdev_set_geo_table_cmd {
-	u32 tlv_header;
-	u32 pdev_id;
-	u32 rsvd_len;
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 rsvd_len;
 } __packed;
 
 struct wmi_sta_keepalive_cmd {
-	u32 tlv_header;
-	u32 vdev_id;
-	u32 enabled;
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 enabled;
 
 	/* WMI_STA_KEEPALIVE_METHOD_ */
-	u32 method;
+	__le32 method;
 
 	/* in seconds */
-	u32 interval;
+	__le32 interval;
 
 	/* following this structure is the TLV for struct
 	 * wmi_sta_keepalive_arp_resp
@@ -6397,9 +6402,9 @@ struct wmi_sta_keepalive_cmd {
 } __packed;
 
 struct wmi_sta_keepalive_arp_resp {
-	u32 tlv_header;
-	u32 src_ip4_addr;
-	u32 dest_ip4_addr;
+	__le32 tlv_header;
+	__le32 src_ip4_addr;
+	__le32 dest_ip4_addr;
 	struct wmi_mac_addr dest_mac_addr;
 } __packed;
 

-- 
2.53.0


