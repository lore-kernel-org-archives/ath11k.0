Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A6606A333
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pstFNeQP;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=hp/+48Uf;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=LFKkZn/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0Bmgp71NLgnnd3bTOWoVyAlw6YFw8FFfsZ5hubjs1JY=; b=pstFNeQP2BOfOx5e7OlXPd1PZL
	O+NVd+ZujYjCjXbSaEuatuQegwh2T8BQ3Um4xgxfh2QF+QkmmUmtVTLkNHyy2YuDAO8u9Zt5+qeAp
	L0Tv3+9lhCHS1hUiwdp5tgr0xnjHVAAs5nc3S7vxKfPyQU18/+FeW92knhSYTsH1aS33vBkaDQWx2
	JxRsFU/CHwHudmXPREso5c2CQndw2TARuq0Of2xpzooz2tBTGx0/lh/X+s3685r+0hbLKYKCswlZv
	iJAnKZ+QEcGNutP61UeYlTK5wHXzttswzzVb3q3HckiOZyHcFI9sH/4UcA1IlzyslR3dP2MtC7szs
	aPaysadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyN0-0000000BNpa-0sWp;
	Thu, 19 Nov 2026 09:23:54 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyMv-0000000BNmS-3Md2
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:23:52 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6vbmM459417;
	Thu, 19 Nov 2026 10:23:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	0Bmgp71NLgnnd3bTOWoVyAlw6YFw8FFfsZ5hubjs1JY=; b=hp/+48UfRiEJBMDE
	NQHlQ7EejRUO9Q1kJyhxzGfFdLoMp6X9noL4ZuGkB7aDH1GosSMlkirbn1b9g/OR
	j1zXDkao6UzUklwqRqhek9QPX5dqrK/iQ9CjxwL3augdXFZbak1Q9kC5nPfxWcAP
	Hnb+JfevwrSxkpads9ErEzvi2/NhW63FLgcdUrNuBGYuQA0at4PfZt4gpR+yCKJ2
	1o+TzIaG0JS+b7jAVeJBd8SHhiNJ7NDkc0J+2WA8kEQomb8nMoIMpopLRSa5E2kM
	BYR6h2ufdvsNMXTL06ERg0TwbfzkogbyInGYUGiOF1T5dzEh69Zl/kvKj0isuxgu
	jTkJzg==
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11020112.outbound.protection.outlook.com [52.101.69.112])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qgbgdff-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:45 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvP0USB+BbgezEzkNc07uBQadRE6uOd/uOpFyJra3zp6LwCfvWDFS2S0uDsFd7SoBikcVdVxWrLDNljiSXz3FY5KU7moVgzNhwLJvIvTy/NPuD6vOjhbhqzgPL79Bfwgu0pdXiR1zP/gT6jYpY1hwEtvz3gcztpX+aL7CzX4iCRsWTIKpKbVZTjkEDnSt1+kh+lvqmf7mzcmW/+jFbHTGqUfpBoy7t+6lNRtKY9QtXWVZhy0DCRIU3U+aU+Hjp8mWfc9K3Jd2rvUAl5ijLSjG3KMEN5K1IwusNITyujCNYjimEyTcQX1SSbhD67/FXYqc43u1pRYdoYCHleio3HWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Bmgp71NLgnnd3bTOWoVyAlw6YFw8FFfsZ5hubjs1JY=;
 b=gzHR0A+1ciEPPxF87QDwwSSag6jX31oc4Hqe9tRaNbbimFhx5tBKshxdOpjFQXqBeOWCBHel+ltmS9SIxKcYSI738/B1HnYhy5JjxqQvspDIq474NRg5VYO1Vp7eRypEzYNLT+kUNVKZRkqG4yXGIA/oH/w96hLR8foeCsOi4XcgUcWTL3cnujMsaokOAYpnRfqTuo2zS19b/catuh2KQMT7JOh8f8oe7/HzBGPb9W01UoGNf1uARjCfig450uE3tGwGEI3CFDJqjOsoFginlg6wkYEjqcm0349rUfD0Ua5bZwaAMIO55R+VpzdNQXCtTMFesum37Bq8CNxDug310A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bmgp71NLgnnd3bTOWoVyAlw6YFw8FFfsZ5hubjs1JY=;
 b=LFKkZn/XBHCkok4UjQkaiPTULsW4snQSeJHKM/PElTb7BIdEvGEUJuJ454VVtsRWQHCNSPPrDYDBwkZZ2tL4l9kFyj/YSR7LMzRxcMhjED2agDQSF5O0c0brOnsJ8OLR0v/q00tTDaEVWR+UkQMV8mhV5JKPMDZHhrU+yrUFM58=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:44 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:44 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:54 +0100
Subject: [PATCH RFC 2/7] wifi: ath11k: convert HTC messages to little
 endian types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-2-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: GV3PEPF0001DBF6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::306) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 908378a4-4a3f-4986-a819-08df461ece97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|4143699003|11063799006|56012099006|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261028144727099003|261009223027099003|261009221227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7cxmnITnTClhIZyajBDfsPTTThamdZum63UCxOdYTyigaq1vupHAoOVX8jp6XtGwDGT9BUoLI4BuQbshFSMWcyCLNlgo7n8M8d+5GxVkSQvzXkbhS3V4eW0+w3v9LKIt7YxFlENXhdx/ls39CtvsXzj/j5Ub53cQTF8iNX0AKussF9+T3omWxx0kSN0xA/LSgJFOPaB6M3rGHGjgtvIpxHmH1UESppcDurbWz/vPAmrgzbIb8MMnQSDgnYXljEd4thDq3ylQ5HhPKMDRIhhtdt+54QtLhJbrqDq1tS4q2ImAeFP3uvoTqJ4Bz5E2v9W6/VZXAF58uSFluT58kzR3g/gaeK/MLHeS/Tc3Bsemxium7thYW8BZN7VoJ/euLSN2pMIrh7DGtY/UgcVlCXX7javj8BQOM8RgSpgp8ZaSuINzlHJDMfKbzlJwi+vKWgNaco/Rt1fsCzl1hvRVbHdX4hi8DdhtNn1JrgkRiuwr1wqFZvdNQccILNyWKCFmr+9CCWUF+haAMgnfH5/dHNDBZdYeMHl3n/XSUyT71XeYzZzFtJwi4qSgrviW6qGayCuW9huw9pxUnZvfMRwO5C2sJhQyXSOL1iREM7e2PumhBHREjUWwiTXR9UzD2+ZDFZrwPyG4OJH6Pl6IeqgGTttwElo91XaO4v4ejOAf7X11VxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261028144727099003)(261009223027099003)(261009221227099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVBobFo4cmU5U2svZTROZ0VsNTNVUTlqSkNmNlF3WFNvNkVjZkpYbFhyMnBM?=
 =?utf-8?B?TUpLK0ZNbDhNVXl3NVdFSVZoRUNHTG52S3R3dlphY2xpRDhTUmNocGIwNUk5?=
 =?utf-8?B?clIrZEZyQUhrK2ZzeFhLbjY3Zng5c0FQTDZ6VE03eWo3aHU0SHhNNVdIalFr?=
 =?utf-8?B?WWc0cFJyOHFrRC8ycTZWM2Z4eU4xeGVDV1JyWHZLVGFmbERJOFRMZ1FzWFRJ?=
 =?utf-8?B?MGtSRlNRcG1EQVgwU0x0UnNKbWNMcVZucWMzZzRTd0xRaTF2VGhkR01TaW9o?=
 =?utf-8?B?Y1Vna09IcjFhclJnMmlwazJmZFYrNFV6MDZVYWVmMmdWdk02Sk8rWkp6NzU0?=
 =?utf-8?B?NE9ZeG8ybXd0a2l0Q1lGMXpiMEJ6aDhudjdBZVF2bFhwdFVPRllRdllta0dT?=
 =?utf-8?B?djgwL05vT29RNnFvOVpsVk5PSzRkeEVWUExCV3Jacm9rMlY0WXNaV1lPNU1N?=
 =?utf-8?B?dldqUHdsV0FzWkRKdnAzdlhEOHh1SkV4NjN3WjNRaHdLRGd4cHNDdm5ZcVJF?=
 =?utf-8?B?YUQ4T3BxeHNxaTRGV0ZEWXpSckhqRi9BS2tuanBSWXdma3VXQ2RFMzFvMlpD?=
 =?utf-8?B?SmhUOWp4TUhiUUd3YXVaL2hSbVlUREwvVTJJU1dvNTA4aWhDaVdYM2YwTnVa?=
 =?utf-8?B?cjV2VWlOazh5Y3JnaWx4aDI5WjE4K2ZqNGJXRURpWmxBWE04SlpVQnJxSVEx?=
 =?utf-8?B?eFp5QzVSTGJhREZkMVhxRExCWktVNUEwZU1ZTGQvMzM0N3VNeUx2c085RnM4?=
 =?utf-8?B?cXJVWmJqZTZCOWt3a2k5SGV3OEtOb3pROGJ5OEdUZGtKN1RuTG54bGtvNHo2?=
 =?utf-8?B?QTJjSTRUbHU3MVhqNFc3TUhaUnBLVGtGT0lLanB5cFpTOWZjN0NEUnNLVkRY?=
 =?utf-8?B?MTFaNUJXQXc3K0Y4K2hWRGV2K2FSSmE4QktNakQ4L3J5bmlqTTJYWjZSYVhw?=
 =?utf-8?B?Z0ZLQ1VCd1NJenZ6NVkya0cwc0Z1b1ZPeXlyK21RbzVDdmNudlJ2SklSS2RK?=
 =?utf-8?B?TjhyVUhBMHJsQzRsZWZhRGNhSWg3Z3diK1k2eFdDOHlsQmoxa3UwcEpGVlEy?=
 =?utf-8?B?dUJRSE5mY1lLRkphRVVMSitLa1U5d0dhL2lxN0V2TnJId2hSS1R2bEJhdWVF?=
 =?utf-8?B?dzUyQ3I5M0sza3I3UXQvVVpUeWFHRnlmd2hxYjFkcGIrSno3S2J5cUpmWG9B?=
 =?utf-8?B?RGxVNjAzcDY4VCtyM2xVTTdIRnRKRUorbFAyZkE0cG5hNmVvQVhCQis3UUh5?=
 =?utf-8?B?ZHJ3SEZQMTc3TnpKd3lBTFViRllEbDF2UjFPNUVyblV5SEN4K1lEWXJnUHI1?=
 =?utf-8?B?U1ZjTTRaSnhwSHhVRFh1UWtmb29RNk1pTm5GZFZldnh5Q2dxb3VyMGVXd2w5?=
 =?utf-8?B?MzNZZnBDVXcwdzZ3Z2hQSlZsL1ZUT2V5dzRTbUM5RUJMa0hmVzRNUzlCejh3?=
 =?utf-8?B?RzhRRVJBSldRSm41UnJSQ2FHYk5KVWRmanhMWmdFWVJtYXBKbUxYRnpzOHQy?=
 =?utf-8?B?V3hUZWg4MUJSMGRFdTg5QVo5WnJrUHVtNm1rT1hsZ3VLbHhBSjdPUGQycDJR?=
 =?utf-8?B?alE2TXZGTDdLVThoWDV4anBMV3ZHamlCOUtOLzA5Y1JOZUtBc0xMVmF5US9K?=
 =?utf-8?B?d2tQTDZaNUswQWNiRlFoNmJ3NndQVXMzTTdDZUZkc3BQa21yblpGZ0JjMmc3?=
 =?utf-8?B?RU5sdVVVODJsUkxGWTBzd1ozUzU3dXBjdE15K3JQMTRaNmg2RWl0MWtuQmFQ?=
 =?utf-8?B?RGtnU2haN2tXNlhmbklWaTBhcnNmMit4REFjd2dHSHNESUR4NzZpOU1qOE5Q?=
 =?utf-8?B?S0pwNUdKWVd1L1V1cFNXcEp5YTROOFovTmRoVVpwVnhKbktUNC83NlB0TjN6?=
 =?utf-8?B?eElhUEVyK3E5L1BMQVcwQkw1aGZQdUlFY0YyKzBGNFFXQmgzT252YWN2YndD?=
 =?utf-8?B?T3c5Y0tQcm5mV09UYXBDYW9kZzJKOWMxWFVaT3luQWE1a2lWeVRSR1RWbG96?=
 =?utf-8?B?eWxTUkRKaVI1OHJyaUpVUm4rM0JKMDY2RnFPV3BRaWxScitYaFB4Y05CN0NF?=
 =?utf-8?B?U3RZRE9rSlpxd2xYVTg1YXlhVlk5U2pQcWpGVVVoZWtKeG0wT0ZHYXlmYml0?=
 =?utf-8?B?Tjk4VU5JSnVXREpwdFpUSStXcENJYjJKdFhMVjh0clk1MDdYY0NkanQ4Sk9O?=
 =?utf-8?B?cStkajZHZVZOL0hLZmZnS3FWSnJzM2N6ZnhtdnNFL3I3NTIxc0JadkJ4TFJT?=
 =?utf-8?B?Ukd3djdsT211NGM1ejZYMmtEVWJQdm1mSDhoU05EcWEySGJraUF6QTdzUjJ0?=
 =?utf-8?B?SFluU2NRK0tlc2JZQm1MSWtsUmNCdTdSVDBmVlgzUEsxaVNUaUljQT09?=
X-Exchange-RoutingPolicyChecked: fmHOMaEfWW8C3jXQQmayVjOa1LY6WVf16j7SDT0iEpgGhYgGcJaAVEvwxYsdua4HzktHG69RTAzu4KDnmmt5G2BblE/+qJ7SCbZIgKRzAihy0/OZrvCSORDr4bNtBUaZx5Da3xujSpl2E5gjZQnz7zY0Pd4cqdudqhx/Pwbl8yGZEaSJOe+kjxD24eFavMGfA/wYNiOItPG4s6SGmUz8h3xgD1xlPEzxTfZ+Sccotcc0xni5uEOccgpEzP9V+VZ9oYrNgL4egWiCkp0mInrxFvNrus+FdsFopEj26MwtaEM+nHS2Vu5Ly/YmrLh8U9V36SCjIP7taEAGCb5Db9eRsg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iHSQJEC7tw3EtYyR73qvttQhnSmY/axLiLi/AM10D73PzbSOrgLJDMUADAWNW/SeCsVzIuysf8ZFZMYDWBawEtMLSBlwexDaFkZU1hkneAVuNyLDjM3jbMRrZqX3SCL16cAgBZt/vAkoVupZb8oc8slLzh+sJ5F8cRemCZN7YC0Nv/X7GZ3L89r1AcTqOWl13olrp4WkwTsYjicCsqciN3/pLV3Zgiui/ga/bBtA3/3NtBJcwcFffX/eQSHlWsnlr5G6SQsbEni8xSUPZczmIWXDJcI1B2mleTew7qB9SgG33Xwky2t7VHB0lkLLeTnBVGJ0Pew3zApL9xMQImgjj43Jg/pthL8MEZUXVn565fI1WMkss9J0Sxc+wditn8FCRyj1CcCw1omqon+hn6yWLp/gQMCn/SCxcaH6Bpy3O6RZQdtKgx1sKTbjXLEW9SbaI9s2y4skCJOAB/sz4cOh1UX+NrTPhhoYATkyduaWwig6Sd94bmokIig8gVPJhN0bp+FpxvI1jJe6FMxhLKncSi3VUc0IJqVRESzHXXd+YxjVxDiJL6ktV0ml8SZJhIFl9gl/0ffTzhuJGKu8oRvOS7aIvUDcxatl7M0/c/enSt1zZtnFoKeKEPH33Z8+Bh4K
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908378a4-4a3f-4986-a819-08df461ece97
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:44.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XPWoZOr2DNuCqQKwNlI8OssSAQq2m7TKdh34RuhvPsC8L5E9Bitj0pDvrfILMjbjGNJuyNZg3EPxYTXb+m+nA==
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
X-Proofpoint-GUID: aHk0JV1ATuZD-FWmwuCZ70SxFA6eaifF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX/qedaMofVngF
 P4ANO1yzer7cYZ+WFHWqbQiAs4MYI/pQASp9sJ9sX3RgfHyHF35qew5IB8YauatWWlKAEiEiKSv
 rKSPC53zD/cK9S8l3zhNwiWVH306mCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX9LHV03rQdpFD
 lby23IRIJ1ixkvMCDOJsj4ffRsxwEA+dR7sL5QAu5XJugQRubtrBXoFv2t3jheNp1HAXNuDxaCM
 T72FXUdwGl2L8XQxwThmZU6SlneFNH5pyrTPlqVhBcMUO7H2ryB+HfdMoVxy/+qRVzy3UpwH9jd
 bTGv12AfFdJqAphu7pS5t4XnJGxEbn3d5V2iwYT1nTKnlZnmVw+QlJQ4OplIM180ScnXzEvc91+
 npjusJYJcCAvyZPx7l0pCDDncitkTyQpYFUTpi93Yu7hY+VjLDw6GXfq7LO8uDk6Rjg4+t1+8Gv
 LwXAw+HdfSI1qyXNBxGUbCIm5QcMeDFSb2oNOz/cdnzIb4aouZhpTR/WN8CYEKF2XZ4ejH8pet9
 EPVRCM8wC8SBpofla2EhK7BvWHupBjZc8cQNBAFDVqGBM92CJUbF/JEJwMpRpm+2qM0MyO/1RZA
 6M/OONdpBh46r1oNjKg==
X-Authority-Analysis: v=2.4 cv=e6KT2qp/ c=1 sm=1 tr=0 ts=6afec021 cx=c_pps
 a=Wl/vruDC58w1PVykjF/zIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=eCwy-lng9wtVnUzYFvkA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: aHk0JV1ATuZD-FWmwuCZ70SxFA6eaifF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012350_181260_4DB4B371 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

The HTC header and control messages exchanged with the firmware are defined
as little endian, but the corresponding structures use host endian u32
fields accessed with FIELD_PREP()/FIELD_GET(). On big endian hosts this
results in wrong endpoint IDs, payload lengths and message IDs, so HTC
setup with the firmware fails.

Convert the HTC structures to __le32 and use le32_encode_bits(),
le32_get_bits() and cpu_to_le32() for all accesses. Adjust the format
specifiers in the debug and warning messages accordingly, since
le32_get_bits() returns u32 instead of unsigned long.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/htc.c | 83 +++++++++++++++++++++++++++++++++++++++++------------------------------------------
 drivers/net/wireless/ath/ath11k/htc.h | 30 +++++++++++++++---------------
 2 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 07fc959ed74c..99d4dd3fc5dd 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -58,16 +58,16 @@ static void ath11k_htc_prepare_tx_skb(struct ath11k_htc_ep *ep,
 	hdr = (struct ath11k_htc_hdr *)skb->data;
 
 	memset(hdr, 0, sizeof(*hdr));
-	hdr->htc_info = FIELD_PREP(HTC_HDR_ENDPOINTID, ep->eid) |
-			FIELD_PREP(HTC_HDR_PAYLOADLEN,
-				   (skb->len - sizeof(*hdr)));
+	hdr->htc_info = le32_encode_bits(ep->eid, HTC_HDR_ENDPOINTID) |
+			le32_encode_bits((skb->len - sizeof(*hdr)),
+					 HTC_HDR_PAYLOADLEN);
 
 	if (ep->tx_credit_flow_enabled)
-		hdr->htc_info |= FIELD_PREP(HTC_HDR_FLAGS,
-					    ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE);
+		hdr->htc_info |= le32_encode_bits(ATH11K_HTC_FLAG_NEED_CREDIT_UPDATE,
+						  HTC_HDR_FLAGS);
 
 	spin_lock_bh(&ep->htc->tx_lock);
-	hdr->ctrl_info = FIELD_PREP(HTC_HDR_CONTROLBYTES1, ep->seq_no++);
+	hdr->ctrl_info = le32_encode_bits(ep->seq_no++, HTC_HDR_CONTROLBYTES1);
 	spin_unlock_bh(&ep->htc->tx_lock);
 }
 
@@ -295,7 +295,7 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	hdr = (struct ath11k_htc_hdr *)skb->data;
 	skb_pull(skb, sizeof(*hdr));
 
-	eid = FIELD_GET(HTC_HDR_ENDPOINTID, hdr->htc_info);
+	eid = le32_get_bits(hdr->htc_info, HTC_HDR_ENDPOINTID);
 
 	if (eid >= ATH11K_HTC_EP_COUNT) {
 		ath11k_warn(ab, "HTC Rx: invalid eid %d\n", eid);
@@ -304,7 +304,7 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 
 	ep = &htc->endpoint[eid];
 
-	payload_len = FIELD_GET(HTC_HDR_PAYLOADLEN, hdr->htc_info);
+	payload_len = le32_get_bits(hdr->htc_info, HTC_HDR_PAYLOADLEN);
 
 	if (payload_len + sizeof(*hdr) > ATH11K_HTC_MAX_LEN) {
 		ath11k_warn(ab, "HTC rx frame too long, len: %zu\n",
@@ -319,7 +319,7 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	}
 
 	/* get flags to check for trailer */
-	trailer_present = (FIELD_GET(HTC_HDR_FLAGS, hdr->htc_info)) &
+	trailer_present = le32_get_bits(hdr->htc_info, HTC_HDR_FLAGS) &
 			  ATH11K_HTC_FLAG_TRAILER_PRESENT;
 
 	ath11k_dbg(ab, ATH11K_DBG_HTC, "rx ep %d skb %p trailer_present %d\n",
@@ -328,7 +328,7 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	if (trailer_present) {
 		u8 *trailer;
 
-		trailer_len = FIELD_GET(HTC_HDR_CONTROLBYTES0, hdr->ctrl_info);
+		trailer_len = le32_get_bits(hdr->ctrl_info, HTC_HDR_CONTROLBYTES0);
 		min_len = sizeof(struct ath11k_htc_record_hdr);
 
 		if ((trailer_len < min_len) ||
@@ -357,7 +357,7 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 	if (eid == ATH11K_HTC_EP_0) {
 		struct ath11k_htc_msg *msg = (struct ath11k_htc_msg *)skb->data;
 
-		message_id = FIELD_GET(HTC_MSG_MESSAGEID, msg->msg_svc_id);
+		message_id = le32_get_bits(msg->msg_svc_id, HTC_MSG_MESSAGEID);
 
 		ath11k_dbg(ab, ATH11K_DBG_HTC, "rx ep %d skb %p message_id %d\n",
 			   eid, skb, message_id);
@@ -394,8 +394,8 @@ void ath11k_htc_rx_completion_handler(struct ath11k_base *ab,
 			ath11k_htc_wakeup_from_suspend(ab);
 			break;
 		default:
-			ath11k_warn(ab, "ignoring unsolicited htc ep0 event %ld\n",
-				    FIELD_GET(HTC_MSG_MESSAGEID, msg->msg_svc_id));
+			ath11k_warn(ab, "ignoring unsolicited htc ep0 event %u\n",
+				    le32_get_bits(msg->msg_svc_id, HTC_MSG_MESSAGEID));
 			break;
 		}
 		goto out;
@@ -556,10 +556,10 @@ int ath11k_htc_wait_target(struct ath11k_htc *htc)
 	}
 
 	ready = (struct ath11k_htc_ready *)htc->control_resp_buffer;
-	message_id   = FIELD_GET(HTC_MSG_MESSAGEID, ready->id_credit_count);
-	credit_count = FIELD_GET(HTC_READY_MSG_CREDITCOUNT,
-				 ready->id_credit_count);
-	credit_size  = FIELD_GET(HTC_READY_MSG_CREDITSIZE, ready->size_ep);
+	message_id   = le32_get_bits(ready->id_credit_count, HTC_MSG_MESSAGEID);
+	credit_count = le32_get_bits(ready->id_credit_count,
+				     HTC_READY_MSG_CREDITCOUNT);
+	credit_size  = le32_get_bits(ready->size_ep, HTC_READY_MSG_CREDITSIZE);
 
 	if (message_id != ATH11K_HTC_MSG_READY_ID) {
 		ath11k_warn(ab, "Invalid HTC ready msg: 0x%x\n", message_id);
@@ -635,8 +635,8 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 	memset(skb->data, 0, length);
 
 	req_msg = (struct ath11k_htc_conn_svc *)skb->data;
-	req_msg->msg_svc_id = FIELD_PREP(HTC_MSG_MESSAGEID,
-					 ATH11K_HTC_MSG_CONNECT_SERVICE_ID);
+	req_msg->msg_svc_id = le32_encode_bits(ATH11K_HTC_MSG_CONNECT_SERVICE_ID,
+					       HTC_MSG_MESSAGEID);
 
 	flags |= FIELD_PREP(ATH11K_HTC_CONN_FLAGS_RECV_ALLOC, tx_alloc);
 
@@ -653,9 +653,9 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 		disable_credit_flow_ctrl = true;
 	}
 
-	req_msg->flags_len = FIELD_PREP(HTC_SVC_MSG_CONNECTIONFLAGS, flags);
-	req_msg->msg_svc_id |= FIELD_PREP(HTC_SVC_MSG_SERVICE_ID,
-					  conn_req->service_id);
+	req_msg->flags_len = le32_encode_bits(flags, HTC_SVC_MSG_CONNECTIONFLAGS);
+	req_msg->msg_svc_id |= le32_encode_bits(conn_req->service_id,
+						HTC_SVC_MSG_SERVICE_ID);
 
 	reinit_completion(&htc->ctl_resp);
 
@@ -675,9 +675,9 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 
 	/* we controlled the buffer creation, it's aligned */
 	resp_msg = (struct ath11k_htc_conn_svc_resp *)htc->control_resp_buffer;
-	message_id = FIELD_GET(HTC_MSG_MESSAGEID, resp_msg->msg_svc_id);
-	service_id = FIELD_GET(HTC_SVC_RESP_MSG_SERVICEID,
-			       resp_msg->msg_svc_id);
+	message_id = le32_get_bits(resp_msg->msg_svc_id, HTC_MSG_MESSAGEID);
+	service_id = le32_get_bits(resp_msg->msg_svc_id,
+				   HTC_SVC_RESP_MSG_SERVICEID);
 
 	if ((message_id != ATH11K_HTC_MSG_CONNECT_SERVICE_RESP_ID) ||
 	    (htc->control_resp_len < sizeof(*resp_msg))) {
@@ -686,13 +686,13 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_HTC,
-		   "service %s connect response status 0x%lx assigned ep 0x%lx\n",
+		   "service %s connect response status 0x%x assigned ep 0x%x\n",
 		   htc_service_name(service_id),
-		   FIELD_GET(HTC_SVC_RESP_MSG_STATUS, resp_msg->flags_len),
-		   FIELD_GET(HTC_SVC_RESP_MSG_ENDPOINTID, resp_msg->flags_len));
+		   le32_get_bits(resp_msg->flags_len, HTC_SVC_RESP_MSG_STATUS),
+		   le32_get_bits(resp_msg->flags_len, HTC_SVC_RESP_MSG_ENDPOINTID));
 
-	conn_resp->connect_resp_code = FIELD_GET(HTC_SVC_RESP_MSG_STATUS,
-						 resp_msg->flags_len);
+	conn_resp->connect_resp_code = le32_get_bits(resp_msg->flags_len,
+						     HTC_SVC_RESP_MSG_STATUS);
 
 	/* check response status */
 	if (conn_resp->connect_resp_code != ATH11K_HTC_CONN_SVC_STATUS_SUCCESS) {
@@ -702,12 +702,11 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 		return -EPROTO;
 	}
 
-	assigned_eid = (enum ath11k_htc_ep_id)FIELD_GET(
-						HTC_SVC_RESP_MSG_ENDPOINTID,
-						resp_msg->flags_len);
+	assigned_eid = le32_get_bits(resp_msg->flags_len,
+				     HTC_SVC_RESP_MSG_ENDPOINTID);
 
-	max_msg_size = FIELD_GET(HTC_SVC_RESP_MSG_MAXMSGSIZE,
-				 resp_msg->flags_len);
+	max_msg_size = le32_get_bits(resp_msg->flags_len,
+				     HTC_SVC_RESP_MSG_MAXMSGSIZE);
 
 setup:
 
@@ -725,14 +724,14 @@ int ath11k_htc_connect_service(struct ath11k_htc *htc,
 
 	/* return assigned endpoint to caller */
 	conn_resp->eid = assigned_eid;
-	conn_resp->max_msg_len = FIELD_GET(HTC_SVC_RESP_MSG_MAXMSGSIZE,
-					   resp_msg->flags_len);
+	conn_resp->max_msg_len = le32_get_bits(resp_msg->flags_len,
+					       HTC_SVC_RESP_MSG_MAXMSGSIZE);
 
 	/* setup the endpoint */
 	ep->service_id = conn_req->service_id;
 	ep->max_tx_queue_depth = conn_req->max_send_queue_depth;
-	ep->max_ep_message_len = FIELD_GET(HTC_SVC_RESP_MSG_MAXMSGSIZE,
-					   resp_msg->flags_len);
+	ep->max_ep_message_len = le32_get_bits(resp_msg->flags_len,
+					       HTC_SVC_RESP_MSG_MAXMSGSIZE);
 	ep->tx_credits = tx_alloc;
 
 	/* copy all the callbacks */
@@ -775,13 +774,13 @@ int ath11k_htc_start(struct ath11k_htc *htc)
 	memset(skb->data, 0, skb->len);
 
 	msg = (struct ath11k_htc_setup_complete_extended *)skb->data;
-	msg->msg_id = FIELD_PREP(HTC_MSG_MESSAGEID,
-				 ATH11K_HTC_MSG_SETUP_COMPLETE_EX_ID);
+	msg->msg_id = le32_encode_bits(ATH11K_HTC_MSG_SETUP_COMPLETE_EX_ID,
+				       HTC_MSG_MESSAGEID);
 
 	if (ab->hw_params.credit_flow)
 		ath11k_dbg(ab, ATH11K_DBG_HTC, "using tx credit flow control\n");
 	else
-		msg->flags |= ATH11K_GLOBAL_DISABLE_CREDIT_FLOW;
+		msg->flags |= cpu_to_le32(ATH11K_GLOBAL_DISABLE_CREDIT_FLOW);
 
 	status = ath11k_htc_send(htc, ATH11K_HTC_EP_0, skb);
 	if (status) {
diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index 945c409bc08f..76a8fdb3d480 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -56,8 +56,8 @@ enum ath11k_htc_rx_flags {
 };
 
 struct ath11k_htc_hdr {
-	u32 htc_info;
-	u32 ctrl_info;
+	__le32 htc_info;
+	__le32 ctrl_info;
 } __packed __aligned(4);
 
 enum ath11k_htc_msg_id {
@@ -97,37 +97,37 @@ enum ath11k_htc_conn_svc_status {
 };
 
 struct ath11k_htc_ready {
-	u32 id_credit_count;
-	u32 size_ep;
+	__le32 id_credit_count;
+	__le32 size_ep;
 } __packed;
 
 struct ath11k_htc_ready_extended {
 	struct ath11k_htc_ready base;
-	u32 ver_bundle;
+	__le32 ver_bundle;
 } __packed;
 
 struct ath11k_htc_conn_svc {
-	u32 msg_svc_id;
-	u32 flags_len;
+	__le32 msg_svc_id;
+	__le32 flags_len;
 } __packed;
 
 struct ath11k_htc_conn_svc_resp {
-	u32 msg_svc_id;
-	u32 flags_len;
-	u32 svc_meta_pad;
+	__le32 msg_svc_id;
+	__le32 flags_len;
+	__le32 svc_meta_pad;
 } __packed;
 
 #define ATH11K_GLOBAL_DISABLE_CREDIT_FLOW BIT(1)
 
 struct ath11k_htc_setup_complete_extended {
-	u32 msg_id;
-	u32 flags;
-	u32 max_msgs_per_bundled_recv;
+	__le32 msg_id;
+	__le32 flags;
+	__le32 max_msgs_per_bundled_recv;
 } __packed;
 
 struct ath11k_htc_msg {
-	u32 msg_svc_id;
-	u32 flags_len;
+	__le32 msg_svc_id;
+	__le32 flags_len;
 } __packed __aligned(4);
 
 enum ath11k_htc_record_id {

-- 
2.53.0


