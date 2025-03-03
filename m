Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1253C282CD
	for <ath11k@archiver.kernel.org>; Mon,  3 Mar 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dDoQ4KW/NKQnkDdQmWgUQbRcWdLgMaMP+ig+9/Nn+Bo=; b=j/ZL+lnjgNIX89BVQYBAoYyZfC
	SEfxy6sDtTrRyfn+2CedftqNVk1wT5rQD1dkZUkCnfVEobso4VwDuY5b6naDCKop/+PI9qlPSUoB2
	XKaAhI4VcBlzn8OOSbHdjlFiYuABkGw3MZZC9AhzD8pGXmnkRf0nyvMxVyXN4XN9HDrjfCEnhoZ5c
	5cpHkZBq2HKD/duIVgx86zByI5CtxJKMiO9D4ETjKRP9wXJAv8BHm1+ncTbUSPr65jnvjUtulc567
	+pdkQc/T87ziXDzeRRkNrogRtLUP2jCRWK/Ef5dboGF7vmRNrGNL0FB7/N9XSTO9GezUtyimAxhEF
	IjKcXipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8JJ-00000001Qwv-1Oae;
	Mon, 03 Mar 2025 16:06:29 +0000
Received: from mail-koreacentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d40f::3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7mE-00000001KQY-3C2u
	for ath11k@lists.infradead.org;
	Mon, 03 Mar 2025 15:32:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovh00ngawho1xpJXEXYXTxhGbBUVwYrSPq43VAO/PLfDJm5d0i8ajHS4ksVFk2mo2X1+SAObbE4razHruYmjODmED6jLu2A6d6jpqhxYGmSOL76t+wvDbH39UHbSuh8n6HfphQGsAqnHbIO+G4AaZ5GQsayvOnssKSMhKJz6yGRghs4lSLmW8DzpyRP+ZfsmiYb67/lmHPvZibMAxXaKqg1TT90hFqaR/tkgDcpTtgWvg+fNGa/v20NXYw28ZMIkfJPmFiCV6P8ZIWSvGDpMwsiGnUVPZlpkY7qAFShi2Ba60AmWOAJ+bhsjLrIh9GDEIDwkmj6c4mPshRBe7H/9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDoQ4KW/NKQnkDdQmWgUQbRcWdLgMaMP+ig+9/Nn+Bo=;
 b=Q8LbcxF+ZrfizKaiRwpVA4vMlwcI6s6COUqTUtn7qfVd7+4lI9H7zSlsZ5cuef3eMgNrldmXAru4v2dd7qkqeWqB6SFxZK3fdExJw/x04WdL9DFQk2NJoFdmb1PUxIUo8MIBmlvDu9tz7ubdsjtSwk5j6T1Hu2qvEirsg8O7GO4Nis9672g8uO7fH1W9ird5lqW8vwi/l/dl061PF4lDA4lE77Kz+M1dao449FpV3vo38lugGFWj/Ou4vrpBv9opFAescl7yeD+jsmdrEoL1Ch04R+XDA9X2C4Q3M9lqZ6ERyR9zvOGnd7tXHurenYLEodBhM+O+RpVViGLXyR4/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDoQ4KW/NKQnkDdQmWgUQbRcWdLgMaMP+ig+9/Nn+Bo=;
 b=Z3zHj7fUPOPFJvKSTaBVpbYUm4ubRdkIPjOx1xNQAYz4Yx3upX0Dr10p6W0E+9ZxlyiJ/5/oPbbE1r36hBhKlXGYtPaRfm5jJw3fWPc5Sf5jQ5Gh81AYAUFtAugMUZ6LU9yTBEbFp99gOPfGRIdlztSEAUABtgne0fnNOGAhFU9V7y5+iDnIn8ElaP10fVDmYgb+nKTlteMYbx7dqx/uhJHP7uT1kxzUO0LrvwPIAUZmU1GYjA9Y0YKcapc29E2hOV7Qijw0PAszU7SDgp0c0etTy5vFbm2+QIb/juJ220cggusGIIsiqd/h8C9yLIoweDI6EshL2GYQVsZKsYIu8A==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by SEYPR01MB5766.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1af::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 15:32:06 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 15:32:05 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: johannes@sipsolutions.net
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [PATCH 1/1] wifi: ath11k: move ATH11K_FIRMWARE_MODE_OFF to ath11k_firmware_mode
Date: Mon,  3 Mar 2025 23:31:56 +0800
Message-ID: <TYZPR01MB55561DF4543A0265B47A58CDC9C92@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20250303153156.8619-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|SEYPR01MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 4534c8ad-6e12-48ac-591b-08dd5a688d8b
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|15080799006|5062599005|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IqiPK0K3r4ao15WLmWacRhJ9Q+csDYLmhdaIsaoZ2PMnQzdAa2nfqIgWZVLP?=
 =?us-ascii?Q?jGvOIYTd5V+I8zFIoSzUNb+sq4RTqqF54vEiASd8FKGEwXVFbuU4U5I8Y9Zb?=
 =?us-ascii?Q?auRR9x4g3ab7jsQMUC4nVSRy2ybMYOCTx7udOWjfDHDZY1V7Lrsz9rlzpmQR?=
 =?us-ascii?Q?eeWWlC0UNs6HVUxwtWuvLHxIEcK0nZKlLgYkmU2K9sSfd5A6/NFxDWde1boi?=
 =?us-ascii?Q?ajaB1jWto9ivOOG8cX492ciC49vYN39J3TlpkfUfnIkTBscGUDdx6SU1/re2?=
 =?us-ascii?Q?XXYWFpNlnWBU/Qw16p0hDr8E9CPibabtbNPbQ6jZK1X9h33BhhvODxdf/RQp?=
 =?us-ascii?Q?5Sv3wO8QiXaj1V7KbQc888aQFZZPTC1joR7V4kQdj1BMTRAz2XQwlgIWxsc6?=
 =?us-ascii?Q?DslOfltrIeVv7QCNT2K66bft/pZJlaGks7F///xLdFioWm7oj8WvfU2O79y5?=
 =?us-ascii?Q?S7zdqAWvfQhKZzcEhqcEBjpK4W1HmPC2yj6ZNFJU9bVXED7q1q7mpMD4A4cd?=
 =?us-ascii?Q?wy2mIuTSOb9jdRCFFtZjF0UlMQyGszgWKAKdOvYaRTq1a/mCjn011LvWZYok?=
 =?us-ascii?Q?pzv2t7I/RRjQTvWpPpAtCCYZlKpuc5itsA0jEsekkolsIZc77xBax/Ih0t+o?=
 =?us-ascii?Q?nA+2+htHW0DHU/f17J1XSIpVFqPr4DVe1QM771j1EyRMhC/NGyZHQnEgM9EE?=
 =?us-ascii?Q?AQLcIpdmM9DIp+2tyodlCZWI0NSjvKkJkoLCQB/waDRRvIZe6nx3FH2YftII?=
 =?us-ascii?Q?8C5hU4JiWHcslYuu67YPv7jCHycqibionrtaud6QZDAPSvoTjvN5Zd0GIN2f?=
 =?us-ascii?Q?RnAk3qzOEj5VxmTnRoZAO2QzDOF4S8/tQjLqvX45juyZ3bcj+uF5mNKDdpsq?=
 =?us-ascii?Q?mu+31OmNW/2q2FOhN1JONGez9ysgopxnnO45NJCSmzRd83NxzL9gtPhjJ0KK?=
 =?us-ascii?Q?dey5TgjNRhBMffL9heyV8WykwNyt2VmGpZ+7VQLKs1kZ5gSyBObi3NkU5wus?=
 =?us-ascii?Q?Q+IyRhmCuM5pw24Tqsj63nCx8vOsjwGdWNvKAHToEE62SLn5YJ2GGgloKr4a?=
 =?us-ascii?Q?zTl4EzyPtcLqmTxR+JBBUu6QBB+0n8Sh+arRrbVuqW9V+Sr1GUc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6crJc9x1TW5fQ+NqyawOBBPj9VgaUO/+LPmHfvVk7F0gc1NWm0kFeJ0vEvm3?=
 =?us-ascii?Q?+5jg36o9ftsnLvYZPCA+UtBaI/cSSZGUnMFy8zwYg/d+gFAXJKelqmWxufJ6?=
 =?us-ascii?Q?S2B3sDJ8RTsW6Tdr4QWFiE76YBpwpMzZfZC/gOso33oV2P0t9XNf7Y0p1hnq?=
 =?us-ascii?Q?JLO+dfX2/uyIG3m261SOVWrl5MDArPyk/hTxMyhimVo+lSfl6NN8PhK7GliD?=
 =?us-ascii?Q?L0mJ6ttrUwJlJQk4w3+hbI/0UZlCjkXgKn/20rPeRiKvQ6kt/YLaqSvU1JnO?=
 =?us-ascii?Q?6tgklTmJ+DGb6s9Cxjyv1FZmQzYTVb2U9hrwMgjCM3a6E1GN8kQcyExRHACN?=
 =?us-ascii?Q?l8GGp2aGA9JkPVs0+mS/GSOM8BDnQCpm+PR7zLtgc0iGjnkyVOkJA5fGjpjG?=
 =?us-ascii?Q?GegG4DiMQB4EQBhikFVHjTKCXXRjhipXYHamgzXtdR7TFrtmGyrsOryJkqvv?=
 =?us-ascii?Q?E5ID6NkKEPbTH4VMsgTnXHRGc/6cQFpIqqJW5ysdOkS8hJMmw/BMOwnlEORL?=
 =?us-ascii?Q?So1ghIMEb+IG8hR569Q3HfK2uJ2Wj5ACxxN6EbUlW/jLHg9rQ7aP9+gyuROl?=
 =?us-ascii?Q?A8IEjSHU7KCatqOPB7+GCHdk8WymOVkYKPRrQtnnRzDMPxif4S5ZWeTNqMty?=
 =?us-ascii?Q?wNFm0QaDBtrT4pQvhkuqAJfaWfFOQ+E1MeoiBhFbMoCg84XLyA0SbHERqBPz?=
 =?us-ascii?Q?J+H3xKwvg84bWhjD67dLH022m3KbPSSmpLSuh/qD+nmIvSWDyUA/VPvLwBxM?=
 =?us-ascii?Q?YHzhq+FR4HWmQGeZJnA15kmGSyMONPj31bLo6wa8ybHOTXyBgn7GoB8Sd2i+?=
 =?us-ascii?Q?KXgjjhfLjCRxbzzNScwAyMVAg8ifNYcK1+JECJV+IKLGMkG4ei5L7C7XsKaR?=
 =?us-ascii?Q?f7N4x8ttG0i6cjWSITmKqGvqKtFbFMH9TPAz5Tw5tWP8eKb/dXWw59u0kqr6?=
 =?us-ascii?Q?io5Be4WBLGlvOwMUtTeCoM5fbsVlY1QL51rve2RVc3maEAgH+pPh79BGYI23?=
 =?us-ascii?Q?p7Lizlam6mFS9dtY4Qn1Hhkx+/Fx2C0Kzp/whf5cjx0f+RnaS7x2H9dKlbWX?=
 =?us-ascii?Q?7zj2+vegyTOJD2JsdKHL+BgdmXp2TBBv+rsHtq0DLVKgsxImWTN4B2zuMkFl?=
 =?us-ascii?Q?zyil1C96UIg1QYnWuwhaW45nBGEkeULPyrWzk8KWDHGD3o/n1jsA2RRaQPVr?=
 =?us-ascii?Q?v9VRjNgZkwJfBfQqwKhxLlQW+lAScMnGQA2w/y6hbrv5cg/u07qGNxjOQ0Y?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4534c8ad-6e12-48ac-591b-08dd5a688d8b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 15:32:05.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_073218_805508_452D28B2 
X-CRM114-Status: UNSURE (   8.53  )
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

Put it together with other modes.

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
 drivers/net/wireless/ath/ath11k/core.h | 3 +++
 drivers/net/wireless/ath/ath11k/qmi.h  | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a9dc7fe7765a..bfa2e8b21b5f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -158,6 +158,9 @@ enum ath11k_firmware_mode {
 	/* factory tests etc */
 	ATH11K_FIRMWARE_MODE_FTM,
 
+	/* power off */
+	ATH11K_FIRMWARE_MODE_OFF = 4,
+
 	/* Cold boot calibration */
 	ATH11K_FIRMWARE_MODE_COLD_BOOT = 7,
 };
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7e06d100af57..5e8fd22bb9a0 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -36,7 +36,6 @@
 #define QMI_WLFW_FW_INIT_DONE_IND_V01		0x0038
 
 #define QMI_WLANFW_MAX_DATA_SIZE_V01		6144
-#define ATH11K_FIRMWARE_MODE_OFF		4
 #define ATH11K_COLD_BOOT_FW_RESET_DELAY		(60 * HZ)
 
 #define ATH11K_QMI_DEVICE_BAR_SIZE		0x200000
-- 
2.40.1


