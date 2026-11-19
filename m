Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F01606A339
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ilj5JcsT;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=rtmTGnCy;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=SrpamS42
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NdUuERnd+BRoNDrjq7ul1WnCsFmt8E7qUDAN94JpIck=; b=ilj5JcsTDQ+a9AZK1w5j+T/d4O
	+POfeaxj9jBSNsWWKQ2w5LGMB6aX+eQJVRg5VpOd/Q+5EUAH0Wy7t3JFWWXvLjhDVllwC0bOInWWN
	LyMfk0WyJyo9PahX6J3JrCy5K21mMB1dK5sMLoU4S7j+USl9aGlKd3Sad6BUm/18dkQGzfnf+wphL
	YpbexgF6rAgdJgeBcfA6w0/bAupdtKlNX0BOZkANQg4T5NAzN4o388C9dBLDi/FI50JBbJxzu1b/t
	UpRrUpOWB7vqDpMLeEYZrOROuog8HySQkP+3wshm5F9jcMoEr5DLx62E7y15ZwNHone1aKVi7M8ZZ
	db1Q6LUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyOD-0000000BODF-3Ex7;
	Thu, 19 Nov 2026 09:25:09 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyNC-0000000BNwP-0Azj
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:25:08 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6wEbr606778;
	Thu, 19 Nov 2026 10:24:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	NdUuERnd+BRoNDrjq7ul1WnCsFmt8E7qUDAN94JpIck=; b=rtmTGnCy2Qy6zwtg
	b6Qjy6p2uwc7E3pPhj57d9fo8XSyeE44IBRGhpG6nlkBCo14ugBpc8jZxhUaHlCx
	DMMNiUFYR91zF/cNqdZGR+TUmngk9AORuBWUBNqxKc4Qq0SFtwjL7fhWL8dUAbZt
	Zf4H6ZuwqQZe7oczmZXKv6k0z1AkA2hdZJ5H1aHsak6WLhwcbU25GghR54su2NQ1
	nVQmTKtUOYH8cQcAw7dVsDfrJHvDHa1bdMqO2/p79+lmMponIanIId1LHKRbY/nU
	NL//FGTRQx4d/7T2xa9NWoYqddF1fWTgu9ao97gm57bFSwRLWqvo5AvvsGC3LDNA
	Ovz4ww==
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11021112.outbound.protection.outlook.com [52.101.70.112])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qjqrc4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:24:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7eY+yHoOXL+1HTBk7e2UPCSaRAlYn025nxN/X9YTRQcUcJztkme/4fk3Sv/S0yL7kh+6t/ar4zziZnPzU1r/gy6MbcSOhyhqARidKWFM/V0fEUh0wrAkCKro/01yOXqvl0oBbJJ0eslS7JdhExyd/RMCW6l4oQJIgWdUTaSGItfhKTmU+qJjbS4qOR9+M7GOQmhiVx8WiJeHl3bDK5df2Lw8bRUHwsIW5ExSnqW8GPr6oQjrlUDwbGw76NgiW3aRC6qZoAySqJdvNbiMW1aJkyQsD9g4ViG5BRGhKIqiKY0oB6eB4G7lHeS3UUwrk4oJ7XycrSJyfbedOmCt2zjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdUuERnd+BRoNDrjq7ul1WnCsFmt8E7qUDAN94JpIck=;
 b=u9wiOTkxwPFy1r0i4sQo+7Q/gZG2b845K/lmXIEkz3SAaNaMG9akVRcuZPLHbGJyMJAL0iYRAbDF896mKBsvw6nDM11r2ZYoZQxFgE1t4spJFYxEPm0fRckZ/eqZ6wn819sA5PwvxPb5cXLd75mX2XR9V/4PS3nO0+YPkhmaGL+6wgp5l1CptMyv+CBy8DnSb0O+WDUO590owJKQ29dupH/v/T2+rt+65/5S19eYYmrN8Q/eQh7wqv+8xbfjuidBAF2Bq3SFjAkFjtr2jOHOpM9BLqGpCr99IQWdQTThHMkASYZfpIvbbJCwtXdJJMNGd/L2DyueVbmUEW4qPV3iqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdUuERnd+BRoNDrjq7ul1WnCsFmt8E7qUDAN94JpIck=;
 b=SrpamS42LRA99XJfX77lr4dKgXeauU5qOkcaubT3D8hVtVusP9SaQ6ewDC42STQqJ4I5TQWrl4wgF7GK0KN/rTZ8vfylN4Zgua+d9MNJdwPvM9XskHbjv0plbPpmwpyw3bjtGsLILlIwr/XC9reZjxf4eqEkWwpkcWBauNcDDt0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:59 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:59 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:59 +0100
Subject: [PATCH RFC 7/7] wifi: ath11k: fix endianness of QMI target CE and
 service configuration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-7-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS6P279CA0180.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:38::14) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: b6168d22-ec9a-4783-de6a-08df461ed786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|4143699003|261026121527099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZjhsbSFUi23f5wuzPsqzIoddsK+D1UCfFfOUqTZqCO2+5/1i9bv0obp4DyJAumY72sAcH/eNZGFZc5IxKih1s0r2g/ueIXvuRdiU/AniT7LkKt7/RVqrfp92wj2YfGaDEVATmwdbJihNn9FAWQuZZJW5gpD6VK3OBvv5g6rH/xLiXy0Myo/BlXiUgYrRKYm91TxQocqr0l7ppLk0Xvl0FcuKuOsmffCBk06YbJmfzgwvSEIX/ECtLsGpB+kxGVsxhQ2Zx+tA7zWPScP6mgZiplFE8MsroYA7oZNM9j3oHVXvcVugvn0NmyBi5hKQDKS7+R+5wqewmIjQQra9gtZGwFvP2/uKJq52TacJvQwxsPWIM9EGyMt/4HAo5gXi9tXKI4t+gULTOMNTD7k8wwFyQO+6chmroyk4Pp3IM5REpkdU+KrRxXjzTa0y5gzlOk+iVV+QE5P82UWrSJ23HywYs3psrheQxyR7riOgPUpqXcjj2ADgSf2WCDy8v2n3tysV5PWiRS97dh5cdVHilaLi2Q3eaWh3kA/FLvnJ9qsDiBpbzQsIgosPxryT6lLAJORTR0RMnL//CIx5DHtXTC008bcCLTXjJU8A4kwH16GnruySZg7rH0jys0cGUEDygAyRJnsf0YYGRu2D0OXQHlzWlp+beYoKdH57BBWmEzYGYAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(4143699003)(261026121527099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajVVY2QrNXRMcmkrM3QzTjlKV1RXcFdUakgzb3dWVXVNN01QeFBWRTA1dUJK?=
 =?utf-8?B?eE5OUHhHMFdtWk1ObFNEOU1Nb2NLMFRSZ2Raekl4MG5IaXNuN21uN0Z2ZEtl?=
 =?utf-8?B?cFZSTVk0VlRzdldKaVcyV1k4T054RUFWbWNOUlFuVENqeHpST2tHamg2c0Vv?=
 =?utf-8?B?bHVaZUJwK3lpVjRXYWQvdHM5WWJEUll4MlBUU0JvWmthL2g5Z3FPMXBQZ1li?=
 =?utf-8?B?RUpsMXBUb2pRMFR4empobVBFaUJHdEJ6cy9kUUVYRlluT083bU5RUndaakNM?=
 =?utf-8?B?Q01TQzRFUTAvYUJ2Yy9EUmdGV1ZsMWJaRGVWSzRySlFOZnlZc0lpWWl1UUdX?=
 =?utf-8?B?SFBMelZLcXB0Sk1qQUFKRG1YVCs5a3VFdnhwWTFUb0FMVlUwWnBDU3pKUzd6?=
 =?utf-8?B?bUt1dDRoN3ExbUJtSEhqUllTY0FlYjRvV0libDBMN2RtWkZBNlN0Um11VXBk?=
 =?utf-8?B?MVZZYVpZYnU2NURUNDFjcGpPMTlMRWY3ZkxBZEF0aTNpbU8wMEFHTWxqZno3?=
 =?utf-8?B?d2ZGZ2lGekZXL0dQRTJ0TXRkak9uWjNOM1prSDhiMjVWaDlwNlU0NDFHbVZD?=
 =?utf-8?B?MnJMSzZXcjk5Skx3NndpK0d2bk9WQlZmVytQUVFlaUZ4eWlyMlZwQmdjdjIr?=
 =?utf-8?B?QmoyUFpCM0pDekVOc2RrWUlqenNWKy9qVlhLRTVaV2loeEJjaHQ1RXN2bUw3?=
 =?utf-8?B?WUN1dk1mdkxyNEVWaGpaNTBsdnltUWZybWNRT3E0eW9aWE5CdUZvVTE2WVdu?=
 =?utf-8?B?bi9oWUdONmpSWnRCOFFuajF5b3FWbGR3V0t4d0dpazhWeEg5MEk4S096ay9C?=
 =?utf-8?B?OXpaOGlFL3dkYVE4cW8yMEVhU0pXdXVuUWdGTmFTdEhHWkw0OTZWQk94WVB6?=
 =?utf-8?B?bVQycFVIa2krRWV0K3c5SUJrY0IzbWhRUXlDUWtYS3I0U2E3Q1NsQWlicW93?=
 =?utf-8?B?WDJkK21jQXNtYkVLWU5VYW10SlF1NnJvYVRiOTlnbUVud3N3QmZjV1d2MHMz?=
 =?utf-8?B?OWNCNHdZbmFKNGR1elpzN0ZMY3J0V3lYZlZ0NnFreDBtaytzaDVNOFBFcWtO?=
 =?utf-8?B?Y0Z0TGNlR3R2NDY0ekl5M0lVSjVuVXFFUDMxZXRuNzBYNUI3OEU0ZGhpZm1y?=
 =?utf-8?B?Y0FveU1obW8zN0tLS25RYlRtYU1FWldDTGgwcGNpN3ZxMkdkYWRQWldzZ2Y5?=
 =?utf-8?B?RzBIdjRUbTM2eTJsSWVQeS9uM3ZBRGVBd1lqR2pub3d6Mld6M20vcnpic2Ny?=
 =?utf-8?B?UVJVMDA4ZTg2TWJ0aU1yQ05ZOHdURzFRd3lrUExSSlNWcXM4UGZndzRmUWxH?=
 =?utf-8?B?UDBKSmpNUzF2N3lhSEZMaGw1ak01N1Vuclk5SzJBSG1zOVRFM1dLSGVnVHc0?=
 =?utf-8?B?SnduTEY4bW9iTXlNdjcrNVpEM1BEMEQybTBUaWVXUWp0MDJRL25meU9CYTNG?=
 =?utf-8?B?bklpeUFQTUVvWWdGd1FNT2o3MmplSXFCSEV3LzFiYlpLQUhVNDkyOTNuMHRM?=
 =?utf-8?B?dW8vTFNwNWM3S2djdWw0aW9SRGpwbmV2QmxVUFF6eDBmWW81VzcrMkw0Rmww?=
 =?utf-8?B?eDhreFZyeVBGeTZCYzk4ZHdvblQzSlVPTWxFV0hCTG1RSG1RN1kxcUFrOHQ2?=
 =?utf-8?B?UldFSVdSWERzQnNLMThBaTBhcTZnSVZHZGlEUGhTSFdaMHBwTFZpQXJtTnFJ?=
 =?utf-8?B?bDJvemtsUHhPb1RkZnFWRjV2Z1RBYk0rNWd0NDd0MndnU1JXdEpuNGphNTZm?=
 =?utf-8?B?NW1pa1gyMzBsMkYvcTR0NithYmNhM3ZsOWZMV2I1RE56ckZ4MUlPUCswYXUr?=
 =?utf-8?B?cGtIdWtQT3l2d3pyM291OUw1K0cvMmZ1VVNqb0szQzVoOVVqdC9kV2VwTFI5?=
 =?utf-8?B?a2h3TmkwZUtLRXQ2L3RvVnJxYkJ6NXMrOGZwWUZzNEVWbktlbmNtSUxzWHRJ?=
 =?utf-8?B?Z0lYaWxQNXBWMlhjRzY2MmRDMm9hYmlrT0U5c29zdFRqb295YTVKdkJBUE1R?=
 =?utf-8?B?VVNnVnU0dU5IdWQ0RWYyNGJQYmhQZG1RTlB3Z2lIZnQ2c1dhRVdxRnRFcHJC?=
 =?utf-8?B?eWlYZ2dqWG5uM1VObDlKeVpheXJzTENNbHFZRTAycHlRS0txdUpiUmNMZmJy?=
 =?utf-8?B?M1NHSVZTTFpqKzFiVmRnTEwvbEp3SzFjYUJhUEN0VmhOcW1OL3NOWlFjdzIx?=
 =?utf-8?B?UVpnUW5ndFJnNStUOHFaMjdQTWdPd3RlQUhMWE0wM0RCSS9zZTZQSU1yYXRX?=
 =?utf-8?B?S1dRbUE4YzF3OXF3bUJpUnBLK0dFZ0N5d2FtcUwxVnRmUEtHNTNkdjdtcDRF?=
 =?utf-8?B?a2JZZlFyMEVCTWdPenROTjhCbk9rc1RJZHd4V3ZiZkhFcGJhajlGdz09?=
X-Exchange-RoutingPolicyChecked: JGSpIRrMbx7UiU2uEJaVuTn/yBWvKYxoYjWHJ/yySFDBovEQSF2pBuks9EZM+16XqrNJxL/m28K6+PmbYlcS3xMXqgqcvt4GnypRaRSb94IUA8a4UbZ0VlnbUeE63LupmzLbCX5qRUwwcn2seZr2IOTh3yaFylkiharwHKr9DwK0qNZm3QuJjQwfcsfM5ch2xzioksl0wVkMoUtppLzGV0L7on8wxQ4n0PIy6/FAazl09q1vcYsaJfJbNUISj9EevVAvIMbU9HkVc45CMWXd52w8Y06CvbT1hiQt+S8rH888/ErK6XOx9/3mRsnYAcuuTDYlUTbtG/qyomhBibBz5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: V9lFO7IlRWU6F75wVqXJ6XnP4LdgAW2f2o7H7Uupr90hmDDpXFb95zxZxoJ/0SP8fphdHf1MBlzxzunHXCiBWCUcVuwAxrKnvvD9TKAY/DSxK9fuD1fCOwA6YSv/QFuWmbr4QSyUP430w5GVORPKaLMnE3OSiPkpcLEvy4Gp67ncnS+BcDgN/cGXAQ5RH9EapNdkX2AjzJhThUjcaxHHVPN/ViZiWUdupshk8IqQ6dA7XrfrwZqquvPTRLQv4DmErnfz/HfIY1G2PIO7pC9XVaTs5Ur6KPMd0hqbA5mvwabYk+VSlji99mWjhCmnDRsbNGQ4jTRyz4HrTZVw+uK8ytzof0xpvLNHCv+M8bVIpRbSvNodr3l3nTc6tJfiVzIDCUtUJdkhZEUkdYRV2DT7beJcUmRCbnApzPXrluNkIHyrzeMSGkQolI8YzNt1cavmXG8121Ww88Nv8lRkx+dg7b93s41GjhizRucHPtWoC/KETcDjj+FNmqVvS/K1iGh2Mah1YYtkWa9qQwagif5QBv0ckZU6Swd6tWO0XSx9Ij2DhpCWC0jwucfg48TvvPcyG3EXhyCJdUcv/GLLst2gHNJLcO00/WdhjiaSpUjpnIWZHu6IJPJitNlggcO7xnD2
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6168d22-ec9a-4783-de6a-08df461ed786
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:59.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKwypvCIxgfNKrhi6nm+LCwBNjB1drVrwuLKVPjal7O1ixBCHW5ZNLgJDeub6jTvD0XMls61bVA2JgGAdmpmAA==
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX4/68Xx1eWPgK
 WBUvo8LfIpnGdH1GuJ7NZvzOXwvlXJ5adubl67PVkOEQtFbCxM+ZQTXzrpWNC0I9bkjPk7SH7b5
 SlquHDLbezd3SddxozeBbRkKv4nR9XQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX9LHY9u8Bk3HQ
 rBMXtKwnfzZJW2aHpu5xvFSFmOFyn4T88G/YQHX+708zYg6GX8bAYmbZf5RveWyGIA1ajo7YP1Z
 /VsaWEQRPEdir0QbY5EI1ARQoxHYG63IxvIZ7VusLRYrXXqNIxS8wtdXJkF9eIUb0sh2/86SNpR
 whyj3wf66gD112G7uO4KOG0hP638Y40z+rjhyGGXfL6P5S/xgEovaug/zPG9wz65/bOhIlAWOk4
 BY4RBTFree9CH48uAsUxT4T/GwL9d466viAk0QTMjNhfa5pyF8QUoy6tHCSv8Ac4u4Ic8vf0ik7
 olPgt6BNrUm+4XoSVE43+B1UxTAVQdIq5xdl4vGUt9/pM4l6aaO1stt4LFv/m4Df+fucs3ovtLV
 p0DSmnzvGCMlvrF8biT7MCKxqzlr/suYYP1U2HnH1nuLfoyreJ+WkmiRrPMeq5I4FeN/dkNORP9
 tjQ7rSLFn8UxbDHAqVg==
X-Authority-Analysis: v=2.4 cv=T5YZ3PKQ c=1 sm=1 tr=0 ts=6afec030 cx=c_pps
 a=N7pK7rDXVvfjO3u/5WQglg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=WQ4YJ39tjzx_Hbm9pN5v:22
 a=N9GNhs4bAAAA:8 a=g2gty-AKM3KxiX33rxwA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: 8ASx48e_L_0DOR6ko-Xf-cZgt5y4hVuF
X-Proofpoint-ORIG-GUID: 8ASx48e_L_0DOR6ko-Xf-cZgt5y4hVuF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012406_396006_60705FAB 
X-CRM114-Status: GOOD (  10.95  )
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

The target CE pipe configuration and the service to pipe mapping tables in
hw.c are stored as __le32 values. When sending the WLAN config request,
these values are copied unchanged into the QMI request structures, which
are declared as __le32 as well.

However, the QMI encoder serializes the request structures itself and
expects the elements in host byte order, converting them to little endian
on the wire. On big endian hosts the values are therefore swapped twice and
the firmware receives a wrong CE and service configuration.

Declare the QMI target CE and service pipe configuration elements as u32
and convert the table values with le32_to_cpu() when filling the request.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 24 ++++++++++++++++--------
 drivers/net/wireless/ath/ath11k/qmi.h | 16 ++++++++--------
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7dc07339b957..a379b0904794 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2718,20 +2718,28 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 	/* This is number of CE configs */
 	req->tgt_cfg_len = ab->qmi.ce_cfg.tgt_ce_len;
 	for (pipe_num = 0; pipe_num < req->tgt_cfg_len ; pipe_num++) {
-		req->tgt_cfg[pipe_num].pipe_num = ce_cfg[pipe_num].pipenum;
-		req->tgt_cfg[pipe_num].pipe_dir = ce_cfg[pipe_num].pipedir;
-		req->tgt_cfg[pipe_num].nentries = ce_cfg[pipe_num].nentries;
-		req->tgt_cfg[pipe_num].nbytes_max = ce_cfg[pipe_num].nbytes_max;
-		req->tgt_cfg[pipe_num].flags = ce_cfg[pipe_num].flags;
+		req->tgt_cfg[pipe_num].pipe_num =
+			le32_to_cpu(ce_cfg[pipe_num].pipenum);
+		req->tgt_cfg[pipe_num].pipe_dir =
+			le32_to_cpu(ce_cfg[pipe_num].pipedir);
+		req->tgt_cfg[pipe_num].nentries =
+			le32_to_cpu(ce_cfg[pipe_num].nentries);
+		req->tgt_cfg[pipe_num].nbytes_max =
+			le32_to_cpu(ce_cfg[pipe_num].nbytes_max);
+		req->tgt_cfg[pipe_num].flags =
+			le32_to_cpu(ce_cfg[pipe_num].flags);
 	}
 
 	req->svc_cfg_valid = 1;
 	/* This is number of Service/CE configs */
 	req->svc_cfg_len = ab->qmi.ce_cfg.svc_to_ce_map_len;
 	for (pipe_num = 0; pipe_num < req->svc_cfg_len; pipe_num++) {
-		req->svc_cfg[pipe_num].service_id = svc_cfg[pipe_num].service_id;
-		req->svc_cfg[pipe_num].pipe_dir = svc_cfg[pipe_num].pipedir;
-		req->svc_cfg[pipe_num].pipe_num = svc_cfg[pipe_num].pipenum;
+		req->svc_cfg[pipe_num].service_id =
+			le32_to_cpu(svc_cfg[pipe_num].service_id);
+		req->svc_cfg[pipe_num].pipe_dir =
+			le32_to_cpu(svc_cfg[pipe_num].pipedir);
+		req->svc_cfg[pipe_num].pipe_num =
+			le32_to_cpu(svc_cfg[pipe_num].pipenum);
 	}
 	req->shadow_reg_valid = 0;
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 350816c81ee5..1f799183a010 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -315,17 +315,17 @@ enum qmi_wlanfw_pipedir_enum_v01 {
 };
 
 struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01 {
-	__le32 pipe_num;
-	__le32 pipe_dir;
-	__le32 nentries;
-	__le32 nbytes_max;
-	__le32 flags;
+	u32 pipe_num;
+	u32 pipe_dir;
+	u32 nentries;
+	u32 nbytes_max;
+	u32 flags;
 };
 
 struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01 {
-	__le32 service_id;
-	__le32 pipe_dir;
-	__le32 pipe_num;
+	u32 service_id;
+	u32 pipe_dir;
+	u32 pipe_num;
 };
 
 struct qmi_wlanfw_shadow_reg_cfg_s_v01 {

-- 
2.53.0


