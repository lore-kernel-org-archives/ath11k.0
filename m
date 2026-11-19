Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD3606A32A
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Ff83GSb;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=hWbMq7OA;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=CkZ2OJpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ix3a93gzuul6VROQSvquCtYBwqaHNQ36gYa8xcv+gKc=; b=0Ff83GSbN35DseWx5SZMW/7S/h
	lLvA417Lgt2lz7Lj57j+Zc5pnUAKYGtUE/LnVw8LuqHK6cJMz2S4ys0Mgnj0YaHyuQclp/2mCDpfg
	/CH+MyE4Vtkraz//9AvFoX1XIEX+m2ozianlZKqD8lCgk55arjP4BdLw3ZQBmlK+SANGupQFdGkns
	I/itAW1hQ0Z/E5S+8+Ls3tB9y+pmi6C+2rhQsSeRy7LjESN5c1gu4jwRAUGt5H4lN5pro0xJ8PDtI
	kKpi0DvyW3T2OkWHJ1HDASzfxP1RQ9qmP7H0/XmR63DTiHmy6waIuw6j3InZ14a+tGSt2z8Uf+qgZ
	CWQLxCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyMy-0000000BNnW-07PJ;
	Thu, 19 Nov 2026 09:23:52 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyMv-0000000BNmA-3BgE
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:23:51 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6wHHu460507;
	Thu, 19 Nov 2026 10:23:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	Ix3a93gzuul6VROQSvquCtYBwqaHNQ36gYa8xcv+gKc=; b=hWbMq7OA+sW4gUwR
	ADV9+eOL9YSh0ciurth06NWVN4ca3Edc10NTNniBGW5TV39sDajHAjt3K52rNE/m
	f+c9eXa2qYRZ+YLmSUI109V3ywHuberrh+KcijIg33zkNN6XbPoBr6wiV8vIemy5
	T/oPGbGVi+dQV2LgTktHbdNI/2CKlJ9095A8CqU71W/ww0oCW9uaH4Pt/9k6z199
	LslyJBdlrz4GJ9DfXXnQqQk1CTcBz8tff3H+/4I+U4glAmfsUdTdfbeCbaAyNV2k
	pTd5Fvivmf7A/As0DgowhMKNAZhSDe6RITAeca+AVLPJO+iMiK52SVfUQWUgy/x0
	+Xg3yg==
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11020115.outbound.protection.outlook.com [52.101.69.115])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qgbgdfd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:43 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QS0P7dKqlGn0JhGANzPzjuuqLjka1nnlcaBubu9jW8CB+zYyEHFmBNzKYMSkfIRYzl9WwoAvmCAiz+cIw7HkZstUxnja3CuB9w2IPAPaIeVuWvc2GQ+EdjUin9vjwPTyNaqiKNXZKaCnA6oBK5iAyGKoZybohLbRn3W/JIA9K/JnJOhY6xIZR0p7SunlcKT/4CKvcF8k8C9y3vRAhiT4PENlu0xAu8qV3fFTK9zV4HueTihyNNfAUKBLqOX9lENOKzAh6gOcf7Kt7YU5I17MVcJP/c3D0cQTKopOdwodGJjgcilLsM+oT9GJ20KCOITc0JQVxaH4del5g6cwIb78vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ix3a93gzuul6VROQSvquCtYBwqaHNQ36gYa8xcv+gKc=;
 b=rfpCSWmu9xyjji5tiy6Y2Xikd5GMFAiQLgxLEotnD7DXcxOmvCm9QubxvCExb8zsGikbvbsk4gu3OighiqlGZl8Rk/EE2Hkf5iPPCnWDTuXHfR0tCE3JbFHd3JRjfapLOod8/adDeqDFsK6GFfxJVb5SJBPjD0QdD4kOw6sOSDkOGT0j3G7ehOmEHrNSClehbhiXhL70vgFbfiF/vT7gduRS2AmVSM83dAA3Klgo+1pw7jxjvpWoLmAjkJKeR8tWO7AFJBC1Et0VRHOS3diQUEfiX/2jFt+jviIDvnedEbXEIg2pdiKMssUwkNmGpjb2wCQ2rspvIxVEXmI9/xXlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix3a93gzuul6VROQSvquCtYBwqaHNQ36gYa8xcv+gKc=;
 b=CkZ2OJpm55+7cf34ZhL736BHmR57F3nY/NM64SsQ5wA6hBcigk2UM6+fCkYzCU+uA0OSBEYETVRCbJwdHk+arlSD8WCadsJrW/v0BkdcCOY/wCT2bDGK1N1QNPjtZddy36qBOS/9SCJhdwFcw+k8o3Tww3TMseTXcrcBLTo49/c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:41 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:41 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:53 +0100
Subject: [PATCH RFC 1/7] wifi: ath11k: remove CE byte swap for big endian
 hosts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-1-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OL1P279CA0048.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:14::17) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 5312cb46-0b7d-457c-6d76-08df461eccc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|261022115727099003|4143699003|261026130827099003|261026121527099003|11063799006|261102130727099003|56012099006|261026140227099003|261026135527099003|261021130227099003|261021123027099003|261022105027099003|261021121427099003|261021133027099003|261022075727099003|261028144727099003|261022113327099003|261021135927099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: LYeBxgsSNc2fsa334+X0WflDqu/eO99A11/yJWQDCzLintZirqmJuBNfBlSfgYhJabxbj5NFVpCtn+f3Qu++dxpWX3VSIxOpuBtRP1UwSkYBy2WWFR3GkdCCLv47ILJaHrBMPWZ/ZGR7N+P0gim/NstI/8g0530/SB6sk1C+m2MiCrdGJaT+/9wJb4y3Zt4iQdsZ+KbhKLpPG16oed9qPfXYGRtl/x1jKxVJwWeONAEk/ZbnTekZtG2aZnYNOfQykNJyi33WNSM8g1RLIfzu1DYwFRXOAjPfsJtl5dvq76bOn/iPJyVFGRFJZ0sDQUnezC22jZlajhiMS1jJhUSfK+rwjrR5OpYBoL5G/nDOewuvD6uLWOidWqNa3K7U8uT5VP6Xo6CQtsTim/sF1KeStsBcfLS0p2tabbuGvPvV/JrPwcC4RrxXGrFieAWSM//qHkfYcZ+MbeFX29LQm7tPR82JCPVIjTv8FM1Wheh24+iukRuKg9c9S+jlJM+U8Sx34Bfs7GcLC0t7MaLRqsDhqg2qG5OjHVJH65Tqu4U5Uy1H8pJA6eakpEyIolIaTFHUpqHbf4tdLFsKHcxbcxoP33cP92ejS/xnK+k2/kkVKrTHjh42FdsunA7P/Ji1ZuwM5b9Ygi1oaoveYU2zwAndsJJe6DRXtDtfccNHuc2UyDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(261022115727099003)(4143699003)(261026130827099003)(261026121527099003)(11063799006)(261102130727099003)(56012099006)(261026140227099003)(261026135527099003)(261021130227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261021133027099003)(261022075727099003)(261028144727099003)(261022113327099003)(261021135927099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU9sMk1TWmxGeGtXQ3RLeEwrdjMrSnh4TEVBTFJIbXFMQ0dxSnBnaWcxblc2?=
 =?utf-8?B?ZTRUeUxFd0Yyb3IyZEZFMWtWeFZndzlUR1FLMmhJc25iZ05lSjZYNFprZTVE?=
 =?utf-8?B?RGFUU0d4UGFnUlNFRTJzaWNLSEEzWm9EVER5ODh6T1VmU2tjT05oRWNuOU12?=
 =?utf-8?B?S1hZWkl0SXdKZ3RlMURNcDc2b1ZaeWpTODFmNnNGSS9Rbnpld3JNaTI1TkRN?=
 =?utf-8?B?QUpkV3pKUXNuc0VvMTQ0ZlFqWU5kZW5QZjhFUDFrT2xwQ2tHd2Z3b3NHZDE5?=
 =?utf-8?B?ZTRJQmVYS3g5SWhkVnEyTGxibjMxUktWVzdVN20wRXpCaGVEK0RiNUhKVk55?=
 =?utf-8?B?ZjFDN2hGMXR1cnJzTlNhSHhxQTduZ0RxWWYwY2phY3hHdDJLQWtCekF0U1Vz?=
 =?utf-8?B?NXI2WlFQaUNIeVZGWUc3dFhYRmEzVmlIVTFiS2U0VWxqRkI3YlFNTzhnbWxv?=
 =?utf-8?B?V0c3aGhFdlFuNkNJaHc5SU5QT3pLd3RYZGVEd25hMjY0OWJDQ0Z1bm96WGp4?=
 =?utf-8?B?ZmdIMmNwMGlJZnJ2Y0FPN29CdU5oOUsrLzEwWWZOTHZ6Tmg0VkhOOXdhMzVP?=
 =?utf-8?B?MmE2YUJsYUtyUHNJTHJaVlg2WVJHTWw5eG9oUEJQMmlqZ3poMW1jTFlZMi9i?=
 =?utf-8?B?Uk1DTXd4M2Z2bmNTdlBRd1ZBVFc0MWs1R04zOW5ScVNpU1ZOYWMyVnBSQUlo?=
 =?utf-8?B?V3l1V0dKMjZEWFROK0pyZGN3WHFhdEp6MVhqVllhenFCWStyNGJ1ZHFYSjJK?=
 =?utf-8?B?eHJCNjdmZ053a291K3lmU216UlEwMU1sQkxjeWFIWXg0N3crbmVKREZkYmpo?=
 =?utf-8?B?VERWZHJXOWQ1NExxSmFTcXU5UGVRTWcrdnc0d0oyQUpJVk1RNVJ6NmVsMnRo?=
 =?utf-8?B?Vk9TaTMzY1l0eGNFbS9wQUJyV1JwZFk4VGc3RDZWbWpVY0E3Q0VMNVM0U0xY?=
 =?utf-8?B?N2FFbnpENlhUK1poOGpDcVJkOS9TMzNyclAwZWtScjRBL0Mza3h1NzBrQ1VR?=
 =?utf-8?B?SUtzNmt5eThhTDYycmxNbmJLR1RwakZxOHdHQzdQUWQySTd1dElDRGt6bTF6?=
 =?utf-8?B?K2lycXBzWVJ0MWVwWUpnU2VkRWF3cEtEUUE5QlM5SnRuNzJEb1VSU084Qk45?=
 =?utf-8?B?V29SM2FCcTFyeTh4Wm9XTmpsaSt5VFI1bUxHNCtvNHlYL3VsZ2xiZkUrRHJm?=
 =?utf-8?B?ZHl6SHhDU2NQMDhLVml1QVAwQW05NkFJVkJrTHFJb2lZOUkvQUpFY3VGem1L?=
 =?utf-8?B?d3ZnWFU2ZmVEcnRzM3R4OU0yc1daR01CcDFIbHFCb2ZEMkVHWGtHbUdmUWNG?=
 =?utf-8?B?QndqYzFmM2hpM0lnN0NxQklTeVBsWUZwSGpCc3AzSjBtTXVsbXdWcElrejNY?=
 =?utf-8?B?czlHUDJxN1k0bTc4RVRHeVBRSzc4a0lyQjYwK0tUMGNLNXZYYk9yQ0hoVWZ0?=
 =?utf-8?B?czhaTjRGQlg0NUQ5Nzhaczg0RFBRU1V5RWloNEZDUDlsQitWT2lIVEFya2NI?=
 =?utf-8?B?SWZFNGplb3I0U0dvell3cGUvWTdoZWhyaDJ2NGVibnp6dlZkK0EvZkFOZFlo?=
 =?utf-8?B?NUNTSDVNS0JNYkp6UFpac2huVGtWQWhmUWpLUkViNE1aYlRuNUtNUTgzcmxP?=
 =?utf-8?B?eUNjU3JkUFJnU1NYclgzRXN4L056TUFXREY5WXdLR1pQSFBFOWVuUjVlUlN0?=
 =?utf-8?B?WWk3VEprMDFlNndYTmJsT3d3SHQ5TmJhM3Jlck5nS1JNN3QrUCtUOUhUTUZQ?=
 =?utf-8?B?V29ZdFdLYXN5bVUyUHBMSWdwY2pvcWhHd2NRRHhwYW13Qm9CbTNjVjlIVHFI?=
 =?utf-8?B?VWptN1g4eVJwSFVlNmtaMHhBUHNjUEpxZmk2VGZhQzk5MFNtK0tMMnFyN0hp?=
 =?utf-8?B?d2p6UC9lRXVUTFRoRTZLVFVzS0hPaXU0YmtvcCt4SDJSaXB2ZUI4R0xiTm94?=
 =?utf-8?B?RFNFOERYbzY0U3AwWmFCczIyRGxzOHk4SXdkUzVZSGZXaU5YK3VDK2VUVVVr?=
 =?utf-8?B?RiszQmpIQlUraVJZcDdnT2pmOEdlRmlqVTJTUXZid2JKQi83YzB5Tm1zdk9o?=
 =?utf-8?B?NWtUbHhhZVpXcUxJOE95YkRNTDhHYWhPVGhLdWJKZlZ3ZnNLUG94enFlZzBk?=
 =?utf-8?B?dXJGUWhPOVlSREhLcjVxUEZTK3ZJcE5yc0dUWGdrTGpNYno1TWJ4b3gzeDRK?=
 =?utf-8?B?OEIvQ3g3Qm8zYVQzaFlab1BGckxCaUlrVXp2OHNwZEZxbDcxTG40TjlMKzJt?=
 =?utf-8?B?QWROYnNBdmJFSFlHMkFZUG1YZ3M2ZTl3MlhvWG1ZR0tpeGhwSElTL1ZyV0Er?=
 =?utf-8?B?QlVCU05FbjlyVmVLUWJVM3NqV3V3SVVEeENlbllCTUxWdGdUU3lIZz09?=
X-Exchange-RoutingPolicyChecked: MQTqQSG8+WoRAKKwvaZ/N8BkdwlSZ5zba/NvFnh8Uo9qIJIOebG6T2c5Wve9nif/bN0XND/8MBhK6TrsdwyuU9IG7VkDDnfRE76GubDPC3to3TJ3eGW75KpAljrXyDPxcu8cIgHz4L4+nyv/JwiqgB6STtkCn5Zff2mMZRDYwbQ/H/3ua/m9eGMm6kw2mRqIL2ztl2O1DFf96ELHQLR9pL1Jmdkz+x7Usm9GJf28/+rguJSfQA67cIg/OjZMpWWLyeMh1u0bWlxKtFCNal9ETgx7Hc4La0vnEmUI7yRESixJrfYzKFwaNDuDl5afud1e3DtjdS8Q7B2iqe56mPEeMw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lHsOGmUYQzxhmvUWa/hc0b+u/21J0m6aEWt3QAZ2Aey38G5wQ4bNOJ/76MWWv0Mwn0sI/i93h15ZmLiteBMCEDel365XZHPdGy/Z+Ae++NTIaedWIv8Gxb/jI727D/XZPRABh1RcKcJ2U0JdMVDim7OP9i+niJecqJ3QCgAlcCcPWYk7Ng09DrJvZoJkSweE22T6tsBJCOCSlqLD51lF5D3tXeKbT4KiCDxdMBjFX3yXJ6pnFNIEGNydRASS3DVMp5kkrCYzeRrTFSHK+tE3cCV1oxFHZJwusfpfC1ZzbdEV0sUl/hEQSAHQm17wxqJfg5oM11LkJIfUhBKX2TfLz5uFgMJwOl9Me8KjL14yuoXM0eSI/mjfCL5J8WtZLJJuAgNcC621tJktY5acxpCaneM6wQr3h2RRlISSnhaptqlGFRs92SptPjucNy9ck4f5yx2GLfKw81TiNUEMHXv9PqAeAcf46Ua1XFfudzkQkpjq0onwxiV6yYEjwRxU9ULDlH5JupUp5XjDjLGa3FBck6nyLsvU8SYU0T7jf+AIbA+N49u/OZkaOIdHW1pqXgWaSZ2Y1j1lw4iBzm4a+2aYX5TVbL0bwxRkrnoddERkJicH+qY9ZANlgWWt+g9bWeFV
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5312cb46-0b7d-457c-6d76-08df461eccc6
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:40.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g25cUAeBf6ETR1wNFpJiZC0RBMWpQ8Dq1h7nnmvVAhKn4l1qlFVg61b5UY/EV2eB210KHtYqBlMVOYLlC/1TZw==
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
X-Proofpoint-GUID: 8n7RbMBzHMZshL7w15DYlY62TormUTB5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX8rTl2TQMH1SK
 ugRBqdABf4z6YZ47LeZsxtfhLm9x1hvdPt8h+EC2SohbgDFhhT/9cY9BCnL262q6QCjv4cclYLg
 gIIQozrgZt2z4QL4NOqEmqRKsils/YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX3pIkgCak+vZp
 RV+9e73mvp7GDwJAr2iOOByUgaR5KN2Gc4pb6bLYXw9Z7Siud9PXy/3yMZfmAOcbVsOrghzzCCb
 cvwRBQtURFhKKAMpEK2Q8U17ut1k/dKdE7aaKZu03AYY5vFpMGVkbJSv9lTjT40fTPGcsTL1fhy
 LkpmqWUYzdvuLouFFWNVf8VNUoUIVCvulBevZmCjk8fE3Zrd5LSKT4+unExiXmzYYTiVUmHPK1c
 mER9PB876tDkN6frunETGy0+PzGcNUNAOQ+C26vMqp6jFfPkR1E7HnB6ojrqembcBziJvu1iIbK
 4LdP2QvCQG9/fu18xB/6h+olqEK8dNCcGEbMIPm5DBBU4fRJh1h5lo2L0PpdwmzR0Q5jzMzddG4
 hGuYib8RaKv7vMwhyFwWxpCBjBpFt+IRM4qUY5d70aT6Mi9GEU/uWcPMeEAqTSODO4fNImVucBt
 JqWxhySIs3yrVSo5FgQ==
X-Authority-Analysis: v=2.4 cv=e6KT2qp/ c=1 sm=1 tr=0 ts=6afec01f cx=c_pps
 a=liNU4DyYNKSIpXKgFlKCpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=ayrFxtdICWJgHmJ6DOoA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: 8n7RbMBzHMZshL7w15DYlY62TormUTB5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012350_119034_294AF39E 
X-CRM114-Status: GOOD (  12.48  )
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

On big endian hosts the copy engine is configured with
CE_ATTR_BYTE_SWAP_DATA, so that the hardware swaps the transferred data in
32 bit words. In addition, ath11k_ce_byte_swap() swaps selected byte array
payloads back into their original order.

The byte swapping in the copy engine does not work reliably. The root cause
is unknown and the resulting byte order may differ between firmware
versions, so data exchanged between host and firmware ends up corrupted.
Relying on the CE byte swap therefore cannot provide working big endian
support.

Disable the CE byte swap and remove ath11k_ce_byte_swap(). Instead,
endianness is handled in the driver itself by converting all structures
shared with the firmware to __le types and using the appropriate accessors,
as done in the following patches.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/ce.c  | 19 -------------------
 drivers/net/wireless/ath/ath11k/ce.h  |  6 ------
 drivers/net/wireless/ath/ath11k/wmi.c | 17 -----------------
 3 files changed, 42 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 1e08b0970b14..16f13d25baea 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -1050,25 +1050,6 @@ int ath11k_ce_alloc_pipes(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_ce_alloc_pipes);
 
-/* For Big Endian Host, Copy Engine byte_swap is enabled
- * When Copy Engine does byte_swap, need to byte swap again for the
- * Host to get/put buffer content in the correct byte order
- */
-void ath11k_ce_byte_swap(void *mem, u32 len)
-{
-	int i;
-
-	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
-		if (!mem)
-			return;
-
-		for (i = 0; i < (len / 4); i++) {
-			*(u32 *)mem = swab32(*(u32 *)mem);
-			mem += 4;
-		}
-	}
-}
-
 int ath11k_ce_get_attr_flags(struct ath11k_base *ab, int ce_id)
 {
 	if (ce_id >= ab->hw_params.ce_count)
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 308f425fcec0..b97eca14be7d 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -16,17 +16,11 @@
 #define CE_ATTR_DIS_INTR		8
 
 /* Host software's Copy Engine configuration. */
-#ifdef __BIG_ENDIAN
-#define CE_ATTR_FLAGS CE_ATTR_BYTE_SWAP_DATA
-#else
 #define CE_ATTR_FLAGS 0
-#endif
 
 /* Threshold to poll for tx completion in case of Interrupt disabled CE's */
 #define ATH11K_CE_USAGE_THRESHOLD 32
 
-void ath11k_ce_byte_swap(void *mem, u32 len);
-
 /*
  * Directions for interconnect pipe configuration.
  * These definitions may be used during configuration and are shared
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df481cb..08babb0cb534 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -700,8 +700,6 @@ int ath11k_wmi_mgmt_send(struct ath11k *ar, u32 vdev_id, u32 buf_id,
 
 	memcpy(frame_tlv->value, frame->data, buf_len);
 
-	ath11k_ce_byte_swap(frame_tlv->value, buf_len);
-
 	if (tx_params_valid) {
 		params =
 		(struct wmi_mgmt_send_params *)(skb->data + (len - sizeof(*params)));
@@ -6016,8 +6014,6 @@ static int ath11k_pull_mgmt_rx_params_tlv(struct ath11k_base *ab,
 	skb_pull(skb, frame - skb->data);
 	skb_put(skb, hdr->buf_len);
 
-	ath11k_ce_byte_swap(skb->data, hdr->buf_len);
-
 	return 0;
 }
 
@@ -9547,9 +9543,7 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 			     FIELD_PREP(WMI_TLV_LEN, sizeof(*bitmap) - TLV_HDR_SIZE);
 
 	memcpy(bitmap->patternbuf, pattern, pattern_len);
-	ath11k_ce_byte_swap(bitmap->patternbuf, roundup(pattern_len, 4));
 	memcpy(bitmap->bitmaskbuf, mask, pattern_len);
-	ath11k_ce_byte_swap(bitmap->bitmaskbuf, roundup(pattern_len, 4));
 	bitmap->pattern_offset = pattern_offset;
 	bitmap->pattern_len = pattern_len;
 	bitmap->bitmask_len = pattern_len;
@@ -9697,8 +9691,6 @@ ath11k_wmi_op_gen_config_pno_start(struct ath11k *ar,
 				WMI_NLO_CONFIG_RANDOM_SEQ_NO_IN_PROBE_REQ;
 		ether_addr_copy(cmd->mac_addr.addr, pno->mac_addr);
 		ether_addr_copy(cmd->mac_mask.addr, pno->mac_addr_mask);
-		ath11k_ce_byte_swap(cmd->mac_addr.addr, 8);
-		ath11k_ce_byte_swap(cmd->mac_mask.addr, 8);
 	}
 
 	ptr += sizeof(*cmd);
@@ -9722,8 +9714,6 @@ ath11k_wmi_op_gen_config_pno_start(struct ath11k *ar,
 		memcpy(nlo_list[i].ssid.ssid.ssid,
 		       pno->a_networks[i].ssid.ssid,
 		       nlo_list[i].ssid.ssid.ssid_len);
-		ath11k_ce_byte_swap(nlo_list[i].ssid.ssid.ssid,
-				    roundup(nlo_list[i].ssid.ssid.ssid_len, 4));
 
 		if (pno->a_networks[i].rssi_threshold &&
 		    pno->a_networks[i].rssi_threshold > -300) {
@@ -9842,14 +9832,11 @@ static void ath11k_wmi_fill_ns_offload(struct ath11k *ar,
 
 			memcpy(ns->target_ipaddr[0], offload->ipv6_addr[i], 16);
 			memcpy(ns->solicitation_ipaddr, offload->self_ipv6_addr[i], 16);
-			ath11k_ce_byte_swap(ns->target_ipaddr[0], 16);
-			ath11k_ce_byte_swap(ns->solicitation_ipaddr, 16);
 
 			if (offload->ipv6_type[i])
 				ns->flags |= WMI_NSOL_FLAGS_IS_IPV6_ANYCAST;
 
 			memcpy(ns->target_mac.addr, offload->mac_addr, ETH_ALEN);
-			ath11k_ce_byte_swap(ns->target_mac.addr, 8);
 
 			if (ns->target_mac.word0 != 0 ||
 			    ns->target_mac.word1 != 0) {
@@ -9893,7 +9880,6 @@ static void ath11k_wmi_fill_arp_offload(struct ath11k *ar,
 			/* Copy the target ip addr and flags */
 			arp->flags = WMI_ARPOL_FLAGS_VALID;
 			memcpy(arp->target_ipaddr, offload->ipv4_addr[i], 4);
-			ath11k_ce_byte_swap(arp->target_ipaddr, 4);
 
 			ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "arp offload address %pI4",
 				   arp->target_ipaddr);
@@ -9988,14 +9974,11 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 
 		/* the length in rekey_data and cmd is equal */
 		memcpy(cmd->kck, rekey_data->kck, sizeof(cmd->kck));
-		ath11k_ce_byte_swap(cmd->kck, GTK_OFFLOAD_KEK_BYTES);
 		memcpy(cmd->kek, rekey_data->kek, sizeof(cmd->kek));
-		ath11k_ce_byte_swap(cmd->kek, GTK_OFFLOAD_KEK_BYTES);
 
 		replay_ctr = cpu_to_le64(rekey_data->replay_ctr);
 		memcpy(cmd->replay_ctr, &replay_ctr,
 		       sizeof(replay_ctr));
-		ath11k_ce_byte_swap(cmd->replay_ctr, GTK_REPLAY_COUNTER_BYTES);
 	} else {
 		cmd->flags = GTK_OFFLOAD_DISABLE_OPCODE;
 	}

-- 
2.53.0


