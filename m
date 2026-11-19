Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B1606A324
	for <ath11k@archiver.kernel.org>; Thu, 19 Nov 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jLSu1yv3;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.a=rsa-sha256 header.s=270620241 header.b=zAyVnWOJ;
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-beijerelectronicsab-onmicrosoft-com header.b=zWBvNRsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3KmoMr5VMrm+lj3wfLQ9diozeX4chapUHAPo7VDS6cY=; b=jLSu1yv3WTHnaNkbK+L04BqQ15
	ZB+Iz/ZA09AK3qZeEOZAcqnW9esdpc9rU1C2LqeF/t6Wnz+bGtIsQZ2rPdlOp/jtXjTdy11pyLxfn
	yPXUWgb3TH2P7REhF+JOO2e2HelHUK7qs8bxUuos3ffZDJHiK7RVLQI/7048nM6yqhSkeSmwwMpuf
	wmjeO9UXSmd713SQDg1J7OdHrI4EZjtkd2p6iBrLP8pZqzfWpNkvRF77NoNRhxN1x2iGttYh4AcPK
	KRKp5D3xJCgkGIXVUIzd/Emf+w1IUqzH0OhMVUxPdldlZWXy/27sfePP8bWt80fHm/t+V2Ayn8Jsc
	3hDIU0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyOB-0000000BOC4-2gfn;
	Thu, 19 Nov 2026 09:25:07 +0000
Received: from mx07-0057a101.pphosted.com ([205.220.184.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyN0-0000000BNp3-3YUg
	for ath11k@lists.infradead.org;
	Thu, 19 Nov 2026 09:25:06 +0000
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AJ6wHHv460507;
	Thu, 19 Nov 2026 10:23:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	3KmoMr5VMrm+lj3wfLQ9diozeX4chapUHAPo7VDS6cY=; b=zAyVnWOJ30XkVjIz
	feUqD2z37TtIRjCWixBTUglVXjLKe/nvFJKz+xRIRb0IU6tk9KpTYHcyX3vJtZVg
	QPgWzJX4i28xg4p0E4pKV0cIORWrbF33iK/jEhVj/2jXIlEXJC5UZxxLhwtwOyam
	r3Nndc3bl9uie8yoAhqDXrBZy2CFAgs4gPtvJfNk3qJOj8tmKU0ydoQN7ChXUCWw
	uPbX9qSXykPV66XFIOpOVIyCUbNM+wFAemV0CfLSlAN6h3xtuH6ML1vRtj0zNbXw
	ASZThkXoFijBWYJF0hlRl/xoG+jJ5UPy6QO9eP1847RGUkBuvwq0yzxSyzOZ+d0b
	rCn7Lg==
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11023130.outbound.protection.outlook.com [40.107.159.130])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4j1qgbgdfh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT key_exchange=secp256r1);
	Thu, 19 Nov 2026 10:23:50 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9V/EV1MnQlQAfd+K5p9Z8S8vxQsQXR25cLOIV82pwQLpCeKUjtHHHNy5jMiXUqEyBflx9MGcYEMq6di6BbWOvxdsjBg5cowacCSajxVO50fhPfVz2hPjzcLI93dV2Gx4DgxcCbKWBWWfBXC475XsfuWGnDvhutPVBYjvvaLQ1VwgWaCSPlrcboNCJxMt1YXI11yXLWxy2hyqXq2U7vtoD/Rm07SU3/moC9URu4KvhvrvOdUXKu83prP4rf3nK7J28G3tEse3NrC7PdKuv+eL5hGysL1YIfuURAo0m54RhhRM62nE5UwkEFs2psOpCs25eyjgkC9Rhv40DvJ8hYy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KmoMr5VMrm+lj3wfLQ9diozeX4chapUHAPo7VDS6cY=;
 b=O39GNB63XukKPC36Ubxm4Y2FBcdkoqtIdYaXeOqYqHJqk5zuOaJQX2ZSZ9ppQFcxhhltYj5KfF2kUT7AoenNNLEZPzVXWzVo4dcLn9kVWy82JGRq+vtK4LzbnZhoNgMEB0FrE9UHV+cr6FyKs04CZznDlIuVGk3LabmN1bpcXVTtMg61LieAPKIMGmH0sTSD+rKg4ompMyl26k9+KgiDtFA/Q+w+Z19kXy8A73gn35KmjgvRBJrFwT3XrW9oG/9+sP1ih8pWdAL3AjIxAuWERcl7ICSumy/92dTTB9JCZxFmRR65Bw8HiN9wZltJgsO4+B+HZM7mLWxMJ76IkYBNwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KmoMr5VMrm+lj3wfLQ9diozeX4chapUHAPo7VDS6cY=;
 b=zWBvNRsywYnmAWvCDO/G2cq9nGr8lnC61kYtjrHyRB/wes+FejnkdUpShmbHiOODo5/rxlN4jGY7VgrLJiWAGsa/lXQ68kE2MnViC2VNW9lKZXC3Yn7f+ZBwjmJFLAcS6gT9K4R26DCEz24stFiKVsAz5JKTp5oz+k21WSD5/wI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=westermo.com;
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e2::11)
 by PR3P192MB0893.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:23:47 +0000
Received: from DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b]) by DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 ([fe80::656d:42d4:bdce:a46b%6]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 09:23:46 +0000
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Date: Thu, 19 Nov 2026 10:17:55 +0100
Subject: [PATCH RFC 3/7] wifi: ath11k: convert HAL CE descriptors to little
 endian types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-ath11k-support-big-endian-hosts-v1-3-c82fe63f9859@westermo.com>
References: <akYnvuVkIQrPcjkO@FUE-ALEWI-WINX> <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
In-Reply-To: <20261119-ath11k-support-big-endian-hosts-v1-0-c82fe63f9859@westermo.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS6P279CA0144.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::12) To DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:5e2::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P192MB3090:EE_|PR3P192MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 7748b46c-fe12-4582-d3b4-08df461ed04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261021135927099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +Aaf7aE4dms1AqLhlJ2B71uwYZsWvm7akxlWKGSH4BkcMnmogsUPMG9o8g7faLqMIHTC9yQJF3NyCoHMDH33SnQTGquECfSbPNpFCmKK87rKrF8FdsyO8AOU5AyClpWwaUjyMkEyKSZrUy/L27E89O/sXlOJB6uLQbuXIRnneY8GgT7BZqu6tEda0jHk9J/w40M/aXxzlU0Jj4tqKtzNKmIdRE5IW9je8DoKt8SiXhhQiMqlojX8N8h9qL74kZ1jPiHsZYJrH+e/8gf/RDCGjZhhPWPX22nyehQ8SlFgXO790HxclC5PsCOI01M37cBy4ryGBXqdAwKuN1pt5aUure7MQP1YnIEd2htLCERd3xjBWYU1AUMIeDBy31nDHZb4Ox8FuNAfd2btF8Fy3LAMbmRexDKejCC/5KxO5+Gfn02ZG2eKrIDBxkFqIPlhXJxpUvPPsQSE38DItyujfbP6sB6/XlhAjZz0RsmmZtZ5Iy3Y2bATWHMbIYkb1+sjlGI9uz3WYtEm6hf+IB9SZijQy15LfMwSC2czOFgmqVNl3RubsI/dtOwy5dTs2JNqtUx1y07/GludOisyIuypq5+wTWdA93EBNY2MlwOhBx/58SisFLjX7JxZvd0jepnnu/sTt1KHAMFH8Ybq4OCCwEo52f6NVDkiSuHemUgB75WU7u0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P192MB3090.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261021135927099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNmTFg0bDdGSE1Ubnd2L3hpYkxhdnFpNWxDVkMzYkVLcS9PdklYejBVQll2?=
 =?utf-8?B?anprME9MSWJtdnc1c3Y3L20yNTFuZUV3SnhpOVJnb0N5UHJ3ZmdQVlMzNG5v?=
 =?utf-8?B?aUtnVXRjcEtPL2tQUit6aS9WbG9JNXRVOU1MSXh2ZFBQSnlYZGdqMnB6N3oy?=
 =?utf-8?B?QjdiNFQ3TUNjTGptOHVITmhnejVMRC8yS0tYMUVtSW9JSnNwNHdZdk9mNHl1?=
 =?utf-8?B?SFc1ekZhVW1PTFR3SW4yMElDRWVVUDVpU0tqeFdJZ1lBK0pwcVFnUUxVMlcx?=
 =?utf-8?B?WUJmdVQwWlAyeTFBMm9NWUtpajBwdFoxWGlPMmJ6NXkwampCSG5tR0N1RFZX?=
 =?utf-8?B?bmFTZ0ZnTDNCc00xN2xGOFJQWm9TVjBSTUhsb2ROSGg3Q3AyYWRWdGd5MWY2?=
 =?utf-8?B?TngyRDk3b1Nnb016RWlaS3VLYzN6Y05YdytBQWl0QzdRc1lmbXF5azJmVUpu?=
 =?utf-8?B?T0FTV3dFdXlwTnVjVFVqNnZOZGpCZVpFNnE4d1BDQXp1N1FPdEZaVHExTTJK?=
 =?utf-8?B?ZUV2ZGNnRDAyVUF6YUV3Q2hYUWt3NWVkaFdYR1crWUZoR2wvQ1ZKVDdBcHJ4?=
 =?utf-8?B?cUhEdW5VclJEYzJ6SGVwYXRqYngrMTl4SDdOM0g4NU11b09pVGxicU54aFZW?=
 =?utf-8?B?ZnIzTTZXU1RuUVF0ZytlWkxneHI1YnNkZ1lUWlpJbzFGVTdBRk9PS01hOWtN?=
 =?utf-8?B?TTJwYm5QUU1ZRDJwQlN2Vm91OGVUcTF4SGE2VTRGbHJyc1pnZ25idHpERkJH?=
 =?utf-8?B?SCtTazJ5bDRCTEFZakJvS1M3ZW9pOS9rWXlwdUprUHljNW5jZlVmLy9LT25H?=
 =?utf-8?B?djk1NkV0Y1Vrck40M0NXV1c5bUNIM0xpYTd1a2llS2RKN3I2VklQWnRzb1B2?=
 =?utf-8?B?eXdkREJhZU1GK25YRTV6bjNrRWR2S2oyNDdhalJ1R3BtaXNKK0lJYlRsL2xm?=
 =?utf-8?B?MHZhTGVwVzEvSGJ6MTdrUTMzc3JJM0xGQXpmQkNBamxsbXF6ZFlwODhENXFD?=
 =?utf-8?B?TzhmWTR6MHhxc0xzaWtnZ09kYjBwMG1oSDJTYlFaZWZBcnhhTU1yeHZnK1Zv?=
 =?utf-8?B?eURHeFVKN1c5c2doTGNBMEZEdkJYRTlhSVZPWHc0N3ZvZGd4WWhFSnRKcE9Y?=
 =?utf-8?B?VHVaQ3BSZDl4YzFtWC9wYTFxVkczNjBzSjUrVnhlZDNlcGgrNjU1RG5WR2hq?=
 =?utf-8?B?VWNsaWJtRFJJYzVKbThOVkJNY0NBSHVmQ3BMMHFpSGQraU9OU2ZGWi8xdVpQ?=
 =?utf-8?B?bmo0Q2xEYTdOd3QxTVUzbTlDSmxXajdwT3Rta2N3N2V5cTRSWEJPUVBRNXly?=
 =?utf-8?B?RncxRFYrR2F2MTFuMHd5dHM1cStYQktxUEpCL2l5YU1ZS1hKa054SGRiTmhU?=
 =?utf-8?B?ZTcyc0c2dnNHYjkwQXU5MmsveFBLYWZNWW5BRFkwb3BOWUMyR3V1RzJlOS9y?=
 =?utf-8?B?MHFxeG8vMVVJVUx3ZS96SGZ0ajNsaDZQN0JGNEFGRHFLWkFucFJCdmErNENS?=
 =?utf-8?B?Ulo5ZzdnTCszVk4wMTlpOGc3SEpvTHBQYjdIdVoxRFRxYjZJRjZac1UyUUcv?=
 =?utf-8?B?Zmp2VTdTV3ZZbGVNU1JhanQwZzNqSEVMem95OGNlKzhsbGg2ZHhnTEg0Uy9S?=
 =?utf-8?B?UThZeUsvelFSUEthRVRkaTdLR1pYM016eWg0RjRQYUlXdjVCRkJVTVNiKzJH?=
 =?utf-8?B?aFkwMjBseTBRdW9uYitpTnlLOHhnSWlyOTh2ZE5WbVJlNG1lNGUveDRCbDIy?=
 =?utf-8?B?SUN6Ulo3WEJFWnMvZURLcCtGeXFsdTQ5ZThxZm1WVFU5VndOVytnQ3FMRHZw?=
 =?utf-8?B?c3Y3ekNZRnBFUjZ1dkJvV3RjbXhwRTgwYy9OYlZlYWwyb2E3S1p1SVV0SkdW?=
 =?utf-8?B?RGFnK2FtOWMrVW14Zzd5dU80Vmh5TVU0VXZXZHRKYjZFSUhhWDhxRU1kalk1?=
 =?utf-8?B?K1ZPRzlPajFhOE9BTmcyVW5lVlNRdnJSRTdqY2liZE42bkRqbFN2azRwTlFn?=
 =?utf-8?B?QU9MNDZPUGsvUUN6K0pzK3QvYU13VDEyN01aZ2JzL2VYaG52aS81V3FCbEYz?=
 =?utf-8?B?YkE0MEx4N3MwdVVFOUhEZmRHeGxVUzJXMTRVTjlmZWJMckQ2K0NTbkZGd0dn?=
 =?utf-8?B?dVh1ZGtVQnRwTFV2em5TSHJUSTJyQjR0cHpsZEc0WXFmU0M3NUZ1ZlZ4THVB?=
 =?utf-8?B?NGhxN2V6VzYwNVZUNEpnOWlxWkJudzV0dTJ1eTBXaCtyNTBsZklUeVBuaXVz?=
 =?utf-8?B?ZEJsVDJUaDIyTDdScVBjM2JoeVFZNFo3NDBLeVoyK1Y5bSs3Mm0vcWtGNmRl?=
 =?utf-8?B?cjdaRmhjcFMwM0oyK0xMMmNCZ05wV2svY3NWSVErbXROdGNWVXh3dz09?=
X-Exchange-RoutingPolicyChecked: bOGkpbMo+FD9y72OhNK3tokR3e4Nq/UHMVv27NWFIRgTwRHNvHZAvK9zxnB27x/wUnAL+YAfNu2Ow5fYxagVWuz8iMVcvnl7/gY3/fLS4L0gA/fCPOp9kZo+ZIV3d9UNp/3T8sIN2RIPPlsdl2pfQPXhJFkmgN1wyYx2NCp2w3qF0bMwd+Ar/VySZASdOMgq8d9dkC55hSHSk7mnlI1VQXNNy/CMatnPUpOmJd5Z2EuHlvrzeRmR1Wt9jxE2T5ma/oa0exXeRadnPFFlHY1pyPbHU4lWpyHqD21+HvILYvX7WbWA0W9tzapn92qWn69oT8PwZnbPvAjJLUJY/Hzrgg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hwTSqANZrXCVsWbmt06VXJy0WmmjKgwFF+hvOavi7exOpXKDh6qN2vn9dOPaDcscg5fHvmffN+N/NhAquO8zv5ZP/sZMbbdXo0/+1i5GkxyucyQQRzhYJllt2aAX7X0P7z4XhiVTifwvP6Me70a9JxS+YOehvx7sHWXVLZ1gEHUtlxKQTCdEdP27tTXctEErHhNRw9TUh09nHxbZJzObpC8yZUsM4iOPGuDr2HkmwuzeX5zDmoiR6h4ME+6SYfBoIEbkd5wt1BVMMs+QFPXzLhROxeeNCY6jm1DkbJ/li1i6RqtmcUyIZJbtqJiURDd3wix0fm/18+pHj/mDAfLCsTVgXKdmJrZ6JJ4k2QEGf76YRna4cKYik2jg1ix6ySuGe76uT2lCW89h6+4GCXq8o9aY7/1bByloDi/OoQ2Pvoq1GwigHtmpfYa+I/KWc1DqXFClOBOQmCPmsIEUdNgrAZsFlTjgDKjbsd7/a2g2sW/+2+G+PnY6C1gQBaBsGZCJDXZo7YvE+RSLm0gX3P8I2N6RL0EtQ68WynlDOjq+f4i7C1521blwqisoNBVhLYK3JGIUtEoQokdiMFqqmn7lXE2CIjILjWrO3ff/H9X28wzI42KojNl8bRYWcUEui9p3
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7748b46c-fe12-4582-d3b4-08df461ed04c
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB3090.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:23:46.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0jDLBduIl9aA5CGocLkJTDAGW8/xklyk9XLmVNI8t0rL5hUq6ZBdWF28qpPZyIEiN5J1X3+GE8G0DljS7Nj1g==
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
X-Proofpoint-GUID: XFGyx-yr5zyH9Q_jL3x59h1iiNerCRUk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX5Yd8N+hkzmK6
 wkgjUceGKXTQVscjF4DP+8EqmfsKUwOlGacFghvWsVBgpkRu0LenKeCG5YSRW2sPRWKK5Ck/opd
 T7Zyjpic3GyySzYhtBFwFp3txSk1dQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX0E5EUDyYkXcW
 bgjsHss808mfAYP1PlU1ifLrLOpZpoKkfPjGu7d0pAiLKLlLhdT0eckcJtcR/wu3CldlAGsSSkq
 dAOu+UoH7NA5u6Oo93O+VUkgH+jovfKTlfjwQxdyRPvSJTETUh3xVOtEDvvVcBEYxn7Pfx4ho15
 NtXb1UjcrS8vk8ipZLTjhnxDv8oMTXFa/cUl6SiTWjvxk4PAHqyJdLZmzkYvqP6KF390vkpZV3w
 V1Sas3q721zUhEi+lcgnATnjmcFnG180qhxTUgWRUx9IM6Qyt8/lXtMBes5aWSqqfe6+JeUsHiH
 7NyzeRFmfDMElD/aqXAb/0pvUQAfBWOXUKLl63UnRl3KT4/zNdMWdD6bE28O8E4khL3ioZoVMlf
 b9njxP+jV2Fs/txIji0lwUyyJd6q2plAJK7rHnytiGYy7wv4QBRlea9Crd8oOthakHn7NHtzyo7
 G1KUv61PvtuGvRjQ3Dg==
X-Authority-Analysis: v=2.4 cv=e6KT2qp/ c=1 sm=1 tr=0 ts=6afec026 cx=c_pps
 a=39RDZMm4Dcyx5Q+ex0xpLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tr3XZvuDWTETL0Uaxejn:22 a=8ys4xmT3Mru1TjC2zVq1:22
 a=N9GNhs4bAAAA:8 a=Fcvcvy57vIv4vxiygTkA:9 a=QEXdDO2ut3YA:10
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: XFGyx-yr5zyH9Q_jL3x59h1iiNerCRUk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_012355_202332_FF4A2E1E 
X-CRM114-Status: GOOD (  10.06  )
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

The copy engine source, destination and destination status ring descriptors
are read and written by the hardware in little endian byte order. However,
the corresponding structures use host endian u32 fields accessed with
FIELD_PREP()/FIELD_GET(). On big endian hosts this programs wrong buffer
addresses and lengths into the CE rings and misinterprets the received
length, breaking all host/firmware communication.

Convert the HAL CE descriptor structures to __le32 and use cpu_to_le32(),
le32_encode_bits() and le32_get_bits() for all accesses.

Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
---
 drivers/net/wireless/ath/ath11k/hal.c      | 26 +++++++++++++-------------
 drivers/net/wireless/ath/ath11k/hal_desc.h | 20 ++++++++++----------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 98bd9e3f0aae..a25f7bf57c07 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -574,25 +574,25 @@ void ath11k_hal_ce_src_set_desc(void *buf, dma_addr_t paddr, u32 len, u32 id,
 {
 	struct hal_ce_srng_src_desc *desc = buf;
 
-	desc->buffer_addr_low = paddr & HAL_ADDR_LSB_REG_MASK;
+	desc->buffer_addr_low = cpu_to_le32(paddr & HAL_ADDR_LSB_REG_MASK);
 	desc->buffer_addr_info =
-		FIELD_PREP(HAL_CE_SRC_DESC_ADDR_INFO_ADDR_HI,
-			   ((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT)) |
-		FIELD_PREP(HAL_CE_SRC_DESC_ADDR_INFO_BYTE_SWAP,
-			   byte_swap_data) |
-		FIELD_PREP(HAL_CE_SRC_DESC_ADDR_INFO_GATHER, 0) |
-		FIELD_PREP(HAL_CE_SRC_DESC_ADDR_INFO_LEN, len);
-	desc->meta_info = FIELD_PREP(HAL_CE_SRC_DESC_META_INFO_DATA, id);
+		le32_encode_bits(((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT),
+				 HAL_CE_SRC_DESC_ADDR_INFO_ADDR_HI) |
+		le32_encode_bits(byte_swap_data,
+				 HAL_CE_SRC_DESC_ADDR_INFO_BYTE_SWAP) |
+		le32_encode_bits(0, HAL_CE_SRC_DESC_ADDR_INFO_GATHER) |
+		le32_encode_bits(len, HAL_CE_SRC_DESC_ADDR_INFO_LEN);
+	desc->meta_info = le32_encode_bits(id, HAL_CE_SRC_DESC_META_INFO_DATA);
 }
 
 void ath11k_hal_ce_dst_set_desc(void *buf, dma_addr_t paddr)
 {
 	struct hal_ce_srng_dest_desc *desc = buf;
 
-	desc->buffer_addr_low = paddr & HAL_ADDR_LSB_REG_MASK;
+	desc->buffer_addr_low = cpu_to_le32(paddr & HAL_ADDR_LSB_REG_MASK);
 	desc->buffer_addr_info =
-		FIELD_PREP(HAL_CE_DEST_DESC_ADDR_INFO_ADDR_HI,
-			   ((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT));
+		le32_encode_bits(((u64)paddr >> HAL_ADDR_MSB_REG_SHIFT),
+				 HAL_CE_DEST_DESC_ADDR_INFO_ADDR_HI);
 }
 
 u32 ath11k_hal_ce_dst_status_get_length(void *buf)
@@ -600,8 +600,8 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 	struct hal_ce_srng_dst_status_desc *desc = buf;
 	u32 len;
 
-	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
-	desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
+	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
+	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
 
 	return len;
 }
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index c8b01f6921c0..65529451425d 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -1310,10 +1310,10 @@ struct hal_tcl_status_ring {
 #define HAL_CE_SRC_DESC_FLAGS_LOOP_CNT		HAL_SRNG_DESC_LOOP_CNT
 
 struct hal_ce_srng_src_desc {
-	u32 buffer_addr_low;
-	u32 buffer_addr_info; /* %HAL_CE_SRC_DESC_ADDR_INFO_ */
-	u32 meta_info; /* %HAL_CE_SRC_DESC_META_INFO_ */
-	u32 flags; /* %HAL_CE_SRC_DESC_FLAGS_ */
+	__le32 buffer_addr_low;
+	__le32 buffer_addr_info; /* %HAL_CE_SRC_DESC_ADDR_INFO_ */
+	__le32 meta_info; /* %HAL_CE_SRC_DESC_META_INFO_ */
+	__le32 flags; /* %HAL_CE_SRC_DESC_FLAGS_ */
 } __packed;
 
 /*
@@ -1399,8 +1399,8 @@ struct hal_ce_srng_src_desc {
 #define HAL_CE_DEST_DESC_ADDR_INFO_LOOP_CNT		HAL_SRNG_DESC_LOOP_CNT
 
 struct hal_ce_srng_dest_desc {
-	u32 buffer_addr_low;
-	u32 buffer_addr_info; /* %HAL_CE_DEST_DESC_ADDR_INFO_ */
+	__le32 buffer_addr_low;
+	__le32 buffer_addr_info; /* %HAL_CE_DEST_DESC_ADDR_INFO_ */
 } __packed;
 
 /* hal_ce_srng_dest_desc
@@ -1454,10 +1454,10 @@ struct hal_ce_srng_dest_desc {
 #define HAL_CE_DST_STATUS_DESC_META_INFO_LOOP_CNT	HAL_SRNG_DESC_LOOP_CNT
 
 struct hal_ce_srng_dst_status_desc {
-	u32 flags; /* %HAL_CE_DST_STATUS_DESC_FLAGS_ */
-	u32 toeplitz_hash0;
-	u32 toeplitz_hash1;
-	u32 meta_info; /* HAL_CE_DST_STATUS_DESC_META_INFO_ */
+	__le32 flags; /* %HAL_CE_DST_STATUS_DESC_FLAGS_ */
+	__le32 toeplitz_hash0;
+	__le32 toeplitz_hash1;
+	__le32 meta_info; /* HAL_CE_DST_STATUS_DESC_META_INFO_ */
 } __packed;
 
 /* hal_ce_srng_dst_status_desc

-- 
2.53.0


