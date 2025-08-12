Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A735C87FCB
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ZgCXMZ787UP+z3Zt+DnLJa0Ltw5qqpQxX18oS2v28c=; b=ZCiKqhy6IdvtLMnk1+va+irwDS
	8ARux8F3m5fFleisRvd+IE6F5CBMV0WFgLQ9YttmOmzyw3vBnnTi5NtAdS3tYDqnGV2BZjDaPro5H
	qGNnC12luR0l8roKAVHmbLyU71/DXg6+bEhIPuo7kzRkJ+z5EN29sctz9RmLQ8b/pU699Lm7ckb1r
	8WcoEKnGCVG8lXLfI7Ty1u0z66Ss76xjLd2TDTQBEgIhNGf9zhLJ2HTM5mXbC+rD7IKTxKlf6Xqdj
	IsFSZbHmFaDa1lddAyzbRkgDWGNmcNvCTSxCOksUGCCUBT0X/pn97nbhDc3dpFo3BTJJOaJ/xCHIm
	zcwiNUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljqX-0000000AAOQ-09l1;
	Tue, 12 Aug 2025 07:55:01 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uljou-0000000AA5U-2Zam
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 07:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/3MnTWRW+mYQofkx4qNTnCKzzY9d3UB7SKg9qiE5IIz6xEvDJvWKe28KhCIIz78Ww6L1iLx7qxP3V/9u/guomEyZvXR7kFCqBgjn7f+Ku5juJ6Sc24UTZ0mAnrORge95+h0X8YrK9s8ILXnGgW+DK9Ylx8JnHQkmNjjfuUqhiPoAQoJscOeTA9F5cIoH9k5M4shmpinCbrle8EfpE26ZFF3cBBGsxuS1ETIc0hykbIKNQeypTd4gPEpCHxgGkRrycaCnJWWEdH8AVmpPFo3OYRAJzlUP263E0YF/pf/ehXkRS5X0wGWPyrI8s7ybdzHTUVKpMjj8DbY+tdW+Xzxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZgCXMZ787UP+z3Zt+DnLJa0Ltw5qqpQxX18oS2v28c=;
 b=Rel0GcJ6EFBC4+Cus/guLviD0fIgJODcT0SuAPUAFSNCe2MRq9A1dGfph48dS1WI4wLOgpuWCLPSEI9WtEM8OKZiuJkUcRr4TXJc1PL+XJkKb6Oxbi5acLyq2sy4Iw9qrhe7Y2n7wA6Y5p8qFzVcmHYyqSOCTXEWAd/2MR+Yo3NKNzr/4W6gC5erShJJ9dHAhcN3ZtT3bouVRA91NQdvxaqb8tp/mPwFyHaFJNEARQteLxUxVhJOOR7aVWwlwcyG28+C3C24NmgTivM0y3NMuTpxs0oCAo869E5fKxtzP4JBkZeKiEw297lPwNiAlaHNobf8mHG87Apioa4pPcedYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZgCXMZ787UP+z3Zt+DnLJa0Ltw5qqpQxX18oS2v28c=;
 b=WwNbvfDUJX5hLSJluR9RlGw7NqsrhgZ8ptzvruKwVsbhkTuveEDBkEPZDDB6+5AUz7iT96RxiO2txHapogIRCrBXYd6F0eFpIWXNKYFvJ3MZXRys+26YbpiFG0zPu/YztbGUGICws9rMKt6nIJVYuCVjHxL+RAhz/t9uL7TKx28nqZwNXDb2vEeBCa9pPUS2yV8If8R1qaEyyk0Zi/j2Nh6eyLKaeATT0sBllrNM5zhimD/iOMGgAcRufdgrgfM2UehtIC3+TAiqZuHOELM8AyKCZRqcW72edxhEL20zngjuO5PJBKuRri12riC7nT9s82bKAmB6bo3QPsUflkUsgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB7263.apcprd06.prod.outlook.com (2603:1096:101:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 07:53:11 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 07:53:11 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Muna Sinada <quic_msinada@quicinc.com>,
	linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] wifi: ath11k: Remove redundant semicolons
Date: Tue, 12 Aug 2025 15:52:58 +0800
Message-Id: <20250812075259.6921-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2fc32b-943d-4b05-1a65-08ddd975486e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8TtU8NBCxb51oRxdrZRX3CjWU3p3glbEsboiwlh61CMmlHjAfV27G8MOFZcI?=
 =?us-ascii?Q?3ulgjUsAWRXp4NsrOLFHG6u0ihIkU/f1hhs1XrJXdJA2c1DIES1Ti8mJ0UMV?=
 =?us-ascii?Q?aS+omwhDSrvCszj+011wKawBZiYTCbD5uZJl6ZllvsQxkdfpK6Ut5vKNmU+b?=
 =?us-ascii?Q?Qw4LcJx5qOoJgxEiembgVDhNbXMI1WcodLCcFfphVY0OFZ5cNf/k4nLskwAd?=
 =?us-ascii?Q?X67QHqlyWMV2af1+hAJSTsU87dpFFEWF5QJTvd+E1NNOmImLprdlKg8uewI6?=
 =?us-ascii?Q?X11gQinInFAkqVH41HFuOmJBjo5da7f+pCmwIyXDYQnE8l/VmvmG22tVPkxW?=
 =?us-ascii?Q?ZhPXR4Iy0KpVxIWMNwFRHTeajB2+2zTm+RtwA5L7lqH8b0Hfj3hsf2IMFUhF?=
 =?us-ascii?Q?Y/6lHu935YpEclGHvy9zzx8iG8l+u2VLHXKHH7C7UC8s1FWY0QIYHK2anEyw?=
 =?us-ascii?Q?NXeyafgl6v8uqTV8U3FqJYlkodqohPG+9kseW7GI72m4j/Bd1RQFlzMuX4O/?=
 =?us-ascii?Q?dG8py2YGP1L3JyncyeLxu1RM0MMPANWwHDek6Zy+YWPKxr96AhQFhVkDOIhc?=
 =?us-ascii?Q?YSw4wfmE2jdbiO8h35AXETGQlDNr1TPxHzqrDAstys0Giu2PhxEyPAqu4++a?=
 =?us-ascii?Q?ARqG1dAup9hxWYvIQKDazIgKS/+lZ0ovr3uVA/0u41ZGX8PnyCii108FHckc?=
 =?us-ascii?Q?6L9QvW1lmX9Doq3rEeqjwkx+TrHDLm6xVPYQ1wxQhnQ+Y58NEWenOmBNhqBu?=
 =?us-ascii?Q?2grC/vrfUYLeux0Dc/0zgajy+Ib8pk9KhJgfElgISWG3S97ye0+hK8ltkPjJ?=
 =?us-ascii?Q?Lr6njKrQS5ZiSJ4vbWblIwT2gQSclqYRn3zPYuhU6N7c2R/Kv10YmJkttx/y?=
 =?us-ascii?Q?uSPAUx9+Mkw2KFzY/WeUFUdXYvjyHJP29koyd2GoemcU7RBA0vmqYy+D0IQf?=
 =?us-ascii?Q?hoEgV1r+uu9HKlzZ17lr3q8jyyh0o9KEUGNheX87YJEsJrf1GhdpvSNzebnb?=
 =?us-ascii?Q?N2f5I0U/PqgNzhl8Q++vlZOHrRxorntyfrLgOi249Jd8RlfN+o4jGop+jx/7?=
 =?us-ascii?Q?jgHD5or7zIRrZRXocgIYu82LpHYC3KOwlrti8A0lpXvJwXTWyY8Yvp/tigrQ?=
 =?us-ascii?Q?AjW7WNkw5OdZIhwerFqgszUOPWUHd2zBHlJLhHZaECb4S7nCR8B9F9khGgm4?=
 =?us-ascii?Q?9zAsP5kQv1bdpyScRdadGbF1sFYHLXQ55VE7pbYlrDXdF3MIIKu3QZAN95Iy?=
 =?us-ascii?Q?LIEtJPcTin+3tCFqdnT54Egf8Dz21TrMqF1snBCOeOqFtJJgK9DIzVLpjxdb?=
 =?us-ascii?Q?e4QwaowerIBIzk8Rhldrk17sSzlVFHobJ0C/XEOjmc+znYHzdh4u26P3tBAX?=
 =?us-ascii?Q?vv/+Hrm9nVee213M6Boks0DbmS2lhV3i6+lZP8djXgxhzRR1pmQhNEFaBw0h?=
 =?us-ascii?Q?ZPubEupjLRXpIh0PJW2OmSS/XyHW8VQIeXK1jD85Z4Y/zWi5BXdHmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SWjZDMF7Pc19vc8URCUraILCF1vR6dLRw17XQZnU0puuXAcG1okKxJn1sryt?=
 =?us-ascii?Q?ucyG/pBvuAM4d3BU9hivTSfoJxX0CVy8qtyqRqPuA4GFjlmhmqr9mpx4KxC0?=
 =?us-ascii?Q?qNXL3ePEEvwWrkmt6Bi7AXwu4DqGOvVaNPfkvBgbfEq8H5LhkxyAmJl4Hny2?=
 =?us-ascii?Q?JEzSK5ep0pUoKul8Rl7+QwZkGlm3kDq8Bj3PUu82mgHNa7kBrp5Lkc5q0FN2?=
 =?us-ascii?Q?ryuw+JzNMFQ536KcFAhRTL3K1LNQxagJ+WznYMML0qVacESxMVIBxNZGi3y7?=
 =?us-ascii?Q?IFxUWAzDEssqsMgv3bm9hR70oRxpejDGEZZpqjTYGVGYCQ3r/llV0uBsRs1k?=
 =?us-ascii?Q?JFmWCShJXyX++pU7FacpUqRzZgsTaFqM8RICVcOTZw3xT0x9Ksx8ZqMaFHlC?=
 =?us-ascii?Q?dFtrmFBQS2PJe3LvMeBAe+q2R1xHWqCdXXmcWwQYB0PJXKqbotGJBAdh2phJ?=
 =?us-ascii?Q?+94QgbI6KM7MWaZmAz6QoB5d3GRFPFNx4Gfq4jHTZvkgVU6CzOOrp2YIf4ff?=
 =?us-ascii?Q?dLRmp9YcicKmXVDIhEVrKhM+HUxwEue10pPUkkMRTIpN0/zX2H52xltwm64e?=
 =?us-ascii?Q?5vrNjyyA9n2YiO4s+WtuCmMQodkWHuVQoFq4VpWhab4ySZggTzTZsu6VYB0t?=
 =?us-ascii?Q?yJehTZTTVJ0hkl3/1+XQtFPhjzjUe6+bn23gFg69anfy7wZhU+gT2f6RvKzA?=
 =?us-ascii?Q?22d9GP0DwVmddNeoam7/K5zRtiyBXoPUS2FHQ+h8QPWuaQm7a1fDyEsICdcY?=
 =?us-ascii?Q?JMwHX5uIGh272yJbVk8QSZ5jKRQm4H9/c8JLyw308xg7BQW7cCIXjkYt344A?=
 =?us-ascii?Q?97m7DMO6Jmujo3wkYzUzBMcBPSp9CcgVI/SK+feh/oZoEjpPG+P/65sneW9h?=
 =?us-ascii?Q?2tKzvWTi6QcwJPiZOvdP/1Ic+hPbDtA9gqPJkXAwYoPZzAtCYwiA2/YgNgpt?=
 =?us-ascii?Q?wzX7rWZsPLppHWnrUhCRKEyV+qj9xyw2ZZEocjhrePr75j8fd4KWlgEviZGe?=
 =?us-ascii?Q?qkkfXaVyd9w4wtbcfItZNrzkq6ZOQ29okKbdJDZrIWyTFlscdYlBvppeZaNX?=
 =?us-ascii?Q?E0I/st3552dWkpw/DLl9wtW3Ya2/uTPJhlaWLpFHNFGG1fQ9oPAYhnFtZLZA?=
 =?us-ascii?Q?nrM1nq9Az9d6FGAzFHnLQMKZFbekw4WhhXWxdOPtu+s+S+9uov0U+Ye1ooO+?=
 =?us-ascii?Q?0EPXApG/ugtVx87naoK9xqukIOeBZU/gVHR0LoNmRk//iGgcbvKAiQ6EtbTw?=
 =?us-ascii?Q?HhZyvrDUCBF4ruokLT2LO4ogpXXD1ik1C4dgaLcExnPqEm8r/09u/RYuwgUS?=
 =?us-ascii?Q?S4j9YRcAOzPhPtrM7YDi8pMppbjBMYDJBIaJw+mYdO/0WAQleMJi/98D4TkO?=
 =?us-ascii?Q?zoAkG+2I+HtXlOJP0QDkrE6cBJJWKs+KCPC9c0eN3m+hm2PrK2vi6kCDfFz/?=
 =?us-ascii?Q?zaJyCYCbDam0eJGFANEVKGev6EImfA5Jn8VlVHUbmr0b2YlVQTjYoe6+RV9n?=
 =?us-ascii?Q?9uzi3zt3H04UvaI9Rt+KwuA6tMBtl9yqSr1R+fqSp/vfVjIJ9IE+xgVPYcJH?=
 =?us-ascii?Q?KF12rGN86nnO43apadYxjqN8Cryg9XWhMnpPPuRn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2fc32b-943d-4b05-1a65-08ddd975486e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 07:53:10.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kDz9QvaJ8gX17yVbT28cN3KwyR3Yod99+IYpY7umLShAZ+1o0z7pRbUxHnZqZVSg18FWSlPhxuG8IKcMJx6tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_005320_654199_851BB1ED 
X-CRM114-Status: UNSURE (   7.68  )
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

Remove unnecessary semicolons.

Fixes: d5c65159f2895 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index ffc7482c77b6..b9e976ddcbbf 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4615,7 +4615,6 @@ static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
 			      msdu_details[i].buf_addr_info.info0) == 0) {
 			msdu_desc_info = &msdu_details[i - 1].rx_msdu_info;
 			msdu_desc_info->info0 |= last;
-			;
 			break;
 		}
 		msdu_desc_info = &msdu_details[i].rx_msdu_info;
-- 
2.34.1


