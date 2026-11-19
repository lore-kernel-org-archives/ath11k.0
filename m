Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FC0606A320
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VfjxA0vh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EngP4ntx;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=QnLo4cdN;
	dkim=neutral header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=CgQWSy7S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OTGieLCMv2UepikBykIbNintrYUa++aE6Vqz2wtFVKM=; b=VfjxA0vhiwAT85m4fhR0SeWlcp
	Z+5t7pVy22oTgLUJMcTlTsFT6WBk8gf3zzSt0DFdGaCYcrOyAL4QTv5pHojlEt+oKeEIGi5+fzXHs
	yBpzh/3o9wAFI6jvS8v5pyvvOS0iKhZny8yV4QlcW6YlACtUbVyi+/3NjAQ74fPXSm669lIY3fFCV
	gKUamw3w3+OxebsU0uc/kLecrhKyNxlOCVbDqZtIy9frMfQeEtLHh+1IOcUDWtiUKnxLpLhQfGcu4
	3QN+hvDVOMuwULywSqvI7pbAEEaJHdq1DzQLpbVY0Z1Uqu9/x8laLYftlt39ZcXk2QEAcQc4J7Vg3
	KJpZ77Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyNU-0000000BO2Q-1iHG;
	Thu, 19 Nov 2026 09:24:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyNR-0000000BO1A-44kK
	for ath11k@bombadil.infradead.org;
	Thu, 19 Nov 2026 09:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OTGieLCMv2UepikBykIbNintrYUa++aE6Vqz2wtFVKM=; b=EngP4ntxabnDVd1POxrH33pKUV
	AFtCAA0s7JDENYnvCGlP1tBRTF91MizcpLP4PB8vTryaIB2LuRzM+z2P1wL+9ZWrv8ftnrU97dAn9
	GCWB+jvZCsS9BACUwCdaJe5Vo8MhHACPejs/Rt998xFje/RBXbIRrcrfOv1n7YXUC9+0DzZiT0ocl
	jnFTx7x2la6SdxBWFnFmBdd8mVkowa0navj3JT5pvLbwlsEi4+4x7Ah4suTt97ndFJmw8kpmPTCqz
	1uZzW3O+As1srhE774Q7rJt9TqUHBxh98PXb82cVOZ8SsmBRwKcHjD4CjLkIOudVrGdbVLzJXPIcD
	6CXa6C8Q==;
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyNH-0000000H2yB-2mUv
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:24:19 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6wEsM606827;
	Thu, 19 Nov 2026 10:23:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	OTGieLCMv2UepikBykIbNintrYUa++aE6Vqz2wtFVKM=; b=QnLo4cdN3Shv3TCG
	K33GyjWprpohaq1jvhotPfRB0lh3v4L2rYS3iR1hKPK4mUuGN76SnHN8yUEs1x6m
	sDH5S+hr8ibxjHRCEXtxhz/pNVo+1ZSa/4QhI8ZmAWDTKj2dvJWVF42R33WZt+aa
	zqwZFBOpkR4H9ZbaK+hJNhPyfiBsq3IXXKcykYFJNO/nB8GUYWe3vGJhMoQmX79Q
	6NhFOC4OBXkgn5HX8nDKLEYhBthHXoYlLYRfMH1DlEeKI/XgjS1j7k3bp4VTbNVD
	gm6fNuDhuMk3/YCVGlhNLzqXxSb4/9accyk02DzzCJFSnNtpGVjpicMbKRxDhgbz
	18YDIA==
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11022101.outbound.protection.outlook.com [52.101.66.101])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qjqrc4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzWAKaOm4GJ8t023Cnzg9/KPZ30NdUL9saLqfAYFgUUf5hF9HttLNCRVcQioy/VKus01lYlt1QuypQFrpIMFDOXnqDMWOqS+Yq7lBkjb1jrw38NuHlTEb1qSpslIcmJGOP+eNX560W4zu6I6bAwB/EtxMjwRtGRzXnF8yMq70C0DYNxwu3/MjOQZOMJrXAOrEkX0dKLqRbn+wYun3kLDdPxsj9DGucdlVPeUWyeUeNYL6ZKfWnClRdHI8kxiXxQQ2KWkXWEBQF3pTBP2nkohs3nr0urwyjB0Ze6AbZFm4Ym5ByZxa0JT1bMopRXKaLA6ad6MjadEUwuJm3lmZQl7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTGieLCMv2UepikBykIbNintrYUa++aE6Vqz2wtFVKM=;
 b=iHk8PVW4Vs882Any8MXobJZZbhCPDT66Dbyk5aA9B4dvzR+9nK/scoLEx5LSLxgaaU+/nOdYrObk0R0tiUuMAxfR0DmvsQZVZmh4aD0LVRnjPEhhxVo6W5y3S6VTHIa0ATfc3fZAmUp/MmVtLXK+tBGX1f0y7xqgdTtErXTgE8zdfJ2vPLKE1uUOM562kTC4sQQ9IkZdAsexPl7AVHuXyrMA9bx37QbRZD7LbqYDoveBHtSCp8j9XRu8cwWpXG8CMXoCOFu4QdKUyMlNvW+2tCP3U3OywnRF68/SLEgz4LS3fUENQc2d/do22ahgjZeS1VtLCqIMiUKImDMEJhc4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTGieLCMv2UepikBykIbNintrYUa++aE6Vqz2wtFVKM=;
 b=CgQWSy7S/9ply6vlEDLZ7DPNMh3ix+MiXQAP9WuzH10vLYe4w20cxn73Q6y0Q42GNgSJ2MjBNlUh6WrXpjSGcB97facs2CSQRfwcVjQDGOXcDkKUJgZGeuBkKVVDkkNx3i+GinMjpAv5KxkyrogvxnRbXnHgtAbG98SR/iaQGU4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:53 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:53 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:57 +0100
Subject: [PATCH RFC 5/7] wifi: ath11k: convert DP and HTT messages to
 little endian types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-5-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS6P279CA0102.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3d::9) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a184377-ff28-4bdc-878a-08df461ed3c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|261022115727099003|4143699003|261026130827099003|261026121527099003|11063799006|56012099006|261026140227099003|261026135527099003|261021130227099003|261021123027099003|261022105027099003|261021121427099003|261021133027099003|261022075727099003|261028144727099003|261022113327099003|261021135927099003|261009223027099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: mUfy0JpnFvF9JhF8Beo8kkMNINMyvYC9FYctSQHeYOEtth9mGWS4mkeMIP21sDFfTEW22bfgW9ZBIbQ2NrY2BzvOmm9MClL/1YMCfD/4ZPHENQqxktzkBmri0EcJoEG/aXZ0LYAHg8pkq9xrSDFrQF/RaNlm0E8DJk5iP1sY1KTOQ6QslmwEVJEDHWPTD59n2q5Z0KpfI0tEHtmWhaTAZE018R+6DkLdNT5CZKDkDH3zjmaTayeZygqg5y7jTdA5Ob45NOCl1GpN6iElAjYq+voR1MK8Pj+53eP7Ud9MYumMk9tGAMKyyHnpqloRfioUMOpQtjEoXrGkMd64V8xXFyI4SN5wtastaIVPC8Vw2kXMlpff/D+9Z/t1MiSZQTQAOs6vtC6Rq3OpnFKpHPBIuGTDv6M7sHeWAnoXHRQwkeuJ3imVxi7sR22457zwoZtoSs3fohLvoD4E61aw9w8cEH0h/XzA4K6QBS4gc/0gCBq32+2XXT7WepUipr6kdydEWVyWO6yx/TDT8rvToc6wteJFsaI6DZzc6P8tyBLDts39Fk7RsFIQLPZ7Q6xMlrbqNus40/FJGjJ9URGMD5SRl/Unn4Lv4y9WWz3t7vxWo5VsqqutN2xLl2HUZBh5VFEBftptfrlXWW8tXeujmMCV3t7SNKTuUaRkdGiBQIBrt0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(261022115727099003)(4143699003)(261026130827099003)(261026121527099003)(11063799006)(56012099006)(261026140227099003)(261026135527099003)(261021130227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261021133027099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021135927099003)(261009223027099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9MVkhBR2ZtZTByMXp6b2hwQ0I4YUEvcUhmalRSb0hzUCszbWcrS2phQjd5?=
 =?utf-8?B?T3F2U3dZWWRaenVwQWV4QWNjd1NHZVlUZVRYdG1OYis4bmVuWm0vUytSbnNa?=
 =?utf-8?B?WXpwOENPUzdVcHhkMFdRcGlMaExhT05wNmZISVFrRVhOc2NuZnlTd3p5RHZJ?=
 =?utf-8?B?dTNDL2RIMEdZQ1NySDlYSmlZYmRxMC8vNEdDQWpzU3I2RVhBWk4xVVZreWNk?=
 =?utf-8?B?TUZaeHRRUWdPWmN5a04rdW8rMVI3WCttQmNoUUMzWUt3TUxmTTVia09QSnNm?=
 =?utf-8?B?cVh3a0JPbjAyeGNTa01TaGQ0dVcwcEhRNzRqV3FxOGl6ZGZ1MWxIcWFZN2pT?=
 =?utf-8?B?YUl2UE5QZUVRelN0Q2R2Vjl5aHpsMzJDT3QxbUZMdjNjb1hFUmMxbi95Smgv?=
 =?utf-8?B?UitkdkorTlE1a1JHOGRXdGgxZGZaS3ByTjFucW1qZnppNzFUU0ZTSldBTC95?=
 =?utf-8?B?bWNWWWV2TTlwZmZ5dUVDWm85dDNsVkNxMXBzVVhBcFN2SURrSXAyUlJUVnBL?=
 =?utf-8?B?cFZqLys3cGZuQ05KNG80cHlNS1h4TWJsQXZqQVZDelVHOUJKM2dTdTdxTnEw?=
 =?utf-8?B?RXRUbng4OFROYmVUOUxrQnhQWk5WMDZ6SEtuSUlvTkJQcnF1eDhWdzRaYWdq?=
 =?utf-8?B?WmFDNUR2SUJnWG0rWklHMGJLNXlKUkxzQmxVdit0YTgzdlIramZkWk1XNnhk?=
 =?utf-8?B?UmZqY3pzNGVyTFFFYWJlYXFqdDh3TjNQYVBkekhNNTFRZHZFSEx0bjNBbnB4?=
 =?utf-8?B?Y0lRZEsvYzBCMExxc1YrMFRtR0M1K0prUHFUMnFOYmVCaDBtaXhPUG5WSVc1?=
 =?utf-8?B?dDBrWHI4K3hCSGJTZURTRFRVeWFaTFcvRXRucnM2NmRUS3A3Nzl3aG9kK2Vz?=
 =?utf-8?B?OTlJK1c0amwrTndmRFNuQlVialNkcTQ0UzVMcnk1bHRmeWNINFV5WnlUQ25I?=
 =?utf-8?B?Z0diU1dJWG1nUk5UOHZFSXRKZGJjQXpzaGlyMEg5QWRubkNDZFlZaVQ5bHl1?=
 =?utf-8?B?alRnSDEwN2ZscVNUZXdMSk5VaW5TYXA0Z3hzV3p6SnhNSUdWYWI0b2FlSzZV?=
 =?utf-8?B?dlF0eWdzd0o4WW5abG41eEF6N2VWVklyMjVuVjBWamlMaWJWR1BQTUg5QWF2?=
 =?utf-8?B?YmZLd1ppUm1qRlZJQnk5WDY0MFZ4clR6NWhBMjMzeEJES3ZyRnF2aUtxMFhN?=
 =?utf-8?B?NGRzdVo3WUlrV0c3R05wQkk0aEFFcDhJcmNRRGgxaE9ScmxCNTY4K2pycEVv?=
 =?utf-8?B?WTdqSExiRzRCajg2cUhWL0pwWFlHeElMdm9nSUpoam1FanN5S1JIeVlOemhU?=
 =?utf-8?B?d3pTeStCWlppaVhGZUxvamxTa1JlZThqQy82NzFQdEpjaU0rby9FSTQyaFhU?=
 =?utf-8?B?MFFqdmFvNUh6cjFDZXNlSVIzeElDVDFPWklDS3k2UHFtMVpDVG15b2pzRXdj?=
 =?utf-8?B?K05tVGYvcW96RmgxVkRvaStmOE0vM2xNaXlsY0puazhVYlc0SmpiS0U2d0Yr?=
 =?utf-8?B?dUVOcmJnRTdXTng1aTRob2cxNFFMY2dDT041YSt3cU9WdUY3Y0JTeE1CdU4x?=
 =?utf-8?B?M0dGTWdzTTg4cUMzV3dtZEdMMmh6dGwyZWc1c2w1UHZtY0FyY2tGWjNCMkZX?=
 =?utf-8?B?eVJVaTUvZ1pvdCtsNVZSVnYwNGJ2RXRYWUV4dWJ0dUpNNXNJa3M5eGZLTEFo?=
 =?utf-8?B?ditTcWhOQWhZR0VPZFpCQkkzcTRwM21jSk43SFQ1MmgzTUVEZFNmTkNnTHQ3?=
 =?utf-8?B?cko5TE8yYm54bkpvcmR0V0c1ZHA1NkhGVW9RYlNwbVNhLzJ5ak1EUmtuNUQ2?=
 =?utf-8?B?YjhOSk9ZajVHMi9XV3R2aVZJUXkzVDJKbWM3MXJYQytMd2J4YjBJUXFhYm95?=
 =?utf-8?B?dWRaSGNwTkpJRnh0TFc5QklnYjlSaEhiWUFBMnJCaGxtRjZGMGN0aUROOWtv?=
 =?utf-8?B?VUpXNGkrZ1BNUlEzTVkzbzZYVm5OTGZONXlWR2dicGI5Yk5hOC9oWjk2K0xI?=
 =?utf-8?B?WE5RSnlYb1FBVUljeU9STWUydkJIUTE4Nlh3NzAxbDFSNUdFTXdvNlRLVnZY?=
 =?utf-8?B?eW5saHRoUU50K2IyU2xEdklWRkJLK3hqYlFmWkRoM0ZGSWRHZjM1NXk3VlFY?=
 =?utf-8?B?aHhpN1BjTkJmeEJ4R3RURzZGUHVIY3lPbzZtMEtxaVhJOWVDenp5TlVTOWNY?=
 =?utf-8?B?b3YyNFJjOVAreFZpRkVOcHQ2UXJUeStBc3pyNTZSaDhBMmNtekJ3WUdSeGZY?=
 =?utf-8?B?NXNJNC95WjFXVU1HSHFnbjBZY2JjczFGYWJZQVZReHViSkEyeFpBd0VxZHRQ?=
 =?utf-8?B?UWtJbkN3RDliYnptR2ZJdVNoVS8ySWdMNXVuWnV3bDUrUm5uQ3BsQT09?=
X-Exchange-RoutingPolicyChecked: 1ZGxtCf12KoChLCNTBsDkQY2Q7NlnhoNFKD0cdJvkUu0kqQX1ANEJroINWuDsvs2+o/5Ufu48RnaNbuv6PNulG0FgKW02/5P6OPoVEMhimioS6vOIxTfXLDIR1zaciH5TJ7trPEC/FTcj6m5phHgL7hlQ8QFDOmfnLxW60ZWZ/oY7J3QvgC9FOw7Ar364NY147ay7oEbjIDh/UTyxlSYzEfYrGjlMZpmcjzFHo5PXw8hoHtfxh04z9e6bAq9tpXBY71kL5x0DsjWYEW10wg/tlZo98u3cc9XjpLFkjAfRJQb1vCrn8ITSd+FZJRbf+f9t6g8N/NYErnIglFZ/fN3Hg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VmeCbXAumWdE9nS4uAkemDemy/zA2SQ4CqYJ6bIkfMS1oxrQYAmeS54prkjZ7YxUvENk5mxdsLnFGDthR9/SWlhCfo34etHxeOq1yKcC2TNadL91WURYWxpfWUr0FKNHrJhTz+/ty6Yz6Hf/Y7QdIjn9QeaNEgysHoj5FrcEmnMXr0x7I8dmMdSivCG7GONZ+Gy0JwnjE4wbpXx/wjl2ZhT/QMqTtRogRTihydYXfUOmNkSswDQsxwFN27kF/TcmUrlumPjuqgCeYf/MEXuLVSKWK0skY7uiI8iOG8ig4DTa25/M40C1FBSnRpoGwxm9ORJjsXIACxxajt1HMGeIqEbbeunGLhrbydCloK4i8kHZ/9TBuQpwVEh2/LnV1SR8QmDFqwW9IZsqQt+pOdKP36MwZOdlz4jfct4W4sSf2TDKnOm0sPsewo8daswu5L0nm5l5jVAe2TwKKKNQPbz/JjlW5jGTT6sNbxDMQV+zfdGBYjWLaquKDkswNSIpWA2iWvZZpaUBXXqGAJApVrCeeJ5jlMpT5nVT0wgZaTCcL6efnoBpNGPCTcgLJ34rnddB6s0Lfb1LX9urhd3AbuN/BXeskeU8kIVg7w1xwr60wekOYBelsRcYnyo7+Id+hwsu
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a184377-ff28-4bdc-878a-08df461ed3c6
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:52.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkFcGv4I/88yE4wEw/qHa3a8ISxTkTXoHZ49Ijnmwvls6f/fsS1ncrkeKUvioXDQrJp4e4recqdGjLwejIsniw==
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX2hMt7IrKMuKB
 LZUBEZrXUMvdAJDw9Pwkc08gsi1dLLpZh+rBqcNz4AX/dahvMbMLMlHxpjEbvhHH/EGNNClyT4n
 O+3yTlLlr3AST8Y+PYEqYhbs4cUeqsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX5zkf8DIilntA
 hOhPTrfgS5Hzf5t9Ic4z+Ga5vIR6UtHZ6uvYPcJKguXh7SDU67DJHkdAv5YAc1XMsFIYrFJav/U
 VZtteTNK8PklOP0dfuxt1SbqQMvi4yi2ZhAyEnXtnoPkZET4fByOlxVYEJEOkEFDODyTRNOkXnd
 hja0iUZVi9KOW6sZnBqZn+ZLKOXn+FAjPgqUVQFOWvQSzdA3zxXM/1kt8BvgYhV4xwH07RwakBa
 gkuS5DHAn0rgUrKuwEELcr6H28yYsVU8d0Rtl5cIK1zFOT9yiR72p41kSY8m2Ui2Gs1FHOCvNaA
 Kc4cXaDIKV3NmGzHlaV0j8d/UkbpIQF9daQCWNbEOZ4c2m4h0ADK7etU1Rsm3yvkuMbgXVJ0xX/
 U+zwJXPT6z2rGO9UknaV3e+4JrLRw/SSIl7Sc84ucxok5QUDAlTzMWN9Zhvw5b0O9/hPzxPrjQ0
 RbzyVz1XfaIsfNiz5qw==
X-Authority-Analysis: v=2.4 cv=T5YZ3PKQ c=1 sm=1 tr=0 ts=6afec02d cx=c_pps
 a=Ej+gNUoTsSNzJFPVBRn0oA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=N9GNhs4bAAAA:8 a=CSDw-C9IAAAA:8 a=Iwk81yimAAAA:8 a=vjkW6uPWAAAA:8
 a=8AGaLNXrm3mnY7YEeu4A:9 a=IBCxe4MaTATa_LW9:21 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22 a=wzwtrm5WU4lM03trS8pa:22 a=PqBb7rsBcpu_OT3Qf5tX:22
 a=FTqP262Ndm71lHIshRHN:22
X-Proofpoint-GUID: r1KSDWZ2wAcLJ68tR3Hrh4JnFL9ssD5V
X-Proofpoint-ORIG-GUID: r1KSDWZ2wAcLJ68tR3Hrh4JnFL9ssD5V
X-Spam-Note: CRM114 run bypassed due to message size (303572 bytes)
X-Spam-Score: -0.9 (/)
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

The HTT messages exchanged with the firmware (H2T commands like SRNG setup,
RX filter and PPDU stats configuration, T2H events like version
confirmation, peer map/unmap, TX completion, PPDU and extended stats) as
well as the RX attention and TX completion data in the data path are
defined as little endian. The corresponding structures, however, use host
endian u32 fields accessed with FIELD_PREP()/FIELD_GET(). On big endian
hosts this leads to wrong ring configuration, wrong peer mapping and
corrupted statistics.

Convert the HTT and DP structures, including the HTT stats TLVs used by
debugfs, to __le32 and use cpu_to_le32(), le32_to_cpu(), le32_encode_bits()
and le32_get_bits() for all accesses. Adjust the format specifiers where
the value type changes from unsigned long to u32.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 2229 +++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 1638 ++++++++++++++++++++++++++++++++++++------------------------------------
 drivers/net/wireless/ath/ath11k/dp.h                |  200 ++++-----
 drivers/net/wireless/ath/ath11k/dp_rx.c             |  270 ++++++------
 drivers/net/wireless/ath/ath11k/dp_tx.c             |  217 +++++-----
 5 files changed, 2370 insertions(+), 2184 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index 731f3ca86711..e806f1753dca 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -75,107 +75,118 @@ static inline void htt_print_tx_pdev_stats_cmn_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_PDEV_STATS_CMN_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_PDEV_STATS_CMN_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "hw_queued = %u\n",
-			 htt_stats_buf->hw_queued);
+			 le32_to_cpu(htt_stats_buf->hw_queued));
 	len += scnprintf(buf + len, buf_len - len, "hw_reaped = %u\n",
-			 htt_stats_buf->hw_reaped);
+			 le32_to_cpu(htt_stats_buf->hw_reaped));
 	len += scnprintf(buf + len, buf_len - len, "underrun = %u\n",
-			 htt_stats_buf->underrun);
+			 le32_to_cpu(htt_stats_buf->underrun));
 	len += scnprintf(buf + len, buf_len - len, "hw_paused = %u\n",
-			 htt_stats_buf->hw_paused);
+			 le32_to_cpu(htt_stats_buf->hw_paused));
 	len += scnprintf(buf + len, buf_len - len, "hw_flush = %u\n",
-			 htt_stats_buf->hw_flush);
+			 le32_to_cpu(htt_stats_buf->hw_flush));
 	len += scnprintf(buf + len, buf_len - len, "hw_filt = %u\n",
-			 htt_stats_buf->hw_filt);
+			 le32_to_cpu(htt_stats_buf->hw_filt));
 	len += scnprintf(buf + len, buf_len - len, "tx_abort = %u\n",
-			 htt_stats_buf->tx_abort);
+			 le32_to_cpu(htt_stats_buf->tx_abort));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_requeued = %u\n",
-			 htt_stats_buf->mpdu_requeued);
+			 le32_to_cpu(htt_stats_buf->mpdu_requeued));
 	len += scnprintf(buf + len, buf_len - len, "tx_xretry = %u\n",
-			 htt_stats_buf->tx_xretry);
+			 le32_to_cpu(htt_stats_buf->tx_xretry));
 	len += scnprintf(buf + len, buf_len - len, "data_rc = %u\n",
-			 htt_stats_buf->data_rc);
+			 le32_to_cpu(htt_stats_buf->data_rc));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_dropped_xretry = %u\n",
-			 htt_stats_buf->mpdu_dropped_xretry);
-	len += scnprintf(buf + len, buf_len - len, "illegal_rate_phy_err = %u\n",
-			 htt_stats_buf->illgl_rate_phy_err);
+			 le32_to_cpu(htt_stats_buf->mpdu_dropped_xretry));
+	len += scnprintf(buf + len, buf_len - len,
+			 "illegal_rate_phy_err = %u\n",
+			 le32_to_cpu(htt_stats_buf->illgl_rate_phy_err));
 	len += scnprintf(buf + len, buf_len - len, "cont_xretry = %u\n",
-			 htt_stats_buf->cont_xretry);
+			 le32_to_cpu(htt_stats_buf->cont_xretry));
 	len += scnprintf(buf + len, buf_len - len, "tx_timeout = %u\n",
-			 htt_stats_buf->tx_timeout);
+			 le32_to_cpu(htt_stats_buf->tx_timeout));
 	len += scnprintf(buf + len, buf_len - len, "pdev_resets = %u\n",
-			 htt_stats_buf->pdev_resets);
+			 le32_to_cpu(htt_stats_buf->pdev_resets));
 	len += scnprintf(buf + len, buf_len - len, "phy_underrun = %u\n",
-			 htt_stats_buf->phy_underrun);
+			 le32_to_cpu(htt_stats_buf->phy_underrun));
 	len += scnprintf(buf + len, buf_len - len, "txop_ovf = %u\n",
-			 htt_stats_buf->txop_ovf);
+			 le32_to_cpu(htt_stats_buf->txop_ovf));
 	len += scnprintf(buf + len, buf_len - len, "seq_posted = %u\n",
-			 htt_stats_buf->seq_posted);
+			 le32_to_cpu(htt_stats_buf->seq_posted));
 	len += scnprintf(buf + len, buf_len - len, "seq_failed_queueing = %u\n",
-			 htt_stats_buf->seq_failed_queueing);
+			 le32_to_cpu(htt_stats_buf->seq_failed_queueing));
 	len += scnprintf(buf + len, buf_len - len, "seq_completed = %u\n",
-			 htt_stats_buf->seq_completed);
+			 le32_to_cpu(htt_stats_buf->seq_completed));
 	len += scnprintf(buf + len, buf_len - len, "seq_restarted = %u\n",
-			 htt_stats_buf->seq_restarted);
+			 le32_to_cpu(htt_stats_buf->seq_restarted));
 	len += scnprintf(buf + len, buf_len - len, "mu_seq_posted = %u\n",
-			 htt_stats_buf->mu_seq_posted);
-	len += scnprintf(buf + len, buf_len - len, "seq_switch_hw_paused = %u\n",
-			 htt_stats_buf->seq_switch_hw_paused);
+			 le32_to_cpu(htt_stats_buf->mu_seq_posted));
+	len += scnprintf(buf + len, buf_len - len,
+			 "seq_switch_hw_paused = %u\n",
+			 le32_to_cpu(htt_stats_buf->seq_switch_hw_paused));
 	len += scnprintf(buf + len, buf_len - len, "next_seq_posted_dsr = %u\n",
-			 htt_stats_buf->next_seq_posted_dsr);
+			 le32_to_cpu(htt_stats_buf->next_seq_posted_dsr));
 	len += scnprintf(buf + len, buf_len - len, "seq_posted_isr = %u\n",
-			 htt_stats_buf->seq_posted_isr);
+			 le32_to_cpu(htt_stats_buf->seq_posted_isr));
 	len += scnprintf(buf + len, buf_len - len, "seq_ctrl_cached = %u\n",
-			 htt_stats_buf->seq_ctrl_cached);
+			 le32_to_cpu(htt_stats_buf->seq_ctrl_cached));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_count_tqm = %u\n",
-			 htt_stats_buf->mpdu_count_tqm);
+			 le32_to_cpu(htt_stats_buf->mpdu_count_tqm));
 	len += scnprintf(buf + len, buf_len - len, "msdu_count_tqm = %u\n",
-			 htt_stats_buf->msdu_count_tqm);
+			 le32_to_cpu(htt_stats_buf->msdu_count_tqm));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_removed_tqm = %u\n",
-			 htt_stats_buf->mpdu_removed_tqm);
+			 le32_to_cpu(htt_stats_buf->mpdu_removed_tqm));
 	len += scnprintf(buf + len, buf_len - len, "msdu_removed_tqm = %u\n",
-			 htt_stats_buf->msdu_removed_tqm);
+			 le32_to_cpu(htt_stats_buf->msdu_removed_tqm));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_sw_flush = %u\n",
-			 htt_stats_buf->mpdus_sw_flush);
+			 le32_to_cpu(htt_stats_buf->mpdus_sw_flush));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_hw_filter = %u\n",
-			 htt_stats_buf->mpdus_hw_filter);
+			 le32_to_cpu(htt_stats_buf->mpdus_hw_filter));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_truncated = %u\n",
-			 htt_stats_buf->mpdus_truncated);
+			 le32_to_cpu(htt_stats_buf->mpdus_truncated));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_ack_failed = %u\n",
-			 htt_stats_buf->mpdus_ack_failed);
+			 le32_to_cpu(htt_stats_buf->mpdus_ack_failed));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_expired = %u\n",
-			 htt_stats_buf->mpdus_expired);
+			 le32_to_cpu(htt_stats_buf->mpdus_expired));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_seq_hw_retry = %u\n",
-			 htt_stats_buf->mpdus_seq_hw_retry);
+			 le32_to_cpu(htt_stats_buf->mpdus_seq_hw_retry));
 	len += scnprintf(buf + len, buf_len - len, "ack_tlv_proc = %u\n",
-			 htt_stats_buf->ack_tlv_proc);
-	len += scnprintf(buf + len, buf_len - len, "coex_abort_mpdu_cnt_valid = %u\n",
-			 htt_stats_buf->coex_abort_mpdu_cnt_valid);
+			 le32_to_cpu(htt_stats_buf->ack_tlv_proc));
+	len += scnprintf(buf + len, buf_len - len,
+			 "coex_abort_mpdu_cnt_valid = %u\n",
+			 le32_to_cpu(htt_stats_buf->coex_abort_mpdu_cnt_valid));
 	len += scnprintf(buf + len, buf_len - len, "coex_abort_mpdu_cnt = %u\n",
-			 htt_stats_buf->coex_abort_mpdu_cnt);
-	len += scnprintf(buf + len, buf_len - len, "num_total_ppdus_tried_ota = %u\n",
-			 htt_stats_buf->num_total_ppdus_tried_ota);
-	len += scnprintf(buf + len, buf_len - len, "num_data_ppdus_tried_ota = %u\n",
-			 htt_stats_buf->num_data_ppdus_tried_ota);
-	len += scnprintf(buf + len, buf_len - len, "local_ctrl_mgmt_enqued = %u\n",
-			 htt_stats_buf->local_ctrl_mgmt_enqued);
-	len += scnprintf(buf + len, buf_len - len, "local_ctrl_mgmt_freed = %u\n",
-			 htt_stats_buf->local_ctrl_mgmt_freed);
+			 le32_to_cpu(htt_stats_buf->coex_abort_mpdu_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_total_ppdus_tried_ota = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_total_ppdus_tried_ota));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_data_ppdus_tried_ota = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_data_ppdus_tried_ota));
+	len += scnprintf(buf + len, buf_len - len,
+			 "local_ctrl_mgmt_enqued = %u\n",
+			 le32_to_cpu(htt_stats_buf->local_ctrl_mgmt_enqued));
+	len += scnprintf(buf + len, buf_len - len,
+			 "local_ctrl_mgmt_freed = %u\n",
+			 le32_to_cpu(htt_stats_buf->local_ctrl_mgmt_freed));
 	len += scnprintf(buf + len, buf_len - len, "local_data_enqued = %u\n",
-			 htt_stats_buf->local_data_enqued);
+			 le32_to_cpu(htt_stats_buf->local_data_enqued));
 	len += scnprintf(buf + len, buf_len - len, "local_data_freed = %u\n",
-			 htt_stats_buf->local_data_freed);
+			 le32_to_cpu(htt_stats_buf->local_data_freed));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_tried = %u\n",
-			 htt_stats_buf->mpdu_tried);
+			 le32_to_cpu(htt_stats_buf->mpdu_tried));
 	len += scnprintf(buf + len, buf_len - len, "isr_wait_seq_posted = %u\n",
-			 htt_stats_buf->isr_wait_seq_posted);
-	len += scnprintf(buf + len, buf_len - len, "tx_active_dur_us_low = %u\n",
-			 htt_stats_buf->tx_active_dur_us_low);
-	len += scnprintf(buf + len, buf_len - len, "tx_active_dur_us_high = %u\n\n",
-			 htt_stats_buf->tx_active_dur_us_high);
+			 le32_to_cpu(htt_stats_buf->isr_wait_seq_posted));
+	len += scnprintf(buf + len, buf_len - len,
+			 "tx_active_dur_us_low = %u\n",
+			 le32_to_cpu(htt_stats_buf->tx_active_dur_us_low));
+	len += scnprintf(buf + len, buf_len - len,
+			 "tx_active_dur_us_high = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->tx_active_dur_us_high));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -318,20 +329,25 @@ htt_print_tx_pdev_stats_tx_ppdu_stats_tlv_v(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_PDEV_STATS_TX_PPDU_STATS_TLV_V:\n");
 
-	len += scnprintf(buf + len, buf_len - len, "num_data_ppdus_legacy_su = %u\n",
-			 htt_stats_buf->num_data_ppdus_legacy_su);
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_data_ppdus_legacy_su = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_data_ppdus_legacy_su));
 
-	len += scnprintf(buf + len, buf_len - len, "num_data_ppdus_ac_su = %u\n",
-			 htt_stats_buf->num_data_ppdus_ac_su);
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_data_ppdus_ac_su = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_data_ppdus_ac_su));
 
-	len += scnprintf(buf + len, buf_len - len, "num_data_ppdus_ax_su = %u\n",
-			 htt_stats_buf->num_data_ppdus_ax_su);
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_data_ppdus_ax_su = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_data_ppdus_ax_su));
 
-	len += scnprintf(buf + len, buf_len - len, "num_data_ppdus_ac_su_txbf = %u\n",
-			 htt_stats_buf->num_data_ppdus_ac_su_txbf);
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_data_ppdus_ac_su_txbf = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_data_ppdus_ac_su_txbf));
 
-	len += scnprintf(buf + len, buf_len - len, "num_data_ppdus_ax_su_txbf = %u\n\n",
-			 htt_stats_buf->num_data_ppdus_ax_su_txbf);
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_data_ppdus_ax_su_txbf = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->num_data_ppdus_ax_su_txbf));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -354,8 +370,9 @@ htt_print_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_PDEV_STATS_TRIED_MPDU_CNT_HIST_TLV_V:\n");
-	len += scnprintf(buf + len, buf_len - len, "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u\n",
-			 htt_stats_buf->hist_bin_size);
+	len += scnprintf(buf + len, buf_len - len,
+			 "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u\n",
+			 le32_to_cpu(htt_stats_buf->hist_bin_size));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->tried_mpdu_cnt_hist,
 			   "tried_mpdu_cnt_hist", num_elements, "\n\n");
@@ -382,9 +399,9 @@ static inline void htt_print_hw_stats_intr_misc_tlv(const void *tag_buf,
 	       HTT_STATS_MAX_HW_INTR_NAME_LEN);
 	len += scnprintf(buf + len, buf_len - len, "hw_intr_name = %s\n", hw_intr_name);
 	len += scnprintf(buf + len, buf_len - len, "mask = %u\n",
-			 htt_stats_buf->mask);
+			 le32_to_cpu(htt_stats_buf->mask));
 	len += scnprintf(buf + len, buf_len - len, "count = %u\n\n",
-			 htt_stats_buf->count);
+			 le32_to_cpu(htt_stats_buf->count));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -410,7 +427,7 @@ htt_print_hw_stats_wd_timeout_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "hw_module_name = %s\n",
 			 hw_module_name);
 	len += scnprintf(buf + len, buf_len - len, "count = %u\n",
-			 htt_stats_buf->count);
+			 le32_to_cpu(htt_stats_buf->count));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -428,29 +445,31 @@ static inline void htt_print_hw_stats_pdev_errs_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_HW_STATS_PDEV_ERRS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_HW_STATS_PDEV_ERRS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "tx_abort = %u\n",
-			 htt_stats_buf->tx_abort);
+			 le32_to_cpu(htt_stats_buf->tx_abort));
 	len += scnprintf(buf + len, buf_len - len, "tx_abort_fail_count = %u\n",
-			 htt_stats_buf->tx_abort_fail_count);
+			 le32_to_cpu(htt_stats_buf->tx_abort_fail_count));
 	len += scnprintf(buf + len, buf_len - len, "rx_abort = %u\n",
-			 htt_stats_buf->rx_abort);
+			 le32_to_cpu(htt_stats_buf->rx_abort));
 	len += scnprintf(buf + len, buf_len - len, "rx_abort_fail_count = %u\n",
-			 htt_stats_buf->rx_abort_fail_count);
+			 le32_to_cpu(htt_stats_buf->rx_abort_fail_count));
 	len += scnprintf(buf + len, buf_len - len, "warm_reset = %u\n",
-			 htt_stats_buf->warm_reset);
+			 le32_to_cpu(htt_stats_buf->warm_reset));
 	len += scnprintf(buf + len, buf_len - len, "cold_reset = %u\n",
-			 htt_stats_buf->cold_reset);
+			 le32_to_cpu(htt_stats_buf->cold_reset));
 	len += scnprintf(buf + len, buf_len - len, "tx_flush = %u\n",
-			 htt_stats_buf->tx_flush);
+			 le32_to_cpu(htt_stats_buf->tx_flush));
 	len += scnprintf(buf + len, buf_len - len, "tx_glb_reset = %u\n",
-			 htt_stats_buf->tx_glb_reset);
+			 le32_to_cpu(htt_stats_buf->tx_glb_reset));
 	len += scnprintf(buf + len, buf_len - len, "tx_txq_reset = %u\n",
-			 htt_stats_buf->tx_txq_reset);
+			 le32_to_cpu(htt_stats_buf->tx_txq_reset));
 	len += scnprintf(buf + len, buf_len - len, "rx_timeout_reset = %u\n\n",
-			 htt_stats_buf->rx_timeout_reset);
+			 le32_to_cpu(htt_stats_buf->rx_timeout_reset));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -468,36 +487,44 @@ static inline void htt_print_msdu_flow_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_MSDU_FLOW_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "last_update_timestamp = %u\n",
-			 htt_stats_buf->last_update_timestamp);
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_MSDU_FLOW_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_update_timestamp = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_update_timestamp));
 	len += scnprintf(buf + len, buf_len - len, "last_add_timestamp = %u\n",
-			 htt_stats_buf->last_add_timestamp);
-	len += scnprintf(buf + len, buf_len - len, "last_remove_timestamp = %u\n",
-			 htt_stats_buf->last_remove_timestamp);
-	len += scnprintf(buf + len, buf_len - len, "total_processed_msdu_count = %u\n",
-			 htt_stats_buf->total_processed_msdu_count);
-	len += scnprintf(buf + len, buf_len - len, "cur_msdu_count_in_flowq = %u\n",
-			 htt_stats_buf->cur_msdu_count_in_flowq);
+			 le32_to_cpu(htt_stats_buf->last_add_timestamp));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_remove_timestamp = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_remove_timestamp));
+	len += scnprintf(buf + len, buf_len - len,
+			 "total_processed_msdu_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->total_processed_msdu_count));
+	len += scnprintf(buf + len, buf_len - len,
+			 "cur_msdu_count_in_flowq = %u\n",
+			 le32_to_cpu(htt_stats_buf->cur_msdu_count_in_flowq));
 	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %u\n",
-			 htt_stats_buf->sw_peer_id);
-	len += scnprintf(buf + len, buf_len - len, "tx_flow_no = %lu\n",
-			 FIELD_GET(HTT_MSDU_FLOW_STATS_TX_FLOW_NO,
-				   htt_stats_buf->tx_flow_no__tid_num__drop_rule));
-	len += scnprintf(buf + len, buf_len - len, "tid_num = %lu\n",
-			 FIELD_GET(HTT_MSDU_FLOW_STATS_TID_NUM,
-				   htt_stats_buf->tx_flow_no__tid_num__drop_rule));
-	len += scnprintf(buf + len, buf_len - len, "drop_rule = %lu\n",
-			 FIELD_GET(HTT_MSDU_FLOW_STATS_DROP_RULE,
-				   htt_stats_buf->tx_flow_no__tid_num__drop_rule));
-	len += scnprintf(buf + len, buf_len - len, "last_cycle_enqueue_count = %u\n",
-			 htt_stats_buf->last_cycle_enqueue_count);
-	len += scnprintf(buf + len, buf_len - len, "last_cycle_dequeue_count = %u\n",
-			 htt_stats_buf->last_cycle_dequeue_count);
-	len += scnprintf(buf + len, buf_len - len, "last_cycle_drop_count = %u\n",
-			 htt_stats_buf->last_cycle_drop_count);
+			 le32_to_cpu(htt_stats_buf->sw_peer_id));
+	len += scnprintf(buf + len, buf_len - len, "tx_flow_no = %u\n",
+			 le32_get_bits(htt_stats_buf->tx_flow_no__tid_num__drop_rule,
+				       HTT_MSDU_FLOW_STATS_TX_FLOW_NO));
+	len += scnprintf(buf + len, buf_len - len, "tid_num = %u\n",
+			 le32_get_bits(htt_stats_buf->tx_flow_no__tid_num__drop_rule,
+				       HTT_MSDU_FLOW_STATS_TID_NUM));
+	len += scnprintf(buf + len, buf_len - len, "drop_rule = %u\n",
+			 le32_get_bits(htt_stats_buf->tx_flow_no__tid_num__drop_rule,
+				       HTT_MSDU_FLOW_STATS_DROP_RULE));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_cycle_enqueue_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_cycle_enqueue_count));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_cycle_dequeue_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_cycle_dequeue_count));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_cycle_drop_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_cycle_drop_count));
 	len += scnprintf(buf + len, buf_len - len, "current_drop_th = %u\n\n",
-			 htt_stats_buf->current_drop_th);
+			 le32_to_cpu(htt_stats_buf->current_drop_th));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -519,38 +546,38 @@ static inline void htt_print_tx_tid_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TID_STATS_TLV:\n");
 	memcpy(tid_name, &(htt_stats_buf->tid_name[0]), MAX_HTT_TID_NAME);
 	len += scnprintf(buf + len, buf_len - len, "tid_name = %s\n", tid_name);
-	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_SW_PEER_ID,
-				   htt_stats_buf->sw_peer_id__tid_num));
-	len += scnprintf(buf + len, buf_len - len, "tid_num = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_TID_NUM,
-				   htt_stats_buf->sw_peer_id__tid_num));
-	len += scnprintf(buf + len, buf_len - len, "num_sched_pending = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_NUM_SCHED_PENDING,
-				   htt_stats_buf->num_sched_pending__num_ppdu_in_hwq));
-	len += scnprintf(buf + len, buf_len - len, "num_ppdu_in_hwq = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_NUM_PPDU_IN_HWQ,
-				   htt_stats_buf->num_sched_pending__num_ppdu_in_hwq));
+	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %u\n",
+			 le32_get_bits(htt_stats_buf->sw_peer_id__tid_num,
+				       HTT_TX_TID_STATS_SW_PEER_ID));
+	len += scnprintf(buf + len, buf_len - len, "tid_num = %u\n",
+			 le32_get_bits(htt_stats_buf->sw_peer_id__tid_num,
+				       HTT_TX_TID_STATS_TID_NUM));
+	len += scnprintf(buf + len, buf_len - len, "num_sched_pending = %u\n",
+			 le32_get_bits(htt_stats_buf->num_sched_pending__num_ppdu_in_hwq,
+				       HTT_TX_TID_STATS_NUM_SCHED_PENDING));
+	len += scnprintf(buf + len, buf_len - len, "num_ppdu_in_hwq = %u\n",
+			 le32_get_bits(htt_stats_buf->num_sched_pending__num_ppdu_in_hwq,
+				       HTT_TX_TID_STATS_NUM_PPDU_IN_HWQ));
 	len += scnprintf(buf + len, buf_len - len, "tid_flags = 0x%x\n",
-			 htt_stats_buf->tid_flags);
+			 le32_to_cpu(htt_stats_buf->tid_flags));
 	len += scnprintf(buf + len, buf_len - len, "hw_queued = %u\n",
-			 htt_stats_buf->hw_queued);
+			 le32_to_cpu(htt_stats_buf->hw_queued));
 	len += scnprintf(buf + len, buf_len - len, "hw_reaped = %u\n",
-			 htt_stats_buf->hw_reaped);
+			 le32_to_cpu(htt_stats_buf->hw_reaped));
 	len += scnprintf(buf + len, buf_len - len, "mpdus_hw_filter = %u\n",
-			 htt_stats_buf->mpdus_hw_filter);
+			 le32_to_cpu(htt_stats_buf->mpdus_hw_filter));
 	len += scnprintf(buf + len, buf_len - len, "qdepth_bytes = %u\n",
-			 htt_stats_buf->qdepth_bytes);
+			 le32_to_cpu(htt_stats_buf->qdepth_bytes));
 	len += scnprintf(buf + len, buf_len - len, "qdepth_num_msdu = %u\n",
-			 htt_stats_buf->qdepth_num_msdu);
+			 le32_to_cpu(htt_stats_buf->qdepth_num_msdu));
 	len += scnprintf(buf + len, buf_len - len, "qdepth_num_mpdu = %u\n",
-			 htt_stats_buf->qdepth_num_mpdu);
+			 le32_to_cpu(htt_stats_buf->qdepth_num_mpdu));
 	len += scnprintf(buf + len, buf_len - len, "last_scheduled_tsmp = %u\n",
-			 htt_stats_buf->last_scheduled_tsmp);
+			 le32_to_cpu(htt_stats_buf->last_scheduled_tsmp));
 	len += scnprintf(buf + len, buf_len - len, "pause_module_id = %u\n",
-			 htt_stats_buf->pause_module_id);
+			 le32_to_cpu(htt_stats_buf->pause_module_id));
 	len += scnprintf(buf + len, buf_len - len, "block_module_id = %u\n\n",
-			 htt_stats_buf->block_module_id);
+			 le32_to_cpu(htt_stats_buf->block_module_id));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -572,42 +599,43 @@ static inline void htt_print_tx_tid_stats_v1_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TID_STATS_V1_TLV:\n");
 	memcpy(tid_name, &(htt_stats_buf->tid_name[0]), MAX_HTT_TID_NAME);
 	len += scnprintf(buf + len, buf_len - len, "tid_name = %s\n", tid_name);
-	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_V1_SW_PEER_ID,
-				   htt_stats_buf->sw_peer_id__tid_num));
-	len += scnprintf(buf + len, buf_len - len, "tid_num = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_V1_TID_NUM,
-				   htt_stats_buf->sw_peer_id__tid_num));
-	len += scnprintf(buf + len, buf_len - len, "num_sched_pending = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_V1_NUM_SCHED_PENDING,
-				   htt_stats_buf->num_sched_pending__num_ppdu_in_hwq));
-	len += scnprintf(buf + len, buf_len - len, "num_ppdu_in_hwq = %lu\n",
-			 FIELD_GET(HTT_TX_TID_STATS_V1_NUM_PPDU_IN_HWQ,
-				   htt_stats_buf->num_sched_pending__num_ppdu_in_hwq));
+	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %u\n",
+			 le32_get_bits(htt_stats_buf->sw_peer_id__tid_num,
+				       HTT_TX_TID_STATS_V1_SW_PEER_ID));
+	len += scnprintf(buf + len, buf_len - len, "tid_num = %u\n",
+			 le32_get_bits(htt_stats_buf->sw_peer_id__tid_num,
+				       HTT_TX_TID_STATS_V1_TID_NUM));
+	len += scnprintf(buf + len, buf_len - len, "num_sched_pending = %u\n",
+			 le32_get_bits(htt_stats_buf->num_sched_pending__num_ppdu_in_hwq,
+				       HTT_TX_TID_STATS_V1_NUM_SCHED_PENDING));
+	len += scnprintf(buf + len, buf_len - len, "num_ppdu_in_hwq = %u\n",
+			 le32_get_bits(htt_stats_buf->num_sched_pending__num_ppdu_in_hwq,
+				       HTT_TX_TID_STATS_V1_NUM_PPDU_IN_HWQ));
 	len += scnprintf(buf + len, buf_len - len, "tid_flags = 0x%x\n",
-			 htt_stats_buf->tid_flags);
+			 le32_to_cpu(htt_stats_buf->tid_flags));
 	len += scnprintf(buf + len, buf_len - len, "max_qdepth_bytes = %u\n",
-			 htt_stats_buf->max_qdepth_bytes);
+			 le32_to_cpu(htt_stats_buf->max_qdepth_bytes));
 	len += scnprintf(buf + len, buf_len - len, "max_qdepth_n_msdus = %u\n",
-			 htt_stats_buf->max_qdepth_n_msdus);
+			 le32_to_cpu(htt_stats_buf->max_qdepth_n_msdus));
 	len += scnprintf(buf + len, buf_len - len, "rsvd = %u\n",
-			 htt_stats_buf->rsvd);
+			 le32_to_cpu(htt_stats_buf->rsvd));
 	len += scnprintf(buf + len, buf_len - len, "qdepth_bytes = %u\n",
-			 htt_stats_buf->qdepth_bytes);
+			 le32_to_cpu(htt_stats_buf->qdepth_bytes));
 	len += scnprintf(buf + len, buf_len - len, "qdepth_num_msdu = %u\n",
-			 htt_stats_buf->qdepth_num_msdu);
+			 le32_to_cpu(htt_stats_buf->qdepth_num_msdu));
 	len += scnprintf(buf + len, buf_len - len, "qdepth_num_mpdu = %u\n",
-			 htt_stats_buf->qdepth_num_mpdu);
+			 le32_to_cpu(htt_stats_buf->qdepth_num_mpdu));
 	len += scnprintf(buf + len, buf_len - len, "last_scheduled_tsmp = %u\n",
-			 htt_stats_buf->last_scheduled_tsmp);
+			 le32_to_cpu(htt_stats_buf->last_scheduled_tsmp));
 	len += scnprintf(buf + len, buf_len - len, "pause_module_id = %u\n",
-			 htt_stats_buf->pause_module_id);
+			 le32_to_cpu(htt_stats_buf->pause_module_id));
 	len += scnprintf(buf + len, buf_len - len, "block_module_id = %u\n",
-			 htt_stats_buf->block_module_id);
+			 le32_to_cpu(htt_stats_buf->block_module_id));
 	len += scnprintf(buf + len, buf_len - len, "allow_n_flags = 0x%x\n",
-			 htt_stats_buf->allow_n_flags);
-	len += scnprintf(buf + len, buf_len - len, "sendn_frms_allowed = %u\n\n",
-			 htt_stats_buf->sendn_frms_allowed);
+			 le32_to_cpu(htt_stats_buf->allow_n_flags));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sendn_frms_allowed = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->sendn_frms_allowed));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -627,22 +655,25 @@ static inline void htt_print_rx_tid_stats_tlv(const void *tag_buf,
 	char tid_name[MAX_HTT_TID_NAME + 1] = {};
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_RX_TID_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %lu\n",
-			 FIELD_GET(HTT_RX_TID_STATS_SW_PEER_ID,
-				   htt_stats_buf->sw_peer_id__tid_num));
-	len += scnprintf(buf + len, buf_len - len, "tid_num = %lu\n",
-			 FIELD_GET(HTT_RX_TID_STATS_TID_NUM,
-				   htt_stats_buf->sw_peer_id__tid_num));
+	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %u\n",
+			 le32_get_bits(htt_stats_buf->sw_peer_id__tid_num,
+				       HTT_RX_TID_STATS_SW_PEER_ID));
+	len += scnprintf(buf + len, buf_len - len, "tid_num = %u\n",
+			 le32_get_bits(htt_stats_buf->sw_peer_id__tid_num,
+				       HTT_RX_TID_STATS_TID_NUM));
 	memcpy(tid_name, &(htt_stats_buf->tid_name[0]), MAX_HTT_TID_NAME);
 	len += scnprintf(buf + len, buf_len - len, "tid_name = %s\n", tid_name);
 	len += scnprintf(buf + len, buf_len - len, "dup_in_reorder = %u\n",
-			 htt_stats_buf->dup_in_reorder);
-	len += scnprintf(buf + len, buf_len - len, "dup_past_outside_window = %u\n",
-			 htt_stats_buf->dup_past_outside_window);
-	len += scnprintf(buf + len, buf_len - len, "dup_past_within_window = %u\n",
-			 htt_stats_buf->dup_past_within_window);
-	len += scnprintf(buf + len, buf_len - len, "rxdesc_err_decrypt = %u\n\n",
-			 htt_stats_buf->rxdesc_err_decrypt);
+			 le32_to_cpu(htt_stats_buf->dup_in_reorder));
+	len += scnprintf(buf + len, buf_len - len,
+			 "dup_past_outside_window = %u\n",
+			 le32_to_cpu(htt_stats_buf->dup_past_outside_window));
+	len += scnprintf(buf + len, buf_len - len,
+			 "dup_past_within_window = %u\n",
+			 le32_to_cpu(htt_stats_buf->dup_past_within_window));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rxdesc_err_decrypt = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->rxdesc_err_decrypt));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -666,7 +697,7 @@ static inline void htt_print_counter_tlv(const void *tag_buf,
 			   "counter_name",
 			   HTT_MAX_COUNTER_NAME, "\n");
 	len += scnprintf(buf + len, buf_len - len, "count = %u\n\n",
-			 htt_stats_buf->count);
+			 le32_to_cpu(htt_stats_buf->count));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -686,33 +717,34 @@ static inline void htt_print_peer_stats_cmn_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_PEER_STATS_CMN_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "ppdu_cnt = %u\n",
-			 htt_stats_buf->ppdu_cnt);
+			 le32_to_cpu(htt_stats_buf->ppdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_cnt = %u\n",
-			 htt_stats_buf->mpdu_cnt);
+			 le32_to_cpu(htt_stats_buf->mpdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "msdu_cnt = %u\n",
-			 htt_stats_buf->msdu_cnt);
+			 le32_to_cpu(htt_stats_buf->msdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "pause_bitmap = %u\n",
-			 htt_stats_buf->pause_bitmap);
+			 le32_to_cpu(htt_stats_buf->pause_bitmap));
 	len += scnprintf(buf + len, buf_len - len, "block_bitmap = %u\n",
-			 htt_stats_buf->block_bitmap);
+			 le32_to_cpu(htt_stats_buf->block_bitmap));
 	len += scnprintf(buf + len, buf_len - len, "last_rssi = %d\n",
 			 htt_stats_buf->rssi);
 	len += scnprintf(buf + len, buf_len - len, "enqueued_count = %llu\n",
-			 htt_stats_buf->peer_enqueued_count_low |
-			 ((u64)htt_stats_buf->peer_enqueued_count_high << 32));
+			 le32_to_cpu(htt_stats_buf->peer_enqueued_count_low) |
+			 ((u64)le32_to_cpu(htt_stats_buf->peer_enqueued_count_high) << 32));
 	len += scnprintf(buf + len, buf_len - len, "dequeued_count = %llu\n",
-			 htt_stats_buf->peer_dequeued_count_low |
-			 ((u64)htt_stats_buf->peer_dequeued_count_high << 32));
+			 le32_to_cpu(htt_stats_buf->peer_dequeued_count_low) |
+			 ((u64)le32_to_cpu(htt_stats_buf->peer_dequeued_count_high) << 32));
 	len += scnprintf(buf + len, buf_len - len, "dropped_count = %llu\n",
-			 htt_stats_buf->peer_dropped_count_low |
-			 ((u64)htt_stats_buf->peer_dropped_count_high << 32));
-	len += scnprintf(buf + len, buf_len - len, "transmitted_ppdu_bytes = %llu\n",
-			 htt_stats_buf->ppdu_transmitted_bytes_low |
-			 ((u64)htt_stats_buf->ppdu_transmitted_bytes_high << 32));
+			 le32_to_cpu(htt_stats_buf->peer_dropped_count_low) |
+			 ((u64)le32_to_cpu(htt_stats_buf->peer_dropped_count_high) << 32));
+	len += scnprintf(buf + len, buf_len - len,
+			 "transmitted_ppdu_bytes = %llu\n",
+			 le32_to_cpu(htt_stats_buf->ppdu_transmitted_bytes_low) |
+			 ((u64)le32_to_cpu(htt_stats_buf->ppdu_transmitted_bytes_high) << 32));
 	len += scnprintf(buf + len, buf_len - len, "ttl_removed_count = %u\n",
-			 htt_stats_buf->peer_ttl_removed_count);
+			 le32_to_cpu(htt_stats_buf->peer_ttl_removed_count));
 	len += scnprintf(buf + len, buf_len - len, "inactive_time = %u\n\n",
-			 htt_stats_buf->inactive_time);
+			 le32_to_cpu(htt_stats_buf->inactive_time));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -732,36 +764,36 @@ static inline void htt_print_peer_details_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_PEER_DETAILS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "peer_type = %u\n",
-			 htt_stats_buf->peer_type);
+			 le32_to_cpu(htt_stats_buf->peer_type));
 	len += scnprintf(buf + len, buf_len - len, "sw_peer_id = %u\n",
-			 htt_stats_buf->sw_peer_id);
-	len += scnprintf(buf + len, buf_len - len, "vdev_id = %lu\n",
-			 FIELD_GET(HTT_PEER_DETAILS_VDEV_ID,
-				   htt_stats_buf->vdev_pdev_ast_idx));
-	len += scnprintf(buf + len, buf_len - len, "pdev_id = %lu\n",
-			 FIELD_GET(HTT_PEER_DETAILS_PDEV_ID,
-				   htt_stats_buf->vdev_pdev_ast_idx));
-	len += scnprintf(buf + len, buf_len - len, "ast_idx = %lu\n",
-			 FIELD_GET(HTT_PEER_DETAILS_AST_IDX,
-				   htt_stats_buf->vdev_pdev_ast_idx));
-	len += scnprintf(buf + len, buf_len - len,
-			 "mac_addr = %02lx:%02lx:%02lx:%02lx:%02lx:%02lx\n",
-			 FIELD_GET(HTT_MAC_ADDR_L32_0,
-				   htt_stats_buf->mac_addr.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_L32_1,
-				   htt_stats_buf->mac_addr.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_L32_2,
-				   htt_stats_buf->mac_addr.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_L32_3,
-				   htt_stats_buf->mac_addr.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_H16_0,
-				   htt_stats_buf->mac_addr.mac_addr_h16),
-			 FIELD_GET(HTT_MAC_ADDR_H16_1,
-				   htt_stats_buf->mac_addr.mac_addr_h16));
+			 le32_to_cpu(htt_stats_buf->sw_peer_id));
+	len += scnprintf(buf + len, buf_len - len, "vdev_id = %u\n",
+			 le32_get_bits(htt_stats_buf->vdev_pdev_ast_idx,
+				       HTT_PEER_DETAILS_VDEV_ID));
+	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
+			 le32_get_bits(htt_stats_buf->vdev_pdev_ast_idx,
+				       HTT_PEER_DETAILS_PDEV_ID));
+	len += scnprintf(buf + len, buf_len - len, "ast_idx = %u\n",
+			 le32_get_bits(htt_stats_buf->vdev_pdev_ast_idx,
+				       HTT_PEER_DETAILS_AST_IDX));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mac_addr = %02x:%02x:%02x:%02x:%02x:%02x\n",
+			 le32_get_bits(htt_stats_buf->mac_addr.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_0),
+			 le32_get_bits(htt_stats_buf->mac_addr.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_1),
+			 le32_get_bits(htt_stats_buf->mac_addr.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_2),
+			 le32_get_bits(htt_stats_buf->mac_addr.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_3),
+			 le32_get_bits(htt_stats_buf->mac_addr.mac_addr_h16,
+				       HTT_MAC_ADDR_H16_0),
+			 le32_get_bits(htt_stats_buf->mac_addr.mac_addr_h16,
+				       HTT_MAC_ADDR_H16_1));
 	len += scnprintf(buf + len, buf_len - len, "peer_flags = 0x%x\n",
-			 htt_stats_buf->peer_flags);
+			 le32_to_cpu(htt_stats_buf->peer_flags));
 	len += scnprintf(buf + len, buf_len - len, "qpeer_flags = 0x%x\n\n",
-			 htt_stats_buf->qpeer_flags);
+			 le32_to_cpu(htt_stats_buf->qpeer_flags));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -782,11 +814,11 @@ static inline void htt_print_tx_peer_rate_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_PEER_RATE_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "tx_ldpc = %u\n",
-			 htt_stats_buf->tx_ldpc);
+			 le32_to_cpu(htt_stats_buf->tx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "rts_cnt = %u\n",
-			 htt_stats_buf->rts_cnt);
+			 le32_to_cpu(htt_stats_buf->rts_cnt));
 	len += scnprintf(buf + len, buf_len - len, "ack_rssi = %u\n",
-			 htt_stats_buf->ack_rssi);
+			 le32_to_cpu(htt_stats_buf->ack_rssi));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->tx_mcs, "tx_mcs",
 			   HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS, "\n");
@@ -832,17 +864,17 @@ static inline void htt_print_rx_peer_rate_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_RX_PEER_RATE_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "nsts = %u\n",
-			 htt_stats_buf->nsts);
+			 le32_to_cpu(htt_stats_buf->nsts));
 	len += scnprintf(buf + len, buf_len - len, "rx_ldpc = %u\n",
-			 htt_stats_buf->rx_ldpc);
+			 le32_to_cpu(htt_stats_buf->rx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "rts_cnt = %u\n",
-			 htt_stats_buf->rts_cnt);
+			 le32_to_cpu(htt_stats_buf->rts_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rssi_mgmt = %u\n",
-			 htt_stats_buf->rssi_mgmt);
+			 le32_to_cpu(htt_stats_buf->rssi_mgmt));
 	len += scnprintf(buf + len, buf_len - len, "rssi_data = %u\n",
-			 htt_stats_buf->rssi_data);
+			 le32_to_cpu(htt_stats_buf->rssi_data));
 	len += scnprintf(buf + len, buf_len - len, "rssi_comb = %u\n",
-			 htt_stats_buf->rssi_comb);
+			 le32_to_cpu(htt_stats_buf->rssi_comb));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_mcs, "rx_mcs",
 			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS, "\n");
@@ -891,11 +923,12 @@ htt_print_tx_hwq_mu_mimo_sch_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_HWQ_MU_MIMO_SCH_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "mu_mimo_sch_posted = %u\n",
-			 htt_stats_buf->mu_mimo_sch_posted);
+			 le32_to_cpu(htt_stats_buf->mu_mimo_sch_posted));
 	len += scnprintf(buf + len, buf_len - len, "mu_mimo_sch_failed = %u\n",
-			 htt_stats_buf->mu_mimo_sch_failed);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_ppdu_posted = %u\n\n",
-			 htt_stats_buf->mu_mimo_ppdu_posted);
+			 le32_to_cpu(htt_stats_buf->mu_mimo_sch_failed));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_ppdu_posted = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_ppdu_posted));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -916,20 +949,27 @@ htt_print_tx_hwq_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_HWQ_MU_MIMO_MPDU_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_mpdus_queued_usr = %u\n",
-			 htt_stats_buf->mu_mimo_mpdus_queued_usr);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_mpdus_tried_usr = %u\n",
-			 htt_stats_buf->mu_mimo_mpdus_tried_usr);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_mpdus_failed_usr = %u\n",
-			 htt_stats_buf->mu_mimo_mpdus_failed_usr);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_mpdus_requeued_usr = %u\n",
-			 htt_stats_buf->mu_mimo_mpdus_requeued_usr);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_err_no_ba_usr = %u\n",
-			 htt_stats_buf->mu_mimo_err_no_ba_usr);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_mpdu_underrun_usr = %u\n",
-			 htt_stats_buf->mu_mimo_mpdu_underrun_usr);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_ampdu_underrun_usr = %u\n\n",
-			 htt_stats_buf->mu_mimo_ampdu_underrun_usr);
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_mpdus_queued_usr = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_mpdus_queued_usr));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_mpdus_tried_usr = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_mpdus_tried_usr));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_mpdus_failed_usr = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_mpdus_failed_usr));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_mpdus_requeued_usr = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_mpdus_requeued_usr));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_err_no_ba_usr = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_err_no_ba_usr));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_mpdu_underrun_usr = %u\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_mpdu_underrun_usr));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_ampdu_underrun_usr = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_ampdu_underrun_usr));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -948,13 +988,14 @@ htt_print_tx_hwq_mu_mimo_cmn_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_HWQ_MU_MIMO_CMN_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_TX_HWQ_STATS_MAC_ID,
-				   htt_stats_buf->mac_id__hwq_id__word));
-	len += scnprintf(buf + len, buf_len - len, "hwq_id = %lu\n\n",
-			 FIELD_GET(HTT_TX_HWQ_STATS_HWQ_ID,
-				   htt_stats_buf->mac_id__hwq_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_HWQ_MU_MIMO_CMN_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__hwq_id__word,
+				       HTT_TX_HWQ_STATS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len, "hwq_id = %u\n\n",
+			 le32_get_bits(htt_stats_buf->mac_id__hwq_id__word,
+				       HTT_TX_HWQ_STATS_HWQ_ID));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -973,53 +1014,55 @@ htt_print_tx_hwq_stats_cmn_tlv(const void *tag_buf, struct debug_htt_stats_req *
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
 	/* TODO: HKDBG */
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_HWQ_STATS_CMN_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_TX_HWQ_STATS_MAC_ID,
-				   htt_stats_buf->mac_id__hwq_id__word));
-	len += scnprintf(buf + len, buf_len - len, "hwq_id = %lu\n",
-			 FIELD_GET(HTT_TX_HWQ_STATS_HWQ_ID,
-				   htt_stats_buf->mac_id__hwq_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_HWQ_STATS_CMN_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__hwq_id__word,
+				       HTT_TX_HWQ_STATS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len, "hwq_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__hwq_id__word,
+				       HTT_TX_HWQ_STATS_HWQ_ID));
 	len += scnprintf(buf + len, buf_len - len, "xretry = %u\n",
-			 htt_stats_buf->xretry);
+			 le32_to_cpu(htt_stats_buf->xretry));
 	len += scnprintf(buf + len, buf_len - len, "underrun_cnt = %u\n",
-			 htt_stats_buf->underrun_cnt);
+			 le32_to_cpu(htt_stats_buf->underrun_cnt));
 	len += scnprintf(buf + len, buf_len - len, "flush_cnt = %u\n",
-			 htt_stats_buf->flush_cnt);
+			 le32_to_cpu(htt_stats_buf->flush_cnt));
 	len += scnprintf(buf + len, buf_len - len, "filt_cnt = %u\n",
-			 htt_stats_buf->filt_cnt);
+			 le32_to_cpu(htt_stats_buf->filt_cnt));
 	len += scnprintf(buf + len, buf_len - len, "null_mpdu_bmap = %u\n",
-			 htt_stats_buf->null_mpdu_bmap);
+			 le32_to_cpu(htt_stats_buf->null_mpdu_bmap));
 	len += scnprintf(buf + len, buf_len - len, "user_ack_failure = %u\n",
-			 htt_stats_buf->user_ack_failure);
+			 le32_to_cpu(htt_stats_buf->user_ack_failure));
 	len += scnprintf(buf + len, buf_len - len, "ack_tlv_proc = %u\n",
-			 htt_stats_buf->ack_tlv_proc);
+			 le32_to_cpu(htt_stats_buf->ack_tlv_proc));
 	len += scnprintf(buf + len, buf_len - len, "sched_id_proc = %u\n",
-			 htt_stats_buf->sched_id_proc);
+			 le32_to_cpu(htt_stats_buf->sched_id_proc));
 	len += scnprintf(buf + len, buf_len - len, "null_mpdu_tx_count = %u\n",
-			 htt_stats_buf->null_mpdu_tx_count);
+			 le32_to_cpu(htt_stats_buf->null_mpdu_tx_count));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_bmap_not_recvd = %u\n",
-			 htt_stats_buf->mpdu_bmap_not_recvd);
+			 le32_to_cpu(htt_stats_buf->mpdu_bmap_not_recvd));
 	len += scnprintf(buf + len, buf_len - len, "num_bar = %u\n",
-			 htt_stats_buf->num_bar);
+			 le32_to_cpu(htt_stats_buf->num_bar));
 	len += scnprintf(buf + len, buf_len - len, "rts = %u\n",
-			 htt_stats_buf->rts);
+			 le32_to_cpu(htt_stats_buf->rts));
 	len += scnprintf(buf + len, buf_len - len, "cts2self = %u\n",
-			 htt_stats_buf->cts2self);
+			 le32_to_cpu(htt_stats_buf->cts2self));
 	len += scnprintf(buf + len, buf_len - len, "qos_null = %u\n",
-			 htt_stats_buf->qos_null);
+			 le32_to_cpu(htt_stats_buf->qos_null));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_tried_cnt = %u\n",
-			 htt_stats_buf->mpdu_tried_cnt);
+			 le32_to_cpu(htt_stats_buf->mpdu_tried_cnt));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_queued_cnt = %u\n",
-			 htt_stats_buf->mpdu_queued_cnt);
+			 le32_to_cpu(htt_stats_buf->mpdu_queued_cnt));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_ack_fail_cnt = %u\n",
-			 htt_stats_buf->mpdu_ack_fail_cnt);
+			 le32_to_cpu(htt_stats_buf->mpdu_ack_fail_cnt));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_filt_cnt = %u\n",
-			 htt_stats_buf->mpdu_filt_cnt);
-	len += scnprintf(buf + len, buf_len - len, "false_mpdu_ack_count = %u\n",
-			 htt_stats_buf->false_mpdu_ack_count);
+			 le32_to_cpu(htt_stats_buf->mpdu_filt_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "false_mpdu_ack_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->false_mpdu_ack_count));
 	len += scnprintf(buf + len, buf_len - len, "txq_timeout = %u\n\n",
-			 htt_stats_buf->txq_timeout);
+			 le32_to_cpu(htt_stats_buf->txq_timeout));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1043,7 +1086,7 @@ htt_print_tx_hwq_difs_latency_stats_tlv_v(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_HWQ_DIFS_LATENCY_STATS_TLV_V:\n");
 	len += scnprintf(buf + len, buf_len - len, "hist_intvl = %u\n",
-			 htt_stats_buf->hist_intvl);
+			 le32_to_cpu(htt_stats_buf->hist_intvl));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->difs_latency_hist,
 			   "difs_latency_hist", data_len, "\n\n");
@@ -1150,8 +1193,9 @@ htt_print_tx_hwq_tried_mpdu_cnt_hist_tlv_v(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_HWQ_TRIED_MPDU_CNT_HIST_TLV_V:\n");
-	len += scnprintf(buf + len, buf_len - len, "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u\n",
-			 htt_stats_buf->hist_bin_size);
+	len += scnprintf(buf + len, buf_len - len,
+			 "TRIED_MPDU_CNT_HIST_BIN_SIZE : %u\n",
+			 le32_to_cpu(htt_stats_buf->hist_bin_size));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->tried_mpdu_cnt_hist,
 			   "tried_mpdu_cnt_hist", num_elements, "\n\n");
@@ -1197,42 +1241,42 @@ static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf,
 	u8 *buf = stats_req->buf;
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
-	const u32 *cbf_20 = htt_stats_buf->cbf_20;
-	const u32 *cbf_40 = htt_stats_buf->cbf_40;
-	const u32 *cbf_80 = htt_stats_buf->cbf_80;
-	const u32 *cbf_160 = htt_stats_buf->cbf_160;
+	const __le32 *cbf_20 = htt_stats_buf->cbf_20;
+	const __le32 *cbf_40 = htt_stats_buf->cbf_40;
+	const __le32 *cbf_80 = htt_stats_buf->cbf_80;
+	const __le32 *cbf_160 = htt_stats_buf->cbf_160;
 
-	if (htt_stats_buf->tx_sounding_mode == HTT_TX_AC_SOUNDING_MODE) {
+	if (le32_to_cpu(htt_stats_buf->tx_sounding_mode) == HTT_TX_AC_SOUNDING_MODE) {
 		len += scnprintf(buf + len, buf_len - len,
 				 "\nHTT_TX_AC_SOUNDING_STATS_TLV:\n\n");
 		len += scnprintf(buf + len, buf_len - len,
 				 "ac_cbf_20 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_20[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_20[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 		len += scnprintf(buf + len, buf_len - len,
 				 "ac_cbf_40 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_40[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_40[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 		len += scnprintf(buf + len, buf_len - len,
 				 "ac_cbf_80 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_80[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_80[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 		len += scnprintf(buf + len, buf_len - len,
 				 "ac_cbf_160 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_160[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_160[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 
 		for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS; i++) {
 			len += scnprintf(buf + len, buf_len - len,
@@ -1243,37 +1287,37 @@ static inline void htt_print_tx_sounding_stats_tlv(const void *tag_buf,
 					 htt_stats_buf->sounding[2],
 					 htt_stats_buf->sounding[3]);
 		}
-	} else if (htt_stats_buf->tx_sounding_mode == HTT_TX_AX_SOUNDING_MODE) {
+	} else if (le32_to_cpu(htt_stats_buf->tx_sounding_mode) == HTT_TX_AX_SOUNDING_MODE) {
 		len += scnprintf(buf + len, buf_len - len,
 				 "\nHTT_TX_AX_SOUNDING_STATS_TLV:\n");
 		len += scnprintf(buf + len, buf_len - len,
 				 "ax_cbf_20 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_20[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_20[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_20[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_20[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 		len += scnprintf(buf + len, buf_len - len,
 				 "ax_cbf_40 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_40[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_40[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_40[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_40[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 		len += scnprintf(buf + len, buf_len - len,
 				 "ax_cbf_80 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_80[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_80[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_80[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_80[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 		len += scnprintf(buf + len, buf_len - len,
 				 "ax_cbf_160 = IBF : %u, SU_SIFS : %u, SU_RBO : %u, MU_SIFS : %u, MU_RBO : %u\n",
-				 cbf_160[HTT_IMPLICIT_TXBF_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS],
-				 cbf_160[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]);
+				 le32_to_cpu(cbf_160[HTT_IMPLICIT_TXBF_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_SU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_SU_RBO_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_MU_SIFS_STEER_STATS]),
+				 le32_to_cpu(cbf_160[HTT_EXPLICIT_TXBF_MU_RBO_STEER_STATS]));
 
 		for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS; i++) {
 			len += scnprintf(buf + len, buf_len - len,
@@ -1303,31 +1347,33 @@ htt_print_tx_selfgen_cmn_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_SELFGEN_CMN_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_SELFGEN_CMN_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "su_bar = %u\n",
-			 htt_stats_buf->su_bar);
+			 le32_to_cpu(htt_stats_buf->su_bar));
 	len += scnprintf(buf + len, buf_len - len, "rts = %u\n",
-			 htt_stats_buf->rts);
+			 le32_to_cpu(htt_stats_buf->rts));
 	len += scnprintf(buf + len, buf_len - len, "cts2self = %u\n",
-			 htt_stats_buf->cts2self);
+			 le32_to_cpu(htt_stats_buf->cts2self));
 	len += scnprintf(buf + len, buf_len - len, "qos_null = %u\n",
-			 htt_stats_buf->qos_null);
+			 le32_to_cpu(htt_stats_buf->qos_null));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_1 = %u\n",
-			 htt_stats_buf->delayed_bar_1);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_1));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_2 = %u\n",
-			 htt_stats_buf->delayed_bar_2);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_2));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_3 = %u\n",
-			 htt_stats_buf->delayed_bar_3);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_3));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_4 = %u\n",
-			 htt_stats_buf->delayed_bar_4);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_4));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_5 = %u\n",
-			 htt_stats_buf->delayed_bar_5);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_5));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_6 = %u\n",
-			 htt_stats_buf->delayed_bar_6);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_6));
 	len += scnprintf(buf + len, buf_len - len, "delayed_bar_7 = %u\n\n",
-			 htt_stats_buf->delayed_bar_7);
+			 le32_to_cpu(htt_stats_buf->delayed_bar_7));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1348,19 +1394,20 @@ htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_SELFGEN_AC_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "ac_su_ndpa = %u\n",
-			 htt_stats_buf->ac_su_ndpa);
+			 le32_to_cpu(htt_stats_buf->ac_su_ndpa));
 	len += scnprintf(buf + len, buf_len - len, "ac_su_ndp = %u\n",
-			 htt_stats_buf->ac_su_ndp);
+			 le32_to_cpu(htt_stats_buf->ac_su_ndp));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_ndpa = %u\n",
-			 htt_stats_buf->ac_mu_mimo_ndpa);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndpa));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_ndp = %u\n",
-			 htt_stats_buf->ac_mu_mimo_ndp);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndp));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_brpoll_1 = %u\n",
-			 htt_stats_buf->ac_mu_mimo_brpoll_1);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_brpoll_1));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_brpoll_2 = %u\n",
-			 htt_stats_buf->ac_mu_mimo_brpoll_2);
-	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_brpoll_3 = %u\n\n",
-			 htt_stats_buf->ac_mu_mimo_brpoll_3);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_brpoll_2));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ac_mu_mimo_brpoll_3 = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_brpoll_3));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1381,37 +1428,37 @@ htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_SELFGEN_AX_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "ax_su_ndpa = %u\n",
-			 htt_stats_buf->ax_su_ndpa);
+			 le32_to_cpu(htt_stats_buf->ax_su_ndpa));
 	len += scnprintf(buf + len, buf_len - len, "ax_su_ndp = %u\n",
-			 htt_stats_buf->ax_su_ndp);
+			 le32_to_cpu(htt_stats_buf->ax_su_ndp));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_ndpa = %u\n",
-			 htt_stats_buf->ax_mu_mimo_ndpa);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndpa));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_ndp = %u\n",
-			 htt_stats_buf->ax_mu_mimo_ndp);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_1 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_1);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_1));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_2 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_2);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_2));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_3 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_3);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_3));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_4 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_4);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_4));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_5 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_5);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_5));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_6 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_6);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_6));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brpoll_7 = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brpoll_7);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brpoll_7));
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
-			 htt_stats_buf->ax_basic_trigger);
+			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_trigger = %u\n",
-			 htt_stats_buf->ax_ulmumimo_trigger);
+			 le32_to_cpu(htt_stats_buf->ax_ulmumimo_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_bsr_trigger = %u\n",
-			 htt_stats_buf->ax_bsr_trigger);
+			 le32_to_cpu(htt_stats_buf->ax_bsr_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_bar_trigger = %u\n",
-			 htt_stats_buf->ax_mu_bar_trigger);
+			 le32_to_cpu(htt_stats_buf->ax_mu_bar_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_rts_trigger = %u\n\n",
-			 htt_stats_buf->ax_mu_rts_trigger);
+			 le32_to_cpu(htt_stats_buf->ax_mu_rts_trigger));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1432,19 +1479,20 @@ htt_print_tx_selfgen_ac_err_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_SELFGEN_AC_ERR_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "ac_su_ndp_err = %u\n",
-			 htt_stats_buf->ac_su_ndp_err);
+			 le32_to_cpu(htt_stats_buf->ac_su_ndp_err));
 	len += scnprintf(buf + len, buf_len - len, "ac_su_ndpa_err = %u\n",
-			 htt_stats_buf->ac_su_ndpa_err);
+			 le32_to_cpu(htt_stats_buf->ac_su_ndpa_err));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_ndpa_err = %u\n",
-			 htt_stats_buf->ac_mu_mimo_ndpa_err);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndpa_err));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_ndp_err = %u\n",
-			 htt_stats_buf->ac_mu_mimo_ndp_err);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndp_err));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_brp1_err = %u\n",
-			 htt_stats_buf->ac_mu_mimo_brp1_err);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_brp1_err));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_brp2_err = %u\n",
-			 htt_stats_buf->ac_mu_mimo_brp2_err);
-	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_brp3_err = %u\n\n",
-			 htt_stats_buf->ac_mu_mimo_brp3_err);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_brp2_err));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ac_mu_mimo_brp3_err = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_brp3_err));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1465,37 +1513,41 @@ htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_SELFGEN_AX_ERR_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "ax_su_ndp_err = %u\n",
-			 htt_stats_buf->ax_su_ndp_err);
+			 le32_to_cpu(htt_stats_buf->ax_su_ndp_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_su_ndpa_err = %u\n",
-			 htt_stats_buf->ax_su_ndpa_err);
+			 le32_to_cpu(htt_stats_buf->ax_su_ndpa_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_ndpa_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_ndpa_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndpa_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_ndp_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_ndp_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp1_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp1_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp1_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp2_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp2_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp2_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp3_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp3_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp3_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp4_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp4_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp4_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp5_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp5_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp5_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp6_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp6_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp6_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_brp7_err = %u\n",
-			 htt_stats_buf->ax_mu_mimo_brp7_err);
-	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger_err = %u\n",
-			 htt_stats_buf->ax_basic_trigger_err);
-	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_trigger_err = %u\n",
-			 htt_stats_buf->ax_ulmumimo_trigger_err);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_brp7_err));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ax_basic_trigger_err = %u\n",
+			 le32_to_cpu(htt_stats_buf->ax_basic_trigger_err));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ax_ulmumimo_trigger_err = %u\n",
+			 le32_to_cpu(htt_stats_buf->ax_ulmumimo_trigger_err));
 	len += scnprintf(buf + len, buf_len - len, "ax_bsr_trigger_err = %u\n",
-			 htt_stats_buf->ax_bsr_trigger_err);
-	len += scnprintf(buf + len, buf_len - len, "ax_mu_bar_trigger_err = %u\n",
-			 htt_stats_buf->ax_mu_bar_trigger_err);
-	len += scnprintf(buf + len, buf_len - len, "ax_mu_rts_trigger_err = %u\n\n",
-			 htt_stats_buf->ax_mu_rts_trigger_err);
+			 le32_to_cpu(htt_stats_buf->ax_bsr_trigger_err));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ax_mu_bar_trigger_err = %u\n",
+			 le32_to_cpu(htt_stats_buf->ax_mu_bar_trigger_err));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ax_mu_rts_trigger_err = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->ax_mu_rts_trigger_err));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1518,11 +1570,12 @@ htt_print_tx_pdev_mu_mimo_sch_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_PDEV_MU_MIMO_SCH_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "mu_mimo_sch_posted = %u\n",
-			 htt_stats_buf->mu_mimo_sch_posted);
+			 le32_to_cpu(htt_stats_buf->mu_mimo_sch_posted));
 	len += scnprintf(buf + len, buf_len - len, "mu_mimo_sch_failed = %u\n",
-			 htt_stats_buf->mu_mimo_sch_failed);
-	len += scnprintf(buf + len, buf_len - len, "mu_mimo_ppdu_posted = %u\n\n",
-			 htt_stats_buf->mu_mimo_ppdu_posted);
+			 le32_to_cpu(htt_stats_buf->mu_mimo_sch_failed));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mu_mimo_ppdu_posted = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->mu_mimo_ppdu_posted));
 
 	for (i = 0; i < HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS; i++)
 		len += scnprintf(buf + len, buf_len - len,
@@ -1596,116 +1649,117 @@ htt_print_tx_pdev_mu_mimo_mpdu_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	if (htt_stats_buf->tx_sched_mode == HTT_STATS_TX_SCHED_MODE_MU_MIMO_AC) {
-		if (!htt_stats_buf->user_index)
+	if (le32_to_cpu(htt_stats_buf->tx_sched_mode) == HTT_STATS_TX_SCHED_MODE_MU_MIMO_AC) {
+		if (!le32_to_cpu(htt_stats_buf->user_index))
 			len += scnprintf(buf + len, buf_len - len,
 					 "HTT_TX_PDEV_MU_MIMO_AC_MPDU_STATS:\n");
 
-		if (htt_stats_buf->user_index <
+		if (le32_to_cpu(htt_stats_buf->user_index) <
 		    HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS) {
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_mpdus_queued_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_queued_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_queued_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_mpdus_tried_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_tried_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_tried_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_mpdus_failed_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_failed_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_failed_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_mpdus_requeued_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_requeued_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_requeued_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_err_no_ba_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->err_no_ba_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->err_no_ba_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_mpdu_underrun_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdu_underrun_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdu_underrun_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ac_mu_mimo_ampdu_underrun_usr_%u = %u\n\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->ampdu_underrun_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->ampdu_underrun_usr));
 		}
 	}
 
-	if (htt_stats_buf->tx_sched_mode == HTT_STATS_TX_SCHED_MODE_MU_MIMO_AX) {
-		if (!htt_stats_buf->user_index)
+	if (le32_to_cpu(htt_stats_buf->tx_sched_mode) == HTT_STATS_TX_SCHED_MODE_MU_MIMO_AX) {
+		if (!le32_to_cpu(htt_stats_buf->user_index))
 			len += scnprintf(buf + len, buf_len - len,
 					 "HTT_TX_PDEV_MU_MIMO_AX_MPDU_STATS:\n");
 
-		if (htt_stats_buf->user_index <
+		if (le32_to_cpu(htt_stats_buf->user_index) <
 		    HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS) {
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_mpdus_queued_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_queued_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_queued_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_mpdus_tried_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_tried_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_tried_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_mpdus_failed_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_failed_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_failed_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_mpdus_requeued_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_requeued_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_requeued_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_err_no_ba_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->err_no_ba_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->err_no_ba_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_mpdu_underrun_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdu_underrun_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdu_underrun_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_mimo_ampdu_underrun_usr_%u = %u\n\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->ampdu_underrun_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->ampdu_underrun_usr));
 		}
 	}
 
-	if (htt_stats_buf->tx_sched_mode == HTT_STATS_TX_SCHED_MODE_MU_OFDMA_AX) {
-		if (!htt_stats_buf->user_index)
+	if (le32_to_cpu(htt_stats_buf->tx_sched_mode) == HTT_STATS_TX_SCHED_MODE_MU_OFDMA_AX) {
+		if (!le32_to_cpu(htt_stats_buf->user_index))
 			len += scnprintf(buf + len, buf_len - len,
 					 "HTT_TX_PDEV_AX_MU_OFDMA_MPDU_STATS:\n");
 
-		if (htt_stats_buf->user_index < HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS) {
+		if (le32_to_cpu(htt_stats_buf->user_index) <
+		    HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS) {
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_mpdus_queued_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_queued_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_queued_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_mpdus_tried_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_tried_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_tried_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_mpdus_failed_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_failed_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_failed_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_mpdus_requeued_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdus_requeued_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdus_requeued_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_err_no_ba_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->err_no_ba_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->err_no_ba_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_mpdu_underrun_usr_%u = %u\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->mpdu_underrun_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->mpdu_underrun_usr));
 			len += scnprintf(buf + len, buf_len - len,
 					 "ax_mu_ofdma_ampdu_underrun_usr_%u = %u\n\n",
-					 htt_stats_buf->user_index,
-					 htt_stats_buf->ampdu_underrun_usr);
+					 le32_to_cpu(htt_stats_buf->user_index),
+					 le32_to_cpu(htt_stats_buf->ampdu_underrun_usr));
 		}
 	}
 
@@ -1830,54 +1884,63 @@ htt_print_tx_pdev_stats_sched_per_txq_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_PDEV_STATS_SCHED_PER_TXQ_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_TX_PDEV_STATS_SCHED_PER_TXQ_MAC_ID,
-				   htt_stats_buf->mac_id__txq_id__word));
-	len += scnprintf(buf + len, buf_len - len, "txq_id = %lu\n",
-			 FIELD_GET(HTT_TX_PDEV_STATS_SCHED_PER_TXQ_ID,
-				   htt_stats_buf->mac_id__txq_id__word));
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__txq_id__word,
+				       HTT_TX_PDEV_STATS_SCHED_PER_TXQ_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len, "txq_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__txq_id__word,
+				       HTT_TX_PDEV_STATS_SCHED_PER_TXQ_ID));
 	len += scnprintf(buf + len, buf_len - len, "sched_policy = %u\n",
-			 htt_stats_buf->sched_policy);
+			 le32_to_cpu(htt_stats_buf->sched_policy));
 	len += scnprintf(buf + len, buf_len - len,
 			 "last_sched_cmd_posted_timestamp = %u\n",
-			 htt_stats_buf->last_sched_cmd_posted_timestamp);
+			 le32_to_cpu(htt_stats_buf->last_sched_cmd_posted_timestamp));
 	len += scnprintf(buf + len, buf_len - len,
 			 "last_sched_cmd_compl_timestamp = %u\n",
-			 htt_stats_buf->last_sched_cmd_compl_timestamp);
-	len += scnprintf(buf + len, buf_len - len, "sched_2_tac_lwm_count = %u\n",
-			 htt_stats_buf->sched_2_tac_lwm_count);
-	len += scnprintf(buf + len, buf_len - len, "sched_2_tac_ring_full = %u\n",
-			 htt_stats_buf->sched_2_tac_ring_full);
-	len += scnprintf(buf + len, buf_len - len, "sched_cmd_post_failure = %u\n",
-			 htt_stats_buf->sched_cmd_post_failure);
+			 le32_to_cpu(htt_stats_buf->last_sched_cmd_compl_timestamp));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sched_2_tac_lwm_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->sched_2_tac_lwm_count));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sched_2_tac_ring_full = %u\n",
+			 le32_to_cpu(htt_stats_buf->sched_2_tac_ring_full));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sched_cmd_post_failure = %u\n",
+			 le32_to_cpu(htt_stats_buf->sched_cmd_post_failure));
 	len += scnprintf(buf + len, buf_len - len, "num_active_tids = %u\n",
-			 htt_stats_buf->num_active_tids);
+			 le32_to_cpu(htt_stats_buf->num_active_tids));
 	len += scnprintf(buf + len, buf_len - len, "num_ps_schedules = %u\n",
-			 htt_stats_buf->num_ps_schedules);
+			 le32_to_cpu(htt_stats_buf->num_ps_schedules));
 	len += scnprintf(buf + len, buf_len - len, "sched_cmds_pending = %u\n",
-			 htt_stats_buf->sched_cmds_pending);
+			 le32_to_cpu(htt_stats_buf->sched_cmds_pending));
 	len += scnprintf(buf + len, buf_len - len, "num_tid_register = %u\n",
-			 htt_stats_buf->num_tid_register);
+			 le32_to_cpu(htt_stats_buf->num_tid_register));
 	len += scnprintf(buf + len, buf_len - len, "num_tid_unregister = %u\n",
-			 htt_stats_buf->num_tid_unregister);
+			 le32_to_cpu(htt_stats_buf->num_tid_unregister));
 	len += scnprintf(buf + len, buf_len - len, "num_qstats_queried = %u\n",
-			 htt_stats_buf->num_qstats_queried);
-	len += scnprintf(buf + len, buf_len - len, "qstats_update_pending = %u\n",
-			 htt_stats_buf->qstats_update_pending);
-	len += scnprintf(buf + len, buf_len - len, "last_qstats_query_timestamp = %u\n",
-			 htt_stats_buf->last_qstats_query_timestamp);
+			 le32_to_cpu(htt_stats_buf->num_qstats_queried));
+	len += scnprintf(buf + len, buf_len - len,
+			 "qstats_update_pending = %u\n",
+			 le32_to_cpu(htt_stats_buf->qstats_update_pending));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_qstats_query_timestamp = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_qstats_query_timestamp));
 	len += scnprintf(buf + len, buf_len - len, "num_tqm_cmdq_full = %u\n",
-			 htt_stats_buf->num_tqm_cmdq_full);
-	len += scnprintf(buf + len, buf_len - len, "num_de_sched_algo_trigger = %u\n",
-			 htt_stats_buf->num_de_sched_algo_trigger);
-	len += scnprintf(buf + len, buf_len - len, "num_rt_sched_algo_trigger = %u\n",
-			 htt_stats_buf->num_rt_sched_algo_trigger);
-	len += scnprintf(buf + len, buf_len - len, "num_tqm_sched_algo_trigger = %u\n",
-			 htt_stats_buf->num_tqm_sched_algo_trigger);
+			 le32_to_cpu(htt_stats_buf->num_tqm_cmdq_full));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_de_sched_algo_trigger = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_de_sched_algo_trigger));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_rt_sched_algo_trigger = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_rt_sched_algo_trigger));
+	len += scnprintf(buf + len, buf_len - len,
+			 "num_tqm_sched_algo_trigger = %u\n",
+			 le32_to_cpu(htt_stats_buf->num_tqm_sched_algo_trigger));
 	len += scnprintf(buf + len, buf_len - len, "notify_sched = %u\n\n",
-			 htt_stats_buf->notify_sched);
-	len += scnprintf(buf + len, buf_len - len, "dur_based_sendn_term = %u\n\n",
-			 htt_stats_buf->dur_based_sendn_term);
+			 le32_to_cpu(htt_stats_buf->notify_sched));
+	len += scnprintf(buf + len, buf_len - len,
+			 "dur_based_sendn_term = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->dur_based_sendn_term));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1895,11 +1958,13 @@ static inline void htt_print_stats_tx_sched_cmn_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_STATS_TX_SCHED_CMN_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_STATS_TX_SCHED_CMN_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "current_timestamp = %u\n\n",
-			 htt_stats_buf->current_timestamp);
+			 le32_to_cpu(htt_stats_buf->current_timestamp));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -1995,67 +2060,72 @@ htt_print_tx_tqm_pdev_stats_tlv_v(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_PDEV_STATS_TLV_V:\n");
 	len += scnprintf(buf + len, buf_len - len, "msdu_count = %u\n",
-			 htt_stats_buf->msdu_count);
+			 le32_to_cpu(htt_stats_buf->msdu_count));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_count = %u\n",
-			 htt_stats_buf->mpdu_count);
+			 le32_to_cpu(htt_stats_buf->mpdu_count));
 	len += scnprintf(buf + len, buf_len - len, "remove_msdu = %u\n",
-			 htt_stats_buf->remove_msdu);
+			 le32_to_cpu(htt_stats_buf->remove_msdu));
 	len += scnprintf(buf + len, buf_len - len, "remove_mpdu = %u\n",
-			 htt_stats_buf->remove_mpdu);
+			 le32_to_cpu(htt_stats_buf->remove_mpdu));
 	len += scnprintf(buf + len, buf_len - len, "remove_msdu_ttl = %u\n",
-			 htt_stats_buf->remove_msdu_ttl);
+			 le32_to_cpu(htt_stats_buf->remove_msdu_ttl));
 	len += scnprintf(buf + len, buf_len - len, "send_bar = %u\n",
-			 htt_stats_buf->send_bar);
+			 le32_to_cpu(htt_stats_buf->send_bar));
 	len += scnprintf(buf + len, buf_len - len, "bar_sync = %u\n",
-			 htt_stats_buf->bar_sync);
+			 le32_to_cpu(htt_stats_buf->bar_sync));
 	len += scnprintf(buf + len, buf_len - len, "notify_mpdu = %u\n",
-			 htt_stats_buf->notify_mpdu);
+			 le32_to_cpu(htt_stats_buf->notify_mpdu));
 	len += scnprintf(buf + len, buf_len - len, "sync_cmd = %u\n",
-			 htt_stats_buf->sync_cmd);
+			 le32_to_cpu(htt_stats_buf->sync_cmd));
 	len += scnprintf(buf + len, buf_len - len, "write_cmd = %u\n",
-			 htt_stats_buf->write_cmd);
+			 le32_to_cpu(htt_stats_buf->write_cmd));
 	len += scnprintf(buf + len, buf_len - len, "hwsch_trigger = %u\n",
-			 htt_stats_buf->hwsch_trigger);
+			 le32_to_cpu(htt_stats_buf->hwsch_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ack_tlv_proc = %u\n",
-			 htt_stats_buf->ack_tlv_proc);
+			 le32_to_cpu(htt_stats_buf->ack_tlv_proc));
 	len += scnprintf(buf + len, buf_len - len, "gen_mpdu_cmd = %u\n",
-			 htt_stats_buf->gen_mpdu_cmd);
+			 le32_to_cpu(htt_stats_buf->gen_mpdu_cmd));
 	len += scnprintf(buf + len, buf_len - len, "gen_list_cmd = %u\n",
-			 htt_stats_buf->gen_list_cmd);
+			 le32_to_cpu(htt_stats_buf->gen_list_cmd));
 	len += scnprintf(buf + len, buf_len - len, "remove_mpdu_cmd = %u\n",
-			 htt_stats_buf->remove_mpdu_cmd);
-	len += scnprintf(buf + len, buf_len - len, "remove_mpdu_tried_cmd = %u\n",
-			 htt_stats_buf->remove_mpdu_tried_cmd);
-	len += scnprintf(buf + len, buf_len - len, "mpdu_queue_stats_cmd = %u\n",
-			 htt_stats_buf->mpdu_queue_stats_cmd);
+			 le32_to_cpu(htt_stats_buf->remove_mpdu_cmd));
+	len += scnprintf(buf + len, buf_len - len,
+			 "remove_mpdu_tried_cmd = %u\n",
+			 le32_to_cpu(htt_stats_buf->remove_mpdu_tried_cmd));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mpdu_queue_stats_cmd = %u\n",
+			 le32_to_cpu(htt_stats_buf->mpdu_queue_stats_cmd));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_head_info_cmd = %u\n",
-			 htt_stats_buf->mpdu_head_info_cmd);
+			 le32_to_cpu(htt_stats_buf->mpdu_head_info_cmd));
 	len += scnprintf(buf + len, buf_len - len, "msdu_flow_stats_cmd = %u\n",
-			 htt_stats_buf->msdu_flow_stats_cmd);
+			 le32_to_cpu(htt_stats_buf->msdu_flow_stats_cmd));
 	len += scnprintf(buf + len, buf_len - len, "remove_msdu_cmd = %u\n",
-			 htt_stats_buf->remove_msdu_cmd);
+			 le32_to_cpu(htt_stats_buf->remove_msdu_cmd));
 	len += scnprintf(buf + len, buf_len - len, "remove_msdu_ttl_cmd = %u\n",
-			 htt_stats_buf->remove_msdu_ttl_cmd);
+			 le32_to_cpu(htt_stats_buf->remove_msdu_ttl_cmd));
 	len += scnprintf(buf + len, buf_len - len, "flush_cache_cmd = %u\n",
-			 htt_stats_buf->flush_cache_cmd);
+			 le32_to_cpu(htt_stats_buf->flush_cache_cmd));
 	len += scnprintf(buf + len, buf_len - len, "update_mpduq_cmd = %u\n",
-			 htt_stats_buf->update_mpduq_cmd);
+			 le32_to_cpu(htt_stats_buf->update_mpduq_cmd));
 	len += scnprintf(buf + len, buf_len - len, "enqueue = %u\n",
-			 htt_stats_buf->enqueue);
+			 le32_to_cpu(htt_stats_buf->enqueue));
 	len += scnprintf(buf + len, buf_len - len, "enqueue_notify = %u\n",
-			 htt_stats_buf->enqueue_notify);
+			 le32_to_cpu(htt_stats_buf->enqueue_notify));
 	len += scnprintf(buf + len, buf_len - len, "notify_mpdu_at_head = %u\n",
-			 htt_stats_buf->notify_mpdu_at_head);
-	len += scnprintf(buf + len, buf_len - len, "notify_mpdu_state_valid = %u\n",
-			 htt_stats_buf->notify_mpdu_state_valid);
+			 le32_to_cpu(htt_stats_buf->notify_mpdu_at_head));
+	len += scnprintf(buf + len, buf_len - len,
+			 "notify_mpdu_state_valid = %u\n",
+			 le32_to_cpu(htt_stats_buf->notify_mpdu_state_valid));
 	len += scnprintf(buf + len, buf_len - len, "sched_udp_notify1 = %u\n",
-			 htt_stats_buf->sched_udp_notify1);
+			 le32_to_cpu(htt_stats_buf->sched_udp_notify1));
 	len += scnprintf(buf + len, buf_len - len, "sched_udp_notify2 = %u\n",
-			 htt_stats_buf->sched_udp_notify2);
-	len += scnprintf(buf + len, buf_len - len, "sched_nonudp_notify1 = %u\n",
-			 htt_stats_buf->sched_nonudp_notify1);
-	len += scnprintf(buf + len, buf_len - len, "sched_nonudp_notify2 = %u\n\n",
-			 htt_stats_buf->sched_nonudp_notify2);
+			 le32_to_cpu(htt_stats_buf->sched_udp_notify2));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sched_nonudp_notify1 = %u\n",
+			 le32_to_cpu(htt_stats_buf->sched_nonudp_notify1));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sched_nonudp_notify2 = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->sched_nonudp_notify2));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2073,23 +2143,26 @@ static inline void htt_print_tx_tqm_cmn_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_CMN_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_TQM_CMN_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "max_cmdq_id = %u\n",
-			 htt_stats_buf->max_cmdq_id);
-	len += scnprintf(buf + len, buf_len - len, "list_mpdu_cnt_hist_intvl = %u\n",
-			 htt_stats_buf->list_mpdu_cnt_hist_intvl);
+			 le32_to_cpu(htt_stats_buf->max_cmdq_id));
+	len += scnprintf(buf + len, buf_len - len,
+			 "list_mpdu_cnt_hist_intvl = %u\n",
+			 le32_to_cpu(htt_stats_buf->list_mpdu_cnt_hist_intvl));
 	len += scnprintf(buf + len, buf_len - len, "add_msdu = %u\n",
-			 htt_stats_buf->add_msdu);
+			 le32_to_cpu(htt_stats_buf->add_msdu));
 	len += scnprintf(buf + len, buf_len - len, "q_empty = %u\n",
-			 htt_stats_buf->q_empty);
+			 le32_to_cpu(htt_stats_buf->q_empty));
 	len += scnprintf(buf + len, buf_len - len, "q_not_empty = %u\n",
-			 htt_stats_buf->q_not_empty);
+			 le32_to_cpu(htt_stats_buf->q_not_empty));
 	len += scnprintf(buf + len, buf_len - len, "drop_notification = %u\n",
-			 htt_stats_buf->drop_notification);
+			 le32_to_cpu(htt_stats_buf->drop_notification));
 	len += scnprintf(buf + len, buf_len - len, "desc_threshold = %u\n\n",
-			 htt_stats_buf->desc_threshold);
+			 le32_to_cpu(htt_stats_buf->desc_threshold));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2109,11 +2182,11 @@ static inline void htt_print_tx_tqm_error_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_ERROR_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "q_empty_failure = %u\n",
-			 htt_stats_buf->q_empty_failure);
+			 le32_to_cpu(htt_stats_buf->q_empty_failure));
 	len += scnprintf(buf + len, buf_len - len, "q_not_empty_failure = %u\n",
-			 htt_stats_buf->q_not_empty_failure);
+			 le32_to_cpu(htt_stats_buf->q_not_empty_failure));
 	len += scnprintf(buf + len, buf_len - len, "add_msdu_failure = %u\n\n",
-			 htt_stats_buf->add_msdu_failure);
+			 le32_to_cpu(htt_stats_buf->add_msdu_failure));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2131,35 +2204,37 @@ static inline void htt_print_tx_tqm_cmdq_status_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_CMDQ_STATUS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_TX_TQM_CMDQ_STATUS_MAC_ID,
-				   htt_stats_buf->mac_id__cmdq_id__word));
-	len += scnprintf(buf + len, buf_len - len, "cmdq_id = %lu\n\n",
-			 FIELD_GET(HTT_TX_TQM_CMDQ_STATUS_CMDQ_ID,
-				   htt_stats_buf->mac_id__cmdq_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_TQM_CMDQ_STATUS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__cmdq_id__word,
+				       HTT_TX_TQM_CMDQ_STATUS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len, "cmdq_id = %u\n\n",
+			 le32_get_bits(htt_stats_buf->mac_id__cmdq_id__word,
+				       HTT_TX_TQM_CMDQ_STATUS_CMDQ_ID));
 	len += scnprintf(buf + len, buf_len - len, "sync_cmd = %u\n",
-			 htt_stats_buf->sync_cmd);
+			 le32_to_cpu(htt_stats_buf->sync_cmd));
 	len += scnprintf(buf + len, buf_len - len, "write_cmd = %u\n",
-			 htt_stats_buf->write_cmd);
+			 le32_to_cpu(htt_stats_buf->write_cmd));
 	len += scnprintf(buf + len, buf_len - len, "gen_mpdu_cmd = %u\n",
-			 htt_stats_buf->gen_mpdu_cmd);
-	len += scnprintf(buf + len, buf_len - len, "mpdu_queue_stats_cmd = %u\n",
-			 htt_stats_buf->mpdu_queue_stats_cmd);
+			 le32_to_cpu(htt_stats_buf->gen_mpdu_cmd));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mpdu_queue_stats_cmd = %u\n",
+			 le32_to_cpu(htt_stats_buf->mpdu_queue_stats_cmd));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_head_info_cmd = %u\n",
-			 htt_stats_buf->mpdu_head_info_cmd);
+			 le32_to_cpu(htt_stats_buf->mpdu_head_info_cmd));
 	len += scnprintf(buf + len, buf_len - len, "msdu_flow_stats_cmd = %u\n",
-			 htt_stats_buf->msdu_flow_stats_cmd);
+			 le32_to_cpu(htt_stats_buf->msdu_flow_stats_cmd));
 	len += scnprintf(buf + len, buf_len - len, "remove_mpdu_cmd = %u\n",
-			 htt_stats_buf->remove_mpdu_cmd);
+			 le32_to_cpu(htt_stats_buf->remove_mpdu_cmd));
 	len += scnprintf(buf + len, buf_len - len, "remove_msdu_cmd = %u\n",
-			 htt_stats_buf->remove_msdu_cmd);
+			 le32_to_cpu(htt_stats_buf->remove_msdu_cmd));
 	len += scnprintf(buf + len, buf_len - len, "flush_cache_cmd = %u\n",
-			 htt_stats_buf->flush_cache_cmd);
+			 le32_to_cpu(htt_stats_buf->flush_cache_cmd));
 	len += scnprintf(buf + len, buf_len - len, "update_mpduq_cmd = %u\n",
-			 htt_stats_buf->update_mpduq_cmd);
+			 le32_to_cpu(htt_stats_buf->update_mpduq_cmd));
 	len += scnprintf(buf + len, buf_len - len, "update_msduq_cmd = %u\n\n",
-			 htt_stats_buf->update_msduq_cmd);
+			 le32_to_cpu(htt_stats_buf->update_msduq_cmd));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2181,17 +2256,17 @@ htt_print_tx_de_eapol_packets_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			   "HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "m1_packets = %u\n",
-			 htt_stats_buf->m1_packets);
+			 le32_to_cpu(htt_stats_buf->m1_packets));
 	len += scnprintf(buf + len, buf_len - len, "m2_packets = %u\n",
-			 htt_stats_buf->m2_packets);
+			 le32_to_cpu(htt_stats_buf->m2_packets));
 	len += scnprintf(buf + len, buf_len - len, "m3_packets = %u\n",
-			 htt_stats_buf->m3_packets);
+			 le32_to_cpu(htt_stats_buf->m3_packets));
 	len += scnprintf(buf + len, buf_len - len, "m4_packets = %u\n",
-			 htt_stats_buf->m4_packets);
+			 le32_to_cpu(htt_stats_buf->m4_packets));
 	len += scnprintf(buf + len, buf_len - len, "g1_packets = %u\n",
-			 htt_stats_buf->g1_packets);
+			 le32_to_cpu(htt_stats_buf->g1_packets));
 	len += scnprintf(buf + len, buf_len - len, "g2_packets = %u\n\n",
-			 htt_stats_buf->g2_packets);
+			 le32_to_cpu(htt_stats_buf->g2_packets));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2212,32 +2287,39 @@ htt_print_tx_de_classify_failed_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len,
 			   "HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "ap_bss_peer_not_found = %u\n",
-			 htt_stats_buf->ap_bss_peer_not_found);
-	len += scnprintf(buf + len, buf_len - len, "ap_bcast_mcast_no_peer = %u\n",
-			 htt_stats_buf->ap_bcast_mcast_no_peer);
-	len += scnprintf(buf + len, buf_len - len, "sta_delete_in_progress = %u\n",
-			 htt_stats_buf->sta_delete_in_progress);
+	len += scnprintf(buf + len, buf_len - len,
+			 "ap_bss_peer_not_found = %u\n",
+			 le32_to_cpu(htt_stats_buf->ap_bss_peer_not_found));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ap_bcast_mcast_no_peer = %u\n",
+			 le32_to_cpu(htt_stats_buf->ap_bcast_mcast_no_peer));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sta_delete_in_progress = %u\n",
+			 le32_to_cpu(htt_stats_buf->sta_delete_in_progress));
 	len += scnprintf(buf + len, buf_len - len, "ibss_no_bss_peer = %u\n",
-			 htt_stats_buf->ibss_no_bss_peer);
+			 le32_to_cpu(htt_stats_buf->ibss_no_bss_peer));
 	len += scnprintf(buf + len, buf_len - len, "invalid_vdev_type = %u\n",
-			 htt_stats_buf->invalid_vdev_type);
-	len += scnprintf(buf + len, buf_len - len, "invalid_ast_peer_entry = %u\n",
-			 htt_stats_buf->invalid_ast_peer_entry);
+			 le32_to_cpu(htt_stats_buf->invalid_vdev_type));
+	len += scnprintf(buf + len, buf_len - len,
+			 "invalid_ast_peer_entry = %u\n",
+			 le32_to_cpu(htt_stats_buf->invalid_ast_peer_entry));
 	len += scnprintf(buf + len, buf_len - len, "peer_entry_invalid = %u\n",
-			 htt_stats_buf->peer_entry_invalid);
+			 le32_to_cpu(htt_stats_buf->peer_entry_invalid));
 	len += scnprintf(buf + len, buf_len - len, "ethertype_not_ip = %u\n",
-			 htt_stats_buf->ethertype_not_ip);
+			 le32_to_cpu(htt_stats_buf->ethertype_not_ip));
 	len += scnprintf(buf + len, buf_len - len, "eapol_lookup_failed = %u\n",
-			 htt_stats_buf->eapol_lookup_failed);
-	len += scnprintf(buf + len, buf_len - len, "qpeer_not_allow_data = %u\n",
-			 htt_stats_buf->qpeer_not_allow_data);
+			 le32_to_cpu(htt_stats_buf->eapol_lookup_failed));
+	len += scnprintf(buf + len, buf_len - len,
+			 "qpeer_not_allow_data = %u\n",
+			 le32_to_cpu(htt_stats_buf->qpeer_not_allow_data));
 	len += scnprintf(buf + len, buf_len - len, "fse_tid_override = %u\n",
-			 htt_stats_buf->fse_tid_override);
-	len += scnprintf(buf + len, buf_len - len, "ipv6_jumbogram_zero_length = %u\n",
-			 htt_stats_buf->ipv6_jumbogram_zero_length);
-	len += scnprintf(buf + len, buf_len - len, "qos_to_non_qos_in_prog = %u\n\n",
-			 htt_stats_buf->qos_to_non_qos_in_prog);
+			 le32_to_cpu(htt_stats_buf->fse_tid_override));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ipv6_jumbogram_zero_length = %u\n",
+			 le32_to_cpu(htt_stats_buf->ipv6_jumbogram_zero_length));
+	len += scnprintf(buf + len, buf_len - len,
+			 "qos_to_non_qos_in_prog = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->qos_to_non_qos_in_prog));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2258,71 +2340,81 @@ htt_print_tx_de_classify_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_DE_CLASSIFY_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "arp_packets = %u\n",
-			 htt_stats_buf->arp_packets);
+			 le32_to_cpu(htt_stats_buf->arp_packets));
 	len += scnprintf(buf + len, buf_len - len, "igmp_packets = %u\n",
-			 htt_stats_buf->igmp_packets);
+			 le32_to_cpu(htt_stats_buf->igmp_packets));
 	len += scnprintf(buf + len, buf_len - len, "dhcp_packets = %u\n",
-			 htt_stats_buf->dhcp_packets);
+			 le32_to_cpu(htt_stats_buf->dhcp_packets));
 	len += scnprintf(buf + len, buf_len - len, "host_inspected = %u\n",
-			 htt_stats_buf->host_inspected);
+			 le32_to_cpu(htt_stats_buf->host_inspected));
 	len += scnprintf(buf + len, buf_len - len, "htt_included = %u\n",
-			 htt_stats_buf->htt_included);
+			 le32_to_cpu(htt_stats_buf->htt_included));
 	len += scnprintf(buf + len, buf_len - len, "htt_valid_mcs = %u\n",
-			 htt_stats_buf->htt_valid_mcs);
+			 le32_to_cpu(htt_stats_buf->htt_valid_mcs));
 	len += scnprintf(buf + len, buf_len - len, "htt_valid_nss = %u\n",
-			 htt_stats_buf->htt_valid_nss);
-	len += scnprintf(buf + len, buf_len - len, "htt_valid_preamble_type = %u\n",
-			 htt_stats_buf->htt_valid_preamble_type);
+			 le32_to_cpu(htt_stats_buf->htt_valid_nss));
+	len += scnprintf(buf + len, buf_len - len,
+			 "htt_valid_preamble_type = %u\n",
+			 le32_to_cpu(htt_stats_buf->htt_valid_preamble_type));
 	len += scnprintf(buf + len, buf_len - len, "htt_valid_chainmask = %u\n",
-			 htt_stats_buf->htt_valid_chainmask);
-	len += scnprintf(buf + len, buf_len - len, "htt_valid_guard_interval = %u\n",
-			 htt_stats_buf->htt_valid_guard_interval);
+			 le32_to_cpu(htt_stats_buf->htt_valid_chainmask));
+	len += scnprintf(buf + len, buf_len - len,
+			 "htt_valid_guard_interval = %u\n",
+			 le32_to_cpu(htt_stats_buf->htt_valid_guard_interval));
 	len += scnprintf(buf + len, buf_len - len, "htt_valid_retries = %u\n",
-			 htt_stats_buf->htt_valid_retries);
+			 le32_to_cpu(htt_stats_buf->htt_valid_retries));
 	len += scnprintf(buf + len, buf_len - len, "htt_valid_bw_info = %u\n",
-			 htt_stats_buf->htt_valid_bw_info);
+			 le32_to_cpu(htt_stats_buf->htt_valid_bw_info));
 	len += scnprintf(buf + len, buf_len - len, "htt_valid_power = %u\n",
-			 htt_stats_buf->htt_valid_power);
-	len += scnprintf(buf + len, buf_len - len, "htt_valid_key_flags = 0x%x\n",
-			 htt_stats_buf->htt_valid_key_flags);
-	len += scnprintf(buf + len, buf_len - len, "htt_valid_no_encryption = %u\n",
-			 htt_stats_buf->htt_valid_no_encryption);
+			 le32_to_cpu(htt_stats_buf->htt_valid_power));
+	len += scnprintf(buf + len, buf_len - len,
+			 "htt_valid_key_flags = 0x%x\n",
+			 le32_to_cpu(htt_stats_buf->htt_valid_key_flags));
+	len += scnprintf(buf + len, buf_len - len,
+			 "htt_valid_no_encryption = %u\n",
+			 le32_to_cpu(htt_stats_buf->htt_valid_no_encryption));
 	len += scnprintf(buf + len, buf_len - len, "fse_entry_count = %u\n",
-			 htt_stats_buf->fse_entry_count);
+			 le32_to_cpu(htt_stats_buf->fse_entry_count));
 	len += scnprintf(buf + len, buf_len - len, "fse_priority_be = %u\n",
-			 htt_stats_buf->fse_priority_be);
+			 le32_to_cpu(htt_stats_buf->fse_priority_be));
 	len += scnprintf(buf + len, buf_len - len, "fse_priority_high = %u\n",
-			 htt_stats_buf->fse_priority_high);
+			 le32_to_cpu(htt_stats_buf->fse_priority_high));
 	len += scnprintf(buf + len, buf_len - len, "fse_priority_low = %u\n",
-			 htt_stats_buf->fse_priority_low);
+			 le32_to_cpu(htt_stats_buf->fse_priority_low));
 	len += scnprintf(buf + len, buf_len - len, "fse_traffic_ptrn_be = %u\n",
-			 htt_stats_buf->fse_traffic_ptrn_be);
-	len += scnprintf(buf + len, buf_len - len, "fse_traffic_ptrn_over_sub = %u\n",
-			 htt_stats_buf->fse_traffic_ptrn_over_sub);
-	len += scnprintf(buf + len, buf_len - len, "fse_traffic_ptrn_bursty = %u\n",
-			 htt_stats_buf->fse_traffic_ptrn_bursty);
-	len += scnprintf(buf + len, buf_len - len, "fse_traffic_ptrn_interactive = %u\n",
-			 htt_stats_buf->fse_traffic_ptrn_interactive);
-	len += scnprintf(buf + len, buf_len - len, "fse_traffic_ptrn_periodic = %u\n",
-			 htt_stats_buf->fse_traffic_ptrn_periodic);
+			 le32_to_cpu(htt_stats_buf->fse_traffic_ptrn_be));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fse_traffic_ptrn_over_sub = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_traffic_ptrn_over_sub));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fse_traffic_ptrn_bursty = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_traffic_ptrn_bursty));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fse_traffic_ptrn_interactive = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_traffic_ptrn_interactive));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fse_traffic_ptrn_periodic = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_traffic_ptrn_periodic));
 	len += scnprintf(buf + len, buf_len - len, "fse_hwqueue_alloc = %u\n",
-			 htt_stats_buf->fse_hwqueue_alloc);
+			 le32_to_cpu(htt_stats_buf->fse_hwqueue_alloc));
 	len += scnprintf(buf + len, buf_len - len, "fse_hwqueue_created = %u\n",
-			 htt_stats_buf->fse_hwqueue_created);
-	len += scnprintf(buf + len, buf_len - len, "fse_hwqueue_send_to_host = %u\n",
-			 htt_stats_buf->fse_hwqueue_send_to_host);
+			 le32_to_cpu(htt_stats_buf->fse_hwqueue_created));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fse_hwqueue_send_to_host = %u\n",
+			 le32_to_cpu(htt_stats_buf->fse_hwqueue_send_to_host));
 	len += scnprintf(buf + len, buf_len - len, "mcast_entry = %u\n",
-			 htt_stats_buf->mcast_entry);
+			 le32_to_cpu(htt_stats_buf->mcast_entry));
 	len += scnprintf(buf + len, buf_len - len, "bcast_entry = %u\n",
-			 htt_stats_buf->bcast_entry);
-	len += scnprintf(buf + len, buf_len - len, "htt_update_peer_cache = %u\n",
-			 htt_stats_buf->htt_update_peer_cache);
+			 le32_to_cpu(htt_stats_buf->bcast_entry));
+	len += scnprintf(buf + len, buf_len - len,
+			 "htt_update_peer_cache = %u\n",
+			 le32_to_cpu(htt_stats_buf->htt_update_peer_cache));
 	len += scnprintf(buf + len, buf_len - len, "htt_learning_frame = %u\n",
-			 htt_stats_buf->htt_learning_frame);
+			 le32_to_cpu(htt_stats_buf->htt_learning_frame));
 	len += scnprintf(buf + len, buf_len - len, "fse_invalid_peer = %u\n",
-			 htt_stats_buf->fse_invalid_peer);
+			 le32_to_cpu(htt_stats_buf->fse_invalid_peer));
 	len += scnprintf(buf + len, buf_len - len, "mec_notify = %u\n\n",
-			 htt_stats_buf->mec_notify);
+			 le32_to_cpu(htt_stats_buf->mec_notify));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2344,21 +2436,22 @@ htt_print_tx_de_classify_status_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			   "HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "eok = %u\n",
-			 htt_stats_buf->eok);
+			 le32_to_cpu(htt_stats_buf->eok));
 	len += scnprintf(buf + len, buf_len - len, "classify_done = %u\n",
-			 htt_stats_buf->classify_done);
+			 le32_to_cpu(htt_stats_buf->classify_done));
 	len += scnprintf(buf + len, buf_len - len, "lookup_failed = %u\n",
-			 htt_stats_buf->lookup_failed);
+			 le32_to_cpu(htt_stats_buf->lookup_failed));
 	len += scnprintf(buf + len, buf_len - len, "send_host_dhcp = %u\n",
-			 htt_stats_buf->send_host_dhcp);
+			 le32_to_cpu(htt_stats_buf->send_host_dhcp));
 	len += scnprintf(buf + len, buf_len - len, "send_host_mcast = %u\n",
-			 htt_stats_buf->send_host_mcast);
-	len += scnprintf(buf + len, buf_len - len, "send_host_unknown_dest = %u\n",
-			 htt_stats_buf->send_host_unknown_dest);
+			 le32_to_cpu(htt_stats_buf->send_host_mcast));
+	len += scnprintf(buf + len, buf_len - len,
+			 "send_host_unknown_dest = %u\n",
+			 le32_to_cpu(htt_stats_buf->send_host_unknown_dest));
 	len += scnprintf(buf + len, buf_len - len, "send_host = %u\n",
-			 htt_stats_buf->send_host);
+			 le32_to_cpu(htt_stats_buf->send_host));
 	len += scnprintf(buf + len, buf_len - len, "status_invalid = %u\n\n",
-			 htt_stats_buf->status_invalid);
+			 le32_to_cpu(htt_stats_buf->status_invalid));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2380,11 +2473,11 @@ htt_print_tx_de_enqueue_packets_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "enqueued_pkts = %u\n",
-			 htt_stats_buf->enqueued_pkts);
+			 le32_to_cpu(htt_stats_buf->enqueued_pkts));
 	len += scnprintf(buf + len, buf_len - len, "to_tqm = %u\n",
-			 htt_stats_buf->to_tqm);
+			 le32_to_cpu(htt_stats_buf->to_tqm));
 	len += scnprintf(buf + len, buf_len - len, "to_tqm_bypass = %u\n\n",
-			 htt_stats_buf->to_tqm_bypass);
+			 le32_to_cpu(htt_stats_buf->to_tqm_bypass));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2406,11 +2499,11 @@ htt_print_tx_de_enqueue_discard_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "discarded_pkts = %u\n",
-			 htt_stats_buf->discarded_pkts);
+			 le32_to_cpu(htt_stats_buf->discarded_pkts));
 	len += scnprintf(buf + len, buf_len - len, "local_frames = %u\n",
-			 htt_stats_buf->local_frames);
+			 le32_to_cpu(htt_stats_buf->local_frames));
 	len += scnprintf(buf + len, buf_len - len, "is_ext_msdu = %u\n\n",
-			 htt_stats_buf->is_ext_msdu);
+			 le32_to_cpu(htt_stats_buf->is_ext_msdu));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2430,15 +2523,15 @@ static inline void htt_print_tx_de_compl_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_TX_DE_COMPL_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "tcl_dummy_frame = %u\n",
-			 htt_stats_buf->tcl_dummy_frame);
+			 le32_to_cpu(htt_stats_buf->tcl_dummy_frame));
 	len += scnprintf(buf + len, buf_len - len, "tqm_dummy_frame = %u\n",
-			 htt_stats_buf->tqm_dummy_frame);
+			 le32_to_cpu(htt_stats_buf->tqm_dummy_frame));
 	len += scnprintf(buf + len, buf_len - len, "tqm_notify_frame = %u\n",
-			 htt_stats_buf->tqm_notify_frame);
+			 le32_to_cpu(htt_stats_buf->tqm_notify_frame));
 	len += scnprintf(buf + len, buf_len - len, "fw2wbm_enq = %u\n",
-			 htt_stats_buf->fw2wbm_enq);
+			 le32_to_cpu(htt_stats_buf->fw2wbm_enq));
 	len += scnprintf(buf + len, buf_len - len, "tqm_bypass_frame = %u\n\n",
-			 htt_stats_buf->tqm_bypass_frame);
+			 le32_to_cpu(htt_stats_buf->tqm_bypass_frame));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2481,21 +2574,25 @@ htt_print_tx_de_cmn_stats_tlv(const void *tag_buf, struct debug_htt_stats_req *s
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_DE_CMN_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_DE_CMN_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "tcl2fw_entry_count = %u\n",
-			 htt_stats_buf->tcl2fw_entry_count);
+			 le32_to_cpu(htt_stats_buf->tcl2fw_entry_count));
 	len += scnprintf(buf + len, buf_len - len, "not_to_fw = %u\n",
-			 htt_stats_buf->not_to_fw);
-	len += scnprintf(buf + len, buf_len - len, "invalid_pdev_vdev_peer = %u\n",
-			 htt_stats_buf->invalid_pdev_vdev_peer);
-	len += scnprintf(buf + len, buf_len - len, "tcl_res_invalid_addrx = %u\n",
-			 htt_stats_buf->tcl_res_invalid_addrx);
+			 le32_to_cpu(htt_stats_buf->not_to_fw));
+	len += scnprintf(buf + len, buf_len - len,
+			 "invalid_pdev_vdev_peer = %u\n",
+			 le32_to_cpu(htt_stats_buf->invalid_pdev_vdev_peer));
+	len += scnprintf(buf + len, buf_len - len,
+			 "tcl_res_invalid_addrx = %u\n",
+			 le32_to_cpu(htt_stats_buf->tcl_res_invalid_addrx));
 	len += scnprintf(buf + len, buf_len - len, "wbm2fw_entry_count = %u\n",
-			 htt_stats_buf->wbm2fw_entry_count);
+			 le32_to_cpu(htt_stats_buf->wbm2fw_entry_count));
 	len += scnprintf(buf + len, buf_len - len, "invalid_pdev = %u\n\n",
-			 htt_stats_buf->invalid_pdev);
+			 le32_to_cpu(htt_stats_buf->invalid_pdev));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2515,43 +2612,45 @@ static inline void htt_print_ring_if_stats_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_RING_IF_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "base_addr = %u\n",
-			 htt_stats_buf->base_addr);
+			 le32_to_cpu(htt_stats_buf->base_addr));
 	len += scnprintf(buf + len, buf_len - len, "elem_size = %u\n",
-			 htt_stats_buf->elem_size);
-	len += scnprintf(buf + len, buf_len - len, "num_elems = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_NUM_ELEMS,
-				   htt_stats_buf->num_elems__prefetch_tail_idx));
-	len += scnprintf(buf + len, buf_len - len, "prefetch_tail_idx = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_PREFETCH_TAIL_INDEX,
-				   htt_stats_buf->num_elems__prefetch_tail_idx));
-	len += scnprintf(buf + len, buf_len - len, "head_idx = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_HEAD_IDX,
-				   htt_stats_buf->head_idx__tail_idx));
-	len += scnprintf(buf + len, buf_len - len, "tail_idx = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_TAIL_IDX,
-				   htt_stats_buf->head_idx__tail_idx));
-	len += scnprintf(buf + len, buf_len - len, "shadow_head_idx = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_SHADOW_HEAD_IDX,
-				   htt_stats_buf->shadow_head_idx__shadow_tail_idx));
-	len += scnprintf(buf + len, buf_len - len, "shadow_tail_idx = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_SHADOW_TAIL_IDX,
-				   htt_stats_buf->shadow_head_idx__shadow_tail_idx));
+			 le32_to_cpu(htt_stats_buf->elem_size));
+	len += scnprintf(buf + len, buf_len - len, "num_elems = %u\n",
+			 le32_get_bits(htt_stats_buf->num_elems__prefetch_tail_idx,
+				       HTT_RING_IF_STATS_NUM_ELEMS));
+	len += scnprintf(buf + len, buf_len - len, "prefetch_tail_idx = %u\n",
+			 le32_get_bits(htt_stats_buf->num_elems__prefetch_tail_idx,
+				       HTT_RING_IF_STATS_PREFETCH_TAIL_INDEX));
+	len += scnprintf(buf + len, buf_len - len, "head_idx = %u\n",
+			 le32_get_bits(htt_stats_buf->head_idx__tail_idx,
+				       HTT_RING_IF_STATS_HEAD_IDX));
+	len += scnprintf(buf + len, buf_len - len, "tail_idx = %u\n",
+			 le32_get_bits(htt_stats_buf->head_idx__tail_idx,
+				       HTT_RING_IF_STATS_TAIL_IDX));
+	len += scnprintf(buf + len, buf_len - len, "shadow_head_idx = %u\n",
+			 le32_get_bits(htt_stats_buf->shadow_head_idx__shadow_tail_idx,
+				       HTT_RING_IF_STATS_SHADOW_HEAD_IDX));
+	len += scnprintf(buf + len, buf_len - len, "shadow_tail_idx = %u\n",
+			 le32_get_bits(htt_stats_buf->shadow_head_idx__shadow_tail_idx,
+				       HTT_RING_IF_STATS_SHADOW_TAIL_IDX));
 	len += scnprintf(buf + len, buf_len - len, "num_tail_incr = %u\n",
-			 htt_stats_buf->num_tail_incr);
-	len += scnprintf(buf + len, buf_len - len, "lwm_thresh = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_LWM_THRESH,
-				   htt_stats_buf->lwm_thresh__hwm_thresh));
-	len += scnprintf(buf + len, buf_len - len, "hwm_thresh = %lu\n",
-			 FIELD_GET(HTT_RING_IF_STATS_HWM_THRESH,
-				   htt_stats_buf->lwm_thresh__hwm_thresh));
+			 le32_to_cpu(htt_stats_buf->num_tail_incr));
+	len += scnprintf(buf + len, buf_len - len, "lwm_thresh = %u\n",
+			 le32_get_bits(htt_stats_buf->lwm_thresh__hwm_thresh,
+				       HTT_RING_IF_STATS_LWM_THRESH));
+	len += scnprintf(buf + len, buf_len - len, "hwm_thresh = %u\n",
+			 le32_get_bits(htt_stats_buf->lwm_thresh__hwm_thresh,
+				       HTT_RING_IF_STATS_HWM_THRESH));
 	len += scnprintf(buf + len, buf_len - len, "overrun_hit_count = %u\n",
-			 htt_stats_buf->overrun_hit_count);
+			 le32_to_cpu(htt_stats_buf->overrun_hit_count));
 	len += scnprintf(buf + len, buf_len - len, "underrun_hit_count = %u\n",
-			 htt_stats_buf->underrun_hit_count);
-	len += scnprintf(buf + len, buf_len - len, "prod_blockwait_count = %u\n",
-			 htt_stats_buf->prod_blockwait_count);
-	len += scnprintf(buf + len, buf_len - len, "cons_blockwait_count = %u\n",
-			 htt_stats_buf->cons_blockwait_count);
+			 le32_to_cpu(htt_stats_buf->underrun_hit_count));
+	len += scnprintf(buf + len, buf_len - len,
+			 "prod_blockwait_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->prod_blockwait_count));
+	len += scnprintf(buf + len, buf_len - len,
+			 "cons_blockwait_count = %u\n",
+			 le32_to_cpu(htt_stats_buf->cons_blockwait_count));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->low_wm_hit_count,
 			   "low_wm_hit_count", HTT_STATS_LOW_WM_BINS, "\n");
@@ -2575,10 +2674,11 @@ static inline void htt_print_ring_if_cmn_tlv(const void *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_RING_IF_CMN_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "num_records = %u\n\n",
-			 htt_stats_buf->num_records);
+			 le32_to_cpu(htt_stats_buf->num_records));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2621,19 +2721,19 @@ static inline void htt_print_sfm_client_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_SFM_CLIENT_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "client_id = %u\n",
-			 htt_stats_buf->client_id);
+			 le32_to_cpu(htt_stats_buf->client_id));
 	len += scnprintf(buf + len, buf_len - len, "buf_min = %u\n",
-			 htt_stats_buf->buf_min);
+			 le32_to_cpu(htt_stats_buf->buf_min));
 	len += scnprintf(buf + len, buf_len - len, "buf_max = %u\n",
-			 htt_stats_buf->buf_max);
+			 le32_to_cpu(htt_stats_buf->buf_max));
 	len += scnprintf(buf + len, buf_len - len, "buf_busy = %u\n",
-			 htt_stats_buf->buf_busy);
+			 le32_to_cpu(htt_stats_buf->buf_busy));
 	len += scnprintf(buf + len, buf_len - len, "buf_alloc = %u\n",
-			 htt_stats_buf->buf_alloc);
+			 le32_to_cpu(htt_stats_buf->buf_alloc));
 	len += scnprintf(buf + len, buf_len - len, "buf_avail = %u\n",
-			 htt_stats_buf->buf_avail);
+			 le32_to_cpu(htt_stats_buf->buf_avail));
 	len += scnprintf(buf + len, buf_len - len, "num_users = %u\n\n",
-			 htt_stats_buf->num_users);
+			 le32_to_cpu(htt_stats_buf->num_users));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2652,16 +2752,17 @@ static inline void htt_print_sfm_cmn_tlv(const void *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_SFM_CMN_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "buf_total = %u\n",
-			 htt_stats_buf->buf_total);
+			 le32_to_cpu(htt_stats_buf->buf_total));
 	len += scnprintf(buf + len, buf_len - len, "mem_empty = %u\n",
-			 htt_stats_buf->mem_empty);
+			 le32_to_cpu(htt_stats_buf->mem_empty));
 	len += scnprintf(buf + len, buf_len - len, "deallocate_bufs = %u\n",
-			 htt_stats_buf->deallocate_bufs);
+			 le32_to_cpu(htt_stats_buf->deallocate_bufs));
 	len += scnprintf(buf + len, buf_len - len, "num_records = %u\n\n",
-			 htt_stats_buf->num_records);
+			 le32_to_cpu(htt_stats_buf->num_records));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2680,50 +2781,50 @@ static inline void htt_print_sring_stats_tlv(const void *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_SRING_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_MAC_ID,
-				   htt_stats_buf->mac_id__ring_id__arena__ep));
-	len += scnprintf(buf + len, buf_len - len, "ring_id = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_RING_ID,
-				   htt_stats_buf->mac_id__ring_id__arena__ep));
-	len += scnprintf(buf + len, buf_len - len, "arena = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_ARENA,
-				   htt_stats_buf->mac_id__ring_id__arena__ep));
-	len += scnprintf(buf + len, buf_len - len, "ep = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_EP,
-				   htt_stats_buf->mac_id__ring_id__arena__ep));
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__ring_id__arena__ep,
+				       HTT_SRING_STATS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len, "ring_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__ring_id__arena__ep,
+				       HTT_SRING_STATS_RING_ID));
+	len += scnprintf(buf + len, buf_len - len, "arena = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__ring_id__arena__ep,
+				       HTT_SRING_STATS_ARENA));
+	len += scnprintf(buf + len, buf_len - len, "ep = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__ring_id__arena__ep,
+				       HTT_SRING_STATS_EP));
 	len += scnprintf(buf + len, buf_len - len, "base_addr_lsb = 0x%x\n",
-			 htt_stats_buf->base_addr_lsb);
+			 le32_to_cpu(htt_stats_buf->base_addr_lsb));
 	len += scnprintf(buf + len, buf_len - len, "base_addr_msb = 0x%x\n",
-			 htt_stats_buf->base_addr_msb);
+			 le32_to_cpu(htt_stats_buf->base_addr_msb));
 	len += scnprintf(buf + len, buf_len - len, "ring_size = %u\n",
-			 htt_stats_buf->ring_size);
+			 le32_to_cpu(htt_stats_buf->ring_size));
 	len += scnprintf(buf + len, buf_len - len, "elem_size = %u\n",
-			 htt_stats_buf->elem_size);
-	len += scnprintf(buf + len, buf_len - len, "num_avail_words = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_NUM_AVAIL_WORDS,
-				   htt_stats_buf->num_avail_words__num_valid_words));
-	len += scnprintf(buf + len, buf_len - len, "num_valid_words = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_NUM_VALID_WORDS,
-				   htt_stats_buf->num_avail_words__num_valid_words));
-	len += scnprintf(buf + len, buf_len - len, "head_ptr = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_HEAD_PTR,
-				   htt_stats_buf->head_ptr__tail_ptr));
-	len += scnprintf(buf + len, buf_len - len, "tail_ptr = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_TAIL_PTR,
-				   htt_stats_buf->head_ptr__tail_ptr));
-	len += scnprintf(buf + len, buf_len - len, "consumer_empty = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_CONSUMER_EMPTY,
-				   htt_stats_buf->consumer_empty__producer_full));
-	len += scnprintf(buf + len, buf_len - len, "producer_full = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_PRODUCER_FULL,
-				   htt_stats_buf->consumer_empty__producer_full));
-	len += scnprintf(buf + len, buf_len - len, "prefetch_count = %lu\n",
-			 FIELD_GET(HTT_SRING_STATS_PREFETCH_COUNT,
-				   htt_stats_buf->prefetch_count__internal_tail_ptr));
-	len += scnprintf(buf + len, buf_len - len, "internal_tail_ptr = %lu\n\n",
-			 FIELD_GET(HTT_SRING_STATS_INTERNAL_TAIL_PTR,
-				   htt_stats_buf->prefetch_count__internal_tail_ptr));
+			 le32_to_cpu(htt_stats_buf->elem_size));
+	len += scnprintf(buf + len, buf_len - len, "num_avail_words = %u\n",
+			 le32_get_bits(htt_stats_buf->num_avail_words__num_valid_words,
+				       HTT_SRING_STATS_NUM_AVAIL_WORDS));
+	len += scnprintf(buf + len, buf_len - len, "num_valid_words = %u\n",
+			 le32_get_bits(htt_stats_buf->num_avail_words__num_valid_words,
+				       HTT_SRING_STATS_NUM_VALID_WORDS));
+	len += scnprintf(buf + len, buf_len - len, "head_ptr = %u\n",
+			 le32_get_bits(htt_stats_buf->head_ptr__tail_ptr,
+				       HTT_SRING_STATS_HEAD_PTR));
+	len += scnprintf(buf + len, buf_len - len, "tail_ptr = %u\n",
+			 le32_get_bits(htt_stats_buf->head_ptr__tail_ptr,
+				       HTT_SRING_STATS_TAIL_PTR));
+	len += scnprintf(buf + len, buf_len - len, "consumer_empty = %u\n",
+			 le32_get_bits(htt_stats_buf->consumer_empty__producer_full,
+				       HTT_SRING_STATS_CONSUMER_EMPTY));
+	len += scnprintf(buf + len, buf_len - len, "producer_full = %u\n",
+			 le32_get_bits(htt_stats_buf->consumer_empty__producer_full,
+				       HTT_SRING_STATS_PRODUCER_FULL));
+	len += scnprintf(buf + len, buf_len - len, "prefetch_count = %u\n",
+			 le32_get_bits(htt_stats_buf->prefetch_count__internal_tail_ptr,
+				       HTT_SRING_STATS_PREFETCH_COUNT));
+	len += scnprintf(buf + len, buf_len - len, "internal_tail_ptr = %u\n\n",
+			 le32_get_bits(htt_stats_buf->prefetch_count__internal_tail_ptr,
+				       HTT_SRING_STATS_INTERNAL_TAIL_PTR));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2743,7 +2844,7 @@ static inline void htt_print_sring_cmn_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_SRING_CMN_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "num_records = %u\n\n",
-			 htt_stats_buf->num_records);
+			 le32_to_cpu(htt_stats_buf->num_records));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -2762,23 +2863,25 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	u8 j;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_TX_PDEV_RATE_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_TX_PDEV_RATE_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "tx_ldpc = %u\n",
-			 htt_stats_buf->tx_ldpc);
+			 le32_to_cpu(htt_stats_buf->tx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "ac_mu_mimo_tx_ldpc = %u\n",
-			 htt_stats_buf->ac_mu_mimo_tx_ldpc);
+			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_tx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "ax_mu_mimo_tx_ldpc = %u\n",
-			 htt_stats_buf->ax_mu_mimo_tx_ldpc);
+			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_tx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "ofdma_tx_ldpc = %u\n",
-			 htt_stats_buf->ofdma_tx_ldpc);
+			 le32_to_cpu(htt_stats_buf->ofdma_tx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "rts_cnt = %u\n",
-			 htt_stats_buf->rts_cnt);
+			 le32_to_cpu(htt_stats_buf->rts_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rts_success = %u\n",
-			 htt_stats_buf->rts_success);
+			 le32_to_cpu(htt_stats_buf->rts_success));
 	len += scnprintf(buf + len, buf_len - len, "ack_rssi = %u\n",
-			 htt_stats_buf->ack_rssi);
+			 le32_to_cpu(htt_stats_buf->ack_rssi));
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "Legacy CCK Rates: 1 Mbps: %u, 2 Mbps: %u, 5.5 Mbps: %u, 11 Mbps: %u\n",
@@ -2888,21 +2991,23 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 	u8 i, j;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_RX_PDEV_RATE_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_RX_PDEV_RATE_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "nsts = %u\n",
-			 htt_stats_buf->nsts);
+			 le32_to_cpu(htt_stats_buf->nsts));
 	len += scnprintf(buf + len, buf_len - len, "rx_ldpc = %u\n",
-			 htt_stats_buf->rx_ldpc);
+			 le32_to_cpu(htt_stats_buf->rx_ldpc));
 	len += scnprintf(buf + len, buf_len - len, "rts_cnt = %u\n",
-			 htt_stats_buf->rts_cnt);
+			 le32_to_cpu(htt_stats_buf->rts_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rssi_mgmt = %u\n",
-			 htt_stats_buf->rssi_mgmt);
+			 le32_to_cpu(htt_stats_buf->rssi_mgmt));
 	len += scnprintf(buf + len, buf_len - len, "rssi_data = %u\n",
-			 htt_stats_buf->rssi_data);
+			 le32_to_cpu(htt_stats_buf->rssi_data));
 	len += scnprintf(buf + len, buf_len - len, "rssi_comb = %u\n",
-			 htt_stats_buf->rssi_comb);
+			 le32_to_cpu(htt_stats_buf->rssi_comb));
 	len += scnprintf(buf + len, buf_len - len, "rssi_in_dbm = %d\n",
 			 htt_stats_buf->rssi_in_dbm);
 
@@ -2918,10 +3023,10 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 			   HTT_RX_PDEV_STATS_NUM_BW_COUNTERS, "\n");
 
 	len += scnprintf(buf + len, buf_len - len, "rx_evm_nss_count = %u\n",
-			 htt_stats_buf->nss_count);
+			 le32_to_cpu(htt_stats_buf->nss_count));
 
 	len += scnprintf(buf + len, buf_len - len, "rx_evm_pilot_count = %u\n",
-			 htt_stats_buf->pilot_count);
+			 le32_to_cpu(htt_stats_buf->pilot_count));
 
 	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
 		len += scnprintf(buf + len, buf_len - len,
@@ -2962,30 +3067,30 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 			   HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES, "\n");
 
 	len += scnprintf(buf + len, buf_len - len, "rx_11ax_su_ext = %u\n",
-			 htt_stats_buf->rx_11ax_su_ext);
+			 le32_to_cpu(htt_stats_buf->rx_11ax_su_ext));
 	len += scnprintf(buf + len, buf_len - len, "rx_11ac_mumimo = %u\n",
-			 htt_stats_buf->rx_11ac_mumimo);
+			 le32_to_cpu(htt_stats_buf->rx_11ac_mumimo));
 	len += scnprintf(buf + len, buf_len - len, "rx_11ax_mumimo = %u\n",
-			 htt_stats_buf->rx_11ax_mumimo);
+			 le32_to_cpu(htt_stats_buf->rx_11ax_mumimo));
 	len += scnprintf(buf + len, buf_len - len, "rx_11ax_ofdma = %u\n",
-			 htt_stats_buf->rx_11ax_ofdma);
+			 le32_to_cpu(htt_stats_buf->rx_11ax_ofdma));
 	len += scnprintf(buf + len, buf_len - len, "txbf = %u\n",
-			 htt_stats_buf->txbf);
+			 le32_to_cpu(htt_stats_buf->txbf));
 
 	len += scnprintf(buf + len, buf_len - len, "\nrx_su_ndpa = %u",
-			 htt_stats_buf->rx_su_ndpa);
+			 le32_to_cpu(htt_stats_buf->rx_su_ndpa));
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_su_txbf_mcs,
 			   "rx_11ax_su_txbf_mcs", HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS,
 			   "\n");
 
 	len += scnprintf(buf + len, buf_len - len, "\nrx_mu_ndpa = %u",
-			 htt_stats_buf->rx_mu_ndpa);
+			 le32_to_cpu(htt_stats_buf->rx_mu_ndpa));
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_mu_txbf_mcs,
 			   "rx_11ax_mu_txbf_mcs", HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS,
 			   "\n");
 
 	len += scnprintf(buf + len, buf_len - len, "\nrx_br_poll = %u",
-			 htt_stats_buf->rx_br_poll);
+			 le32_to_cpu(htt_stats_buf->rx_br_poll));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_legacy_cck_rate,
 			   "rx_legacy_cck_rate",
@@ -2995,12 +3100,14 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 			   "rx_legacy_ofdm_rate",
 			   HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS, "\n");
 
-	len += scnprintf(buf + len, buf_len - len, "rx_active_dur_us_low = %u\n",
-			 htt_stats_buf->rx_active_dur_us_low);
-	len += scnprintf(buf + len, buf_len - len, "rx_active_dur_us_high = %u\n",
-			 htt_stats_buf->rx_active_dur_us_high);
+	len += scnprintf(buf + len, buf_len - len,
+			 "rx_active_dur_us_low = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_active_dur_us_low));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rx_active_dur_us_high = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_active_dur_us_high));
 	len += scnprintf(buf + len, buf_len - len, "rx_11ax_ul_ofdma = %u\n",
-			 htt_stats_buf->rx_11ax_ul_ofdma);
+			 le32_to_cpu(htt_stats_buf->rx_11ax_ul_ofdma));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->ul_ofdma_rx_mcs,
 			   "ul_ofdma_rx_mcs",
@@ -3021,9 +3128,9 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 			   HTT_RX_PDEV_STATS_NUM_BW_COUNTERS, "\n");
 
 	len += scnprintf(buf + len, buf_len - len, "ul_ofdma_rx_stbc = %u\n",
-			htt_stats_buf->ul_ofdma_rx_stbc);
+			le32_to_cpu(htt_stats_buf->ul_ofdma_rx_stbc));
 	len += scnprintf(buf + len, buf_len - len, "ul_ofdma_rx_ldpc = %u\n",
-			htt_stats_buf->ul_ofdma_rx_ldpc);
+			le32_to_cpu(htt_stats_buf->ul_ofdma_rx_ldpc));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_ulofdma_non_data_ppdu,
 			   "rx_ulofdma_non_data_ppdu",
@@ -3081,8 +3188,9 @@ static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
 			   "rx_ulmumimo_mpdu_fail", HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER,
 			   "\n");
 
-	len += scnprintf(buf + len, buf_len - len, "per_chain_rssi_pkt_type = %#x\n",
-			 htt_stats_buf->per_chain_rssi_pkt_type);
+	len += scnprintf(buf + len, buf_len - len,
+			 "per_chain_rssi_pkt_type = %#x\n",
+			 le32_to_cpu(htt_stats_buf->per_chain_rssi_pkt_type));
 
 	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
 		len += scnprintf(buf + len, buf_len - len,
@@ -3113,34 +3221,40 @@ static inline void htt_print_rx_soc_fw_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_RX_SOC_FW_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "fw_reo_ring_data_msdu = %u\n",
-			 htt_stats_buf->fw_reo_ring_data_msdu);
-	len += scnprintf(buf + len, buf_len - len, "fw_to_host_data_msdu_bcmc = %u\n",
-			 htt_stats_buf->fw_to_host_data_msdu_bcmc);
-	len += scnprintf(buf + len, buf_len - len, "fw_to_host_data_msdu_uc = %u\n",
-			 htt_stats_buf->fw_to_host_data_msdu_uc);
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_RX_SOC_FW_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_reo_ring_data_msdu = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_reo_ring_data_msdu));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_to_host_data_msdu_bcmc = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_to_host_data_msdu_bcmc));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_to_host_data_msdu_uc = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_to_host_data_msdu_uc));
 	len += scnprintf(buf + len, buf_len - len,
 			 "ofld_remote_data_buf_recycle_cnt = %u\n",
-			 htt_stats_buf->ofld_remote_data_buf_recycle_cnt);
+			 le32_to_cpu(htt_stats_buf->ofld_remote_data_buf_recycle_cnt));
 	len += scnprintf(buf + len, buf_len - len,
 			 "ofld_remote_free_buf_indication_cnt = %u\n",
-			 htt_stats_buf->ofld_remote_free_buf_indication_cnt);
+			 le32_to_cpu(htt_stats_buf->ofld_remote_free_buf_indication_cnt));
 	len += scnprintf(buf + len, buf_len - len,
 			 "ofld_buf_to_host_data_msdu_uc = %u\n",
-			 htt_stats_buf->ofld_buf_to_host_data_msdu_uc);
+			 le32_to_cpu(htt_stats_buf->ofld_buf_to_host_data_msdu_uc));
 	len += scnprintf(buf + len, buf_len - len,
 			 "reo_fw_ring_to_host_data_msdu_uc = %u\n",
-			 htt_stats_buf->reo_fw_ring_to_host_data_msdu_uc);
+			 le32_to_cpu(htt_stats_buf->reo_fw_ring_to_host_data_msdu_uc));
 	len += scnprintf(buf + len, buf_len - len, "wbm_sw_ring_reap = %u\n",
-			 htt_stats_buf->wbm_sw_ring_reap);
-	len += scnprintf(buf + len, buf_len - len, "wbm_forward_to_host_cnt = %u\n",
-			 htt_stats_buf->wbm_forward_to_host_cnt);
-	len += scnprintf(buf + len, buf_len - len, "wbm_target_recycle_cnt = %u\n",
-			 htt_stats_buf->wbm_target_recycle_cnt);
+			 le32_to_cpu(htt_stats_buf->wbm_sw_ring_reap));
+	len += scnprintf(buf + len, buf_len - len,
+			 "wbm_forward_to_host_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->wbm_forward_to_host_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "wbm_target_recycle_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->wbm_target_recycle_cnt));
 	len += scnprintf(buf + len, buf_len - len,
 			 "target_refill_ring_recycle_cnt = %u\n",
-			 htt_stats_buf->target_refill_ring_recycle_cnt);
+			 le32_to_cpu(htt_stats_buf->target_refill_ring_recycle_cnt));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3237,25 +3351,26 @@ htt_print_rx_reo_debug_stats_tlv_v(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_RX_REO_RESOURCE_STATS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "sample_id = %u\n",
-			 htt_stats_buf->sample_id);
+			 le32_to_cpu(htt_stats_buf->sample_id));
 	len += scnprintf(buf + len, buf_len - len, "total_max = %u\n",
-			 htt_stats_buf->total_max);
+			 le32_to_cpu(htt_stats_buf->total_max));
 	len += scnprintf(buf + len, buf_len - len, "total_avg = %u\n",
-			 htt_stats_buf->total_avg);
+			 le32_to_cpu(htt_stats_buf->total_avg));
 	len += scnprintf(buf + len, buf_len - len, "total_sample = %u\n",
-			 htt_stats_buf->total_sample);
+			 le32_to_cpu(htt_stats_buf->total_sample));
 	len += scnprintf(buf + len, buf_len - len, "non_zeros_avg = %u\n",
-			 htt_stats_buf->non_zeros_avg);
+			 le32_to_cpu(htt_stats_buf->non_zeros_avg));
 	len += scnprintf(buf + len, buf_len - len, "non_zeros_sample = %u\n",
-			 htt_stats_buf->non_zeros_sample);
+			 le32_to_cpu(htt_stats_buf->non_zeros_sample));
 	len += scnprintf(buf + len, buf_len - len, "last_non_zeros_max = %u\n",
-			 htt_stats_buf->last_non_zeros_max);
+			 le32_to_cpu(htt_stats_buf->last_non_zeros_max));
 	len += scnprintf(buf + len, buf_len - len, "last_non_zeros_min %u\n",
-			 htt_stats_buf->last_non_zeros_min);
+			 le32_to_cpu(htt_stats_buf->last_non_zeros_min));
 	len += scnprintf(buf + len, buf_len - len, "last_non_zeros_avg %u\n",
-			 htt_stats_buf->last_non_zeros_avg);
-	len += scnprintf(buf + len, buf_len - len, "last_non_zeros_sample %u\n\n",
-			 htt_stats_buf->last_non_zeros_sample);
+			 le32_to_cpu(htt_stats_buf->last_non_zeros_avg));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_non_zeros_sample %u\n\n",
+			 le32_to_cpu(htt_stats_buf->last_non_zeros_sample));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3298,25 +3413,27 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_RX_PDEV_FW_STATS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_RX_PDEV_FW_STATS_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
 	len += scnprintf(buf + len, buf_len - len, "ppdu_recvd = %u\n",
-			 htt_stats_buf->ppdu_recvd);
+			 le32_to_cpu(htt_stats_buf->ppdu_recvd));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_cnt_fcs_ok = %u\n",
-			 htt_stats_buf->mpdu_cnt_fcs_ok);
+			 le32_to_cpu(htt_stats_buf->mpdu_cnt_fcs_ok));
 	len += scnprintf(buf + len, buf_len - len, "mpdu_cnt_fcs_err = %u\n",
-			 htt_stats_buf->mpdu_cnt_fcs_err);
+			 le32_to_cpu(htt_stats_buf->mpdu_cnt_fcs_err));
 	len += scnprintf(buf + len, buf_len - len, "tcp_msdu_cnt = %u\n",
-			 htt_stats_buf->tcp_msdu_cnt);
+			 le32_to_cpu(htt_stats_buf->tcp_msdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "tcp_ack_msdu_cnt = %u\n",
-			 htt_stats_buf->tcp_ack_msdu_cnt);
+			 le32_to_cpu(htt_stats_buf->tcp_ack_msdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "udp_msdu_cnt = %u\n",
-			 htt_stats_buf->udp_msdu_cnt);
+			 le32_to_cpu(htt_stats_buf->udp_msdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "other_msdu_cnt = %u\n",
-			 htt_stats_buf->other_msdu_cnt);
+			 le32_to_cpu(htt_stats_buf->other_msdu_cnt));
 	len += scnprintf(buf + len, buf_len - len, "fw_ring_mpdu_ind = %u\n",
-			 htt_stats_buf->fw_ring_mpdu_ind);
+			 le32_to_cpu(htt_stats_buf->fw_ring_mpdu_ind));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->fw_ring_mgmt_subtype,
 			   "fw_ring_mgmt_subtype", HTT_STATS_SUBTYPE_MAX, "\n");
@@ -3324,79 +3441,103 @@ static inline void htt_print_rx_pdev_fw_stats_tlv(const void *tag_buf,
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->fw_ring_ctrl_subtype,
 			   "fw_ring_ctrl_subtype", HTT_STATS_SUBTYPE_MAX, "\n");
 
-	len += scnprintf(buf + len, buf_len - len, "fw_ring_mcast_data_msdu = %u\n",
-			 htt_stats_buf->fw_ring_mcast_data_msdu);
-	len += scnprintf(buf + len, buf_len - len, "fw_ring_bcast_data_msdu = %u\n",
-			 htt_stats_buf->fw_ring_bcast_data_msdu);
-	len += scnprintf(buf + len, buf_len - len, "fw_ring_ucast_data_msdu = %u\n",
-			 htt_stats_buf->fw_ring_ucast_data_msdu);
-	len += scnprintf(buf + len, buf_len - len, "fw_ring_null_data_msdu = %u\n",
-			 htt_stats_buf->fw_ring_null_data_msdu);
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_ring_mcast_data_msdu = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_ring_mcast_data_msdu));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_ring_bcast_data_msdu = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_ring_bcast_data_msdu));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_ring_ucast_data_msdu = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_ring_ucast_data_msdu));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_ring_null_data_msdu = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_ring_null_data_msdu));
 	len += scnprintf(buf + len, buf_len - len, "fw_ring_mpdu_drop = %u\n",
-			 htt_stats_buf->fw_ring_mpdu_drop);
-	len += scnprintf(buf + len, buf_len - len, "ofld_local_data_ind_cnt = %u\n",
-			 htt_stats_buf->ofld_local_data_ind_cnt);
+			 le32_to_cpu(htt_stats_buf->fw_ring_mpdu_drop));
+	len += scnprintf(buf + len, buf_len - len,
+			 "ofld_local_data_ind_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->ofld_local_data_ind_cnt));
 	len += scnprintf(buf + len, buf_len - len,
 			 "ofld_local_data_buf_recycle_cnt = %u\n",
-			 htt_stats_buf->ofld_local_data_buf_recycle_cnt);
-	len += scnprintf(buf + len, buf_len - len, "drx_local_data_ind_cnt = %u\n",
-			 htt_stats_buf->drx_local_data_ind_cnt);
+			 le32_to_cpu(htt_stats_buf->ofld_local_data_buf_recycle_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "drx_local_data_ind_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->drx_local_data_ind_cnt));
 	len += scnprintf(buf + len, buf_len - len,
 			 "drx_local_data_buf_recycle_cnt = %u\n",
-			 htt_stats_buf->drx_local_data_buf_recycle_cnt);
-	len += scnprintf(buf + len, buf_len - len, "local_nondata_ind_cnt = %u\n",
-			 htt_stats_buf->local_nondata_ind_cnt);
-	len += scnprintf(buf + len, buf_len - len, "local_nondata_buf_recycle_cnt = %u\n",
-			 htt_stats_buf->local_nondata_buf_recycle_cnt);
-	len += scnprintf(buf + len, buf_len - len, "fw_status_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->fw_status_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "fw_status_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->fw_status_buf_ring_empty_cnt);
-	len += scnprintf(buf + len, buf_len - len, "fw_pkt_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->fw_pkt_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "fw_pkt_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->fw_pkt_buf_ring_empty_cnt);
-	len += scnprintf(buf + len, buf_len - len, "fw_link_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->fw_link_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "fw_link_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->fw_link_buf_ring_empty_cnt);
-	len += scnprintf(buf + len, buf_len - len, "host_pkt_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->host_pkt_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "host_pkt_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->host_pkt_buf_ring_empty_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_pkt_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->mon_pkt_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_pkt_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->mon_pkt_buf_ring_empty_cnt);
+			 le32_to_cpu(htt_stats_buf->drx_local_data_buf_recycle_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "local_nondata_ind_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->local_nondata_ind_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "local_nondata_buf_recycle_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->local_nondata_buf_recycle_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_status_buf_ring_refill_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_status_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_status_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_status_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_pkt_buf_ring_refill_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_pkt_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_pkt_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_pkt_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_link_buf_ring_refill_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_link_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "fw_link_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->fw_link_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "host_pkt_buf_ring_refill_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->host_pkt_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "host_pkt_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->host_pkt_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_pkt_buf_ring_refill_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_pkt_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_pkt_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_pkt_buf_ring_empty_cnt));
 	len += scnprintf(buf + len, buf_len - len,
 			 "mon_status_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->mon_status_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_status_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->mon_status_buf_ring_empty_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_desc_buf_ring_refill_cnt = %u\n",
-			 htt_stats_buf->mon_desc_buf_ring_refill_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_desc_buf_ring_empty_cnt = %u\n",
-			 htt_stats_buf->mon_desc_buf_ring_empty_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_dest_ring_update_cnt = %u\n",
-			 htt_stats_buf->mon_dest_ring_update_cnt);
-	len += scnprintf(buf + len, buf_len - len, "mon_dest_ring_full_cnt = %u\n",
-			 htt_stats_buf->mon_dest_ring_full_cnt);
+			 le32_to_cpu(htt_stats_buf->mon_status_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_status_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_status_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_desc_buf_ring_refill_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_desc_buf_ring_refill_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_desc_buf_ring_empty_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_desc_buf_ring_empty_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_dest_ring_update_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_dest_ring_update_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "mon_dest_ring_full_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->mon_dest_ring_full_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_suspend_cnt = %u\n",
-			 htt_stats_buf->rx_suspend_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_suspend_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_suspend_fail_cnt = %u\n",
-			 htt_stats_buf->rx_suspend_fail_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_suspend_fail_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_resume_cnt = %u\n",
-			 htt_stats_buf->rx_resume_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_resume_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_resume_fail_cnt = %u\n",
-			 htt_stats_buf->rx_resume_fail_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_resume_fail_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_ring_switch_cnt = %u\n",
-			 htt_stats_buf->rx_ring_switch_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_ring_switch_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_ring_restore_cnt = %u\n",
-			 htt_stats_buf->rx_ring_restore_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_ring_restore_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_flush_cnt = %u\n",
-			 htt_stats_buf->rx_flush_cnt);
-	len += scnprintf(buf + len, buf_len - len, "rx_recovery_reset_cnt = %u\n\n",
-			 htt_stats_buf->rx_recovery_reset_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_flush_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rx_recovery_reset_cnt = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->rx_recovery_reset_cnt));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3464,9 +3605,9 @@ htt_print_rx_pdev_fw_stats_phy_err_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "mac_id__word = %u\n",
-			 htt_stats_buf->mac_id__word);
+			 le32_to_cpu(htt_stats_buf->mac_id__word));
 	len += scnprintf(buf + len, buf_len - len, "total_phy_err_nct = %u\n",
-			 htt_stats_buf->total_phy_err_cnt);
+			 le32_to_cpu(htt_stats_buf->total_phy_err_cnt));
 
 	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->phy_err, "phy_errs",
 			   HTT_STATS_PHY_ERR_MAX, "\n\n");
@@ -3490,13 +3631,15 @@ htt_print_pdev_cca_stats_hist_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "\nHTT_PDEV_CCA_STATS_HIST_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "chan_num = %u\n",
-			 htt_stats_buf->chan_num);
+			 le32_to_cpu(htt_stats_buf->chan_num));
 	len += scnprintf(buf + len, buf_len - len, "num_records = %u\n",
-			 htt_stats_buf->num_records);
-	len += scnprintf(buf + len, buf_len - len, "valid_cca_counters_bitmap = 0x%x\n",
-			 htt_stats_buf->valid_cca_counters_bitmap);
-	len += scnprintf(buf + len, buf_len - len, "collection_interval = %u\n\n",
-			 htt_stats_buf->collection_interval);
+			 le32_to_cpu(htt_stats_buf->num_records));
+	len += scnprintf(buf + len, buf_len - len,
+			 "valid_cca_counters_bitmap = 0x%x\n",
+			 le32_to_cpu(htt_stats_buf->valid_cca_counters_bitmap));
+	len += scnprintf(buf + len, buf_len - len,
+			 "collection_interval = %u\n\n",
+			 le32_to_cpu(htt_stats_buf->collection_interval));
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "HTT_PDEV_STATS_CCA_COUNTERS_TLV:(in usec)\n");
@@ -3522,14 +3665,14 @@ htt_print_pdev_stats_cca_counters_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len,
 			 "|%10u| %10u| %10u| %11u| %10u| %11u| %18u| %10u|\n",
-			 htt_stats_buf->tx_frame_usec,
-			 htt_stats_buf->rx_frame_usec,
-			 htt_stats_buf->rx_clear_usec,
-			 htt_stats_buf->my_rx_frame_usec,
-			 htt_stats_buf->usec_cnt,
-			 htt_stats_buf->med_rx_idle_usec,
-			 htt_stats_buf->med_tx_idle_global_usec,
-			 htt_stats_buf->cca_obss_usec);
+			 le32_to_cpu(htt_stats_buf->tx_frame_usec),
+			 le32_to_cpu(htt_stats_buf->rx_frame_usec),
+			 le32_to_cpu(htt_stats_buf->rx_clear_usec),
+			 le32_to_cpu(htt_stats_buf->my_rx_frame_usec),
+			 le32_to_cpu(htt_stats_buf->usec_cnt),
+			 le32_to_cpu(htt_stats_buf->med_rx_idle_usec),
+			 le32_to_cpu(htt_stats_buf->med_tx_idle_global_usec),
+			 le32_to_cpu(htt_stats_buf->cca_obss_usec));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3547,32 +3690,41 @@ static inline void htt_print_hw_stats_whal_tx_tlv(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "HTT_HW_STATS_WHAL_TX_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "mac_id = %lu\n",
-			 FIELD_GET(HTT_STATS_MAC_ID, htt_stats_buf->mac_id__word));
-	len += scnprintf(buf + len, buf_len - len, "last_unpause_ppdu_id = %u\n",
-			 htt_stats_buf->last_unpause_ppdu_id);
-	len += scnprintf(buf + len, buf_len - len, "hwsch_unpause_wait_tqm_write = %u\n",
-			 htt_stats_buf->hwsch_unpause_wait_tqm_write);
-	len += scnprintf(buf + len, buf_len - len, "hwsch_dummy_tlv_skipped = %u\n",
-			 htt_stats_buf->hwsch_dummy_tlv_skipped);
+	len += scnprintf(buf + len, buf_len - len,
+			 "HTT_HW_STATS_WHAL_TX_TLV:\n");
+	len += scnprintf(buf + len, buf_len - len, "mac_id = %u\n",
+			 le32_get_bits(htt_stats_buf->mac_id__word,
+				       HTT_STATS_MAC_ID));
+	len += scnprintf(buf + len, buf_len - len,
+			 "last_unpause_ppdu_id = %u\n",
+			 le32_to_cpu(htt_stats_buf->last_unpause_ppdu_id));
+	len += scnprintf(buf + len, buf_len - len,
+			 "hwsch_unpause_wait_tqm_write = %u\n",
+			 le32_to_cpu(htt_stats_buf->hwsch_unpause_wait_tqm_write));
+	len += scnprintf(buf + len, buf_len - len,
+			 "hwsch_dummy_tlv_skipped = %u\n",
+			 le32_to_cpu(htt_stats_buf->hwsch_dummy_tlv_skipped));
 	len += scnprintf(buf + len, buf_len - len,
 			 "hwsch_misaligned_offset_received = %u\n",
-			 htt_stats_buf->hwsch_misaligned_offset_received);
+			 le32_to_cpu(htt_stats_buf->hwsch_misaligned_offset_received));
 	len += scnprintf(buf + len, buf_len - len, "hwsch_reset_count = %u\n",
-			 htt_stats_buf->hwsch_reset_count);
+			 le32_to_cpu(htt_stats_buf->hwsch_reset_count));
 	len += scnprintf(buf + len, buf_len - len, "hwsch_dev_reset_war = %u\n",
-			 htt_stats_buf->hwsch_dev_reset_war);
+			 le32_to_cpu(htt_stats_buf->hwsch_dev_reset_war));
 	len += scnprintf(buf + len, buf_len - len, "hwsch_delayed_pause = %u\n",
-			 htt_stats_buf->hwsch_delayed_pause);
-	len += scnprintf(buf + len, buf_len - len, "hwsch_long_delayed_pause = %u\n",
-			 htt_stats_buf->hwsch_long_delayed_pause);
-	len += scnprintf(buf + len, buf_len - len, "sch_rx_ppdu_no_response = %u\n",
-			 htt_stats_buf->sch_rx_ppdu_no_response);
-	len += scnprintf(buf + len, buf_len - len, "sch_selfgen_response = %u\n",
-			 htt_stats_buf->sch_selfgen_response);
-	len += scnprintf(buf + len, buf_len - len, "sch_rx_sifs_resp_trigger= %u\n\n",
-			 htt_stats_buf->sch_rx_sifs_resp_trigger);
+			 le32_to_cpu(htt_stats_buf->hwsch_delayed_pause));
+	len += scnprintf(buf + len, buf_len - len,
+			 "hwsch_long_delayed_pause = %u\n",
+			 le32_to_cpu(htt_stats_buf->hwsch_long_delayed_pause));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sch_rx_ppdu_no_response = %u\n",
+			 le32_to_cpu(htt_stats_buf->sch_rx_ppdu_no_response));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sch_selfgen_response = %u\n",
+			 le32_to_cpu(htt_stats_buf->sch_selfgen_response));
+	len += scnprintf(buf + len, buf_len - len,
+			 "sch_rx_sifs_resp_trigger= %u\n\n",
+			 le32_to_cpu(htt_stats_buf->sch_rx_sifs_resp_trigger));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3593,9 +3745,9 @@ htt_print_pdev_stats_twt_sessions_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSIONS_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
-			 htt_stats_buf->pdev_id);
+			 le32_to_cpu(htt_stats_buf->pdev_id));
 	len += scnprintf(buf + len, buf_len - len, "num_sessions = %u\n\n",
-			 htt_stats_buf->num_sessions);
+			 le32_to_cpu(htt_stats_buf->num_sessions));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3616,31 +3768,31 @@ htt_print_pdev_stats_twt_session_tlv(const void *tag_buf,
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_PDEV_STATS_TWT_SESSION_TLV:\n");
 	len += scnprintf(buf + len, buf_len - len, "vdev_id = %u\n",
-			 htt_stats_buf->vdev_id);
-	len += scnprintf(buf + len, buf_len - len,
-			 "peer_mac = %02lx:%02lx:%02lx:%02lx:%02lx:%02lx\n",
-			 FIELD_GET(HTT_MAC_ADDR_L32_0,
-				   htt_stats_buf->peer_mac.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_L32_1,
-				   htt_stats_buf->peer_mac.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_L32_2,
-				   htt_stats_buf->peer_mac.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_L32_3,
-				   htt_stats_buf->peer_mac.mac_addr_l32),
-			 FIELD_GET(HTT_MAC_ADDR_H16_0,
-				   htt_stats_buf->peer_mac.mac_addr_h16),
-			 FIELD_GET(HTT_MAC_ADDR_H16_1,
-				   htt_stats_buf->peer_mac.mac_addr_h16));
+			 le32_to_cpu(htt_stats_buf->vdev_id));
+	len += scnprintf(buf + len, buf_len - len,
+			 "peer_mac = %02x:%02x:%02x:%02x:%02x:%02x\n",
+			 le32_get_bits(htt_stats_buf->peer_mac.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_0),
+			 le32_get_bits(htt_stats_buf->peer_mac.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_1),
+			 le32_get_bits(htt_stats_buf->peer_mac.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_2),
+			 le32_get_bits(htt_stats_buf->peer_mac.mac_addr_l32,
+				       HTT_MAC_ADDR_L32_3),
+			 le32_get_bits(htt_stats_buf->peer_mac.mac_addr_h16,
+				       HTT_MAC_ADDR_H16_0),
+			 le32_get_bits(htt_stats_buf->peer_mac.mac_addr_h16,
+				       HTT_MAC_ADDR_H16_1));
 	len += scnprintf(buf + len, buf_len - len, "flow_id_flags = %u\n",
-			 htt_stats_buf->flow_id_flags);
+			 le32_to_cpu(htt_stats_buf->flow_id_flags));
 	len += scnprintf(buf + len, buf_len - len, "dialog_id = %u\n",
-			 htt_stats_buf->dialog_id);
+			 le32_to_cpu(htt_stats_buf->dialog_id));
 	len += scnprintf(buf + len, buf_len - len, "wake_dura_us = %u\n",
-			 htt_stats_buf->wake_dura_us);
+			 le32_to_cpu(htt_stats_buf->wake_dura_us));
 	len += scnprintf(buf + len, buf_len - len, "wake_intvl_us = %u\n",
-			 htt_stats_buf->wake_intvl_us);
+			 le32_to_cpu(htt_stats_buf->wake_intvl_us));
 	len += scnprintf(buf + len, buf_len - len, "sp_offset_us = %u\n\n",
-			 htt_stats_buf->sp_offset_us);
+			 le32_to_cpu(htt_stats_buf->sp_offset_us));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3659,22 +3811,26 @@ htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 	u32 len = stats_req->buf_len;
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
-	len += scnprintf(buf + len, buf_len - len, "OBSS Tx success PPDU = %u\n",
-			   htt_stats_buf->num_obss_tx_ppdu_success);
-	len += scnprintf(buf + len, buf_len - len, "OBSS Tx failures PPDU = %u\n",
-			   htt_stats_buf->num_obss_tx_ppdu_failure);
-	len += scnprintf(buf + len, buf_len - len, "Non-SRG Opportunities = %u\n",
-			   htt_stats_buf->num_non_srg_opportunities);
+	len += scnprintf(buf + len, buf_len - len,
+			 "OBSS Tx success PPDU = %u\n",
+			   le32_to_cpu(htt_stats_buf->num_obss_tx_ppdu_success));
+	len += scnprintf(buf + len, buf_len - len,
+			 "OBSS Tx failures PPDU = %u\n",
+			   le32_to_cpu(htt_stats_buf->num_obss_tx_ppdu_failure));
+	len += scnprintf(buf + len, buf_len - len,
+			 "Non-SRG Opportunities = %u\n",
+			   le32_to_cpu(htt_stats_buf->num_non_srg_opportunities));
 	len += scnprintf(buf + len, buf_len - len, "Non-SRG tried PPDU = %u\n",
-			   htt_stats_buf->num_non_srg_ppdu_tried);
-	len += scnprintf(buf + len, buf_len - len, "Non-SRG success PPDU = %u\n",
-			   htt_stats_buf->num_non_srg_ppdu_success);
+			   le32_to_cpu(htt_stats_buf->num_non_srg_ppdu_tried));
+	len += scnprintf(buf + len, buf_len - len,
+			 "Non-SRG success PPDU = %u\n",
+			   le32_to_cpu(htt_stats_buf->num_non_srg_ppdu_success));
 	len += scnprintf(buf + len, buf_len - len, "SRG Opportunities = %u\n",
-			   htt_stats_buf->num_srg_opportunities);
+			   le32_to_cpu(htt_stats_buf->num_srg_opportunities));
 	len += scnprintf(buf + len, buf_len - len, "SRG tried PPDU = %u\n",
-			   htt_stats_buf->num_srg_ppdu_tried);
+			   le32_to_cpu(htt_stats_buf->num_srg_ppdu_tried));
 	len += scnprintf(buf + len, buf_len - len, "SRG success PPDU = %u\n\n",
-			   htt_stats_buf->num_srg_ppdu_success);
+			   le32_to_cpu(htt_stats_buf->num_srg_ppdu_success));
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
@@ -3697,16 +3853,16 @@ static inline void htt_print_backpressure_stats_tlv_v(const u32 *tag_buf,
 	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
 
 	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
-			 htt_stats_buf->pdev_id);
+			 le32_to_cpu(htt_stats_buf->pdev_id));
 	len += scnprintf(buf + len, buf_len - len, "current_head_idx = %u\n",
-			 htt_stats_buf->current_head_idx);
+			 le32_to_cpu(htt_stats_buf->current_head_idx));
 	len += scnprintf(buf + len, buf_len - len, "current_tail_idx = %u\n",
-			 htt_stats_buf->current_tail_idx);
+			 le32_to_cpu(htt_stats_buf->current_tail_idx));
 	len += scnprintf(buf + len, buf_len - len, "num_htt_msgs_sent = %u\n",
-			 htt_stats_buf->num_htt_msgs_sent);
+			 le32_to_cpu(htt_stats_buf->num_htt_msgs_sent));
 	len += scnprintf(buf + len, buf_len - len,
 			 "backpressure_time_ms = %u\n",
-			 htt_stats_buf->backpressure_time_ms);
+			 le32_to_cpu(htt_stats_buf->backpressure_time_ms));
 
 	for (i = 0; i < 5; i++)
 		len += scnprintf(buf + len, buf_len - len,
@@ -3942,24 +4098,28 @@ void htt_print_phy_counters_tlv(const void *tag_buf,
 	int i;
 
 	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_COUNTERS_TLV:\n");
-	len += scnprintf(buf + len, buf_len - len, "rx_ofdma_timing_err_cnt = %u\n",
-			 htt_stats_buf->rx_ofdma_timing_err_cnt);
+	len += scnprintf(buf + len, buf_len - len,
+			 "rx_ofdma_timing_err_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_ofdma_timing_err_cnt));
 	len += scnprintf(buf + len, buf_len - len, "rx_cck_fail_cnt = %u\n",
-			 htt_stats_buf->rx_cck_fail_cnt);
+			 le32_to_cpu(htt_stats_buf->rx_cck_fail_cnt));
 	len += scnprintf(buf + len, buf_len - len, "mactx_abort_cnt = %u\n",
-			 htt_stats_buf->mactx_abort_cnt);
+			 le32_to_cpu(htt_stats_buf->mactx_abort_cnt));
 	len += scnprintf(buf + len, buf_len - len, "macrx_abort_cnt = %u\n",
-			 htt_stats_buf->macrx_abort_cnt);
+			 le32_to_cpu(htt_stats_buf->macrx_abort_cnt));
 	len += scnprintf(buf + len, buf_len - len, "phytx_abort_cnt = %u\n",
-			 htt_stats_buf->phytx_abort_cnt);
+			 le32_to_cpu(htt_stats_buf->phytx_abort_cnt));
 	len += scnprintf(buf + len, buf_len - len, "phyrx_abort_cnt = %u\n",
-			 htt_stats_buf->phyrx_abort_cnt);
-	len += scnprintf(buf + len, buf_len - len, "phyrx_defer_abort_cnt = %u\n",
-			 htt_stats_buf->phyrx_defer_abort_cnt);
-	len += scnprintf(buf + len, buf_len - len, "rx_gain_adj_lstf_event_cnt = %u\n",
-			 htt_stats_buf->rx_gain_adj_lstf_event_cnt);
-	len += scnprintf(buf + len, buf_len - len, "rx_gain_adj_non_legacy_cnt = %u\n",
-			 htt_stats_buf->rx_gain_adj_non_legacy_cnt);
+			 le32_to_cpu(htt_stats_buf->phyrx_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "phyrx_defer_abort_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->phyrx_defer_abort_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rx_gain_adj_lstf_event_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_gain_adj_lstf_event_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rx_gain_adj_non_legacy_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rx_gain_adj_non_legacy_cnt));
 
 	for (i = 0; i < HTT_MAX_RX_PKT_CNT; i++)
 		len += scnprintf(buf + len, buf_len - len, "rx_pkt_cnt[%d] = %u\n",
@@ -4000,13 +4160,13 @@ void htt_print_phy_stats_tlv(const void *tag_buf,
 				 i, htt_stats_buf->nf_chain[i]);
 
 	len += scnprintf(buf + len, buf_len - len, "false_radar_cnt = %u\n",
-			 htt_stats_buf->false_radar_cnt);
+			 le32_to_cpu(htt_stats_buf->false_radar_cnt));
 	len += scnprintf(buf + len, buf_len - len, "radar_cs_cnt = %u\n",
-			 htt_stats_buf->radar_cs_cnt);
+			 le32_to_cpu(htt_stats_buf->radar_cs_cnt));
 	len += scnprintf(buf + len, buf_len - len, "ani_level = %d\n",
 			 htt_stats_buf->ani_level);
 	len += scnprintf(buf + len, buf_len - len, "fw_run_time = %u\n",
-			 htt_stats_buf->fw_run_time);
+			 le32_to_cpu(htt_stats_buf->fw_run_time));
 
 	stats_req->buf_len = len;
 }
@@ -4027,17 +4187,22 @@ htt_print_phy_reset_counters_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_RESET_COUNTERS_TLV:\n");
 
 	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
-			 htt_stats_buf->pdev_id);
-	len += scnprintf(buf + len, buf_len - len, "cf_active_low_fail_cnt = %u\n",
-			 htt_stats_buf->cf_active_low_fail_cnt);
-	len += scnprintf(buf + len, buf_len - len, "cf_active_low_pass_cnt = %u\n",
-			 htt_stats_buf->cf_active_low_pass_cnt);
-	len += scnprintf(buf + len, buf_len - len, "phy_off_through_vreg_cnt = %u\n",
-			 htt_stats_buf->phy_off_through_vreg_cnt);
-	len += scnprintf(buf + len, buf_len - len, "force_calibration_cnt = %u\n",
-			 htt_stats_buf->force_calibration_cnt);
-	len += scnprintf(buf + len, buf_len - len, "rf_mode_switch_phy_off_cnt = %u\n",
-			 htt_stats_buf->rf_mode_switch_phy_off_cnt);
+			 le32_to_cpu(htt_stats_buf->pdev_id));
+	len += scnprintf(buf + len, buf_len - len,
+			 "cf_active_low_fail_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->cf_active_low_fail_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "cf_active_low_pass_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->cf_active_low_pass_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "phy_off_through_vreg_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->phy_off_through_vreg_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "force_calibration_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->force_calibration_cnt));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rf_mode_switch_phy_off_cnt = %u\n",
+			 le32_to_cpu(htt_stats_buf->rf_mode_switch_phy_off_cnt));
 
 	stats_req->buf_len = len;
 }
@@ -4058,63 +4223,70 @@ htt_print_phy_reset_stats_tlv(const void *tag_buf,
 	len += scnprintf(buf + len, buf_len - len, "HTT_PHY_RESET_STATS_TLV:\n");
 
 	len += scnprintf(buf + len, buf_len - len, "pdev_id = %u\n",
-			 htt_stats_buf->pdev_id);
+			 le32_to_cpu(htt_stats_buf->pdev_id));
 	len += scnprintf(buf + len, buf_len - len, "chan_mhz = %u\n",
-			 htt_stats_buf->chan_mhz);
-	len += scnprintf(buf + len, buf_len - len, "chan_band_center_freq1 = %u\n",
-			 htt_stats_buf->chan_band_center_freq1);
-	len += scnprintf(buf + len, buf_len - len, "chan_band_center_freq2 = %u\n",
-			 htt_stats_buf->chan_band_center_freq2);
+			 le32_to_cpu(htt_stats_buf->chan_mhz));
+	len += scnprintf(buf + len, buf_len - len,
+			 "chan_band_center_freq1 = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_band_center_freq1));
+	len += scnprintf(buf + len, buf_len - len,
+			 "chan_band_center_freq2 = %u\n",
+			 le32_to_cpu(htt_stats_buf->chan_band_center_freq2));
 	len += scnprintf(buf + len, buf_len - len, "chan_phy_mode = %u\n",
-			 htt_stats_buf->chan_phy_mode);
+			 le32_to_cpu(htt_stats_buf->chan_phy_mode));
 	len += scnprintf(buf + len, buf_len - len, "chan_flags = 0x%0x\n",
-			 htt_stats_buf->chan_flags);
+			 le32_to_cpu(htt_stats_buf->chan_flags));
 	len += scnprintf(buf + len, buf_len - len, "chan_num = %u\n",
-			 htt_stats_buf->chan_num);
+			 le32_to_cpu(htt_stats_buf->chan_num));
 	len += scnprintf(buf + len, buf_len - len, "reset_cause = 0x%0x\n",
-			 htt_stats_buf->reset_cause);
+			 le32_to_cpu(htt_stats_buf->reset_cause));
 	len += scnprintf(buf + len, buf_len - len, "prev_reset_cause = 0x%0x\n",
-			 htt_stats_buf->prev_reset_cause);
-	len += scnprintf(buf + len, buf_len - len, "phy_warm_reset_src = 0x%0x\n",
-			 htt_stats_buf->phy_warm_reset_src);
+			 le32_to_cpu(htt_stats_buf->prev_reset_cause));
+	len += scnprintf(buf + len, buf_len - len,
+			 "phy_warm_reset_src = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_warm_reset_src));
 	len += scnprintf(buf + len, buf_len - len, "rx_gain_tbl_mode = %d\n",
-			 htt_stats_buf->rx_gain_tbl_mode);
+			 le32_to_cpu(htt_stats_buf->rx_gain_tbl_mode));
 	len += scnprintf(buf + len, buf_len - len, "xbar_val = 0x%0x\n",
-			 htt_stats_buf->xbar_val);
+			 le32_to_cpu(htt_stats_buf->xbar_val));
 	len += scnprintf(buf + len, buf_len - len, "force_calibration = %u\n",
-			 htt_stats_buf->force_calibration);
+			 le32_to_cpu(htt_stats_buf->force_calibration));
 	len += scnprintf(buf + len, buf_len - len, "phyrf_mode = %u\n",
-			 htt_stats_buf->phyrf_mode);
+			 le32_to_cpu(htt_stats_buf->phyrf_mode));
 	len += scnprintf(buf + len, buf_len - len, "phy_homechan = %u\n",
-			 htt_stats_buf->phy_homechan);
+			 le32_to_cpu(htt_stats_buf->phy_homechan));
 	len += scnprintf(buf + len, buf_len - len, "phy_tx_ch_mask = 0x%0x\n",
-			 htt_stats_buf->phy_tx_ch_mask);
+			 le32_to_cpu(htt_stats_buf->phy_tx_ch_mask));
 	len += scnprintf(buf + len, buf_len - len, "phy_rx_ch_mask = 0x%0x\n",
-			 htt_stats_buf->phy_rx_ch_mask);
+			 le32_to_cpu(htt_stats_buf->phy_rx_ch_mask));
 	len += scnprintf(buf + len, buf_len - len, "phybb_ini_mask = 0x%0x\n",
-			 htt_stats_buf->phybb_ini_mask);
+			 le32_to_cpu(htt_stats_buf->phybb_ini_mask));
 	len += scnprintf(buf + len, buf_len - len, "phyrf_ini_mask = 0x%0x\n",
-			 htt_stats_buf->phyrf_ini_mask);
+			 le32_to_cpu(htt_stats_buf->phyrf_ini_mask));
 	len += scnprintf(buf + len, buf_len - len, "phy_dfs_en_mask = 0x%0x\n",
-			 htt_stats_buf->phy_dfs_en_mask);
-	len += scnprintf(buf + len, buf_len - len, "phy_sscan_en_mask = 0x%0x\n",
-			 htt_stats_buf->phy_sscan_en_mask);
-	len += scnprintf(buf + len, buf_len - len, "phy_synth_sel_mask = 0x%0x\n",
-			 htt_stats_buf->phy_synth_sel_mask);
+			 le32_to_cpu(htt_stats_buf->phy_dfs_en_mask));
+	len += scnprintf(buf + len, buf_len - len,
+			 "phy_sscan_en_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_sscan_en_mask));
+	len += scnprintf(buf + len, buf_len - len,
+			 "phy_synth_sel_mask = 0x%0x\n",
+			 le32_to_cpu(htt_stats_buf->phy_synth_sel_mask));
 	len += scnprintf(buf + len, buf_len - len, "phy_adfs_freq = %u\n",
-			 htt_stats_buf->phy_adfs_freq);
+			 le32_to_cpu(htt_stats_buf->phy_adfs_freq));
 	len += scnprintf(buf + len, buf_len - len, "cck_fir_settings = 0x%0x\n",
-			 htt_stats_buf->cck_fir_settings);
+			 le32_to_cpu(htt_stats_buf->cck_fir_settings));
 	len += scnprintf(buf + len, buf_len - len, "phy_dyn_pri_chan = %u\n",
-			 htt_stats_buf->phy_dyn_pri_chan);
+			 le32_to_cpu(htt_stats_buf->phy_dyn_pri_chan));
 	len += scnprintf(buf + len, buf_len - len, "cca_thresh = 0x%0x\n",
-			 htt_stats_buf->cca_thresh);
+			 le32_to_cpu(htt_stats_buf->cca_thresh));
 	len += scnprintf(buf + len, buf_len - len, "dyn_cca_status = %u\n",
-			 htt_stats_buf->dyn_cca_status);
-	len += scnprintf(buf + len, buf_len - len, "rxdesense_thresh_hw = 0x%x\n",
-			 htt_stats_buf->rxdesense_thresh_hw);
-	len += scnprintf(buf + len, buf_len - len, "rxdesense_thresh_sw = 0x%x\n",
-			 htt_stats_buf->rxdesense_thresh_sw);
+			 le32_to_cpu(htt_stats_buf->dyn_cca_status));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rxdesense_thresh_hw = 0x%x\n",
+			 le32_to_cpu(htt_stats_buf->rxdesense_thresh_hw));
+	len += scnprintf(buf + len, buf_len - len,
+			 "rxdesense_thresh_sw = 0x%x\n",
+			 le32_to_cpu(htt_stats_buf->rxdesense_thresh_sw));
 
 	stats_req->buf_len = len;
 }
@@ -4562,7 +4734,7 @@ void ath11k_debugfs_htt_ext_stats_handler(struct ath11k_base *ab,
 	u8 pdev_id;
 
 	msg = (struct ath11k_htt_extd_stats_msg *)skb->data;
-	cookie = msg->cookie;
+	cookie = le64_to_cpu(msg->cookie);
 
 	if (FIELD_GET(HTT_STATS_COOKIE_MSB, cookie) != HTT_STATS_MAGIC_VALUE) {
 		ath11k_warn(ab, "received invalid htt ext stats event\n");
@@ -4584,13 +4756,14 @@ void ath11k_debugfs_htt_ext_stats_handler(struct ath11k_base *ab,
 
 	spin_lock_bh(&ar->debug.htt_stats.lock);
 
-	stats_req->done = FIELD_GET(HTT_T2H_EXT_STATS_INFO1_DONE, msg->info1);
+	stats_req->done = le32_get_bits(msg->info1,
+					HTT_T2H_EXT_STATS_INFO1_DONE);
 	if (stats_req->done)
 		send_completion = true;
 
 	spin_unlock_bh(&ar->debug.htt_stats.lock);
 
-	len = FIELD_GET(HTT_T2H_EXT_STATS_INFO1_LENGTH, msg->info1);
+	len = le32_get_bits(msg->info1, HTT_T2H_EXT_STATS_INFO1_LENGTH);
 	ret = ath11k_dp_htt_tlv_iter(ab, msg->data, len,
 				     ath11k_dbg_htt_ext_stats_parse,
 				     stats_req);
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
index 856aa74ba365..8e5228c6154e 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
@@ -146,102 +146,102 @@ enum htt_tx_pdev_underrun_enum {
 /* Length should be multiple of DWORD */
 struct htt_stats_string_tlv {
 	 /* Can be variable length */
-	DECLARE_FLEX_ARRAY(u32, data);
+	DECLARE_FLEX_ARRAY(__le32, data);
 } __packed;
 
 #define HTT_STATS_MAC_ID	GENMASK(7, 0)
 
 /* == TX PDEV STATS == */
 struct htt_tx_pdev_stats_cmn_tlv {
-	u32 mac_id__word;
-	u32 hw_queued;
-	u32 hw_reaped;
-	u32 underrun;
-	u32 hw_paused;
-	u32 hw_flush;
-	u32 hw_filt;
-	u32 tx_abort;
-	u32 mpdu_requeued;
-	u32 tx_xretry;
-	u32 data_rc;
-	u32 mpdu_dropped_xretry;
-	u32 illgl_rate_phy_err;
-	u32 cont_xretry;
-	u32 tx_timeout;
-	u32 pdev_resets;
-	u32 phy_underrun;
-	u32 txop_ovf;
-	u32 seq_posted;
-	u32 seq_failed_queueing;
-	u32 seq_completed;
-	u32 seq_restarted;
-	u32 mu_seq_posted;
-	u32 seq_switch_hw_paused;
-	u32 next_seq_posted_dsr;
-	u32 seq_posted_isr;
-	u32 seq_ctrl_cached;
-	u32 mpdu_count_tqm;
-	u32 msdu_count_tqm;
-	u32 mpdu_removed_tqm;
-	u32 msdu_removed_tqm;
-	u32 mpdus_sw_flush;
-	u32 mpdus_hw_filter;
-	u32 mpdus_truncated;
-	u32 mpdus_ack_failed;
-	u32 mpdus_expired;
-	u32 mpdus_seq_hw_retry;
-	u32 ack_tlv_proc;
-	u32 coex_abort_mpdu_cnt_valid;
-	u32 coex_abort_mpdu_cnt;
-	u32 num_total_ppdus_tried_ota;
-	u32 num_data_ppdus_tried_ota;
-	u32 local_ctrl_mgmt_enqued;
-	u32 local_ctrl_mgmt_freed;
-	u32 local_data_enqued;
-	u32 local_data_freed;
-	u32 mpdu_tried;
-	u32 isr_wait_seq_posted;
-
-	u32 tx_active_dur_us_low;
-	u32 tx_active_dur_us_high;
+	__le32 mac_id__word;
+	__le32 hw_queued;
+	__le32 hw_reaped;
+	__le32 underrun;
+	__le32 hw_paused;
+	__le32 hw_flush;
+	__le32 hw_filt;
+	__le32 tx_abort;
+	__le32 mpdu_requeued;
+	__le32 tx_xretry;
+	__le32 data_rc;
+	__le32 mpdu_dropped_xretry;
+	__le32 illgl_rate_phy_err;
+	__le32 cont_xretry;
+	__le32 tx_timeout;
+	__le32 pdev_resets;
+	__le32 phy_underrun;
+	__le32 txop_ovf;
+	__le32 seq_posted;
+	__le32 seq_failed_queueing;
+	__le32 seq_completed;
+	__le32 seq_restarted;
+	__le32 mu_seq_posted;
+	__le32 seq_switch_hw_paused;
+	__le32 next_seq_posted_dsr;
+	__le32 seq_posted_isr;
+	__le32 seq_ctrl_cached;
+	__le32 mpdu_count_tqm;
+	__le32 msdu_count_tqm;
+	__le32 mpdu_removed_tqm;
+	__le32 msdu_removed_tqm;
+	__le32 mpdus_sw_flush;
+	__le32 mpdus_hw_filter;
+	__le32 mpdus_truncated;
+	__le32 mpdus_ack_failed;
+	__le32 mpdus_expired;
+	__le32 mpdus_seq_hw_retry;
+	__le32 ack_tlv_proc;
+	__le32 coex_abort_mpdu_cnt_valid;
+	__le32 coex_abort_mpdu_cnt;
+	__le32 num_total_ppdus_tried_ota;
+	__le32 num_data_ppdus_tried_ota;
+	__le32 local_ctrl_mgmt_enqued;
+	__le32 local_ctrl_mgmt_freed;
+	__le32 local_data_enqued;
+	__le32 local_data_freed;
+	__le32 mpdu_tried;
+	__le32 isr_wait_seq_posted;
+
+	__le32 tx_active_dur_us_low;
+	__le32 tx_active_dur_us_high;
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_urrn_tlv_v {
 	/* HTT_TX_PDEV_MAX_URRN_STATS */
-	DECLARE_FLEX_ARRAY(u32, urrn_stats);
+	DECLARE_FLEX_ARRAY(__le32, urrn_stats);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_flush_tlv_v {
 	/* HTT_TX_PDEV_MAX_FLUSH_REASON_STATS */
-	DECLARE_FLEX_ARRAY(u32, flush_errs);
+	DECLARE_FLEX_ARRAY(__le32, flush_errs);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_sifs_tlv_v {
 	/* HTT_TX_PDEV_MAX_SIFS_BURST_STATS */
-	DECLARE_FLEX_ARRAY(u32, sifs_status);
+	DECLARE_FLEX_ARRAY(__le32, sifs_status);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_phy_err_tlv_v {
 	/* HTT_TX_PDEV_MAX_PHY_ERR_STATS */
-	DECLARE_FLEX_ARRAY(u32, phy_errs);
+	DECLARE_FLEX_ARRAY(__le32, phy_errs);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_pdev_stats_sifs_hist_tlv_v {
 	/* HTT_TX_PDEV_SIFS_BURST_HIST_STATS */
-	DECLARE_FLEX_ARRAY(u32, sifs_hist_status);
+	DECLARE_FLEX_ARRAY(__le32, sifs_hist_status);
 };
 
 struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v {
-	u32 num_data_ppdus_legacy_su;
-	u32 num_data_ppdus_ac_su;
-	u32 num_data_ppdus_ax_su;
-	u32 num_data_ppdus_ac_su_txbf;
-	u32 num_data_ppdus_ax_su_txbf;
+	__le32 num_data_ppdus_legacy_su;
+	__le32 num_data_ppdus_ac_su;
+	__le32 num_data_ppdus_ax_su;
+	__le32 num_data_ppdus_ac_su_txbf;
+	__le32 num_data_ppdus_ax_su_txbf;
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size .
@@ -257,8 +257,8 @@ struct htt_tx_pdev_stats_tx_ppdu_stats_tlv_v {
  *  #define WAL_TRIED_MPDU_CNT_HISTOGRAM_INTERVAL 30
  */
 struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v {
-	u32 hist_bin_size;
-	u32 tried_mpdu_cnt_hist[]; /* HTT_TX_PDEV_TRIED_MPDU_CNT_HIST */
+	__le32 hist_bin_size;
+	__le32 tried_mpdu_cnt_hist[]; /* HTT_TX_PDEV_TRIED_MPDU_CNT_HIST */
 };
 
 /* == SOC ERROR STATS == */
@@ -268,44 +268,44 @@ struct htt_tx_pdev_stats_tried_mpdu_cnt_hist_tlv_v {
 struct htt_hw_stats_intr_misc_tlv {
 	/* Stored as little endian */
 	u8 hw_intr_name[HTT_STATS_MAX_HW_INTR_NAME_LEN];
-	u32 mask;
-	u32 count;
+	__le32 mask;
+	__le32 count;
 };
 
 #define HTT_STATS_MAX_HW_MODULE_NAME_LEN 8
 struct htt_hw_stats_wd_timeout_tlv {
 	/* Stored as little endian */
 	u8 hw_module_name[HTT_STATS_MAX_HW_MODULE_NAME_LEN];
-	u32 count;
+	__le32 count;
 };
 
 struct htt_hw_stats_pdev_errs_tlv {
-	u32    mac_id__word; /* BIT [ 7 :  0] : mac_id */
-	u32    tx_abort;
-	u32    tx_abort_fail_count;
-	u32    rx_abort;
-	u32    rx_abort_fail_count;
-	u32    warm_reset;
-	u32    cold_reset;
-	u32    tx_flush;
-	u32    tx_glb_reset;
-	u32    tx_txq_reset;
-	u32    rx_timeout_reset;
+	__le32    mac_id__word; /* BIT [ 7 :  0] : mac_id */
+	__le32    tx_abort;
+	__le32    tx_abort_fail_count;
+	__le32    rx_abort;
+	__le32    rx_abort_fail_count;
+	__le32    warm_reset;
+	__le32    cold_reset;
+	__le32    tx_flush;
+	__le32    tx_glb_reset;
+	__le32    tx_txq_reset;
+	__le32    rx_timeout_reset;
 };
 
 struct htt_hw_stats_whal_tx_tlv {
-	u32 mac_id__word;
-	u32 last_unpause_ppdu_id;
-	u32 hwsch_unpause_wait_tqm_write;
-	u32 hwsch_dummy_tlv_skipped;
-	u32 hwsch_misaligned_offset_received;
-	u32 hwsch_reset_count;
-	u32 hwsch_dev_reset_war;
-	u32 hwsch_delayed_pause;
-	u32 hwsch_long_delayed_pause;
-	u32 sch_rx_ppdu_no_response;
-	u32 sch_selfgen_response;
-	u32 sch_rx_sifs_resp_trigger;
+	__le32 mac_id__word;
+	__le32 last_unpause_ppdu_id;
+	__le32 hwsch_unpause_wait_tqm_write;
+	__le32 hwsch_dummy_tlv_skipped;
+	__le32 hwsch_misaligned_offset_received;
+	__le32 hwsch_reset_count;
+	__le32 hwsch_dev_reset_war;
+	__le32 hwsch_delayed_pause;
+	__le32 hwsch_long_delayed_pause;
+	__le32 sch_rx_ppdu_no_response;
+	__le32 sch_selfgen_response;
+	__le32 sch_rx_sifs_resp_trigger;
 };
 
 /* ============ PEER STATS ============ */
@@ -314,17 +314,17 @@ struct htt_hw_stats_whal_tx_tlv {
 #define	HTT_MSDU_FLOW_STATS_DROP_RULE	BIT(20)
 
 struct htt_msdu_flow_stats_tlv {
-	u32 last_update_timestamp;
-	u32 last_add_timestamp;
-	u32 last_remove_timestamp;
-	u32 total_processed_msdu_count;
-	u32 cur_msdu_count_in_flowq;
-	u32 sw_peer_id;
-	u32 tx_flow_no__tid_num__drop_rule;
-	u32 last_cycle_enqueue_count;
-	u32 last_cycle_dequeue_count;
-	u32 last_cycle_drop_count;
-	u32 current_drop_th;
+	__le32 last_update_timestamp;
+	__le32 last_add_timestamp;
+	__le32 last_remove_timestamp;
+	__le32 total_processed_msdu_count;
+	__le32 cur_msdu_count_in_flowq;
+	__le32 sw_peer_id;
+	__le32 tx_flow_no__tid_num__drop_rule;
+	__le32 last_cycle_enqueue_count;
+	__le32 last_cycle_dequeue_count;
+	__le32 last_cycle_drop_count;
+	__le32 current_drop_th;
 };
 
 #define MAX_HTT_TID_NAME 8
@@ -338,20 +338,20 @@ struct htt_msdu_flow_stats_tlv {
 struct htt_tx_tid_stats_tlv {
 	/* Stored as little endian */
 	u8     tid_name[MAX_HTT_TID_NAME];
-	u32 sw_peer_id__tid_num;
-	u32 num_sched_pending__num_ppdu_in_hwq;
-	u32 tid_flags;
-	u32 hw_queued;
-	u32 hw_reaped;
-	u32 mpdus_hw_filter;
-
-	u32 qdepth_bytes;
-	u32 qdepth_num_msdu;
-	u32 qdepth_num_mpdu;
-	u32 last_scheduled_tsmp;
-	u32 pause_module_id;
-	u32 block_module_id;
-	u32 tid_tx_airtime;
+	__le32 sw_peer_id__tid_num;
+	__le32 num_sched_pending__num_ppdu_in_hwq;
+	__le32 tid_flags;
+	__le32 hw_queued;
+	__le32 hw_reaped;
+	__le32 mpdus_hw_filter;
+
+	__le32 qdepth_bytes;
+	__le32 qdepth_num_msdu;
+	__le32 qdepth_num_mpdu;
+	__le32 last_scheduled_tsmp;
+	__le32 pause_module_id;
+	__le32 block_module_id;
+	__le32 tid_tx_airtime;
 };
 
 #define	HTT_TX_TID_STATS_V1_SW_PEER_ID		GENMASK(15, 0)
@@ -363,63 +363,63 @@ struct htt_tx_tid_stats_tlv {
 struct htt_tx_tid_stats_v1_tlv {
 	/* Stored as little endian */
 	u8 tid_name[MAX_HTT_TID_NAME];
-	u32 sw_peer_id__tid_num;
-	u32 num_sched_pending__num_ppdu_in_hwq;
-	u32 tid_flags;
-	u32 max_qdepth_bytes;
-	u32 max_qdepth_n_msdus;
-	u32 rsvd;
-
-	u32 qdepth_bytes;
-	u32 qdepth_num_msdu;
-	u32 qdepth_num_mpdu;
-	u32 last_scheduled_tsmp;
-	u32 pause_module_id;
-	u32 block_module_id;
-	u32 tid_tx_airtime;
-	u32 allow_n_flags;
-	u32 sendn_frms_allowed;
+	__le32 sw_peer_id__tid_num;
+	__le32 num_sched_pending__num_ppdu_in_hwq;
+	__le32 tid_flags;
+	__le32 max_qdepth_bytes;
+	__le32 max_qdepth_n_msdus;
+	__le32 rsvd;
+
+	__le32 qdepth_bytes;
+	__le32 qdepth_num_msdu;
+	__le32 qdepth_num_mpdu;
+	__le32 last_scheduled_tsmp;
+	__le32 pause_module_id;
+	__le32 block_module_id;
+	__le32 tid_tx_airtime;
+	__le32 allow_n_flags;
+	__le32 sendn_frms_allowed;
 };
 
 #define	HTT_RX_TID_STATS_SW_PEER_ID	GENMASK(15, 0)
 #define	HTT_RX_TID_STATS_TID_NUM	GENMASK(31, 16)
 
 struct htt_rx_tid_stats_tlv {
-	u32 sw_peer_id__tid_num;
+	__le32 sw_peer_id__tid_num;
 	u8 tid_name[MAX_HTT_TID_NAME];
-	u32 dup_in_reorder;
-	u32 dup_past_outside_window;
-	u32 dup_past_within_window;
-	u32 rxdesc_err_decrypt;
-	u32 tid_rx_airtime;
+	__le32 dup_in_reorder;
+	__le32 dup_past_outside_window;
+	__le32 dup_past_within_window;
+	__le32 rxdesc_err_decrypt;
+	__le32 tid_rx_airtime;
 };
 
 #define HTT_MAX_COUNTER_NAME 8
 struct htt_counter_tlv {
 	u8 counter_name[HTT_MAX_COUNTER_NAME];
-	u32 count;
+	__le32 count;
 };
 
 struct htt_peer_stats_cmn_tlv {
-	u32 ppdu_cnt;
-	u32 mpdu_cnt;
-	u32 msdu_cnt;
-	u32 pause_bitmap;
-	u32 block_bitmap;
-	u32 current_timestamp;
-	u32 peer_tx_airtime;
-	u32 peer_rx_airtime;
+	__le32 ppdu_cnt;
+	__le32 mpdu_cnt;
+	__le32 msdu_cnt;
+	__le32 pause_bitmap;
+	__le32 block_bitmap;
+	__le32 current_timestamp;
+	__le32 peer_tx_airtime;
+	__le32 peer_rx_airtime;
 	s32 rssi;
-	u32 peer_enqueued_count_low;
-	u32 peer_enqueued_count_high;
-	u32 peer_dequeued_count_low;
-	u32 peer_dequeued_count_high;
-	u32 peer_dropped_count_low;
-	u32 peer_dropped_count_high;
-	u32 ppdu_transmitted_bytes_low;
-	u32 ppdu_transmitted_bytes_high;
-	u32 peer_ttl_removed_count;
-	u32 inactive_time;
+	__le32 peer_enqueued_count_low;
+	__le32 peer_enqueued_count_high;
+	__le32 peer_dequeued_count_low;
+	__le32 peer_dequeued_count_high;
+	__le32 peer_dropped_count_low;
+	__le32 peer_dropped_count_high;
+	__le32 ppdu_transmitted_bytes_low;
+	__le32 ppdu_transmitted_bytes_high;
+	__le32 peer_ttl_removed_count;
+	__le32 inactive_time;
 };
 
 #define HTT_PEER_DETAILS_VDEV_ID	GENMASK(7, 0)
@@ -427,12 +427,12 @@ struct htt_peer_stats_cmn_tlv {
 #define HTT_PEER_DETAILS_AST_IDX	GENMASK(31, 16)
 
 struct htt_peer_details_tlv {
-	u32 peer_type;
-	u32 sw_peer_id;
-	u32 vdev_pdev_ast_idx;
+	__le32 peer_type;
+	__le32 sw_peer_id;
+	__le32 vdev_pdev_ast_idx;
 	struct htt_mac_addr mac_addr;
-	u32 peer_flags;
-	u32 qpeer_flags;
+	__le32 peer_flags;
+	__le32 qpeer_flags;
 };
 
 enum htt_stats_param_type {
@@ -455,27 +455,27 @@ enum htt_stats_param_type {
 #define HTT_TX_PEER_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
 
 struct htt_tx_peer_rate_stats_tlv {
-	u32 tx_ldpc;
-	u32 rts_cnt;
-	u32 ack_rssi;
+	__le32 tx_ldpc;
+	__le32 rts_cnt;
+	__le32 ack_rssi;
 
-	u32 tx_mcs[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
-	u32 tx_su_mcs[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
-	u32 tx_mu_mcs[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_mcs[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_su_mcs[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_mu_mcs[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
 	/* element 0,1, ...7 -> NSS 1,2, ...8 */
-	u32 tx_nss[HTT_TX_PEER_STATS_NUM_SPATIAL_STREAMS];
+	__le32 tx_nss[HTT_TX_PEER_STATS_NUM_SPATIAL_STREAMS];
 	/* element 0: 20 MHz, 1: 40 MHz, 2: 80 MHz, 3: 160 and 80+80 MHz */
-	u32 tx_bw[HTT_TX_PEER_STATS_NUM_BW_COUNTERS];
-	u32 tx_stbc[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
-	u32 tx_pream[HTT_TX_PEER_STATS_NUM_PREAMBLE_TYPES];
+	__le32 tx_bw[HTT_TX_PEER_STATS_NUM_BW_COUNTERS];
+	__le32 tx_stbc[HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_pream[HTT_TX_PEER_STATS_NUM_PREAMBLE_TYPES];
 
 	/* Counters to track number of tx packets in each GI
 	 * (400us, 800us, 1600us & 3200us) in each mcs (0-11)
 	 */
-	u32 tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS][HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_gi[HTT_TX_PEER_STATS_NUM_GI_COUNTERS][HTT_TX_PEER_STATS_NUM_MCS_COUNTERS];
 
 	/* Counters to track packets in dcm mcs (MCS 0, 1, 3, 4) */
-	u32 tx_dcm[HTT_TX_PEER_STATS_NUM_DCM_COUNTERS];
+	__le32 tx_dcm[HTT_TX_PEER_STATS_NUM_DCM_COUNTERS];
 
 };
 
@@ -487,30 +487,30 @@ struct htt_tx_peer_rate_stats_tlv {
 #define HTT_RX_PEER_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
 
 struct htt_rx_peer_rate_stats_tlv {
-	u32 nsts;
+	__le32 nsts;
 
 	/* Number of rx ldpc packets */
-	u32 rx_ldpc;
+	__le32 rx_ldpc;
 	/* Number of rx rts packets */
-	u32 rts_cnt;
+	__le32 rts_cnt;
 
-	u32 rssi_mgmt; /* units = dB above noise floor */
-	u32 rssi_data; /* units = dB above noise floor */
-	u32 rssi_comb; /* units = dB above noise floor */
-	u32 rx_mcs[HTT_RX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 rssi_mgmt; /* units = dB above noise floor */
+	__le32 rssi_data; /* units = dB above noise floor */
+	__le32 rssi_comb; /* units = dB above noise floor */
+	__le32 rx_mcs[HTT_RX_PEER_STATS_NUM_MCS_COUNTERS];
 	/* element 0,1, ...7 -> NSS 1,2, ...8 */
-	u32 rx_nss[HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS];
-	u32 rx_dcm[HTT_RX_PEER_STATS_NUM_DCM_COUNTERS];
-	u32 rx_stbc[HTT_RX_PEER_STATS_NUM_MCS_COUNTERS];
+	__le32 rx_nss[HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS];
+	__le32 rx_dcm[HTT_RX_PEER_STATS_NUM_DCM_COUNTERS];
+	__le32 rx_stbc[HTT_RX_PEER_STATS_NUM_MCS_COUNTERS];
 	/* element 0: 20 MHz, 1: 40 MHz, 2: 80 MHz, 3: 160 and 80+80 MHz */
-	u32 rx_bw[HTT_RX_PEER_STATS_NUM_BW_COUNTERS];
-	u32 rx_pream[HTT_RX_PEER_STATS_NUM_PREAMBLE_TYPES];
+	__le32 rx_bw[HTT_RX_PEER_STATS_NUM_BW_COUNTERS];
+	__le32 rx_pream[HTT_RX_PEER_STATS_NUM_PREAMBLE_TYPES];
 	/* units = dB above noise floor */
 	u8 rssi_chain[HTT_RX_PEER_STATS_NUM_SPATIAL_STREAMS]
 		     [HTT_RX_PEER_STATS_NUM_BW_COUNTERS];
 
 	/* Counters to track number of rx packets in each GI in each mcs (0-11) */
-	u32 rx_gi[HTT_RX_PEER_STATS_NUM_GI_COUNTERS]
+	__le32 rx_gi[HTT_RX_PEER_STATS_NUM_GI_COUNTERS]
 		 [HTT_RX_PEER_STATS_NUM_MCS_COUNTERS];
 };
 
@@ -535,83 +535,83 @@ enum htt_peer_stats_tlv_enum {
 /* =========== MUMIMO HWQ stats =========== */
 /* MU MIMO stats per hwQ */
 struct htt_tx_hwq_mu_mimo_sch_stats_tlv {
-	u32 mu_mimo_sch_posted;
-	u32 mu_mimo_sch_failed;
-	u32 mu_mimo_ppdu_posted;
+	__le32 mu_mimo_sch_posted;
+	__le32 mu_mimo_sch_failed;
+	__le32 mu_mimo_ppdu_posted;
 };
 
 struct htt_tx_hwq_mu_mimo_mpdu_stats_tlv {
-	u32 mu_mimo_mpdus_queued_usr;
-	u32 mu_mimo_mpdus_tried_usr;
-	u32 mu_mimo_mpdus_failed_usr;
-	u32 mu_mimo_mpdus_requeued_usr;
-	u32 mu_mimo_err_no_ba_usr;
-	u32 mu_mimo_mpdu_underrun_usr;
-	u32 mu_mimo_ampdu_underrun_usr;
+	__le32 mu_mimo_mpdus_queued_usr;
+	__le32 mu_mimo_mpdus_tried_usr;
+	__le32 mu_mimo_mpdus_failed_usr;
+	__le32 mu_mimo_mpdus_requeued_usr;
+	__le32 mu_mimo_err_no_ba_usr;
+	__le32 mu_mimo_mpdu_underrun_usr;
+	__le32 mu_mimo_ampdu_underrun_usr;
 };
 
 #define	HTT_TX_HWQ_STATS_MAC_ID	GENMASK(7, 0)
 #define	HTT_TX_HWQ_STATS_HWQ_ID	GENMASK(15, 8)
 
 struct htt_tx_hwq_mu_mimo_cmn_stats_tlv {
-	u32 mac_id__hwq_id__word;
+	__le32 mac_id__hwq_id__word;
 };
 
 /* == TX HWQ STATS == */
 struct htt_tx_hwq_stats_cmn_tlv {
-	u32 mac_id__hwq_id__word;
+	__le32 mac_id__hwq_id__word;
 
 	/* PPDU level stats */
-	u32 xretry;
-	u32 underrun_cnt;
-	u32 flush_cnt;
-	u32 filt_cnt;
-	u32 null_mpdu_bmap;
-	u32 user_ack_failure;
-	u32 ack_tlv_proc;
-	u32 sched_id_proc;
-	u32 null_mpdu_tx_count;
-	u32 mpdu_bmap_not_recvd;
+	__le32 xretry;
+	__le32 underrun_cnt;
+	__le32 flush_cnt;
+	__le32 filt_cnt;
+	__le32 null_mpdu_bmap;
+	__le32 user_ack_failure;
+	__le32 ack_tlv_proc;
+	__le32 sched_id_proc;
+	__le32 null_mpdu_tx_count;
+	__le32 mpdu_bmap_not_recvd;
 
 	/* Selfgen stats per hwQ */
-	u32 num_bar;
-	u32 rts;
-	u32 cts2self;
-	u32 qos_null;
+	__le32 num_bar;
+	__le32 rts;
+	__le32 cts2self;
+	__le32 qos_null;
 
 	/* MPDU level stats */
-	u32 mpdu_tried_cnt;
-	u32 mpdu_queued_cnt;
-	u32 mpdu_ack_fail_cnt;
-	u32 mpdu_filt_cnt;
-	u32 false_mpdu_ack_count;
+	__le32 mpdu_tried_cnt;
+	__le32 mpdu_queued_cnt;
+	__le32 mpdu_ack_fail_cnt;
+	__le32 mpdu_filt_cnt;
+	__le32 false_mpdu_ack_count;
 
-	u32 txq_timeout;
+	__le32 txq_timeout;
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_difs_latency_stats_tlv_v {
-	u32 hist_intvl;
+	__le32 hist_intvl;
 	/* histogram of ppdu post to hwsch - > cmd status received */
-	u32 difs_latency_hist[]; /* HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS */
+	__le32 difs_latency_hist[]; /* HTT_TX_HWQ_MAX_DIFS_LATENCY_BINS */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_cmd_result_stats_tlv_v {
 	/* Histogram of sched cmd result, HTT_TX_HWQ_MAX_CMD_RESULT_STATS */
-	DECLARE_FLEX_ARRAY(u32, cmd_result);
+	DECLARE_FLEX_ARRAY(__le32, cmd_result);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_cmd_stall_stats_tlv_v {
 	/* Histogram of various pause conitions, HTT_TX_HWQ_MAX_CMD_STALL_STATS */
-	DECLARE_FLEX_ARRAY(u32, cmd_stall_status);
+	DECLARE_FLEX_ARRAY(__le32, cmd_stall_status);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_hwq_fes_result_stats_tlv_v {
 	/* Histogram of number of user fes result, HTT_TX_HWQ_MAX_FES_RESULT_STATS */
-	DECLARE_FLEX_ARRAY(u32, fes_result);
+	DECLARE_FLEX_ARRAY(__le32, fes_result);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size
@@ -627,9 +627,9 @@ struct htt_tx_hwq_fes_result_stats_tlv_v {
  *  #define WAL_TRIED_MPDU_CNT_HISTOGRAM_INTERVAL 30
  */
 struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v {
-	u32 hist_bin_size;
+	__le32 hist_bin_size;
 	/* Histogram of number of mpdus on tried mpdu */
-	u32 tried_mpdu_cnt_hist[]; /* HTT_TX_HWQ_TRIED_MPDU_CNT_HIST */
+	__le32 tried_mpdu_cnt_hist[]; /* HTT_TX_HWQ_TRIED_MPDU_CNT_HIST */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size
@@ -644,85 +644,85 @@ struct htt_tx_hwq_tried_mpdu_cnt_hist_tlv_v {
  */
 struct htt_tx_hwq_txop_used_cnt_hist_tlv_v {
 	/* Histogram of txop used cnt,  HTT_TX_HWQ_TXOP_USED_CNT_HIST */
-	DECLARE_FLEX_ARRAY(u32, txop_used_cnt_hist);
+	DECLARE_FLEX_ARRAY(__le32, txop_used_cnt_hist);
 };
 
 /* == TX SELFGEN STATS == */
 struct htt_tx_selfgen_cmn_stats_tlv {
-	u32 mac_id__word;
-	u32 su_bar;
-	u32 rts;
-	u32 cts2self;
-	u32 qos_null;
-	u32 delayed_bar_1; /* MU user 1 */
-	u32 delayed_bar_2; /* MU user 2 */
-	u32 delayed_bar_3; /* MU user 3 */
-	u32 delayed_bar_4; /* MU user 4 */
-	u32 delayed_bar_5; /* MU user 5 */
-	u32 delayed_bar_6; /* MU user 6 */
-	u32 delayed_bar_7; /* MU user 7 */
+	__le32 mac_id__word;
+	__le32 su_bar;
+	__le32 rts;
+	__le32 cts2self;
+	__le32 qos_null;
+	__le32 delayed_bar_1; /* MU user 1 */
+	__le32 delayed_bar_2; /* MU user 2 */
+	__le32 delayed_bar_3; /* MU user 3 */
+	__le32 delayed_bar_4; /* MU user 4 */
+	__le32 delayed_bar_5; /* MU user 5 */
+	__le32 delayed_bar_6; /* MU user 6 */
+	__le32 delayed_bar_7; /* MU user 7 */
 };
 
 struct htt_tx_selfgen_ac_stats_tlv {
 	/* 11AC */
-	u32 ac_su_ndpa;
-	u32 ac_su_ndp;
-	u32 ac_mu_mimo_ndpa;
-	u32 ac_mu_mimo_ndp;
-	u32 ac_mu_mimo_brpoll_1; /* MU user 1 */
-	u32 ac_mu_mimo_brpoll_2; /* MU user 2 */
-	u32 ac_mu_mimo_brpoll_3; /* MU user 3 */
+	__le32 ac_su_ndpa;
+	__le32 ac_su_ndp;
+	__le32 ac_mu_mimo_ndpa;
+	__le32 ac_mu_mimo_ndp;
+	__le32 ac_mu_mimo_brpoll_1; /* MU user 1 */
+	__le32 ac_mu_mimo_brpoll_2; /* MU user 2 */
+	__le32 ac_mu_mimo_brpoll_3; /* MU user 3 */
 };
 
 struct htt_tx_selfgen_ax_stats_tlv {
 	/* 11AX */
-	u32 ax_su_ndpa;
-	u32 ax_su_ndp;
-	u32 ax_mu_mimo_ndpa;
-	u32 ax_mu_mimo_ndp;
-	u32 ax_mu_mimo_brpoll_1; /* MU user 1 */
-	u32 ax_mu_mimo_brpoll_2; /* MU user 2 */
-	u32 ax_mu_mimo_brpoll_3; /* MU user 3 */
-	u32 ax_mu_mimo_brpoll_4; /* MU user 4 */
-	u32 ax_mu_mimo_brpoll_5; /* MU user 5 */
-	u32 ax_mu_mimo_brpoll_6; /* MU user 6 */
-	u32 ax_mu_mimo_brpoll_7; /* MU user 7 */
-	u32 ax_basic_trigger;
-	u32 ax_bsr_trigger;
-	u32 ax_mu_bar_trigger;
-	u32 ax_mu_rts_trigger;
-	u32 ax_ulmumimo_trigger;
+	__le32 ax_su_ndpa;
+	__le32 ax_su_ndp;
+	__le32 ax_mu_mimo_ndpa;
+	__le32 ax_mu_mimo_ndp;
+	__le32 ax_mu_mimo_brpoll_1; /* MU user 1 */
+	__le32 ax_mu_mimo_brpoll_2; /* MU user 2 */
+	__le32 ax_mu_mimo_brpoll_3; /* MU user 3 */
+	__le32 ax_mu_mimo_brpoll_4; /* MU user 4 */
+	__le32 ax_mu_mimo_brpoll_5; /* MU user 5 */
+	__le32 ax_mu_mimo_brpoll_6; /* MU user 6 */
+	__le32 ax_mu_mimo_brpoll_7; /* MU user 7 */
+	__le32 ax_basic_trigger;
+	__le32 ax_bsr_trigger;
+	__le32 ax_mu_bar_trigger;
+	__le32 ax_mu_rts_trigger;
+	__le32 ax_ulmumimo_trigger;
 };
 
 struct htt_tx_selfgen_ac_err_stats_tlv {
 	/* 11AC error stats */
-	u32 ac_su_ndp_err;
-	u32 ac_su_ndpa_err;
-	u32 ac_mu_mimo_ndpa_err;
-	u32 ac_mu_mimo_ndp_err;
-	u32 ac_mu_mimo_brp1_err;
-	u32 ac_mu_mimo_brp2_err;
-	u32 ac_mu_mimo_brp3_err;
+	__le32 ac_su_ndp_err;
+	__le32 ac_su_ndpa_err;
+	__le32 ac_mu_mimo_ndpa_err;
+	__le32 ac_mu_mimo_ndp_err;
+	__le32 ac_mu_mimo_brp1_err;
+	__le32 ac_mu_mimo_brp2_err;
+	__le32 ac_mu_mimo_brp3_err;
 };
 
 struct htt_tx_selfgen_ax_err_stats_tlv {
 	/* 11AX error stats */
-	u32 ax_su_ndp_err;
-	u32 ax_su_ndpa_err;
-	u32 ax_mu_mimo_ndpa_err;
-	u32 ax_mu_mimo_ndp_err;
-	u32 ax_mu_mimo_brp1_err;
-	u32 ax_mu_mimo_brp2_err;
-	u32 ax_mu_mimo_brp3_err;
-	u32 ax_mu_mimo_brp4_err;
-	u32 ax_mu_mimo_brp5_err;
-	u32 ax_mu_mimo_brp6_err;
-	u32 ax_mu_mimo_brp7_err;
-	u32 ax_basic_trigger_err;
-	u32 ax_bsr_trigger_err;
-	u32 ax_mu_bar_trigger_err;
-	u32 ax_mu_rts_trigger_err;
-	u32 ax_ulmumimo_trigger_err;
+	__le32 ax_su_ndp_err;
+	__le32 ax_su_ndpa_err;
+	__le32 ax_mu_mimo_ndpa_err;
+	__le32 ax_mu_mimo_ndp_err;
+	__le32 ax_mu_mimo_brp1_err;
+	__le32 ax_mu_mimo_brp2_err;
+	__le32 ax_mu_mimo_brp3_err;
+	__le32 ax_mu_mimo_brp4_err;
+	__le32 ax_mu_mimo_brp5_err;
+	__le32 ax_mu_mimo_brp6_err;
+	__le32 ax_mu_mimo_brp7_err;
+	__le32 ax_basic_trigger_err;
+	__le32 ax_bsr_trigger_err;
+	__le32 ax_mu_bar_trigger_err;
+	__le32 ax_mu_rts_trigger_err;
+	__le32 ax_ulmumimo_trigger_err;
 };
 
 /* == TX MU STATS == */
@@ -733,63 +733,63 @@ struct htt_tx_selfgen_ax_err_stats_tlv {
 
 struct htt_tx_pdev_mu_mimo_sch_stats_tlv {
 	/* mu-mimo sw sched cmd stats */
-	u32 mu_mimo_sch_posted;
-	u32 mu_mimo_sch_failed;
+	__le32 mu_mimo_sch_posted;
+	__le32 mu_mimo_sch_failed;
 	/* MU PPDU stats per hwQ */
-	u32 mu_mimo_ppdu_posted;
+	__le32 mu_mimo_ppdu_posted;
 	/*
 	 * Counts the number of users in each transmission of
 	 * the given TX mode.
 	 *
 	 * Index is the number of users - 1.
 	 */
-	u32 ac_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
-	u32 ax_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
-	u32 ax_ofdma_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
-	u32 ax_ul_ofdma_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
-	u32 ax_ul_ofdma_bsr_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
-	u32 ax_ul_ofdma_bar_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
-	u32 ax_ul_ofdma_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ac_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
+	__le32 ax_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
+	__le32 ax_ofdma_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_bsr_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_bar_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ul_ofdma_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 
 	/* UL MU-MIMO */
 	/* ax_ul_mumimo_basic_sch_nusers[i] is the number of basic triggers sent
 	 * for (i+1) users
 	 */
-	u32 ax_ul_mumimo_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
+	__le32 ax_ul_mumimo_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
 
 	/* ax_ul_mumimo_brp_sch_nusers[i] is the number of brp triggers sent
 	 * for (i+1) users
 	 */
-	u32 ax_ul_mumimo_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
+	__le32 ax_ul_mumimo_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
 
-	u32 ac_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
-	u32 ax_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
+	__le32 ac_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
+	__le32 ax_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
 };
 
 struct htt_tx_pdev_mu_mimo_mpdu_stats_tlv {
-	u32 mu_mimo_mpdus_queued_usr;
-	u32 mu_mimo_mpdus_tried_usr;
-	u32 mu_mimo_mpdus_failed_usr;
-	u32 mu_mimo_mpdus_requeued_usr;
-	u32 mu_mimo_err_no_ba_usr;
-	u32 mu_mimo_mpdu_underrun_usr;
-	u32 mu_mimo_ampdu_underrun_usr;
-
-	u32 ax_mu_mimo_mpdus_queued_usr;
-	u32 ax_mu_mimo_mpdus_tried_usr;
-	u32 ax_mu_mimo_mpdus_failed_usr;
-	u32 ax_mu_mimo_mpdus_requeued_usr;
-	u32 ax_mu_mimo_err_no_ba_usr;
-	u32 ax_mu_mimo_mpdu_underrun_usr;
-	u32 ax_mu_mimo_ampdu_underrun_usr;
-
-	u32 ax_ofdma_mpdus_queued_usr;
-	u32 ax_ofdma_mpdus_tried_usr;
-	u32 ax_ofdma_mpdus_failed_usr;
-	u32 ax_ofdma_mpdus_requeued_usr;
-	u32 ax_ofdma_err_no_ba_usr;
-	u32 ax_ofdma_mpdu_underrun_usr;
-	u32 ax_ofdma_ampdu_underrun_usr;
+	__le32 mu_mimo_mpdus_queued_usr;
+	__le32 mu_mimo_mpdus_tried_usr;
+	__le32 mu_mimo_mpdus_failed_usr;
+	__le32 mu_mimo_mpdus_requeued_usr;
+	__le32 mu_mimo_err_no_ba_usr;
+	__le32 mu_mimo_mpdu_underrun_usr;
+	__le32 mu_mimo_ampdu_underrun_usr;
+
+	__le32 ax_mu_mimo_mpdus_queued_usr;
+	__le32 ax_mu_mimo_mpdus_tried_usr;
+	__le32 ax_mu_mimo_mpdus_failed_usr;
+	__le32 ax_mu_mimo_mpdus_requeued_usr;
+	__le32 ax_mu_mimo_err_no_ba_usr;
+	__le32 ax_mu_mimo_mpdu_underrun_usr;
+	__le32 ax_mu_mimo_ampdu_underrun_usr;
+
+	__le32 ax_ofdma_mpdus_queued_usr;
+	__le32 ax_ofdma_mpdus_tried_usr;
+	__le32 ax_ofdma_mpdus_failed_usr;
+	__le32 ax_ofdma_mpdus_requeued_usr;
+	__le32 ax_ofdma_err_no_ba_usr;
+	__le32 ax_ofdma_mpdu_underrun_usr;
+	__le32 ax_ofdma_ampdu_underrun_usr;
 };
 
 #define HTT_STATS_TX_SCHED_MODE_MU_MIMO_AC  1
@@ -798,34 +798,34 @@ struct htt_tx_pdev_mu_mimo_mpdu_stats_tlv {
 
 struct htt_tx_pdev_mpdu_stats_tlv {
 	/* mpdu level stats */
-	u32 mpdus_queued_usr;
-	u32 mpdus_tried_usr;
-	u32 mpdus_failed_usr;
-	u32 mpdus_requeued_usr;
-	u32 err_no_ba_usr;
-	u32 mpdu_underrun_usr;
-	u32 ampdu_underrun_usr;
-	u32 user_index;
-	u32 tx_sched_mode; /* HTT_STATS_TX_SCHED_MODE_xxx */
+	__le32 mpdus_queued_usr;
+	__le32 mpdus_tried_usr;
+	__le32 mpdus_failed_usr;
+	__le32 mpdus_requeued_usr;
+	__le32 err_no_ba_usr;
+	__le32 mpdu_underrun_usr;
+	__le32 ampdu_underrun_usr;
+	__le32 user_index;
+	__le32 tx_sched_mode; /* HTT_STATS_TX_SCHED_MODE_xxx */
 };
 
 /* == TX SCHED STATS == */
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_cmd_posted_tlv_v {
 	/* HTT_TX_PDEV_SCHED_TX_MODE_MAX */
-	DECLARE_FLEX_ARRAY(u32, sched_cmd_posted);
+	DECLARE_FLEX_ARRAY(__le32, sched_cmd_posted);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_cmd_reaped_tlv_v {
 	/* HTT_TX_PDEV_SCHED_TX_MODE_MAX */
-	DECLARE_FLEX_ARRAY(u32, sched_cmd_reaped);
+	DECLARE_FLEX_ARRAY(__le32, sched_cmd_reaped);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_sched_order_su_tlv_v {
 	/* HTT_TX_PDEV_NUM_SCHED_ORDER_LOG */
-	DECLARE_FLEX_ARRAY(u32, sched_order_su);
+	DECLARE_FLEX_ARRAY(__le32, sched_order_su);
 };
 
 enum htt_sched_txq_sched_ineligibility_tlv_enum {
@@ -853,43 +853,43 @@ enum htt_sched_txq_sched_ineligibility_tlv_enum {
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sched_txq_sched_ineligibility_tlv_v {
 	/* indexed by htt_sched_txq_sched_ineligibility_tlv_enum */
-	DECLARE_FLEX_ARRAY(u32, sched_ineligibility);
+	DECLARE_FLEX_ARRAY(__le32, sched_ineligibility);
 };
 
 #define	HTT_TX_PDEV_STATS_SCHED_PER_TXQ_MAC_ID	GENMASK(7, 0)
 #define	HTT_TX_PDEV_STATS_SCHED_PER_TXQ_ID	GENMASK(15, 8)
 
 struct htt_tx_pdev_stats_sched_per_txq_tlv {
-	u32 mac_id__txq_id__word;
-	u32 sched_policy;
-	u32 last_sched_cmd_posted_timestamp;
-	u32 last_sched_cmd_compl_timestamp;
-	u32 sched_2_tac_lwm_count;
-	u32 sched_2_tac_ring_full;
-	u32 sched_cmd_post_failure;
-	u32 num_active_tids;
-	u32 num_ps_schedules;
-	u32 sched_cmds_pending;
-	u32 num_tid_register;
-	u32 num_tid_unregister;
-	u32 num_qstats_queried;
-	u32 qstats_update_pending;
-	u32 last_qstats_query_timestamp;
-	u32 num_tqm_cmdq_full;
-	u32 num_de_sched_algo_trigger;
-	u32 num_rt_sched_algo_trigger;
-	u32 num_tqm_sched_algo_trigger;
-	u32 notify_sched;
-	u32 dur_based_sendn_term;
+	__le32 mac_id__txq_id__word;
+	__le32 sched_policy;
+	__le32 last_sched_cmd_posted_timestamp;
+	__le32 last_sched_cmd_compl_timestamp;
+	__le32 sched_2_tac_lwm_count;
+	__le32 sched_2_tac_ring_full;
+	__le32 sched_cmd_post_failure;
+	__le32 num_active_tids;
+	__le32 num_ps_schedules;
+	__le32 sched_cmds_pending;
+	__le32 num_tid_register;
+	__le32 num_tid_unregister;
+	__le32 num_qstats_queried;
+	__le32 qstats_update_pending;
+	__le32 last_qstats_query_timestamp;
+	__le32 num_tqm_cmdq_full;
+	__le32 num_de_sched_algo_trigger;
+	__le32 num_rt_sched_algo_trigger;
+	__le32 num_tqm_sched_algo_trigger;
+	__le32 notify_sched;
+	__le32 dur_based_sendn_term;
 };
 
 struct htt_stats_tx_sched_cmn_tlv {
 	/* BIT [ 7 :  0]   :- mac_id
 	 * BIT [31 :  8]   :- reserved
 	 */
-	u32 mac_id__word;
+	__le32 mac_id__word;
 	/* Current timestamp */
-	u32 current_timestamp;
+	__le32 current_timestamp;
 };
 
 /* == TQM STATS == */
@@ -900,49 +900,49 @@ struct htt_stats_tx_sched_cmn_tlv {
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_tqm_gen_mpdu_stats_tlv_v {
 	/* HTT_TX_TQM_MAX_GEN_MPDU_END_REASON */
-	DECLARE_FLEX_ARRAY(u32, gen_mpdu_end_reason);
+	DECLARE_FLEX_ARRAY(__le32, gen_mpdu_end_reason);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_tqm_list_mpdu_stats_tlv_v {
 	 /* HTT_TX_TQM_MAX_LIST_MPDU_END_REASON */
-	DECLARE_FLEX_ARRAY(u32, list_mpdu_end_reason);
+	DECLARE_FLEX_ARRAY(__le32, list_mpdu_end_reason);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_tx_tqm_list_mpdu_cnt_tlv_v {
 	/* HTT_TX_TQM_MAX_LIST_MPDU_CNT_HISTOGRAM_BINS */
-	DECLARE_FLEX_ARRAY(u32, list_mpdu_cnt_hist);
+	DECLARE_FLEX_ARRAY(__le32, list_mpdu_cnt_hist);
 };
 
 struct htt_tx_tqm_pdev_stats_tlv_v {
-	u32 msdu_count;
-	u32 mpdu_count;
-	u32 remove_msdu;
-	u32 remove_mpdu;
-	u32 remove_msdu_ttl;
-	u32 send_bar;
-	u32 bar_sync;
-	u32 notify_mpdu;
-	u32 sync_cmd;
-	u32 write_cmd;
-	u32 hwsch_trigger;
-	u32 ack_tlv_proc;
-	u32 gen_mpdu_cmd;
-	u32 gen_list_cmd;
-	u32 remove_mpdu_cmd;
-	u32 remove_mpdu_tried_cmd;
-	u32 mpdu_queue_stats_cmd;
-	u32 mpdu_head_info_cmd;
-	u32 msdu_flow_stats_cmd;
-	u32 remove_msdu_cmd;
-	u32 remove_msdu_ttl_cmd;
-	u32 flush_cache_cmd;
-	u32 update_mpduq_cmd;
-	u32 enqueue;
-	u32 enqueue_notify;
-	u32 notify_mpdu_at_head;
-	u32 notify_mpdu_state_valid;
+	__le32 msdu_count;
+	__le32 mpdu_count;
+	__le32 remove_msdu;
+	__le32 remove_mpdu;
+	__le32 remove_msdu_ttl;
+	__le32 send_bar;
+	__le32 bar_sync;
+	__le32 notify_mpdu;
+	__le32 sync_cmd;
+	__le32 write_cmd;
+	__le32 hwsch_trigger;
+	__le32 ack_tlv_proc;
+	__le32 gen_mpdu_cmd;
+	__le32 gen_list_cmd;
+	__le32 remove_mpdu_cmd;
+	__le32 remove_mpdu_tried_cmd;
+	__le32 mpdu_queue_stats_cmd;
+	__le32 mpdu_head_info_cmd;
+	__le32 msdu_flow_stats_cmd;
+	__le32 remove_msdu_cmd;
+	__le32 remove_msdu_ttl_cmd;
+	__le32 flush_cache_cmd;
+	__le32 update_mpduq_cmd;
+	__le32 enqueue;
+	__le32 enqueue_notify;
+	__le32 notify_mpdu_at_head;
+	__le32 notify_mpdu_state_valid;
 	/*
 	 * On receiving TQM_FLOW_NOT_EMPTY_STATUS from TQM, (on MSDUs being enqueued
 	 * the flow is non empty), if the number of MSDUs is greater than the threshold,
@@ -955,30 +955,30 @@ struct htt_tx_tqm_pdev_stats_tlv_v {
 	 *
 	 * Notify signifies that we trigger the scheduler.
 	 */
-	u32 sched_udp_notify1;
-	u32 sched_udp_notify2;
-	u32 sched_nonudp_notify1;
-	u32 sched_nonudp_notify2;
+	__le32 sched_udp_notify1;
+	__le32 sched_udp_notify2;
+	__le32 sched_nonudp_notify1;
+	__le32 sched_nonudp_notify2;
 };
 
 struct htt_tx_tqm_cmn_stats_tlv {
-	u32 mac_id__word;
-	u32 max_cmdq_id;
-	u32 list_mpdu_cnt_hist_intvl;
+	__le32 mac_id__word;
+	__le32 max_cmdq_id;
+	__le32 list_mpdu_cnt_hist_intvl;
 
 	/* Global stats */
-	u32 add_msdu;
-	u32 q_empty;
-	u32 q_not_empty;
-	u32 drop_notification;
-	u32 desc_threshold;
+	__le32 add_msdu;
+	__le32 q_empty;
+	__le32 q_not_empty;
+	__le32 drop_notification;
+	__le32 desc_threshold;
 };
 
 struct htt_tx_tqm_error_stats_tlv {
 	/* Error stats */
-	u32 q_empty_failure;
-	u32 q_not_empty_failure;
-	u32 add_msdu_failure;
+	__le32 q_empty_failure;
+	__le32 q_not_empty_failure;
+	__le32 add_msdu_failure;
 };
 
 /* == TQM CMDQ stats == */
@@ -986,117 +986,117 @@ struct htt_tx_tqm_error_stats_tlv {
 #define	HTT_TX_TQM_CMDQ_STATUS_CMDQ_ID	GENMASK(15, 8)
 
 struct htt_tx_tqm_cmdq_status_tlv {
-	u32 mac_id__cmdq_id__word;
-	u32 sync_cmd;
-	u32 write_cmd;
-	u32 gen_mpdu_cmd;
-	u32 mpdu_queue_stats_cmd;
-	u32 mpdu_head_info_cmd;
-	u32 msdu_flow_stats_cmd;
-	u32 remove_mpdu_cmd;
-	u32 remove_msdu_cmd;
-	u32 flush_cache_cmd;
-	u32 update_mpduq_cmd;
-	u32 update_msduq_cmd;
+	__le32 mac_id__cmdq_id__word;
+	__le32 sync_cmd;
+	__le32 write_cmd;
+	__le32 gen_mpdu_cmd;
+	__le32 mpdu_queue_stats_cmd;
+	__le32 mpdu_head_info_cmd;
+	__le32 msdu_flow_stats_cmd;
+	__le32 remove_mpdu_cmd;
+	__le32 remove_msdu_cmd;
+	__le32 flush_cache_cmd;
+	__le32 update_mpduq_cmd;
+	__le32 update_msduq_cmd;
 };
 
 /* == TX-DE STATS == */
 /* Structures for tx de stats */
 struct htt_tx_de_eapol_packets_stats_tlv {
-	u32 m1_packets;
-	u32 m2_packets;
-	u32 m3_packets;
-	u32 m4_packets;
-	u32 g1_packets;
-	u32 g2_packets;
+	__le32 m1_packets;
+	__le32 m2_packets;
+	__le32 m3_packets;
+	__le32 m4_packets;
+	__le32 g1_packets;
+	__le32 g2_packets;
 };
 
 struct htt_tx_de_classify_failed_stats_tlv {
-	u32 ap_bss_peer_not_found;
-	u32 ap_bcast_mcast_no_peer;
-	u32 sta_delete_in_progress;
-	u32 ibss_no_bss_peer;
-	u32 invalid_vdev_type;
-	u32 invalid_ast_peer_entry;
-	u32 peer_entry_invalid;
-	u32 ethertype_not_ip;
-	u32 eapol_lookup_failed;
-	u32 qpeer_not_allow_data;
-	u32 fse_tid_override;
-	u32 ipv6_jumbogram_zero_length;
-	u32 qos_to_non_qos_in_prog;
+	__le32 ap_bss_peer_not_found;
+	__le32 ap_bcast_mcast_no_peer;
+	__le32 sta_delete_in_progress;
+	__le32 ibss_no_bss_peer;
+	__le32 invalid_vdev_type;
+	__le32 invalid_ast_peer_entry;
+	__le32 peer_entry_invalid;
+	__le32 ethertype_not_ip;
+	__le32 eapol_lookup_failed;
+	__le32 qpeer_not_allow_data;
+	__le32 fse_tid_override;
+	__le32 ipv6_jumbogram_zero_length;
+	__le32 qos_to_non_qos_in_prog;
 };
 
 struct htt_tx_de_classify_stats_tlv {
-	u32 arp_packets;
-	u32 igmp_packets;
-	u32 dhcp_packets;
-	u32 host_inspected;
-	u32 htt_included;
-	u32 htt_valid_mcs;
-	u32 htt_valid_nss;
-	u32 htt_valid_preamble_type;
-	u32 htt_valid_chainmask;
-	u32 htt_valid_guard_interval;
-	u32 htt_valid_retries;
-	u32 htt_valid_bw_info;
-	u32 htt_valid_power;
-	u32 htt_valid_key_flags;
-	u32 htt_valid_no_encryption;
-	u32 fse_entry_count;
-	u32 fse_priority_be;
-	u32 fse_priority_high;
-	u32 fse_priority_low;
-	u32 fse_traffic_ptrn_be;
-	u32 fse_traffic_ptrn_over_sub;
-	u32 fse_traffic_ptrn_bursty;
-	u32 fse_traffic_ptrn_interactive;
-	u32 fse_traffic_ptrn_periodic;
-	u32 fse_hwqueue_alloc;
-	u32 fse_hwqueue_created;
-	u32 fse_hwqueue_send_to_host;
-	u32 mcast_entry;
-	u32 bcast_entry;
-	u32 htt_update_peer_cache;
-	u32 htt_learning_frame;
-	u32 fse_invalid_peer;
+	__le32 arp_packets;
+	__le32 igmp_packets;
+	__le32 dhcp_packets;
+	__le32 host_inspected;
+	__le32 htt_included;
+	__le32 htt_valid_mcs;
+	__le32 htt_valid_nss;
+	__le32 htt_valid_preamble_type;
+	__le32 htt_valid_chainmask;
+	__le32 htt_valid_guard_interval;
+	__le32 htt_valid_retries;
+	__le32 htt_valid_bw_info;
+	__le32 htt_valid_power;
+	__le32 htt_valid_key_flags;
+	__le32 htt_valid_no_encryption;
+	__le32 fse_entry_count;
+	__le32 fse_priority_be;
+	__le32 fse_priority_high;
+	__le32 fse_priority_low;
+	__le32 fse_traffic_ptrn_be;
+	__le32 fse_traffic_ptrn_over_sub;
+	__le32 fse_traffic_ptrn_bursty;
+	__le32 fse_traffic_ptrn_interactive;
+	__le32 fse_traffic_ptrn_periodic;
+	__le32 fse_hwqueue_alloc;
+	__le32 fse_hwqueue_created;
+	__le32 fse_hwqueue_send_to_host;
+	__le32 mcast_entry;
+	__le32 bcast_entry;
+	__le32 htt_update_peer_cache;
+	__le32 htt_learning_frame;
+	__le32 fse_invalid_peer;
 	/*
 	 * mec_notify is HTT TX WBM multicast echo check notification
 	 * from firmware to host.  FW sends SA addresses to host for all
 	 * multicast/broadcast packets received on STA side.
 	 */
-	u32    mec_notify;
+	__le32    mec_notify;
 };
 
 struct htt_tx_de_classify_status_stats_tlv {
-	u32 eok;
-	u32 classify_done;
-	u32 lookup_failed;
-	u32 send_host_dhcp;
-	u32 send_host_mcast;
-	u32 send_host_unknown_dest;
-	u32 send_host;
-	u32 status_invalid;
+	__le32 eok;
+	__le32 classify_done;
+	__le32 lookup_failed;
+	__le32 send_host_dhcp;
+	__le32 send_host_mcast;
+	__le32 send_host_unknown_dest;
+	__le32 send_host;
+	__le32 status_invalid;
 };
 
 struct htt_tx_de_enqueue_packets_stats_tlv {
-	u32 enqueued_pkts;
-	u32 to_tqm;
-	u32 to_tqm_bypass;
+	__le32 enqueued_pkts;
+	__le32 to_tqm;
+	__le32 to_tqm_bypass;
 };
 
 struct htt_tx_de_enqueue_discard_stats_tlv {
-	u32 discarded_pkts;
-	u32 local_frames;
-	u32 is_ext_msdu;
+	__le32 discarded_pkts;
+	__le32 local_frames;
+	__le32 is_ext_msdu;
 };
 
 struct htt_tx_de_compl_stats_tlv {
-	u32 tcl_dummy_frame;
-	u32 tqm_dummy_frame;
-	u32 tqm_notify_frame;
-	u32 fw2wbm_enq;
-	u32 tqm_bypass_frame;
+	__le32 tcl_dummy_frame;
+	__le32 tqm_dummy_frame;
+	__le32 tqm_notify_frame;
+	__le32 fw2wbm_enq;
+	__le32 tqm_bypass_frame;
 };
 
 /*
@@ -1111,19 +1111,19 @@ struct htt_tx_de_compl_stats_tlv {
  *                               ENTRIES_PER_BIN_COUNT)
  */
 struct htt_tx_de_fw2wbm_ring_full_hist_tlv {
-	DECLARE_FLEX_ARRAY(u32, fw2wbm_ring_full_hist);
+	DECLARE_FLEX_ARRAY(__le32, fw2wbm_ring_full_hist);
 };
 
 struct htt_tx_de_cmn_stats_tlv {
-	u32   mac_id__word;
+	__le32   mac_id__word;
 
 	/* Global Stats */
-	u32   tcl2fw_entry_count;
-	u32   not_to_fw;
-	u32   invalid_pdev_vdev_peer;
-	u32   tcl_res_invalid_addrx;
-	u32   wbm2fw_entry_count;
-	u32   invalid_pdev;
+	__le32   tcl2fw_entry_count;
+	__le32   not_to_fw;
+	__le32   invalid_pdev_vdev_peer;
+	__le32   tcl_res_invalid_addrx;
+	__le32   wbm2fw_entry_count;
+	__le32   invalid_pdev;
 };
 
 /* == RING-IF STATS == */
@@ -1140,64 +1140,64 @@ struct htt_tx_de_cmn_stats_tlv {
 #define HTT_RING_IF_STATS_HWM_THRESH		GENMASK(31, 16)
 
 struct htt_ring_if_stats_tlv {
-	u32 base_addr; /* DWORD aligned base memory address of the ring */
-	u32 elem_size;
-	u32 num_elems__prefetch_tail_idx;
-	u32 head_idx__tail_idx;
-	u32 shadow_head_idx__shadow_tail_idx;
-	u32 num_tail_incr;
-	u32 lwm_thresh__hwm_thresh;
-	u32 overrun_hit_count;
-	u32 underrun_hit_count;
-	u32 prod_blockwait_count;
-	u32 cons_blockwait_count;
-	u32 low_wm_hit_count[HTT_STATS_LOW_WM_BINS];
-	u32 high_wm_hit_count[HTT_STATS_HIGH_WM_BINS];
+	__le32 base_addr; /* DWORD aligned base memory address of the ring */
+	__le32 elem_size;
+	__le32 num_elems__prefetch_tail_idx;
+	__le32 head_idx__tail_idx;
+	__le32 shadow_head_idx__shadow_tail_idx;
+	__le32 num_tail_incr;
+	__le32 lwm_thresh__hwm_thresh;
+	__le32 overrun_hit_count;
+	__le32 underrun_hit_count;
+	__le32 prod_blockwait_count;
+	__le32 cons_blockwait_count;
+	__le32 low_wm_hit_count[HTT_STATS_LOW_WM_BINS];
+	__le32 high_wm_hit_count[HTT_STATS_HIGH_WM_BINS];
 };
 
 struct htt_ring_if_cmn_tlv {
-	u32 mac_id__word;
-	u32 num_records;
+	__le32 mac_id__word;
+	__le32 num_records;
 };
 
 /* == SFM STATS == */
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_sfm_client_user_tlv_v {
 	/* Number of DWORDS used per user and per client */
-	DECLARE_FLEX_ARRAY(u32, dwords_used_by_user_n);
+	DECLARE_FLEX_ARRAY(__le32, dwords_used_by_user_n);
 };
 
 struct htt_sfm_client_tlv {
 	/* Client ID */
-	u32 client_id;
+	__le32 client_id;
 	/* Minimum number of buffers */
-	u32 buf_min;
+	__le32 buf_min;
 	/* Maximum number of buffers */
-	u32 buf_max;
+	__le32 buf_max;
 	/* Number of Busy buffers */
-	u32 buf_busy;
+	__le32 buf_busy;
 	/* Number of Allocated buffers */
-	u32 buf_alloc;
+	__le32 buf_alloc;
 	/* Number of Available/Usable buffers */
-	u32 buf_avail;
+	__le32 buf_avail;
 	/* Number of users */
-	u32 num_users;
+	__le32 num_users;
 };
 
 struct htt_sfm_cmn_tlv {
-	u32 mac_id__word;
+	__le32 mac_id__word;
 	/* Indicates the total number of 128 byte buffers
 	 * in the CMEM that are available for buffer sharing
 	 */
-	u32 buf_total;
+	__le32 buf_total;
 	/* Indicates for certain client or all the clients
 	 * there is no dowrd saved in SFM, refer to SFM_R1_MEM_EMPTY
 	 */
-	u32 mem_empty;
+	__le32 mem_empty;
 	/* DEALLOCATE_BUFFERS, refer to register SFM_R0_DEALLOCATE_BUFFERS */
-	u32 deallocate_bufs;
+	__le32 deallocate_bufs;
 	/* Number of Records */
-	u32 num_records;
+	__le32 num_records;
 };
 
 /* == SRNG STATS == */
@@ -1215,20 +1215,20 @@ struct htt_sfm_cmn_tlv {
 #define HTT_SRING_STATS_INTERNAL_TAIL_PTR	GENMASK(31, 16)
 
 struct htt_sring_stats_tlv {
-	u32 mac_id__ring_id__arena__ep;
-	u32 base_addr_lsb; /* DWORD aligned base memory address of the ring */
-	u32 base_addr_msb;
-	u32 ring_size;
-	u32 elem_size;
+	__le32 mac_id__ring_id__arena__ep;
+	__le32 base_addr_lsb; /* DWORD aligned base memory address of the ring */
+	__le32 base_addr_msb;
+	__le32 ring_size;
+	__le32 elem_size;
 
-	u32 num_avail_words__num_valid_words;
-	u32 head_ptr__tail_ptr;
-	u32 consumer_empty__producer_full;
-	u32 prefetch_count__internal_tail_ptr;
+	__le32 num_avail_words__num_valid_words;
+	__le32 head_ptr__tail_ptr;
+	__le32 consumer_empty__producer_full;
+	__le32 prefetch_count__internal_tail_ptr;
 };
 
 struct htt_sring_cmn_tlv {
-	u32 num_records;
+	__le32 num_records;
 };
 
 /* == PDEV TX RATE CTRL STATS == */
@@ -1247,33 +1247,33 @@ struct htt_sring_cmn_tlv {
 	 HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS)
 
 struct htt_tx_pdev_rate_stats_tlv {
-	u32 mac_id__word;
-	u32 tx_ldpc;
-	u32 rts_cnt;
+	__le32 mac_id__word;
+	__le32 tx_ldpc;
+	__le32 rts_cnt;
 	/* RSSI value of last ack packet (units = dB above noise floor) */
-	u32 ack_rssi;
+	__le32 ack_rssi;
 
-	u32 tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
 
-	u32 tx_su_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 tx_mu_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_su_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_mu_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
 
 	/* element 0,1, ...7 -> NSS 1,2, ...8 */
-	u32 tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	/* element 0: 20 MHz, 1: 40 MHz, 2: 80 MHz, 3: 160 and 80+80 MHz */
-	u32 tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
-	u32 tx_stbc[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 tx_pream[HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES];
+	__le32 tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
+	__le32 tx_stbc[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_pream[HTT_TX_PDEV_STATS_NUM_PREAMBLE_TYPES];
 
 	/* Counters to track number of tx packets
 	 * in each GI (400us, 800us, 1600us & 3200us) in each mcs (0-11)
 	 */
-	u32 tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS][HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS][HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
 
 	/* Counters to track packets in dcm mcs (MCS 0, 1, 3, 4) */
-	u32 tx_dcm[HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS];
+	__le32 tx_dcm[HTT_TX_PDEV_STATS_NUM_DCM_COUNTERS];
 	/* Number of CTS-acknowledged RTS packets */
-	u32 rts_success;
+	__le32 rts_success;
 
 	/*
 	 * Counters for legacy 11a and 11b transmissions.
@@ -1285,12 +1285,12 @@ struct htt_tx_pdev_rate_stats_tlv {
 	 * OFDM: 0: 6 Mbps, 1: 9 Mbps, 2: 12 Mbps, 3: 18 Mbps,
 	 *       4: 24 Mbps, 5: 36 Mbps, 6: 48 Mbps, 7: 54 Mbps
 	 */
-	u32 tx_legacy_cck_rate[HTT_TX_PDEV_STATS_NUM_LEGACY_CCK_STATS];
-	u32 tx_legacy_ofdm_rate[HTT_TX_PDEV_STATS_NUM_LEGACY_OFDM_STATS];
+	__le32 tx_legacy_cck_rate[HTT_TX_PDEV_STATS_NUM_LEGACY_CCK_STATS];
+	__le32 tx_legacy_ofdm_rate[HTT_TX_PDEV_STATS_NUM_LEGACY_OFDM_STATS];
 
-	u32 ac_mu_mimo_tx_ldpc;
-	u32 ax_mu_mimo_tx_ldpc;
-	u32 ofdma_tx_ldpc;
+	__le32 ac_mu_mimo_tx_ldpc;
+	__le32 ax_mu_mimo_tx_ldpc;
+	__le32 ofdma_tx_ldpc;
 
 	/*
 	 * Counters for 11ax HE LTF selection during TX.
@@ -1299,25 +1299,25 @@ struct htt_tx_pdev_rate_stats_tlv {
 	 *
 	 * 0: unused, 1: 1x LTF, 2: 2x LTF, 3: 4x LTF
 	 */
-	u32 tx_he_ltf[HTT_TX_PDEV_STATS_NUM_LTF];
+	__le32 tx_he_ltf[HTT_TX_PDEV_STATS_NUM_LTF];
 
-	u32 ac_mu_mimo_tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 ax_mu_mimo_tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 ofdma_tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 ac_mu_mimo_tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 ax_mu_mimo_tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 ofdma_tx_mcs[HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
 
-	u32 ac_mu_mimo_tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
-	u32 ax_mu_mimo_tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
-	u32 ofdma_tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 ac_mu_mimo_tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 ax_mu_mimo_tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 ofdma_tx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 
-	u32 ac_mu_mimo_tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
-	u32 ax_mu_mimo_tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
-	u32 ofdma_tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
+	__le32 ac_mu_mimo_tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
+	__le32 ax_mu_mimo_tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
+	__le32 ofdma_tx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
 
-	u32 ac_mu_mimo_tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
+	__le32 ac_mu_mimo_tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
 			    [HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 ax_mu_mimo_tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
+	__le32 ax_mu_mimo_tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
 			    [HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 ofdma_tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
+	__le32 ofdma_tx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
 		       [HTT_TX_PDEV_STATS_NUM_MCS_COUNTERS];
 };
 
@@ -1336,23 +1336,23 @@ struct htt_tx_pdev_rate_stats_tlv {
 #define HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER          8
 
 struct htt_rx_pdev_rate_stats_tlv {
-	u32 mac_id__word;
-	u32 nsts;
+	__le32 mac_id__word;
+	__le32 nsts;
 
-	u32 rx_ldpc;
-	u32 rts_cnt;
+	__le32 rx_ldpc;
+	__le32 rts_cnt;
 
-	u32 rssi_mgmt; /* units = dB above noise floor */
-	u32 rssi_data; /* units = dB above noise floor */
-	u32 rssi_comb; /* units = dB above noise floor */
-	u32 rx_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 rssi_mgmt; /* units = dB above noise floor */
+	__le32 rssi_data; /* units = dB above noise floor */
+	__le32 rssi_comb; /* units = dB above noise floor */
+	__le32 rx_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
 	/* element 0,1, ...7 -> NSS 1,2, ...8 */
-	u32 rx_nss[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
-	u32 rx_dcm[HTT_RX_PDEV_STATS_NUM_DCM_COUNTERS];
-	u32 rx_stbc[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 rx_nss[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 rx_dcm[HTT_RX_PDEV_STATS_NUM_DCM_COUNTERS];
+	__le32 rx_stbc[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
 	/* element 0: 20 MHz, 1: 40 MHz, 2: 80 MHz, 3: 160 and 80+80 MHz */
-	u32 rx_bw[HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
-	u32 rx_pream[HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES];
+	__le32 rx_bw[HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
+	__le32 rx_pream[HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES];
 	u8 rssi_chain[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
 		     [HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
 					/* units = dB above noise floor */
@@ -1360,37 +1360,37 @@ struct htt_rx_pdev_rate_stats_tlv {
 	/* Counters to track number of rx packets
 	 * in each GI in each mcs (0-11)
 	 */
-	u32 rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS][HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 rx_gi[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS][HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
 	s32 rssi_in_dbm; /* rx Signal Strength value in dBm unit */
 
-	u32 rx_11ax_su_ext;
-	u32 rx_11ac_mumimo;
-	u32 rx_11ax_mumimo;
-	u32 rx_11ax_ofdma;
-	u32 txbf;
-	u32 rx_legacy_cck_rate[HTT_RX_PDEV_STATS_NUM_LEGACY_CCK_STATS];
-	u32 rx_legacy_ofdm_rate[HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS];
-	u32 rx_active_dur_us_low;
-	u32 rx_active_dur_us_high;
+	__le32 rx_11ax_su_ext;
+	__le32 rx_11ac_mumimo;
+	__le32 rx_11ax_mumimo;
+	__le32 rx_11ax_ofdma;
+	__le32 txbf;
+	__le32 rx_legacy_cck_rate[HTT_RX_PDEV_STATS_NUM_LEGACY_CCK_STATS];
+	__le32 rx_legacy_ofdm_rate[HTT_RX_PDEV_STATS_NUM_LEGACY_OFDM_STATS];
+	__le32 rx_active_dur_us_low;
+	__le32 rx_active_dur_us_high;
 
-	u32 rx_11ax_ul_ofdma;
+	__le32 rx_11ax_ul_ofdma;
 
-	u32 ul_ofdma_rx_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 ul_ofdma_rx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
+	__le32 ul_ofdma_rx_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 ul_ofdma_rx_gi[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
 			  [HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 ul_ofdma_rx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
-	u32 ul_ofdma_rx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
-	u32 ul_ofdma_rx_stbc;
-	u32 ul_ofdma_rx_ldpc;
+	__le32 ul_ofdma_rx_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 ul_ofdma_rx_bw[HTT_TX_PDEV_STATS_NUM_BW_COUNTERS];
+	__le32 ul_ofdma_rx_stbc;
+	__le32 ul_ofdma_rx_ldpc;
 
 	/* record the stats for each user index */
-	u32 rx_ulofdma_non_data_ppdu[HTT_RX_PDEV_MAX_OFDMA_NUM_USER]; /* ppdu level */
-	u32 rx_ulofdma_data_ppdu[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];     /* ppdu level */
-	u32 rx_ulofdma_mpdu_ok[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];       /* mpdu level */
-	u32 rx_ulofdma_mpdu_fail[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];     /* mpdu level */
+	__le32 rx_ulofdma_non_data_ppdu[HTT_RX_PDEV_MAX_OFDMA_NUM_USER]; /* ppdu level */
+	__le32 rx_ulofdma_data_ppdu[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];     /* ppdu level */
+	__le32 rx_ulofdma_mpdu_ok[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];       /* mpdu level */
+	__le32 rx_ulofdma_mpdu_fail[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];     /* mpdu level */
 
-	u32 nss_count;
-	u32 pilot_count;
+	__le32 nss_count;
+	__le32 pilot_count;
 	/* RxEVM stats in dB */
 	s32 rx_pilot_evm_db[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
 			   [HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS];
@@ -1409,54 +1409,54 @@ struct htt_rx_pdev_rate_stats_tlv {
 	 * BIT [7 : 4]    :- IEEE80211_FC0_SUBTYPE
 	 * BIT [31 : 8]   :- Reserved
 	 */
-	u32 per_chain_rssi_pkt_type;
+	__le32 per_chain_rssi_pkt_type;
 	s8 rx_per_chain_rssi_in_dbm[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
 				   [HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
 
-	u32 rx_su_ndpa;
-	u32 rx_11ax_su_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 rx_mu_ndpa;
-	u32 rx_11ax_mu_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 rx_br_poll;
-	u32 rx_11ax_dl_ofdma_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
-	u32 rx_11ax_dl_ofdma_ru[HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS];
+	__le32 rx_su_ndpa;
+	__le32 rx_11ax_su_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 rx_mu_ndpa;
+	__le32 rx_11ax_mu_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 rx_br_poll;
+	__le32 rx_11ax_dl_ofdma_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
+	__le32 rx_11ax_dl_ofdma_ru[HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS];
 
-	u32 rx_ulmumimo_non_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
-	u32 rx_ulmumimo_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
-	u32 rx_ulmumimo_mpdu_ok[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
-	u32 rx_ulmumimo_mpdu_fail[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
-	u32 rx_ulofdma_non_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
-	u32 rx_ulofdma_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
+	__le32 rx_ulmumimo_non_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
+	__le32 rx_ulmumimo_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
+	__le32 rx_ulmumimo_mpdu_ok[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
+	__le32 rx_ulmumimo_mpdu_fail[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];
+	__le32 rx_ulofdma_non_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
+	__le32 rx_ulofdma_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
 };
 
 /* == RX PDEV/SOC STATS == */
 struct htt_rx_soc_fw_stats_tlv {
-	u32 fw_reo_ring_data_msdu;
-	u32 fw_to_host_data_msdu_bcmc;
-	u32 fw_to_host_data_msdu_uc;
-	u32 ofld_remote_data_buf_recycle_cnt;
-	u32 ofld_remote_free_buf_indication_cnt;
+	__le32 fw_reo_ring_data_msdu;
+	__le32 fw_to_host_data_msdu_bcmc;
+	__le32 fw_to_host_data_msdu_uc;
+	__le32 ofld_remote_data_buf_recycle_cnt;
+	__le32 ofld_remote_free_buf_indication_cnt;
 
-	u32 ofld_buf_to_host_data_msdu_uc;
-	u32 reo_fw_ring_to_host_data_msdu_uc;
+	__le32 ofld_buf_to_host_data_msdu_uc;
+	__le32 reo_fw_ring_to_host_data_msdu_uc;
 
-	u32 wbm_sw_ring_reap;
-	u32 wbm_forward_to_host_cnt;
-	u32 wbm_target_recycle_cnt;
+	__le32 wbm_sw_ring_reap;
+	__le32 wbm_forward_to_host_cnt;
+	__le32 wbm_target_recycle_cnt;
 
-	u32 target_refill_ring_recycle_cnt;
+	__le32 target_refill_ring_recycle_cnt;
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_empty_tlv_v {
 	/* HTT_RX_STATS_REFILL_MAX_RING */
-	DECLARE_FLEX_ARRAY(u32, refill_ring_empty_cnt);
+	DECLARE_FLEX_ARRAY(__le32, refill_ring_empty_cnt);
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_num_refill_tlv_v {
 	/* HTT_RX_STATS_REFILL_MAX_RING */
-	DECLARE_FLEX_ARRAY(u32, refill_ring_num_refill);
+	DECLARE_FLEX_ARRAY(__le32, refill_ring_num_refill);
 };
 
 /* RXDMA error code from WBM released packets */
@@ -1488,7 +1488,7 @@ enum htt_rx_rxdma_error_code_enum {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_num_rxdma_err_tlv_v {
-	DECLARE_FLEX_ARRAY(u32, rxdma_err); /* HTT_RX_RXDMA_MAX_ERR_CODE */
+	DECLARE_FLEX_ARRAY(__le32, rxdma_err); /* HTT_RX_RXDMA_MAX_ERR_CODE */
 };
 
 /* REO error code from WBM released packets */
@@ -1520,69 +1520,69 @@ enum htt_rx_reo_error_code_enum {
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_soc_fw_refill_ring_num_reo_err_tlv_v {
-	DECLARE_FLEX_ARRAY(u32, reo_err); /* HTT_RX_REO_MAX_ERR_CODE */
+	DECLARE_FLEX_ARRAY(__le32, reo_err); /* HTT_RX_REO_MAX_ERR_CODE */
 };
 
 /* == RX PDEV STATS == */
 #define HTT_STATS_SUBTYPE_MAX     16
 
 struct htt_rx_pdev_fw_stats_tlv {
-	u32 mac_id__word;
-	u32 ppdu_recvd;
-	u32 mpdu_cnt_fcs_ok;
-	u32 mpdu_cnt_fcs_err;
-	u32 tcp_msdu_cnt;
-	u32 tcp_ack_msdu_cnt;
-	u32 udp_msdu_cnt;
-	u32 other_msdu_cnt;
-	u32 fw_ring_mpdu_ind;
-	u32 fw_ring_mgmt_subtype[HTT_STATS_SUBTYPE_MAX];
-	u32 fw_ring_ctrl_subtype[HTT_STATS_SUBTYPE_MAX];
-	u32 fw_ring_mcast_data_msdu;
-	u32 fw_ring_bcast_data_msdu;
-	u32 fw_ring_ucast_data_msdu;
-	u32 fw_ring_null_data_msdu;
-	u32 fw_ring_mpdu_drop;
-	u32 ofld_local_data_ind_cnt;
-	u32 ofld_local_data_buf_recycle_cnt;
-	u32 drx_local_data_ind_cnt;
-	u32 drx_local_data_buf_recycle_cnt;
-	u32 local_nondata_ind_cnt;
-	u32 local_nondata_buf_recycle_cnt;
-
-	u32 fw_status_buf_ring_refill_cnt;
-	u32 fw_status_buf_ring_empty_cnt;
-	u32 fw_pkt_buf_ring_refill_cnt;
-	u32 fw_pkt_buf_ring_empty_cnt;
-	u32 fw_link_buf_ring_refill_cnt;
-	u32 fw_link_buf_ring_empty_cnt;
-
-	u32 host_pkt_buf_ring_refill_cnt;
-	u32 host_pkt_buf_ring_empty_cnt;
-	u32 mon_pkt_buf_ring_refill_cnt;
-	u32 mon_pkt_buf_ring_empty_cnt;
-	u32 mon_status_buf_ring_refill_cnt;
-	u32 mon_status_buf_ring_empty_cnt;
-	u32 mon_desc_buf_ring_refill_cnt;
-	u32 mon_desc_buf_ring_empty_cnt;
-	u32 mon_dest_ring_update_cnt;
-	u32 mon_dest_ring_full_cnt;
-
-	u32 rx_suspend_cnt;
-	u32 rx_suspend_fail_cnt;
-	u32 rx_resume_cnt;
-	u32 rx_resume_fail_cnt;
-	u32 rx_ring_switch_cnt;
-	u32 rx_ring_restore_cnt;
-	u32 rx_flush_cnt;
-	u32 rx_recovery_reset_cnt;
+	__le32 mac_id__word;
+	__le32 ppdu_recvd;
+	__le32 mpdu_cnt_fcs_ok;
+	__le32 mpdu_cnt_fcs_err;
+	__le32 tcp_msdu_cnt;
+	__le32 tcp_ack_msdu_cnt;
+	__le32 udp_msdu_cnt;
+	__le32 other_msdu_cnt;
+	__le32 fw_ring_mpdu_ind;
+	__le32 fw_ring_mgmt_subtype[HTT_STATS_SUBTYPE_MAX];
+	__le32 fw_ring_ctrl_subtype[HTT_STATS_SUBTYPE_MAX];
+	__le32 fw_ring_mcast_data_msdu;
+	__le32 fw_ring_bcast_data_msdu;
+	__le32 fw_ring_ucast_data_msdu;
+	__le32 fw_ring_null_data_msdu;
+	__le32 fw_ring_mpdu_drop;
+	__le32 ofld_local_data_ind_cnt;
+	__le32 ofld_local_data_buf_recycle_cnt;
+	__le32 drx_local_data_ind_cnt;
+	__le32 drx_local_data_buf_recycle_cnt;
+	__le32 local_nondata_ind_cnt;
+	__le32 local_nondata_buf_recycle_cnt;
+
+	__le32 fw_status_buf_ring_refill_cnt;
+	__le32 fw_status_buf_ring_empty_cnt;
+	__le32 fw_pkt_buf_ring_refill_cnt;
+	__le32 fw_pkt_buf_ring_empty_cnt;
+	__le32 fw_link_buf_ring_refill_cnt;
+	__le32 fw_link_buf_ring_empty_cnt;
+
+	__le32 host_pkt_buf_ring_refill_cnt;
+	__le32 host_pkt_buf_ring_empty_cnt;
+	__le32 mon_pkt_buf_ring_refill_cnt;
+	__le32 mon_pkt_buf_ring_empty_cnt;
+	__le32 mon_status_buf_ring_refill_cnt;
+	__le32 mon_status_buf_ring_empty_cnt;
+	__le32 mon_desc_buf_ring_refill_cnt;
+	__le32 mon_desc_buf_ring_empty_cnt;
+	__le32 mon_dest_ring_update_cnt;
+	__le32 mon_dest_ring_full_cnt;
+
+	__le32 rx_suspend_cnt;
+	__le32 rx_suspend_fail_cnt;
+	__le32 rx_resume_cnt;
+	__le32 rx_resume_fail_cnt;
+	__le32 rx_ring_switch_cnt;
+	__le32 rx_ring_restore_cnt;
+	__le32 rx_flush_cnt;
+	__le32 rx_recovery_reset_cnt;
 };
 
 #define HTT_STATS_PHY_ERR_MAX 43
 
 struct htt_rx_pdev_fw_stats_phy_err_tlv {
-	u32 mac_id__word;
-	u32 total_phy_err_cnt;
+	__le32 mac_id__word;
+	__le32 total_phy_err_cnt;
 	/* Counts of different types of phy errs
 	 * The mapping of PHY error types to phy_err array elements is HW dependent.
 	 * The only currently-supported mapping is shown below:
@@ -1631,19 +1631,21 @@ struct htt_rx_pdev_fw_stats_phy_err_tlv {
 	 * 41 phyrx_err_unsupported_cbf
 	 * 42 phyrx_err_other
 	 */
-	u32 phy_err[HTT_STATS_PHY_ERR_MAX];
+	__le32 phy_err[HTT_STATS_PHY_ERR_MAX];
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_pdev_fw_ring_mpdu_err_tlv_v {
 	/* Num error MPDU for each RxDMA error type  */
-	DECLARE_FLEX_ARRAY(u32, fw_ring_mpdu_err); /* HTT_RX_STATS_RXDMA_MAX_ERR */
+	DECLARE_FLEX_ARRAY(__le32,
+			   fw_ring_mpdu_err); /* HTT_RX_STATS_RXDMA_MAX_ERR */
 };
 
 /* NOTE: Variable length TLV, use length spec to infer array size */
 struct htt_rx_pdev_fw_mpdu_drop_tlv_v {
 	/* Num MPDU dropped  */
-	DECLARE_FLEX_ARRAY(u32, fw_mpdu_drop); /* HTT_RX_STATS_FW_DROP_REASON_MAX */
+	DECLARE_FLEX_ARRAY(__le32,
+			   fw_mpdu_drop); /* HTT_RX_STATS_FW_DROP_REASON_MAX */
 };
 
 #define HTT_PDEV_CCA_STATS_TX_FRAME_INFO_PRESENT               (0x1)
@@ -1657,22 +1659,22 @@ struct htt_rx_pdev_fw_mpdu_drop_tlv_v {
 
 struct htt_pdev_stats_cca_counters_tlv {
 	/* Below values are obtained from the HW Cycles counter registers */
-	u32 tx_frame_usec;
-	u32 rx_frame_usec;
-	u32 rx_clear_usec;
-	u32 my_rx_frame_usec;
-	u32 usec_cnt;
-	u32 med_rx_idle_usec;
-	u32 med_tx_idle_global_usec;
-	u32 cca_obss_usec;
+	__le32 tx_frame_usec;
+	__le32 rx_frame_usec;
+	__le32 rx_clear_usec;
+	__le32 my_rx_frame_usec;
+	__le32 usec_cnt;
+	__le32 med_rx_idle_usec;
+	__le32 med_tx_idle_global_usec;
+	__le32 cca_obss_usec;
 };
 
 struct htt_pdev_cca_stats_hist_v1_tlv {
-	u32    chan_num;
+	__le32    chan_num;
 	/* num of CCA records (Num of htt_pdev_stats_cca_counters_tlv)*/
-	u32    num_records;
-	u32    valid_cca_counters_bitmap;
-	u32    collection_interval;
+	__le32    num_records;
+	__le32    valid_cca_counters_bitmap;
+	__le32    collection_interval;
 
 	/* This will be followed by an array which contains the CCA stats
 	 * collected in the last N intervals,
@@ -1684,22 +1686,22 @@ struct htt_pdev_cca_stats_hist_v1_tlv {
 };
 
 struct htt_pdev_stats_twt_session_tlv {
-	u32 vdev_id;
+	__le32 vdev_id;
 	struct htt_mac_addr peer_mac;
-	u32 flow_id_flags;
+	__le32 flow_id_flags;
 
 	/* TWT_DIALOG_ID_UNAVAILABLE is used
 	 * when TWT session is not initiated by host
 	 */
-	u32 dialog_id;
-	u32 wake_dura_us;
-	u32 wake_intvl_us;
-	u32 sp_offset_us;
+	__le32 dialog_id;
+	__le32 wake_dura_us;
+	__le32 wake_intvl_us;
+	__le32 sp_offset_us;
 };
 
 struct htt_pdev_stats_twt_sessions_tlv {
-	u32 pdev_id;
-	u32 num_sessions;
+	__le32 pdev_id;
+	__le32 num_sessions;
 	struct htt_pdev_stats_twt_session_tlv twt_session[];
 };
 
@@ -1724,16 +1726,16 @@ enum htt_rx_reo_resource_sample_id_enum {
 
 struct htt_rx_reo_resource_stats_tlv_v {
 	/* Variable based on the Number of records. HTT_RX_REO_RESOURCE_STATS_MAX */
-	u32 sample_id;
-	u32 total_max;
-	u32 total_avg;
-	u32 total_sample;
-	u32 non_zeros_avg;
-	u32 non_zeros_sample;
-	u32 last_non_zeros_max;
-	u32 last_non_zeros_min;
-	u32 last_non_zeros_avg;
-	u32 last_non_zeros_sample;
+	__le32 sample_id;
+	__le32 total_max;
+	__le32 total_avg;
+	__le32 total_sample;
+	__le32 non_zeros_avg;
+	__le32 non_zeros_sample;
+	__le32 last_non_zeros_max;
+	__le32 last_non_zeros_min;
+	__le32 last_non_zeros_avg;
+	__le32 last_non_zeros_sample;
 };
 
 /* == TX SOUNDING STATS == */
@@ -1753,49 +1755,49 @@ enum htt_stats_sounding_tx_mode {
 };
 
 struct htt_tx_sounding_stats_tlv {
-	u32 tx_sounding_mode; /* HTT_TX_XX_SOUNDING_MODE */
+	__le32 tx_sounding_mode; /* HTT_TX_XX_SOUNDING_MODE */
 	/* Counts number of soundings for all steering modes in each bw */
-	u32 cbf_20[HTT_TXBF_MAX_NUM_OF_MODES];
-	u32 cbf_40[HTT_TXBF_MAX_NUM_OF_MODES];
-	u32 cbf_80[HTT_TXBF_MAX_NUM_OF_MODES];
-	u32 cbf_160[HTT_TXBF_MAX_NUM_OF_MODES];
+	__le32 cbf_20[HTT_TXBF_MAX_NUM_OF_MODES];
+	__le32 cbf_40[HTT_TXBF_MAX_NUM_OF_MODES];
+	__le32 cbf_80[HTT_TXBF_MAX_NUM_OF_MODES];
+	__le32 cbf_160[HTT_TXBF_MAX_NUM_OF_MODES];
 	/*
 	 * The sounding array is a 2-D array stored as an 1-D array of
-	 * u32. The stats for a particular user/bw combination is
+	 * __le32. The stats for a particular user/bw combination is
 	 * referenced with the following:
 	 *
 	 *          sounding[(user* max_bw) + bw]
 	 *
 	 * ... where max_bw == 4 for 160mhz
 	 */
-	u32 sounding[HTT_TX_NUM_OF_SOUNDING_STATS_WORDS];
+	__le32 sounding[HTT_TX_NUM_OF_SOUNDING_STATS_WORDS];
 };
 
 struct htt_pdev_obss_pd_stats_tlv {
-	u32 num_obss_tx_ppdu_success;
-	u32 num_obss_tx_ppdu_failure;
-	u32 num_sr_tx_transmissions;
-	u32 num_spatial_reuse_opportunities;
-	u32 num_non_srg_opportunities;
-	u32 num_non_srg_ppdu_tried;
-	u32 num_non_srg_ppdu_success;
-	u32 num_srg_opportunities;
-	u32 num_srg_ppdu_tried;
-	u32 num_srg_ppdu_success;
-	u32 num_psr_opportunities;
-	u32 num_psr_ppdu_tried;
-	u32 num_psr_ppdu_success;
+	__le32 num_obss_tx_ppdu_success;
+	__le32 num_obss_tx_ppdu_failure;
+	__le32 num_sr_tx_transmissions;
+	__le32 num_spatial_reuse_opportunities;
+	__le32 num_non_srg_opportunities;
+	__le32 num_non_srg_ppdu_tried;
+	__le32 num_non_srg_ppdu_success;
+	__le32 num_srg_opportunities;
+	__le32 num_srg_ppdu_tried;
+	__le32 num_srg_ppdu_success;
+	__le32 num_psr_opportunities;
+	__le32 num_psr_ppdu_tried;
+	__le32 num_psr_ppdu_success;
 };
 
 struct htt_ring_backpressure_stats_tlv {
-	u32 pdev_id;
-	u32 current_head_idx;
-	u32 current_tail_idx;
-	u32 num_htt_msgs_sent;
+	__le32 pdev_id;
+	__le32 current_head_idx;
+	__le32 current_tail_idx;
+	__le32 num_htt_msgs_sent;
 	/* Time in milliseconds for which the ring has been in
 	 * its current backpressure condition
 	 */
-	u32 backpressure_time_ms;
+	__le32 backpressure_time_ms;
 	/* backpressure_hist - histogram showing how many times
 	 * different degrees of backpressure duration occurred:
 	 * Index 0 indicates the number of times ring was
@@ -1809,7 +1811,7 @@ struct htt_ring_backpressure_stats_tlv {
 	 * Index 4 indicates the number of times ring was
 	 * continuously in backpressure state beyond 500ms.
 	 */
-	u32 backpressure_hist[5];
+	__le32 backpressure_hist[5];
 };
 
 #define HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS 14
@@ -1818,75 +1820,75 @@ struct htt_ring_backpressure_stats_tlv {
 
 struct htt_pdev_txrate_txbf_stats_tlv {
 	/* SU TxBF TX MCS stats */
-	u32 tx_su_txbf_mcs[HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_su_txbf_mcs[HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS];
 	/* Implicit BF TX MCS stats */
-	u32 tx_su_ibf_mcs[HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_su_ibf_mcs[HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS];
 	/* Open loop TX MCS stats */
-	u32 tx_su_ol_mcs[HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS];
+	__le32 tx_su_ol_mcs[HTT_TX_TXBF_RATE_STATS_NUM_MCS_COUNTERS];
 	/* SU TxBF TX NSS stats */
-	u32 tx_su_txbf_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 tx_su_txbf_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	/* Implicit BF TX NSS stats */
-	u32 tx_su_ibf_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 tx_su_ibf_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	/* Open loop TX NSS stats */
-	u32 tx_su_ol_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
+	__le32 tx_su_ol_nss[HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS];
 	/* SU TxBF TX BW stats */
-	u32 tx_su_txbf_bw[HTT_TX_TXBF_RATE_STATS_NUM_BW_COUNTERS];
+	__le32 tx_su_txbf_bw[HTT_TX_TXBF_RATE_STATS_NUM_BW_COUNTERS];
 	/* Implicit BF TX BW stats */
-	u32 tx_su_ibf_bw[HTT_TX_TXBF_RATE_STATS_NUM_BW_COUNTERS];
+	__le32 tx_su_ibf_bw[HTT_TX_TXBF_RATE_STATS_NUM_BW_COUNTERS];
 	/* Open loop TX BW stats */
-	u32 tx_su_ol_bw[HTT_TX_TXBF_RATE_STATS_NUM_BW_COUNTERS];
+	__le32 tx_su_ol_bw[HTT_TX_TXBF_RATE_STATS_NUM_BW_COUNTERS];
 };
 
 struct htt_txbf_ofdma_ndpa_stats_tlv {
 	/* 11AX HE OFDMA NDPA frame queued to the HW */
-	u32 ax_ofdma_ndpa_queued[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndpa_queued[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA NDPA frame sent over the air */
-	u32 ax_ofdma_ndpa_tried[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndpa_tried[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA NDPA frame flushed by HW */
-	u32 ax_ofdma_ndpa_flushed[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndpa_flushed[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA NDPA frame completed with error(s) */
-	u32 ax_ofdma_ndpa_err[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndpa_err[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 };
 
 struct htt_txbf_ofdma_ndp_stats_tlv {
 	/* 11AX HE OFDMA NDP frame queued to the HW */
-	u32 ax_ofdma_ndp_queued[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndp_queued[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA NDPA frame sent over the air */
-	u32 ax_ofdma_ndp_tried[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndp_tried[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA NDPA frame flushed by HW */
-	u32 ax_ofdma_ndp_flushed[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndp_flushed[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA NDPA frame completed with error(s) */
-	u32 ax_ofdma_ndp_err[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_ndp_err[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 };
 
 struct htt_txbf_ofdma_brp_stats_tlv {
 	/* 11AX HE OFDMA MU BRPOLL frame queued to the HW */
-	u32 ax_ofdma_brpoll_queued[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_brpoll_queued[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA MU BRPOLL frame sent over the air */
-	u32 ax_ofdma_brpoll_tried[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_brpoll_tried[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA MU BRPOLL frame flushed by HW */
-	u32 ax_ofdma_brpoll_flushed[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_brpoll_flushed[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA MU BRPOLL frame completed with error(s) */
-	u32 ax_ofdma_brp_err[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_brp_err[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* Number of CBF(s) received when 11AX HE OFDMA MU BRPOLL frame
 	 * completed with error(s).
 	 */
-	u32 ax_ofdma_brp_err_num_cbf_rcvd[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS + 1];
+	__le32 ax_ofdma_brp_err_num_cbf_rcvd[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS + 1];
 };
 
 struct htt_txbf_ofdma_steer_stats_tlv {
 	/* 11AX HE OFDMA PPDUs that were sent over the air with steering (TXBF + OFDMA) */
-	u32 ax_ofdma_num_ppdu_steer[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_num_ppdu_steer[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA PPDUs that were sent over the air in open loop */
-	u32 ax_ofdma_num_ppdu_ol[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_num_ppdu_ol[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA number of users for which CBF prefetch was
 	 * initiated to PHY HW during TX.
 	 */
-	u32 ax_ofdma_num_usrs_prefetch[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_num_usrs_prefetch[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA number of users for which sounding was initiated during TX */
-	u32 ax_ofdma_num_usrs_sound[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_num_usrs_sound[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 	/* 11AX HE OFDMA number of users for which sounding was forced during TX */
-	u32 ax_ofdma_num_usrs_force_sound[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
+	__le32 ax_ofdma_num_usrs_force_sound[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
 };
 
 #define HTT_MAX_RX_PKT_CNT 8
@@ -1898,38 +1900,38 @@ struct htt_txbf_ofdma_steer_stats_tlv {
 
 struct htt_phy_counters_tlv {
 	/* number of RXTD OFDMA OTA error counts except power surge and drop */
-	u32 rx_ofdma_timing_err_cnt;
+	__le32 rx_ofdma_timing_err_cnt;
 	/* rx_cck_fail_cnt:
 	 * number of cck error counts due to rx reception failure because of
 	 * timing error in cck
 	 */
-	u32 rx_cck_fail_cnt;
+	__le32 rx_cck_fail_cnt;
 	/* number of times tx abort initiated by mac */
-	u32 mactx_abort_cnt;
+	__le32 mactx_abort_cnt;
 	/* number of times rx abort initiated by mac */
-	u32 macrx_abort_cnt;
+	__le32 macrx_abort_cnt;
 	/* number of times tx abort initiated by phy */
-	u32 phytx_abort_cnt;
+	__le32 phytx_abort_cnt;
 	/* number of times rx abort initiated by phy */
-	u32 phyrx_abort_cnt;
+	__le32 phyrx_abort_cnt;
 	/* number of rx deferred count initiated by phy */
-	u32 phyrx_defer_abort_cnt;
+	__le32 phyrx_defer_abort_cnt;
 	/* number of sizing events generated at LSTF */
-	u32 rx_gain_adj_lstf_event_cnt;
+	__le32 rx_gain_adj_lstf_event_cnt;
 	/* number of sizing events generated at non-legacy LTF */
-	u32 rx_gain_adj_non_legacy_cnt;
+	__le32 rx_gain_adj_non_legacy_cnt;
 	/* rx_pkt_cnt -
 	 * Received EOP (end-of-packet) count per packet type;
 	 * [0] = 11a; [1] = 11b; [2] = 11n; [3] = 11ac; [4] = 11ax; [5] = GF
 	 * [6-7]=RSVD
 	 */
-	u32 rx_pkt_cnt[HTT_MAX_RX_PKT_CNT];
+	__le32 rx_pkt_cnt[HTT_MAX_RX_PKT_CNT];
 	/* rx_pkt_crc_pass_cnt -
 	 * Received EOP (end-of-packet) count per packet type;
 	 * [0] = 11a; [1] = 11b; [2] = 11n; [3] = 11ac; [4] = 11ax; [5] = GF
 	 * [6-7]=RSVD
 	 */
-	u32 rx_pkt_crc_pass_cnt[HTT_MAX_RX_PKT_CRC_PASS_CNT];
+	__le32 rx_pkt_crc_pass_cnt[HTT_MAX_RX_PKT_CRC_PASS_CNT];
 	/* per_blk_err_cnt -
 	 * Error count per error source;
 	 * [0] = unknown; [1] = LSIG; [2] = HTSIG; [3] = VHTSIG; [4] = HESIG;
@@ -1937,7 +1939,7 @@ struct htt_phy_counters_tlv {
 	 * [9] = PMI; [10] = TXFD; [11] = TXTD; [12] = PHYRF
 	 * [13-19]=RSVD
 	 */
-	u32 per_blk_err_cnt[HTT_MAX_PER_BLK_ERR_CNT];
+	__le32 per_blk_err_cnt[HTT_MAX_PER_BLK_ERR_CNT];
 	/* rx_ota_err_cnt -
 	 * RXTD OTA (over-the-air) error count per error reason;
 	 * [0] = voting fail; [1] = weak det fail; [2] = strong sig fail;
@@ -1946,16 +1948,16 @@ struct htt_phy_counters_tlv {
 	 * [8] = coarse timing timeout error
 	 * [9-13]=RSVD
 	 */
-	u32 rx_ota_err_cnt[HTT_MAX_RX_OTA_ERR_CNT];
+	__le32 rx_ota_err_cnt[HTT_MAX_RX_OTA_ERR_CNT];
 };
 
 struct htt_phy_stats_tlv {
 	/* per chain hw noise floor values in dBm */
 	s32 nf_chain[HTT_STATS_MAX_CHAINS];
 	/* number of false radars detected */
-	u32 false_radar_cnt;
+	__le32 false_radar_cnt;
 	/* number of channel switches happened due to radar detection */
-	u32 radar_cs_cnt;
+	__le32 radar_cs_cnt;
 	/* ani_level -
 	 * ANI level (noise interference) corresponds to the channel
 	 * the desense levels range from -5 to 15 in dB units,
@@ -1963,48 +1965,48 @@ struct htt_phy_stats_tlv {
 	 */
 	s32 ani_level;
 	/* running time in minutes since FW boot */
-	u32 fw_run_time;
+	__le32 fw_run_time;
 };
 
 struct htt_phy_reset_counters_tlv {
-	u32 pdev_id;
-	u32 cf_active_low_fail_cnt;
-	u32 cf_active_low_pass_cnt;
-	u32 phy_off_through_vreg_cnt;
-	u32 force_calibration_cnt;
-	u32 rf_mode_switch_phy_off_cnt;
+	__le32 pdev_id;
+	__le32 cf_active_low_fail_cnt;
+	__le32 cf_active_low_pass_cnt;
+	__le32 phy_off_through_vreg_cnt;
+	__le32 force_calibration_cnt;
+	__le32 rf_mode_switch_phy_off_cnt;
 };
 
 struct htt_phy_reset_stats_tlv {
-	u32 pdev_id;
-	u32 chan_mhz;
-	u32 chan_band_center_freq1;
-	u32 chan_band_center_freq2;
-	u32 chan_phy_mode;
-	u32 chan_flags;
-	u32 chan_num;
-	u32 reset_cause;
-	u32 prev_reset_cause;
-	u32 phy_warm_reset_src;
-	u32 rx_gain_tbl_mode;
-	u32 xbar_val;
-	u32 force_calibration;
-	u32 phyrf_mode;
-	u32 phy_homechan;
-	u32 phy_tx_ch_mask;
-	u32 phy_rx_ch_mask;
-	u32 phybb_ini_mask;
-	u32 phyrf_ini_mask;
-	u32 phy_dfs_en_mask;
-	u32 phy_sscan_en_mask;
-	u32 phy_synth_sel_mask;
-	u32 phy_adfs_freq;
-	u32 cck_fir_settings;
-	u32 phy_dyn_pri_chan;
-	u32 cca_thresh;
-	u32 dyn_cca_status;
-	u32 rxdesense_thresh_hw;
-	u32 rxdesense_thresh_sw;
+	__le32 pdev_id;
+	__le32 chan_mhz;
+	__le32 chan_band_center_freq1;
+	__le32 chan_band_center_freq2;
+	__le32 chan_phy_mode;
+	__le32 chan_flags;
+	__le32 chan_num;
+	__le32 reset_cause;
+	__le32 prev_reset_cause;
+	__le32 phy_warm_reset_src;
+	__le32 rx_gain_tbl_mode;
+	__le32 xbar_val;
+	__le32 force_calibration;
+	__le32 phyrf_mode;
+	__le32 phy_homechan;
+	__le32 phy_tx_ch_mask;
+	__le32 phy_rx_ch_mask;
+	__le32 phybb_ini_mask;
+	__le32 phyrf_ini_mask;
+	__le32 phy_dfs_en_mask;
+	__le32 phy_sscan_en_mask;
+	__le32 phy_synth_sel_mask;
+	__le32 phy_adfs_freq;
+	__le32 cck_fir_settings;
+	__le32 phy_dyn_pri_chan;
+	__le32 cca_thresh;
+	__le32 dyn_cca_status;
+	__le32 rxdesense_thresh_hw;
+	__le32 rxdesense_thresh_sw;
 };
 
 struct htt_peer_ctrl_path_txrx_stats_tlv {
@@ -2012,9 +2014,9 @@ struct htt_peer_ctrl_path_txrx_stats_tlv {
 	u8 peer_mac_addr[ETH_ALEN];
 	u8 rsvd[2];
 	/* Num of tx mgmt frames with subtype on peer level */
-	u32 peer_tx_mgmt_subtype[ATH11K_STATS_MGMT_FRM_TYPE_MAX];
+	__le32 peer_tx_mgmt_subtype[ATH11K_STATS_MGMT_FRM_TYPE_MAX];
 	/* Num of rx mgmt frames with subtype on peer level */
-	u32 peer_rx_mgmt_subtype[ATH11K_STATS_MGMT_FRM_TYPE_MAX];
+	__le32 peer_rx_mgmt_subtype[ATH11K_STATS_MGMT_FRM_TYPE_MAX];
 };
 
 #ifdef CONFIG_ATH11K_DEBUGFS
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..1fedcd41d2be 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -315,10 +315,10 @@ struct ath11k_dp {
 #define HTT_TX_WBM_COMP_INFO2_VALID		BIT(21)
 
 struct htt_tx_wbm_completion {
-	u32 info0;
-	u32 info1;
-	u32 info2;
-	u32 info3;
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	__le32 info3;
 } __packed;
 
 enum htt_h2t_msg_type {
@@ -333,7 +333,7 @@ enum htt_h2t_msg_type {
 #define HTT_VER_REQ_INFO_MSG_ID		GENMASK(7, 0)
 
 struct htt_ver_req_cmd {
-	u32 ver_reg_info;
+	__le32 ver_reg_info;
 } __packed;
 
 enum htt_srng_ring_type {
@@ -501,19 +501,19 @@ enum htt_srng_ring_id {
 #define HTT_SRNG_SETUP_CMD_INFO2_RESPONSE_REQUIRED	BIT(19)
 
 struct htt_srng_setup_cmd {
-	u32 info0;
-	u32 ring_base_addr_lo;
-	u32 ring_base_addr_hi;
-	u32 info1;
-	u32 ring_head_off32_remote_addr_lo;
-	u32 ring_head_off32_remote_addr_hi;
-	u32 ring_tail_off32_remote_addr_lo;
-	u32 ring_tail_off32_remote_addr_hi;
-	u32 ring_msi_addr_lo;
-	u32 ring_msi_addr_hi;
-	u32 msi_data;
-	u32 intr_info;
-	u32 info2;
+	__le32 info0;
+	__le32 ring_base_addr_lo;
+	__le32 ring_base_addr_hi;
+	__le32 info1;
+	__le32 ring_head_off32_remote_addr_lo;
+	__le32 ring_head_off32_remote_addr_hi;
+	__le32 ring_tail_off32_remote_addr_lo;
+	__le32 ring_tail_off32_remote_addr_hi;
+	__le32 ring_msi_addr_lo;
+	__le32 ring_msi_addr_hi;
+	__le32 msi_data;
+	__le32 intr_info;
+	__le32 info2;
 } __packed;
 
 /* host -> target FW  PPDU_STATS config message
@@ -550,7 +550,7 @@ struct htt_srng_setup_cmd {
  */
 
 struct htt_ppdu_stats_cfg_cmd {
-	u32 msg;
+	__le32 msg;
 } __packed;
 
 #define HTT_PPDU_STATS_CFG_MSG_TYPE		GENMASK(7, 0)
@@ -976,13 +976,13 @@ enum htt_rx_data_pkt_filter_tlv_flasg3 {
 		HTT_RX_FILTER_TLV_FLAGS_ATTENTION)
 
 struct htt_rx_ring_selection_cfg_cmd {
-	u32 info0;
-	u32 info1;
-	u32 pkt_type_en_flags0;
-	u32 pkt_type_en_flags1;
-	u32 pkt_type_en_flags2;
-	u32 pkt_type_en_flags3;
-	u32 rx_filter_tlv;
+	__le32 info0;
+	__le32 info1;
+	__le32 pkt_type_en_flags0;
+	__le32 pkt_type_en_flags1;
+	__le32 pkt_type_en_flags2;
+	__le32 pkt_type_en_flags3;
+	__le32 rx_filter_tlv;
 } __packed;
 
 struct htt_rx_ring_tlv_filter {
@@ -1015,8 +1015,8 @@ enum htt_rx_full_mon_release_ring {
 };
 
 struct htt_rx_full_monitor_mode_cfg_cmd {
-	u32 info0;
-	u32 cfg;
+	__le32 info0;
+	__le32 cfg;
 } __packed;
 
 /* HTT message target->host */
@@ -1042,7 +1042,7 @@ enum htt_t2h_msg_type {
 #define HTT_T2H_VERSION_CONF_MAJOR	GENMASK(23, 16)
 
 struct htt_t2h_version_conf_msg {
-	u32 version;
+	__le32 version;
 } __packed;
 
 #define HTT_T2H_PEER_MAP_INFO_VDEV_ID	GENMASK(15, 8)
@@ -1054,10 +1054,10 @@ struct htt_t2h_version_conf_msg {
 #define HTT_T2H_PEER_MAP_INFO2_NEXT_HOP_S	16
 
 struct htt_t2h_peer_map_event {
-	u32 info;
-	u32 mac_addr_l32;
-	u32 info1;
-	u32 info2;
+	__le32 info;
+	__le32 mac_addr_l32;
+	__le32 info1;
+	__le32 info2;
 } __packed;
 
 #define HTT_T2H_PEER_UNMAP_INFO_VDEV_ID	HTT_T2H_PEER_MAP_INFO_VDEV_ID
@@ -1068,9 +1068,9 @@ struct htt_t2h_peer_map_event {
 #define HTT_T2H_PEER_MAP_INFO1_NEXT_HOP_S HTT_T2H_PEER_MAP_INFO2_NEXT_HOP_S
 
 struct htt_t2h_peer_unmap_event {
-	u32 info;
-	u32 mac_addr_l32;
-	u32 info1;
+	__le32 info;
+	__le32 mac_addr_l32;
+	__le32 info1;
 } __packed;
 
 struct htt_resp_msg {
@@ -1176,15 +1176,15 @@ enum htt_backpressure_lmac_ringid {
 #define HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE GENMASK(31, 16)
 
 struct ath11k_htt_ppdu_stats_msg {
-	u32 info;
-	u32 ppdu_id;
-	u32 timestamp;
-	u32 rsvd;
+	__le32 info;
+	__le32 ppdu_id;
+	__le32 timestamp;
+	__le32 rsvd;
 	u8 data[];
 } __packed;
 
 struct htt_tlv {
-	u32 header;
+	__le32 header;
 	u8 value[];
 } __packed;
 
@@ -1207,21 +1207,21 @@ enum HTT_PPDU_STATS_BW {
 #define HTT_PPDU_STATS_CMN_FLAGS_BW_M		GENMASK(19, 16)
 
 struct htt_ppdu_stats_common {
-	u32 ppdu_id;
-	u16 sched_cmdid;
+	__le32 ppdu_id;
+	__le16 sched_cmdid;
 	u8 ring_id;
 	u8 num_users;
-	u32 flags; /* %HTT_PPDU_STATS_COMMON_FLAGS_*/
-	u32 chain_mask;
-	u32 fes_duration_us; /* frame exchange sequence */
-	u32 ppdu_sch_eval_start_tstmp_us;
-	u32 ppdu_sch_end_tstmp_us;
-	u32 ppdu_start_tstmp_us;
+	__le32 flags; /* %HTT_PPDU_STATS_COMMON_FLAGS_*/
+	__le32 chain_mask;
+	__le32 fes_duration_us; /* frame exchange sequence */
+	__le32 ppdu_sch_eval_start_tstmp_us;
+	__le32 ppdu_sch_end_tstmp_us;
+	__le32 ppdu_start_tstmp_us;
 	/* BIT [15 :  0] - phy mode (WLAN_PHY_MODE) with which ppdu was transmitted
 	 * BIT [31 : 16] - bandwidth (in MHz) with which ppdu was transmitted
 	 */
-	u16 phy_mode;
-	u16 bw_mhz;
+	__le16 phy_mode;
+	__le16 bw_mhz;
 } __packed;
 
 enum htt_ppdu_stats_gi {
@@ -1250,17 +1250,17 @@ enum htt_ppdu_stats_gi {
 #define HTT_PPDU_STATS_USER_RATE_FLAGS_LDPC_M		BIT(29)
 
 #define HTT_USR_RATE_PREAMBLE(_val) \
-		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M, _val)
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_PREAMBLE_M)
 #define HTT_USR_RATE_BW(_val) \
-		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_BW_M, _val)
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_BW_M)
 #define HTT_USR_RATE_NSS(_val) \
-		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_NSS_M, _val)
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_NSS_M)
 #define HTT_USR_RATE_MCS(_val) \
-		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_MCS_M, _val)
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_MCS_M)
 #define HTT_USR_RATE_GI(_val) \
-		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_GI_M, _val)
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_GI_M)
 #define HTT_USR_RATE_DCM(_val) \
-		FIELD_GET(HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M, _val)
+		le32_get_bits(_val, HTT_PPDU_STATS_USER_RATE_FLAGS_DCM_M)
 
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_LTF_SIZE_M		GENMASK(1, 0)
 #define HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_STBC_M		BIT(2)
@@ -1277,16 +1277,16 @@ enum htt_ppdu_stats_gi {
 struct htt_ppdu_stats_user_rate {
 	u8 tid_num;
 	u8 reserved0;
-	u16 sw_peer_id;
-	u32 info0; /* %HTT_PPDU_STATS_USER_RATE_INFO0_*/
-	u16 ru_end;
-	u16 ru_start;
-	u16 resp_ru_end;
-	u16 resp_ru_start;
-	u32 info1; /* %HTT_PPDU_STATS_USER_RATE_INFO1_ */
-	u32 rate_flags; /* %HTT_PPDU_STATS_USER_RATE_FLAGS_ */
+	__le16 sw_peer_id;
+	__le32 info0; /* %HTT_PPDU_STATS_USER_RATE_INFO0_*/
+	__le16 ru_end;
+	__le16 ru_start;
+	__le16 resp_ru_end;
+	__le16 resp_ru_start;
+	__le32 info1; /* %HTT_PPDU_STATS_USER_RATE_INFO1_ */
+	__le32 rate_flags; /* %HTT_PPDU_STATS_USER_RATE_FLAGS_ */
 	/* Note: resp_rate_info is only valid for if resp_type is UL */
-	u32 resp_rate_flags; /* %HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_ */
+	__le32 resp_rate_flags; /* %HTT_PPDU_STATS_USER_RATE_RESP_FLAGS_ */
 } __packed;
 
 #define HTT_PPDU_STATS_TX_INFO_FLAGS_RATECODE_M		GENMASK(7, 0)
@@ -1297,13 +1297,17 @@ struct htt_ppdu_stats_user_rate {
 #define HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M		GENMASK(31, 16)
 
 #define HTT_TX_INFO_IS_AMSDU(_flags) \
-			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_IS_AMPDU_M, _flags)
+			le32_get_bits(_flags, \
+				      HTT_PPDU_STATS_TX_INFO_FLAGS_IS_AMPDU_M)
 #define HTT_TX_INFO_BA_ACK_FAILED(_flags) \
-			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_BA_ACK_FAILED_M, _flags)
+			le32_get_bits(_flags, \
+				      HTT_PPDU_STATS_TX_INFO_FLAGS_BA_ACK_FAILED_M)
 #define HTT_TX_INFO_RATECODE(_flags) \
-			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_RATECODE_M, _flags)
+			le32_get_bits(_flags, \
+				      HTT_PPDU_STATS_TX_INFO_FLAGS_RATECODE_M)
 #define HTT_TX_INFO_PEERID(_flags) \
-			FIELD_GET(HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M, _flags)
+			le32_get_bits(_flags, \
+				      HTT_PPDU_STATS_TX_INFO_FLAGS_PEERID_M)
 
 enum  htt_ppdu_stats_usr_compln_status {
 	HTT_PPDU_STATS_USER_STATUS_OK,
@@ -1319,21 +1323,21 @@ enum  htt_ppdu_stats_usr_compln_status {
 #define HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_RESP_TYPE_M		GENMASK(12, 9)
 
 #define HTT_USR_CMPLTN_IS_AMPDU(_val) \
-	    FIELD_GET(HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_IS_AMPDU_M, _val)
+	    le32_get_bits(_val, HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_IS_AMPDU_M)
 #define HTT_USR_CMPLTN_LONG_RETRY(_val) \
-	    FIELD_GET(HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRY_M, _val)
+	    le32_get_bits(_val, HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRY_M)
 #define HTT_USR_CMPLTN_SHORT_RETRY(_val) \
-	    FIELD_GET(HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_SHORT_RETRY_M, _val)
+	    le32_get_bits(_val, HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_SHORT_RETRY_M)
 
 struct htt_ppdu_stats_usr_cmpltn_cmn {
 	u8 status;
 	u8 tid_num;
-	u16 sw_peer_id;
+	__le16 sw_peer_id;
 	/* RSSI value of last ack packet (units = dB above noise floor) */
-	u32 ack_rssi;
-	u16 mpdu_tried;
-	u16 mpdu_success;
-	u32 flags; /* %HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRIES*/
+	__le32 ack_rssi;
+	__le16 mpdu_tried;
+	__le16 mpdu_success;
+	__le32 flags; /* %HTT_PPDU_STATS_USR_CMPLTN_CMN_FLAGS_LONG_RETRIES*/
 } __packed;
 
 #define HTT_PPDU_STATS_ACK_BA_INFO_NUM_MPDU_M	GENMASK(8, 0)
@@ -1343,13 +1347,13 @@ struct htt_ppdu_stats_usr_cmpltn_cmn {
 #define HTT_PPDU_STATS_NON_QOS_TID	16
 
 struct htt_ppdu_stats_usr_cmpltn_ack_ba_status {
-	u32 ppdu_id;
-	u16 sw_peer_id;
-	u16 reserved0;
-	u32 info; /* %HTT_PPDU_STATS_USR_CMPLTN_CMN_INFO_ */
-	u16 current_seq;
-	u16 start_seq;
-	u32 success_bytes;
+	__le32 ppdu_id;
+	__le16 sw_peer_id;
+	__le16 reserved0;
+	__le32 info; /* %HTT_PPDU_STATS_USR_CMPLTN_CMN_INFO_ */
+	__le16 current_seq;
+	__le16 start_seq;
+	__le32 success_bytes;
 } __packed;
 
 struct htt_ppdu_user_stats {
@@ -1409,7 +1413,7 @@ struct htt_ppdu_stats_info {
  *     Value: payload size in bytes (payload size is a multiple of 4 bytes)
  */
 struct htt_pktlog_msg {
-	u32 hdr;
+	__le32 hdr;
 	u8 payload[];
 };
 
@@ -1499,13 +1503,13 @@ struct htt_ext_stats_cfg_hdr {
 
 struct htt_ext_stats_cfg_cmd {
 	struct htt_ext_stats_cfg_hdr hdr;
-	u32 cfg_param0;
-	u32 cfg_param1;
-	u32 cfg_param2;
-	u32 cfg_param3;
-	u32 reserved;
-	u32 cookie_lsb;
-	u32 cookie_msb;
+	__le32 cfg_param0;
+	__le32 cfg_param1;
+	__le32 cfg_param2;
+	__le32 cfg_param3;
+	__le32 reserved;
+	__le32 cookie_lsb;
+	__le32 cookie_msb;
 } __packed;
 
 /* htt stats config default params */
@@ -1626,9 +1630,9 @@ struct htt_ext_stats_cfg_params {
 #define HTT_T2H_EXT_STATS_INFO1_LENGTH   GENMASK(31, 16)
 
 struct ath11k_htt_extd_stats_msg {
-	u32 info0;
-	u64 cookie;
-	u32 info1;
+	__le32 info0;
+	__le64 cookie;
+	__le32 info1;
 	u8 data[];
 } __packed;
 
@@ -1640,8 +1644,8 @@ struct ath11k_htt_extd_stats_msg {
 #define	HTT_MAC_ADDR_H16_1	GENMASK(15, 8)
 
 struct htt_mac_addr {
-	u32 mac_addr_l32;
-	u32 mac_addr_h16;
+	__le32 mac_addr_l32;
+	__le32 mac_addr_h16;
 };
 
 static inline void ath11k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..3c5b2c323c1e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -102,26 +102,24 @@ static inline void *ath11k_dp_rx_get_attention(struct ath11k_base *ab,
 
 static inline bool ath11k_dp_rx_h_attn_msdu_done(struct rx_attention *attn)
 {
-	return !!FIELD_GET(RX_ATTENTION_INFO2_MSDU_DONE,
-			   __le32_to_cpu(attn->info2));
+	return !!le32_get_bits(attn->info2, RX_ATTENTION_INFO2_MSDU_DONE);
 }
 
 static inline bool ath11k_dp_rx_h_attn_l4_cksum_fail(struct rx_attention *attn)
 {
-	return !!FIELD_GET(RX_ATTENTION_INFO1_TCP_UDP_CKSUM_FAIL,
-			   __le32_to_cpu(attn->info1));
+	return !!le32_get_bits(attn->info1,
+			       RX_ATTENTION_INFO1_TCP_UDP_CKSUM_FAIL);
 }
 
 static inline bool ath11k_dp_rx_h_attn_ip_cksum_fail(struct rx_attention *attn)
 {
-	return !!FIELD_GET(RX_ATTENTION_INFO1_IP_CKSUM_FAIL,
-			   __le32_to_cpu(attn->info1));
+	return !!le32_get_bits(attn->info1, RX_ATTENTION_INFO1_IP_CKSUM_FAIL);
 }
 
 static inline bool ath11k_dp_rx_h_attn_is_decrypted(struct rx_attention *attn)
 {
-	return (FIELD_GET(RX_ATTENTION_INFO2_DCRYPT_STATUS_CODE,
-			  __le32_to_cpu(attn->info2)) ==
+	return (le32_get_bits(attn->info2,
+			      RX_ATTENTION_INFO2_DCRYPT_STATUS_CODE) ==
 		RX_DESC_DECRYPT_STATUS_CODE_OK);
 }
 
@@ -247,8 +245,7 @@ static void ath11k_dp_rx_desc_end_tlv_copy(struct ath11k_base *ab,
 
 static inline u32 ath11k_dp_rxdesc_get_mpdulen_err(struct rx_attention *attn)
 {
-	return FIELD_GET(RX_ATTENTION_INFO1_MPDU_LEN_ERR,
-			 __le32_to_cpu(attn->info1));
+	return le32_get_bits(attn->info1, RX_ATTENTION_INFO1_MPDU_LEN_ERR);
 }
 
 static inline u8 *ath11k_dp_rxdesc_get_80211hdr(struct ath11k_base *ab,
@@ -290,8 +287,7 @@ static bool ath11k_dp_rx_h_attn_is_mcbc(struct ath11k_base *ab,
 	struct rx_attention *attn = ath11k_dp_rx_get_attention(ab, desc);
 
 	return ath11k_dp_rx_h_msdu_end_first_msdu(ab, desc) &&
-		(!!FIELD_GET(RX_ATTENTION_INFO1_MCAST_BCAST,
-		 __le32_to_cpu(attn->info1)));
+		(!!le32_get_bits(attn->info1, RX_ATTENTION_INFO1_MCAST_BCAST));
 }
 
 static bool ath11k_dp_rxdesc_mac_addr2_valid(struct ath11k_base *ab,
@@ -1271,7 +1267,7 @@ static int ath11k_htt_tlv_ppdu_stats_parse(struct ath11k_base *ab,
 			return -EINVAL;
 		}
 
-		peer_id = ((struct htt_ppdu_stats_user_rate *)ptr)->sw_peer_id;
+		peer_id = le16_to_cpu(((struct htt_ppdu_stats_user_rate *)ptr)->sw_peer_id);
 		cur_user = ath11k_get_ppdu_user_index(&ppdu_info->ppdu_stats,
 						      peer_id);
 		if (cur_user < 0)
@@ -1290,7 +1286,7 @@ static int ath11k_htt_tlv_ppdu_stats_parse(struct ath11k_base *ab,
 			return -EINVAL;
 		}
 
-		peer_id = ((struct htt_ppdu_stats_usr_cmpltn_cmn *)ptr)->sw_peer_id;
+		peer_id = le16_to_cpu(((struct htt_ppdu_stats_usr_cmpltn_cmn *)ptr)->sw_peer_id);
 		cur_user = ath11k_get_ppdu_user_index(&ppdu_info->ppdu_stats,
 						      peer_id);
 		if (cur_user < 0)
@@ -1311,7 +1307,7 @@ static int ath11k_htt_tlv_ppdu_stats_parse(struct ath11k_base *ab,
 		}
 
 		peer_id =
-		((struct htt_ppdu_stats_usr_cmpltn_ack_ba_status *)ptr)->sw_peer_id;
+		le16_to_cpu(((struct htt_ppdu_stats_usr_cmpltn_ack_ba_status *)ptr)->sw_peer_id);
 		cur_user = ath11k_get_ppdu_user_index(&ppdu_info->ppdu_stats,
 						      peer_id);
 		if (cur_user < 0)
@@ -1344,8 +1340,8 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 			return -EINVAL;
 		}
 		tlv = (struct htt_tlv *)ptr;
-		tlv_tag = FIELD_GET(HTT_TLV_TAG, tlv->header);
-		tlv_len = FIELD_GET(HTT_TLV_LEN, tlv->header);
+		tlv_tag = le32_get_bits(tlv->header, HTT_TLV_TAG);
+		tlv_len = le32_get_bits(tlv->header, HTT_TLV_LEN);
 		ptr += sizeof(*tlv);
 		len -= sizeof(*tlv);
 
@@ -1393,15 +1389,15 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	if (usr_stats->tlv_flags &
 	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
-		succ_bytes = usr_stats->ack_ba.success_bytes;
-		succ_pkts = FIELD_GET(HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M,
-				      usr_stats->ack_ba.info);
-		tid = FIELD_GET(HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM,
-				usr_stats->ack_ba.info);
+		succ_bytes = le32_to_cpu(usr_stats->ack_ba.success_bytes);
+		succ_pkts = le32_get_bits(usr_stats->ack_ba.info,
+					  HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M);
+		tid = le32_get_bits(usr_stats->ack_ba.info,
+				    HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM);
 	}
 
 	if (common->fes_duration_us)
-		tx_duration = common->fes_duration_us;
+		tx_duration = le32_to_cpu(common->fes_duration_us);
 
 	user_rate = &usr_stats->rate;
 	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
@@ -1481,8 +1477,8 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 		arsta->txrate.he_dcm = dcm;
 		arsta->txrate.he_gi = ath11k_mac_he_gi_to_nl80211_he_gi(sgi);
 		arsta->txrate.he_ru_alloc = ath11k_mac_phy_he_ru_to_nl80211_he_ru_alloc
-						((user_rate->ru_end -
-						 user_rate->ru_start) + 1);
+						((le16_to_cpu(user_rate->ru_end) -
+						 le16_to_cpu(user_rate->ru_start)) + 1);
 		break;
 	}
 
@@ -1567,9 +1563,9 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	u32 ppdu_id, len;
 
 	msg = (struct ath11k_htt_ppdu_stats_msg *)skb->data;
-	len = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE, msg->info);
-	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, msg->info);
-	ppdu_id = msg->ppdu_id;
+	len = le32_get_bits(msg->info, HTT_T2H_PPDU_STATS_INFO_PAYLOAD_SIZE);
+	pdev_id = le32_get_bits(msg->info, HTT_T2H_PPDU_STATS_INFO_PDEV_ID);
+	ppdu_id = le32_to_cpu(msg->ppdu_id);
 
 	rcu_read_lock();
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
@@ -1613,7 +1609,7 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 	struct ath11k *ar;
 	u8 pdev_id;
 
-	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, data->hdr);
+	pdev_id = le32_get_bits(data->hdr, HTT_T2H_PPDU_STATS_INFO_PDEV_ID);
 
 	rcu_read_lock();
 
@@ -1633,22 +1629,22 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
 						  struct sk_buff *skb)
 {
-	u32 *data = (u32 *)skb->data;
+	__le32 *data = (__le32 *)skb->data;
 	u8 pdev_id, ring_type, ring_id, pdev_idx;
 	u16 hp, tp;
 	u32 backpressure_time;
 	struct ath11k_bp_stats *bp_stats;
 
-	pdev_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_PDEV_ID_M, *data);
-	ring_type = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_TYPE_M, *data);
-	ring_id = FIELD_GET(HTT_BACKPRESSURE_EVENT_RING_ID_M, *data);
+	pdev_id = le32_get_bits(*data, HTT_BACKPRESSURE_EVENT_PDEV_ID_M);
+	ring_type = le32_get_bits(*data, HTT_BACKPRESSURE_EVENT_RING_TYPE_M);
+	ring_id = le32_get_bits(*data, HTT_BACKPRESSURE_EVENT_RING_ID_M);
 	++data;
 
-	hp = FIELD_GET(HTT_BACKPRESSURE_EVENT_HP_M, *data);
-	tp = FIELD_GET(HTT_BACKPRESSURE_EVENT_TP_M, *data);
+	hp = le32_get_bits(*data, HTT_BACKPRESSURE_EVENT_HP_M);
+	tp = le32_get_bits(*data, HTT_BACKPRESSURE_EVENT_TP_M);
 	++data;
 
-	backpressure_time = *data;
+	backpressure_time = le32_to_cpu(*data);
 
 	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "backpressure event, pdev %d, ring type %d,ring id %d, hp %d tp %d, backpressure time %d\n",
 		   pdev_id, ring_type, ring_id, hp, tp, backpressure_time);
@@ -1684,7 +1680,8 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 {
 	struct ath11k_dp *dp = &ab->dp;
 	struct htt_resp_msg *resp = (struct htt_resp_msg *)skb->data;
-	enum htt_t2h_msg_type type = FIELD_GET(HTT_T2H_MSG_TYPE, *(u32 *)resp);
+	enum htt_t2h_msg_type type = FIELD_GET(HTT_T2H_MSG_TYPE,
+					       le32_to_cpu(*(__le32 *)resp));
 	u16 peer_id;
 	u8 vdev_id;
 	u8 mac_addr[ETH_ALEN];
@@ -1696,43 +1693,43 @@ void ath11k_dp_htt_htc_t2h_msg_handler(struct ath11k_base *ab,
 
 	switch (type) {
 	case HTT_T2H_MSG_TYPE_VERSION_CONF:
-		dp->htt_tgt_ver_major = FIELD_GET(HTT_T2H_VERSION_CONF_MAJOR,
-						  resp->version_msg.version);
-		dp->htt_tgt_ver_minor = FIELD_GET(HTT_T2H_VERSION_CONF_MINOR,
-						  resp->version_msg.version);
+		dp->htt_tgt_ver_major = le32_get_bits(resp->version_msg.version,
+						      HTT_T2H_VERSION_CONF_MAJOR);
+		dp->htt_tgt_ver_minor = le32_get_bits(resp->version_msg.version,
+						      HTT_T2H_VERSION_CONF_MINOR);
 		complete(&dp->htt_tgt_version_received);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP:
-		vdev_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_VDEV_ID,
-				    resp->peer_map_ev.info);
-		peer_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_PEER_ID,
-				    resp->peer_map_ev.info);
-		peer_mac_h16 = FIELD_GET(HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16,
-					 resp->peer_map_ev.info1);
-		ath11k_dp_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
+		vdev_id = le32_get_bits(resp->peer_map_ev.info,
+					HTT_T2H_PEER_MAP_INFO_VDEV_ID);
+		peer_id = le32_get_bits(resp->peer_map_ev.info,
+					HTT_T2H_PEER_MAP_INFO_PEER_ID);
+		peer_mac_h16 = le32_get_bits(resp->peer_map_ev.info1,
+					     HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16);
+		ath11k_dp_get_mac_addr(le32_to_cpu(resp->peer_map_ev.mac_addr_l32),
 				       peer_mac_h16, mac_addr);
 		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, 0, 0);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_MAP2:
-		vdev_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_VDEV_ID,
-				    resp->peer_map_ev.info);
-		peer_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO_PEER_ID,
-				    resp->peer_map_ev.info);
-		peer_mac_h16 = FIELD_GET(HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16,
-					 resp->peer_map_ev.info1);
-		ath11k_dp_get_mac_addr(resp->peer_map_ev.mac_addr_l32,
+		vdev_id = le32_get_bits(resp->peer_map_ev.info,
+					HTT_T2H_PEER_MAP_INFO_VDEV_ID);
+		peer_id = le32_get_bits(resp->peer_map_ev.info,
+					HTT_T2H_PEER_MAP_INFO_PEER_ID);
+		peer_mac_h16 = le32_get_bits(resp->peer_map_ev.info1,
+					     HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16);
+		ath11k_dp_get_mac_addr(le32_to_cpu(resp->peer_map_ev.mac_addr_l32),
 				       peer_mac_h16, mac_addr);
-		ast_hash = FIELD_GET(HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL,
-				     resp->peer_map_ev.info2);
-		hw_peer_id = FIELD_GET(HTT_T2H_PEER_MAP_INFO1_HW_PEER_ID,
-				       resp->peer_map_ev.info1);
+		ast_hash = le32_get_bits(resp->peer_map_ev.info2,
+					 HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL);
+		hw_peer_id = le32_get_bits(resp->peer_map_ev.info1,
+					   HTT_T2H_PEER_MAP_INFO1_HW_PEER_ID);
 		ath11k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash,
 				      hw_peer_id);
 		break;
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP:
 	case HTT_T2H_MSG_TYPE_PEER_UNMAP2:
-		peer_id = FIELD_GET(HTT_T2H_PEER_UNMAP_INFO_PEER_ID,
-				    resp->peer_unmap_ev.info);
+		peer_id = le32_get_bits(resp->peer_unmap_ev.info,
+					HTT_T2H_PEER_UNMAP_INFO_PEER_ID);
 		ath11k_peer_unmap_event(ab, peer_id);
 		break;
 	case HTT_T2H_MSG_TYPE_PPDU_STATS_IND:
@@ -1965,7 +1962,7 @@ static void ath11k_dp_rx_h_undecap_nwifi(struct ath11k *ar,
 	size_t hdr_len;
 	u8 da[ETH_ALEN];
 	u8 sa[ETH_ALEN];
-	u16 qos_ctl = 0;
+	__le16 qos_ctl = 0;
 	u8 *qos;
 
 	/* copy SA & DA and pull decapped header */
@@ -1996,10 +1993,10 @@ static void ath11k_dp_rx_h_undecap_nwifi(struct ath11k *ar,
 		/* Reset the order bit as the HT_Control header is stripped */
 		hdr->frame_control &= ~(__cpu_to_le16(IEEE80211_FCTL_ORDER));
 
-		qos_ctl = rxcb->tid;
+		qos_ctl = cpu_to_le16(rxcb->tid & IEEE80211_QOS_CTL_TID_MASK);
 
 		if (ath11k_dp_rx_h_msdu_start_mesh_ctl_present(ar->ab, rxcb->rx_desc))
-			qos_ctl |= IEEE80211_QOS_CTL_MESH_CONTROL_PRESENT;
+			qos_ctl |= cpu_to_le16(IEEE80211_QOS_CTL_MESH_CONTROL_PRESENT);
 
 		/* TODO Add other QoS ctl fields when required */
 
@@ -2686,8 +2683,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 	while (likely(desc =
 	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
 									     srng))) {
-		cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				   desc->buf_addr_info.info1);
+		cookie = le32_get_bits(desc->buf_addr_info.info1,
+				       BUFFER_ADDR_INFO1_SW_COOKIE);
 		buf_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_BUF_ID,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
@@ -2716,8 +2713,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		num_buffs_reaped[mac_id]++;
 
-		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
-					desc->info0);
+		push_reason = le32_get_bits(desc->info0,
+					    HAL_REO_DEST_RING_INFO0_PUSH_REASON);
 		if (unlikely(push_reason !=
 			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
@@ -2725,18 +2722,18 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 			continue;
 		}
 
-		rxcb->is_first_msdu = !!(desc->rx_msdu_info.info0 &
+		rxcb->is_first_msdu = !!(le32_to_cpu(desc->rx_msdu_info.info0) &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
-		rxcb->is_last_msdu = !!(desc->rx_msdu_info.info0 &
+		rxcb->is_last_msdu = !!(le32_to_cpu(desc->rx_msdu_info.info0) &
 					RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
-		rxcb->is_continuation = !!(desc->rx_msdu_info.info0 &
+		rxcb->is_continuation = !!(le32_to_cpu(desc->rx_msdu_info.info0) &
 					   RX_MSDU_DESC_INFO0_MSDU_CONTINUATION);
-		rxcb->peer_id = FIELD_GET(RX_MPDU_DESC_META_DATA_PEER_ID,
-					  desc->rx_mpdu_info.meta_data);
-		rxcb->seq_no = FIELD_GET(RX_MPDU_DESC_INFO0_SEQ_NUM,
-					 desc->rx_mpdu_info.info0);
-		rxcb->tid = FIELD_GET(HAL_REO_DEST_RING_INFO0_RX_QUEUE_NUM,
-				      desc->info0);
+		rxcb->peer_id = le32_get_bits(desc->rx_mpdu_info.meta_data,
+					      RX_MPDU_DESC_META_DATA_PEER_ID);
+		rxcb->seq_no = le32_get_bits(desc->rx_mpdu_info.info0,
+					     RX_MPDU_DESC_INFO0_SEQ_NUM);
+		rxcb->tid = le32_get_bits(desc->info0,
+					  HAL_REO_DEST_RING_INFO0_RX_QUEUE_NUM);
 
 		rxcb->mac_id = mac_id;
 		__skb_queue_tail(&msdu_list[mac_id], msdu);
@@ -2985,18 +2982,18 @@ ath11k_dp_rx_mon_update_status_buf_state(struct ath11k_mon_data *pmon,
 	u8 *ptr;
 
 	/* PPDU id is part of second tlv, move ptr to second tlv */
-	tlv_len = FIELD_GET(HAL_TLV_HDR_LEN, tlv->tl);
+	tlv_len = le32_get_bits(tlv->tl, HAL_TLV_HDR_LEN);
 	ptr = (u8 *)tlv;
 	ptr += sizeof(*tlv) + tlv_len;
 	tlv = (struct hal_tlv_hdr *)ptr;
 
-	if (FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl) != HAL_RX_PPDU_START)
+	if (le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG) != HAL_RX_PPDU_START)
 		return;
 
 	ptr += sizeof(*tlv);
 	ppdu_start = (struct hal_rx_ppdu_start *)ptr;
-	ppdu_id = FIELD_GET(HAL_RX_PPDU_START_INFO0_PPDU_ID,
-			    __le32_to_cpu(ppdu_start->info0));
+	ppdu_id = le32_get_bits(ppdu_start->info0,
+				HAL_RX_PPDU_START_INFO0_PPDU_ID);
 
 	if (pmon->sw_mon_entries.ppdu_id < ppdu_id) {
 		pmon->buf_state = DP_MON_STATUS_LEAD;
@@ -3045,7 +3042,8 @@ ath11k_dp_rx_mon_buf_done(struct ath11k_base *ab, struct hal_srng *srng,
 				DMA_FROM_DEVICE);
 
 	tlv = (struct hal_tlv_hdr *)skb->data;
-	if (FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl) != HAL_RX_STATUS_BUFFER_DONE)
+	if (le32_get_bits(tlv->tl,
+			  HAL_TLV_HDR_TAG) != HAL_RX_STATUS_BUFFER_DONE)
 		return DP_MON_STATUS_NO_DMA;
 
 	return DP_MON_STATUS_REPLINISH;
@@ -3114,11 +3112,12 @@ static int ath11k_dp_rx_reap_mon_status_ring(struct ath11k_base *ab, int mac_id,
 						DMA_FROM_DEVICE);
 
 			tlv = (struct hal_tlv_hdr *)skb->data;
-			if (FIELD_GET(HAL_TLV_HDR_TAG, tlv->tl) !=
+			if (le32_get_bits(tlv->tl, HAL_TLV_HDR_TAG) !=
 					HAL_RX_STATUS_BUFFER_DONE) {
-				ath11k_warn(ab, "mon status DONE not set %lx, buf_id %d\n",
-					    FIELD_GET(HAL_TLV_HDR_TAG,
-						      tlv->tl), buf_id);
+				ath11k_warn(ab,
+					    "mon status DONE not set %x, buf_id %d\n",
+					    le32_get_bits(tlv->tl,
+							  HAL_TLV_HDR_TAG), buf_id);
 				/* RxDMA status done bit might not be set even
 				 * though tp is moved by HW.
 				 */
@@ -3423,7 +3422,8 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	struct hal_rx_msdu_details *msdu0;
 	struct hal_srng *srng;
 	dma_addr_t paddr;
-	u32 desc_bank, msdu_info, mpdu_info;
+	u32 desc_bank;
+	__le32 msdu_info, mpdu_info;
 	u32 dst_idx, cookie, hal_rx_desc_sz;
 	int ret, buf_id;
 
@@ -3435,17 +3435,18 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	msdu_link = (struct hal_rx_msdu_link *)(link_desc_banks[desc_bank].vaddr +
 			(paddr - link_desc_banks[desc_bank].paddr));
 	msdu0 = &msdu_link->msdu_link[0];
-	dst_idx = FIELD_GET(RX_MSDU_DESC_INFO0_REO_DEST_IND, msdu0->rx_msdu_info.info0);
+	dst_idx = le32_get_bits(msdu0->rx_msdu_info.info0,
+				RX_MSDU_DESC_INFO0_REO_DEST_IND);
 	memset(msdu0, 0, sizeof(*msdu0));
 
-	msdu_info = FIELD_PREP(RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU, 1) |
-		    FIELD_PREP(RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU, 1) |
-		    FIELD_PREP(RX_MSDU_DESC_INFO0_MSDU_CONTINUATION, 0) |
-		    FIELD_PREP(RX_MSDU_DESC_INFO0_MSDU_LENGTH,
-			       defrag_skb->len - hal_rx_desc_sz) |
-		    FIELD_PREP(RX_MSDU_DESC_INFO0_REO_DEST_IND, dst_idx) |
-		    FIELD_PREP(RX_MSDU_DESC_INFO0_VALID_SA, 1) |
-		    FIELD_PREP(RX_MSDU_DESC_INFO0_VALID_DA, 1);
+	msdu_info = le32_encode_bits(1, RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU) |
+		    le32_encode_bits(1, RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU) |
+		    le32_encode_bits(0, RX_MSDU_DESC_INFO0_MSDU_CONTINUATION) |
+		    le32_encode_bits(defrag_skb->len - hal_rx_desc_sz,
+				     RX_MSDU_DESC_INFO0_MSDU_LENGTH) |
+		    le32_encode_bits(dst_idx, RX_MSDU_DESC_INFO0_REO_DEST_IND) |
+		    le32_encode_bits(1, RX_MSDU_DESC_INFO0_VALID_SA) |
+		    le32_encode_bits(1, RX_MSDU_DESC_INFO0_VALID_DA);
 	msdu0->rx_msdu_info.info0 = msdu_info;
 
 	/* change msdu len in hal rx desc */
@@ -3493,21 +3494,23 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	ath11k_hal_rx_buf_addr_info_set(reo_ent_ring, paddr, desc_bank,
 					HAL_RX_BUF_RBM_WBM_IDLE_DESC_LIST);
 
-	mpdu_info = FIELD_PREP(RX_MPDU_DESC_INFO0_MSDU_COUNT, 1) |
-		    FIELD_PREP(RX_MPDU_DESC_INFO0_SEQ_NUM, rx_tid->cur_sn) |
-		    FIELD_PREP(RX_MPDU_DESC_INFO0_FRAG_FLAG, 0) |
-		    FIELD_PREP(RX_MPDU_DESC_INFO0_VALID_SA, 1) |
-		    FIELD_PREP(RX_MPDU_DESC_INFO0_VALID_DA, 1) |
-		    FIELD_PREP(RX_MPDU_DESC_INFO0_RAW_MPDU, 1) |
-		    FIELD_PREP(RX_MPDU_DESC_INFO0_VALID_PN, 1);
+	mpdu_info = le32_encode_bits(1, RX_MPDU_DESC_INFO0_MSDU_COUNT) |
+		    le32_encode_bits(rx_tid->cur_sn,
+				     RX_MPDU_DESC_INFO0_SEQ_NUM) |
+		    le32_encode_bits(0, RX_MPDU_DESC_INFO0_FRAG_FLAG) |
+		    le32_encode_bits(1, RX_MPDU_DESC_INFO0_VALID_SA) |
+		    le32_encode_bits(1, RX_MPDU_DESC_INFO0_VALID_DA) |
+		    le32_encode_bits(1, RX_MPDU_DESC_INFO0_RAW_MPDU) |
+		    le32_encode_bits(1, RX_MPDU_DESC_INFO0_VALID_PN);
 
 	reo_ent_ring->rx_mpdu_info.info0 = mpdu_info;
 	reo_ent_ring->rx_mpdu_info.meta_data = reo_dest_ring->rx_mpdu_info.meta_data;
 	reo_ent_ring->queue_addr_lo = reo_dest_ring->queue_addr_lo;
-	reo_ent_ring->info0 = FIELD_PREP(HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI,
-					 FIELD_GET(HAL_REO_DEST_RING_INFO0_QUEUE_ADDR_HI,
-						   reo_dest_ring->info0)) |
-			      FIELD_PREP(HAL_REO_ENTR_RING_INFO0_DEST_IND, dst_idx);
+	reo_ent_ring->info0 = le32_encode_bits(le32_get_bits(reo_dest_ring->info0,
+							     HAL_REO_DEST_RING_INFO0_QUEUE_ADDR_HI),
+					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
+			      le32_encode_bits(dst_idx,
+					       HAL_REO_ENTR_RING_INFO0_DEST_IND);
 	ath11k_hal_srng_access_end(ab, srng);
 	spin_unlock_bh(&srng->lock);
 
@@ -3864,7 +3867,8 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
 			continue;
 		}
 
-		is_frag = !!(reo_desc->rx_mpdu_info.info0 & RX_MPDU_DESC_INFO0_FRAG_FLAG);
+		is_frag = !!(le32_to_cpu(reo_desc->rx_mpdu_info.info0) &
+			     RX_MPDU_DESC_INFO0_FRAG_FLAG);
 
 		/* Process only rx fragments with one msdu per link desc below, and drop
 		 * msdu's indicated due to error reasons.
@@ -4292,8 +4296,8 @@ int ath11k_dp_process_rxdma_err(struct ath11k_base *ab, int mac_id, int budget)
 
 		entr_ring = (struct hal_reo_entrance_ring *)desc;
 		rxdma_err_code =
-			FIELD_GET(HAL_REO_ENTR_RING_INFO1_RXDMA_ERROR_CODE,
-				  entr_ring->info1);
+			le32_get_bits(entr_ring->info1,
+				      HAL_REO_ENTR_RING_INFO1_RXDMA_ERROR_CODE);
 		ab->soc_stats.rxdma_error[rxdma_err_code]++;
 
 		link_desc_va = link_desc_banks[desc_bank].vaddr +
@@ -4360,7 +4364,7 @@ void ath11k_dp_process_reo_status(struct ath11k_base *ab)
 	ath11k_hal_srng_access_begin(ab, srng);
 
 	while ((reo_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
-		tag = FIELD_GET(HAL_SRNG_TLV_HDR_TAG, *reo_desc);
+		tag = le32_get_bits(*(__le32 *)reo_desc, HAL_SRNG_TLV_HDR_TAG);
 
 		switch (tag) {
 		case HAL_REO_GET_QUEUE_STATS_STATUS:
@@ -4615,19 +4619,20 @@ static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
 	struct rx_msdu_desc *msdu_desc_info = NULL;
 	struct hal_rx_msdu_link *msdu_link = NULL;
 	int i;
-	u32 last = FIELD_PREP(RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU, 1);
-	u32 first = FIELD_PREP(RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU, 1);
+	__le32 last = le32_encode_bits(1, RX_MSDU_DESC_INFO0_LAST_MSDU_IN_MPDU);
+	__le32 first = le32_encode_bits(1,
+					RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
 	u8  tmp  = 0;
 
 	msdu_link = msdu_link_desc;
 	msdu_details = &msdu_link->msdu_link[0];
 
 	for (i = 0; i < HAL_RX_NUM_MSDU_DESC; i++) {
-		if (!i && FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-				    msdu_details[i].buf_addr_info.info0) == 0)
+		if (!i && le32_get_bits(msdu_details[i].buf_addr_info.info0,
+					BUFFER_ADDR_INFO0_ADDR) == 0)
 			break;
-		if (FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
-			      msdu_details[i].buf_addr_info.info0) == 0) {
+		if (le32_get_bits(msdu_details[i].buf_addr_info.info0,
+				  BUFFER_ADDR_INFO0_ADDR) == 0) {
 			msdu_desc_info = &msdu_details[i - 1].rx_msdu_info;
 			msdu_desc_info->info0 |= last;
 			break;
@@ -4638,14 +4643,14 @@ static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
 			msdu_desc_info->info0 |= first;
 		else if (i == (HAL_RX_NUM_MSDU_DESC - 1))
 			msdu_desc_info->info0 |= last;
-		msdu_list->msdu_info[i].msdu_flags = msdu_desc_info->info0;
+		msdu_list->msdu_info[i].msdu_flags = le32_to_cpu(msdu_desc_info->info0);
 		msdu_list->msdu_info[i].msdu_len =
-			 HAL_RX_MSDU_PKT_LENGTH_GET(msdu_desc_info->info0);
+			 HAL_RX_MSDU_PKT_LENGTH_GET(le32_to_cpu(msdu_desc_info->info0));
 		msdu_list->sw_cookie[i] =
-			FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				  msdu_details[i].buf_addr_info.info1);
-		tmp = FIELD_GET(BUFFER_ADDR_INFO1_RET_BUF_MGR,
-				msdu_details[i].buf_addr_info.info1);
+			le32_get_bits(msdu_details[i].buf_addr_info.info1,
+				      BUFFER_ADDR_INFO1_SW_COOKIE);
+		tmp = le32_get_bits(msdu_details[i].buf_addr_info.info1,
+				    BUFFER_ADDR_INFO1_RET_BUF_MGR);
 		msdu_list->rbm[i] = tmp;
 	}
 	*num_msdus = i;
@@ -4732,12 +4737,12 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 					    &p_last_buf_addr_info, &rbm,
 					    &msdu_cnt);
 
-	if (FIELD_GET(HAL_REO_ENTR_RING_INFO1_RXDMA_PUSH_REASON,
-		      ent_desc->info1) ==
+	if (le32_get_bits(ent_desc->info1,
+			  HAL_REO_ENTR_RING_INFO1_RXDMA_PUSH_REASON) ==
 		      HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED) {
 		u8 rxdma_err =
-			FIELD_GET(HAL_REO_ENTR_RING_INFO1_RXDMA_ERROR_CODE,
-				  ent_desc->info1);
+			le32_get_bits(ent_desc->info1,
+				      HAL_REO_ENTR_RING_INFO1_RXDMA_ERROR_CODE);
 		if (rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_FLUSH_REQUEST_ERR ||
 		    rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_MPDU_LEN_ERR ||
 		    rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_OVERFLOW_ERR) {
@@ -5375,16 +5380,17 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 	msdu_cnt = sw_mon_entries->msdu_cnt;
 
 	sw_mon_entries->end_of_ppdu =
-		FIELD_GET(HAL_SW_MON_RING_INFO0_END_OF_PPDU, sw_desc->info0);
+		le32_get_bits(sw_desc->info0,
+			      HAL_SW_MON_RING_INFO0_END_OF_PPDU);
 	if (sw_mon_entries->end_of_ppdu)
 		return rx_bufs_used;
 
-	if (FIELD_GET(HAL_SW_MON_RING_INFO0_RXDMA_PUSH_REASON,
-		      sw_desc->info0) ==
+	if (le32_get_bits(sw_desc->info0,
+			  HAL_SW_MON_RING_INFO0_RXDMA_PUSH_REASON) ==
 		      HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED) {
 		rxdma_err =
-			FIELD_GET(HAL_SW_MON_RING_INFO0_RXDMA_ERROR_CODE,
-				  sw_desc->info0);
+			le32_get_bits(sw_desc->info0,
+				      HAL_SW_MON_RING_INFO0_RXDMA_ERROR_CODE);
 		if (rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_FLUSH_REQUEST_ERR ||
 		    rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_MPDU_LEN_ERR ||
 		    rxdma_err == HAL_REO_ENTR_RING_RXDMA_ECODE_OVERFLOW_ERR) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..20bee1d7d842 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -397,20 +397,21 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 
 	status_desc = desc + HTT_TX_WBM_COMP_STATUS_OFFSET;
 
-	wbm_status = FIELD_GET(HTT_TX_WBM_COMP_INFO0_STATUS,
-			       status_desc->info0);
+	wbm_status = le32_get_bits(status_desc->info0,
+				   HTT_TX_WBM_COMP_INFO0_STATUS);
 	switch (wbm_status) {
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_OK:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL:
 		ts.acked = (wbm_status == HAL_WBM_REL_HTT_TX_COMP_STATUS_OK);
 		ts.msdu_id = msdu_id;
-		ts.ack_rssi = FIELD_GET(HTT_TX_WBM_COMP_INFO1_ACK_RSSI,
-					status_desc->info1);
+		ts.ack_rssi = le32_get_bits(status_desc->info1,
+					    HTT_TX_WBM_COMP_INFO1_ACK_RSSI);
 
-		if (FIELD_GET(HTT_TX_WBM_COMP_INFO2_VALID, status_desc->info2))
-			ts.peer_id = FIELD_GET(HTT_TX_WBM_COMP_INFO2_SW_PEER_ID,
-					       status_desc->info2);
+		if (le32_get_bits(status_desc->info2,
+				  HTT_TX_WBM_COMP_INFO2_VALID))
+			ts.peer_id = le32_get_bits(status_desc->info2,
+						   HTT_TX_WBM_COMP_INFO2_SW_PEER_ID);
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
@@ -658,7 +659,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 					     struct hal_tx_status *ts)
 {
 	ts->buf_rel_source =
-		FIELD_GET(HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE, desc->info0);
+		le32_get_bits(desc->info0,
+			      HAL_WBM_RELEASE_INFO0_REL_SRC_MODULE);
 	if (unlikely(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_FW &&
 		     ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM))
 		return;
@@ -666,20 +668,20 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 	if (unlikely(ts->buf_rel_source == HAL_WBM_REL_SRC_MODULE_FW))
 		return;
 
-	ts->status = FIELD_GET(HAL_WBM_RELEASE_INFO0_TQM_RELEASE_REASON,
-			       desc->info0);
-	ts->ppdu_id = FIELD_GET(HAL_WBM_RELEASE_INFO1_TQM_STATUS_NUMBER,
-				desc->info1);
-	ts->try_cnt = FIELD_GET(HAL_WBM_RELEASE_INFO1_TRANSMIT_COUNT,
-				desc->info1);
-	ts->ack_rssi = FIELD_GET(HAL_WBM_RELEASE_INFO2_ACK_FRAME_RSSI,
-				 desc->info2);
-	if (desc->info2 & HAL_WBM_RELEASE_INFO2_FIRST_MSDU)
+	ts->status = le32_get_bits(desc->info0,
+				   HAL_WBM_RELEASE_INFO0_TQM_RELEASE_REASON);
+	ts->ppdu_id = le32_get_bits(desc->info1,
+				    HAL_WBM_RELEASE_INFO1_TQM_STATUS_NUMBER);
+	ts->try_cnt = le32_get_bits(desc->info1,
+				    HAL_WBM_RELEASE_INFO1_TRANSMIT_COUNT);
+	ts->ack_rssi = le32_get_bits(desc->info2,
+				     HAL_WBM_RELEASE_INFO2_ACK_FRAME_RSSI);
+	if (le32_to_cpu(desc->info2) & HAL_WBM_RELEASE_INFO2_FIRST_MSDU)
 		ts->flags |= HAL_TX_STATUS_FLAGS_FIRST_MSDU;
-	ts->peer_id = FIELD_GET(HAL_WBM_RELEASE_INFO3_PEER_ID, desc->info3);
-	ts->tid = FIELD_GET(HAL_WBM_RELEASE_INFO3_TID, desc->info3);
-	if (desc->rate_stats.info0 & HAL_TX_RATE_STATS_INFO0_VALID)
-		ts->rate_stats = desc->rate_stats.info0;
+	ts->peer_id = le32_get_bits(desc->info3, HAL_WBM_RELEASE_INFO3_PEER_ID);
+	ts->tid = le32_get_bits(desc->info3, HAL_WBM_RELEASE_INFO3_TID);
+	if (le32_to_cpu(desc->rate_stats.info0) & HAL_TX_RATE_STATS_INFO0_VALID)
+		ts->rate_stats = le32_to_cpu(desc->rate_stats.info0);
 	else
 		ts->rate_stats = 0;
 }
@@ -730,8 +732,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
 		ath11k_dp_tx_status_parse(ab, tx_status, &ts);
 
-		desc_id = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
-				    tx_status->buf_addr_info.info1);
+		desc_id = le32_get_bits(tx_status->buf_addr_info.info1,
+					BUFFER_ADDR_INFO1_SW_COOKIE);
 		mac_id = FIELD_GET(DP_TX_DESC_ID_MAC_ID, desc_id);
 		msdu_id = FIELD_GET(DP_TX_DESC_ID_MSDU_ID, desc_id);
 
@@ -906,24 +908,25 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 
 	skb_put(skb, len);
 	cmd = (struct htt_srng_setup_cmd *)skb->data;
-	cmd->info0 = FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_MSG_TYPE,
-				HTT_H2T_MSG_TYPE_SRING_SETUP);
+	cmd->info0 = le32_encode_bits(HTT_H2T_MSG_TYPE_SRING_SETUP,
+				      HTT_SRNG_SETUP_CMD_INFO0_MSG_TYPE);
 	if (htt_ring_type == HTT_SW_TO_HW_RING ||
 	    htt_ring_type == HTT_HW_TO_SW_RING)
-		cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_PDEV_ID,
-					 DP_SW2HW_MACID(mac_id));
+		cmd->info0 |= le32_encode_bits(DP_SW2HW_MACID(mac_id),
+					       HTT_SRNG_SETUP_CMD_INFO0_PDEV_ID);
 	else
-		cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_PDEV_ID,
-					 mac_id);
-	cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_RING_TYPE,
-				 htt_ring_type);
-	cmd->info0 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO0_RING_ID, htt_ring_id);
+		cmd->info0 |= le32_encode_bits(mac_id,
+					       HTT_SRNG_SETUP_CMD_INFO0_PDEV_ID);
+	cmd->info0 |= le32_encode_bits(htt_ring_type,
+				       HTT_SRNG_SETUP_CMD_INFO0_RING_TYPE);
+	cmd->info0 |= le32_encode_bits(htt_ring_id,
+				       HTT_SRNG_SETUP_CMD_INFO0_RING_ID);
 
-	cmd->ring_base_addr_lo = params.ring_base_paddr &
-				 HAL_ADDR_LSB_REG_MASK;
+	cmd->ring_base_addr_lo = cpu_to_le32(params.ring_base_paddr &
+				 HAL_ADDR_LSB_REG_MASK);
 
-	cmd->ring_base_addr_hi = (u64)params.ring_base_paddr >>
-				 HAL_ADDR_MSB_REG_SHIFT;
+	cmd->ring_base_addr_hi = cpu_to_le32((u64)params.ring_base_paddr >>
+				 HAL_ADDR_MSB_REG_SHIFT);
 
 	ret = ath11k_hal_srng_get_entrysize(ab, ring_type);
 	if (ret < 0)
@@ -932,45 +935,40 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	ring_entry_sz = ret;
 
 	ring_entry_sz >>= 2;
-	cmd->info1 = FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_ENTRY_SIZE,
-				ring_entry_sz);
-	cmd->info1 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_SIZE,
-				 params.num_entries * ring_entry_sz);
-	cmd->info1 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP,
-				 !!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP));
-	cmd->info1 |= FIELD_PREP(
-			HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_TLV_SWAP,
-			!!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP));
-	cmd->info1 |= FIELD_PREP(
-			HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_HOST_FW_SWAP,
-			!!(params.flags & HAL_SRNG_FLAGS_RING_PTR_SWAP));
+	cmd->info1 = le32_encode_bits(ring_entry_sz,
+				      HTT_SRNG_SETUP_CMD_INFO1_RING_ENTRY_SIZE);
+	cmd->info1 |= le32_encode_bits(params.num_entries * ring_entry_sz,
+				HTT_SRNG_SETUP_CMD_INFO1_RING_SIZE);
+	cmd->info1 |= le32_encode_bits(!!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP),
+				       HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP);
+	cmd->info1 |= le32_encode_bits(!!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP),
+				       HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_TLV_SWAP);
+	cmd->info1 |= le32_encode_bits(!!(params.flags & HAL_SRNG_FLAGS_RING_PTR_SWAP),
+				       HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_HOST_FW_SWAP);
 	if (htt_ring_type == HTT_SW_TO_HW_RING)
-		cmd->info1 |= HTT_SRNG_SETUP_CMD_INFO1_RING_LOOP_CNT_DIS;
+		cmd->info1 |= cpu_to_le32(HTT_SRNG_SETUP_CMD_INFO1_RING_LOOP_CNT_DIS);
 
-	cmd->ring_head_off32_remote_addr_lo = hp_addr & HAL_ADDR_LSB_REG_MASK;
-	cmd->ring_head_off32_remote_addr_hi = (u64)hp_addr >>
-					      HAL_ADDR_MSB_REG_SHIFT;
+	cmd->ring_head_off32_remote_addr_lo = cpu_to_le32(hp_addr & HAL_ADDR_LSB_REG_MASK);
+	cmd->ring_head_off32_remote_addr_hi = cpu_to_le32((u64)hp_addr >>
+					      HAL_ADDR_MSB_REG_SHIFT);
 
-	cmd->ring_tail_off32_remote_addr_lo = tp_addr & HAL_ADDR_LSB_REG_MASK;
-	cmd->ring_tail_off32_remote_addr_hi = (u64)tp_addr >>
-					      HAL_ADDR_MSB_REG_SHIFT;
+	cmd->ring_tail_off32_remote_addr_lo = cpu_to_le32(tp_addr & HAL_ADDR_LSB_REG_MASK);
+	cmd->ring_tail_off32_remote_addr_hi = cpu_to_le32((u64)tp_addr >>
+					      HAL_ADDR_MSB_REG_SHIFT);
 
-	cmd->ring_msi_addr_lo = lower_32_bits(params.msi_addr);
-	cmd->ring_msi_addr_hi = upper_32_bits(params.msi_addr);
-	cmd->msi_data = params.msi_data;
+	cmd->ring_msi_addr_lo = cpu_to_le32(lower_32_bits(params.msi_addr));
+	cmd->ring_msi_addr_hi = cpu_to_le32(upper_32_bits(params.msi_addr));
+	cmd->msi_data = cpu_to_le32(params.msi_data);
 
-	cmd->intr_info = FIELD_PREP(
-			HTT_SRNG_SETUP_CMD_INTR_INFO_BATCH_COUNTER_THRESH,
-			params.intr_batch_cntr_thres_entries * ring_entry_sz);
-	cmd->intr_info |= FIELD_PREP(
-			HTT_SRNG_SETUP_CMD_INTR_INFO_INTR_TIMER_THRESH,
-			params.intr_timer_thres_us >> 3);
+	cmd->intr_info = le32_encode_bits(params.intr_batch_cntr_thres_entries * ring_entry_sz,
+					  HTT_SRNG_SETUP_CMD_INTR_INFO_BATCH_COUNTER_THRESH);
+	cmd->intr_info |= le32_encode_bits(params.intr_timer_thres_us >> 3,
+				    HTT_SRNG_SETUP_CMD_INTR_INFO_INTR_TIMER_THRESH);
 
-	cmd->info2 = 0;
+	cmd->info2 = cpu_to_le32(0);
 	if (params.flags & HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN) {
-		cmd->info2 = FIELD_PREP(
-				HTT_SRNG_SETUP_CMD_INFO2_INTR_LOW_THRESH,
-				params.low_threshold);
+		cmd->info2 = le32_encode_bits(params.low_threshold,
+					      HTT_SRNG_SETUP_CMD_INFO2_INTR_LOW_THRESH);
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_DP_TX,
@@ -1008,8 +1006,8 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 
 	skb_put(skb, len);
 	cmd = (struct htt_ver_req_cmd *)skb->data;
-	cmd->ver_reg_info = FIELD_PREP(HTT_VER_REQ_INFO_MSG_ID,
-				       HTT_H2T_MSG_TYPE_VERSION_REQ);
+	cmd->ver_reg_info = le32_encode_bits(HTT_H2T_MSG_TYPE_VERSION_REQ,
+					     HTT_VER_REQ_INFO_MSG_ID);
 
 	ret = ath11k_htc_send(&ab->htc, dp->eid, skb);
 	if (ret) {
@@ -1051,12 +1049,14 @@ int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
 
 		skb_put(skb, len);
 		cmd = (struct htt_ppdu_stats_cfg_cmd *)skb->data;
-		cmd->msg = FIELD_PREP(HTT_PPDU_STATS_CFG_MSG_TYPE,
-				      HTT_H2T_MSG_TYPE_PPDU_STATS_CFG);
+		cmd->msg = le32_encode_bits(HTT_H2T_MSG_TYPE_PPDU_STATS_CFG,
+					    HTT_PPDU_STATS_CFG_MSG_TYPE);
 
 		pdev_mask = 1 << (ar->pdev_idx + i);
-		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_PDEV_ID, pdev_mask);
-		cmd->msg |= FIELD_PREP(HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK, mask);
+		cmd->msg |= le32_encode_bits(pdev_mask,
+					     HTT_PPDU_STATS_CFG_PDEV_ID);
+		cmd->msg |= le32_encode_bits(mask,
+					     HTT_PPDU_STATS_CFG_TLV_TYPE_BITMASK);
 
 		ret = ath11k_htc_send(&ab->htc, dp->eid, skb);
 		if (ret) {
@@ -1097,31 +1097,31 @@ int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 
 	skb_put(skb, len);
 	cmd = (struct htt_rx_ring_selection_cfg_cmd *)skb->data;
-	cmd->info0 = FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_MSG_TYPE,
-				HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG);
+	cmd->info0 = le32_encode_bits(HTT_H2T_MSG_TYPE_RX_RING_SELECTION_CFG,
+				      HTT_RX_RING_SELECTION_CFG_CMD_INFO0_MSG_TYPE);
 	if (htt_ring_type == HTT_SW_TO_HW_RING ||
 	    htt_ring_type == HTT_HW_TO_SW_RING)
 		cmd->info0 |=
-			FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
-				   DP_SW2HW_MACID(mac_id));
+			le32_encode_bits(DP_SW2HW_MACID(mac_id),
+					 HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID);
 	else
 		cmd->info0 |=
-			FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID,
-				   mac_id);
-	cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_RING_ID,
-				 htt_ring_id);
-	cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_SS,
-				 !!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP));
-	cmd->info0 |= FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PS,
-				 !!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP));
-
-	cmd->info1 = FIELD_PREP(HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE,
-				rx_buf_size);
-	cmd->pkt_type_en_flags0 = tlv_filter->pkt_filter_flags0;
-	cmd->pkt_type_en_flags1 = tlv_filter->pkt_filter_flags1;
-	cmd->pkt_type_en_flags2 = tlv_filter->pkt_filter_flags2;
-	cmd->pkt_type_en_flags3 = tlv_filter->pkt_filter_flags3;
-	cmd->rx_filter_tlv = tlv_filter->rx_filter;
+			le32_encode_bits(mac_id,
+					 HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PDEV_ID);
+	cmd->info0 |= le32_encode_bits(htt_ring_id,
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO0_RING_ID);
+	cmd->info0 |= le32_encode_bits(!!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP),
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO0_SS);
+	cmd->info0 |= le32_encode_bits(!!(params.flags & HAL_SRNG_FLAGS_DATA_TLV_SWAP),
+				       HTT_RX_RING_SELECTION_CFG_CMD_INFO0_PS);
+
+	cmd->info1 = le32_encode_bits(rx_buf_size,
+				      HTT_RX_RING_SELECTION_CFG_CMD_INFO1_BUF_SIZE);
+	cmd->pkt_type_en_flags0 = cpu_to_le32(tlv_filter->pkt_filter_flags0);
+	cmd->pkt_type_en_flags1 = cpu_to_le32(tlv_filter->pkt_filter_flags1);
+	cmd->pkt_type_en_flags2 = cpu_to_le32(tlv_filter->pkt_filter_flags2);
+	cmd->pkt_type_en_flags3 = cpu_to_le32(tlv_filter->pkt_filter_flags3);
+	cmd->rx_filter_tlv = cpu_to_le32(tlv_filter->rx_filter);
 
 	ret = ath11k_htc_send(&ab->htc, ab->dp.eid, skb);
 	if (ret)
@@ -1166,12 +1166,12 @@ ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 	cmd->hdr.pdev_mask = 1 << pdev_id;
 
 	cmd->hdr.stats_type = type;
-	cmd->cfg_param0 = cfg_params->cfg0;
-	cmd->cfg_param1 = cfg_params->cfg1;
-	cmd->cfg_param2 = cfg_params->cfg2;
-	cmd->cfg_param3 = cfg_params->cfg3;
-	cmd->cookie_lsb = lower_32_bits(cookie);
-	cmd->cookie_msb = upper_32_bits(cookie);
+	cmd->cfg_param0 = cpu_to_le32(cfg_params->cfg0);
+	cmd->cfg_param1 = cpu_to_le32(cfg_params->cfg1);
+	cmd->cfg_param2 = cpu_to_le32(cfg_params->cfg2);
+	cmd->cfg_param3 = cpu_to_le32(cfg_params->cfg3);
+	cmd->cookie_lsb = cpu_to_le32(lower_32_bits(cookie));
+	cmd->cookie_msb = cpu_to_le32(upper_32_bits(cookie));
 
 	ret = ath11k_htc_send(&ab->htc, dp->eid, skb);
 	if (ret) {
@@ -1280,17 +1280,18 @@ int ath11k_dp_tx_htt_rx_full_mon_setup(struct ath11k_base *ab, int mac_id,
 	skb_put(skb, len);
 	cmd = (struct htt_rx_full_monitor_mode_cfg_cmd *)skb->data;
 	memset(cmd, 0, sizeof(*cmd));
-	cmd->info0 = FIELD_PREP(HTT_RX_FULL_MON_MODE_CFG_CMD_INFO0_MSG_TYPE,
-				HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE);
+	cmd->info0 = le32_encode_bits(HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE,
+				      HTT_RX_FULL_MON_MODE_CFG_CMD_INFO0_MSG_TYPE);
 
-	cmd->info0 |= FIELD_PREP(HTT_RX_FULL_MON_MODE_CFG_CMD_INFO0_PDEV_ID, mac_id);
+	cmd->info0 |= le32_encode_bits(mac_id,
+				       HTT_RX_FULL_MON_MODE_CFG_CMD_INFO0_PDEV_ID);
 
-	cmd->cfg = HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_ENABLE |
-		   FIELD_PREP(HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_RELEASE_RING,
-			      HTT_RX_MON_RING_SW);
+	cmd->cfg = cpu_to_le32(HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_ENABLE) |
+		   le32_encode_bits(HTT_RX_MON_RING_SW,
+				    HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_RELEASE_RING);
 	if (config) {
-		cmd->cfg |= HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_ZERO_MPDUS_END |
-			    HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_NON_ZERO_MPDUS_END;
+		cmd->cfg |= cpu_to_le32(HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_ZERO_MPDUS_END |
+					HTT_RX_FULL_MON_MODE_CFG_CMD_CFG_NON_ZERO_MPDUS_END);
 	}
 
 	ret = ath11k_htc_send(&ab->htc, ab->dp.eid, skb);

-- 
2.53.0


