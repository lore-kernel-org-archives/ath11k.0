Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47B0C4345F
	for <ath11k@archiver.kernel.org>; Wed,  1 May 2024 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbOtTebtzu/cATU3j7GOnrL+wt4Ra0sZePsLBZFPSAM=; b=g0T6gPUG3znBz5Ghrd2XJ2OOoQ
	38dlqkcaM5BxhsWnA3J7+UX5qsHbcEKABGccpjUn/90LLhNH2jy+iZngqzMvmkHwLCnMGyRzvjXf+
	HPPjehq28eIIm4CV5tVL73aqkT0YlFwXk1xDgNBNXjMtFW54en5SS7dLAr3qsH5q90/GgLmyZFe4p
	1VL1tod+8owAjFP0/ntzMk5JW1kAIZBOpryBbul+UV0rAuwLMrB9z7XGGWHnIWLQCzfoi7VQg8GJE
	IocGsiwfebIPWM0HGxgdYt79AvgbDQY4imE5cd6hHfWFWppsqsm+xwqJKh/gSJ76+pBFG/r2euEj5
	Eua4dEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Cbk-0000000A6Rj-2PFh;
	Wed, 01 May 2024 16:15:00 +0000
Received: from mail-tyzapc01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:280c::801] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Cbi-0000000A6Qq-0MCb
	for ath11k@lists.infradead.org;
	Wed, 01 May 2024 16:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMEdP6v082bZTrB87E51xQnG0zZd/Fpe6QjnW+IxqCIalhDO1ca+Er5u8b5pz5Yd27/VjDyZrpWfcQnhCSRrqwiRHjPY+kNFJcSZHb6sM0ANZQbKHGZ6lz4YWcKYnVc78ggajGFzLIOYaDa3zed7Hls2OkyF2mjE6TMeT5nBHCwYQ/pXtUZsDrHsz4ur+U1WZvQofZzs+IQsBJb0isvdwWGpa09P5+PWZ2+eZ8Bvtg502CzYYW+kf6pZWycb15hfRJl0cA05YSTg8yEtTUK0ySAe7QhvwiopuiTCQ0q15+58z63YZ8SPhQ9y9KryOCFrZaiNrfrW60kaOP6jG8wtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbOtTebtzu/cATU3j7GOnrL+wt4Ra0sZePsLBZFPSAM=;
 b=Y4LPMo77ft/HeCpf1mjAMkjD6p0QgSEMWHFJi9+GYPlCtuDat15cRJA8v4Lc/2oJj8UegUIxZoqVya7lC4Dhftx8EmR+FYxvlSNwdXV8MbrqVKnM99YpbSAlKFNZetSndeTXRIscpru7RHw1f4zMNHvz6/VlxGsveG8U/OFYr2cby3yn8Naeoxz2Yhwz2vm/iE8zF0v0YRjz/2GYVurvlAauvldtCD7UlRiHt+MPHflFrT//u5t6GtYtmE+MvK27XrN5aHIUwWDTqM9PuGyjo5ZwLAUVZrk8rg1GomAX35JpwMKv+BLMp3uXoOzY6XsjtFe5X+LDFIwXl7IrWacywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbOtTebtzu/cATU3j7GOnrL+wt4Ra0sZePsLBZFPSAM=;
 b=kcSSArMFXmR5Afu97BoqcLLu8YM1lYwHWdY6Bw1zJpi6Cjp2kGe7gefc8gPBxmhb7gY0WfhLCobP8Li7xQCI+pCE0RA4+22mgpJDj85VR9qc+VomRbUvMgQXL6rYR3fiW3P+0SH4sH7xvFWRabXxU9l4QGvinLZkb1zeO8uu2KjnhhoypNKgN1uo/DReipTkGw1RVr3sIyrvmN0mbUjJEgAYSrcgezlDNpvNSnqP8wDaajTPsi9CU0XCxY2RYDkTZJ8/yHL+ZVGgh/1qOldkpAlXCn9DyoqOtJQ+YNhY4g7ByGV1W9HDgMhtQotGzGYjE1bFGUNCHTjwehXjlCQsWA==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by KL1PR01MB4861.apcprd01.prod.exchangelabs.com
 (2603:1096:820:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 16:14:48 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094%4]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 16:14:47 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: kvalo@kernel.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [PATCH] wifi: ath11k: fix remapped ce accessing issue on 64bit OS
Date: Thu,  2 May 2024 00:14:31 +0800
Message-ID: <TYZPR01MB55563B3A689D54D18179E5B4C9192@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [XtZR7T2ItLH2/vhgRbeIdkBzNBJGxOQl5AEEcc+XwbsTRErPTIfZ7Q==]
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20240501161431.1021275-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|KL1PR01MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 64080f89-70d8-4249-f575-08dc69f9d1c6
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info: ZKMLRtZJQr1bbi0ZJNBSo+VwLg1D0P9kcCQrUCHXZ7xAZAsRBf0eOGS4BDFd179ep9M0BUuTIWSGrLGd96vr1pSlcvvRFOJA1hr0fIyiP3G5miCph6UHVJ8uH05qgoIMPFMJIwlC0QMMIQZEvzet/SaexPIyGXZFJO01V93JAwjAcR0kpY/4TxTsuibjA6d1gjPdywH32B5HZ6fx/J9ce31bQi6b97QrX00bRjlZTA9Mp63ouonUmcJJz5CtRANY4jLvy0WmXJpZZ7sPImhTc5AivSnhUeKnsIO1NrRbw2CAON1/0GRIYqAlHSbQ9mLvrGaJAqMY9kmfWq7uVHDlYLeeJWvjtB6smv60QBKi08prQ952553tfOjZkDcrUhWAp+yDAVeCQbajMHJwwILbvA+RvXzTKugr10Bzh9uQnoEVhw/rmtQ4NX5XoXSDIvhRQNXqzcnDog10BoXpI8GR1dv3eQ3VauTqO1BHYrmAh0i2NmgZ1XJ2kUjFX5GAFl4ZSDZef+TILFo3m3cGXOGv50oSAG/e5KG6AX2kf6D2e8qAvW4CyYMhf6MxBGB1dDrfYFT/sTDhG9VU84lQSLtIZklvB/DmhUIrP9pqD6vUYj7v6C264blQqiwW81jW+7kY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V0PGIaAaAo5aOxC48rE1Uf0b2e5dnwsglDJWOuPYgIyCUKqtoJCc6hR5vxXA?=
 =?us-ascii?Q?tGOfzQB8BKOhIs7stmux0zADF6EbaICjQf12XQTLImWR79CL+RDsuI/UjzsY?=
 =?us-ascii?Q?P2oyGn/g62Sse733CeUasWjxlUVBv3VmhZTkmLgwAlygOcymNt8NLhGybFXF?=
 =?us-ascii?Q?lQ65rcRzJsZDU4+EO/MtDpRWhuD6naUSG1Htk/qeNYjLnH0tFHArvxqfGGLi?=
 =?us-ascii?Q?76IGIF2zzX0/E70UXfcqDmKSBx9JF64Un4WvyHgW+RJHB+IBn1KZqthbxDrg?=
 =?us-ascii?Q?dxqNjLk7FJedNI/FLeh7ZVf9A72MxszBfZaycd+JyNcsKs6FNIPbHhqkTs79?=
 =?us-ascii?Q?6SDYs1OBbzKAEXqVux6Ot/1uMB8babtquOkfdhDNXhPY4MjCwOXShqNN8i63?=
 =?us-ascii?Q?mAEIhEDt4u1KpRfBm/bw4y/Amg2LqHd8URijw/MqpeUt3BKZT54Rn+5PmIyu?=
 =?us-ascii?Q?vwb0x5AepWip+Ox0estaBr5YABJTmDC6r6ggMfhBhI9ZEj/8HE9cNBv93UjK?=
 =?us-ascii?Q?6ABJsn2QGVMp2zD6Ex239X+ic4yapxcNrQ1AA/vXeiUuzKWlJKHoyImeDknj?=
 =?us-ascii?Q?anNpvp2w6WNcOdmqmm3EN7UEOWMQbGHRdzCXCr2VVNsW7NXNBzcprIHP5lri?=
 =?us-ascii?Q?iMtOQCOKVTsNyvtZ6uiNcZnpYCbA7HHRLUs+/b8bM5GWV/dH9NEiilI9bXTg?=
 =?us-ascii?Q?eMsj4dpiSjQ1ia4VmQYXmKC55SrnzHPye/4p70UjKl6yG37nYyDMNI/bW+PN?=
 =?us-ascii?Q?wK14482NuVilN0XXc2mIAkoVMZqyRmbVNi2aZDks1cgiGRcqI/svYcZBeZpA?=
 =?us-ascii?Q?nBvVeCQEBvv2EVkc67bOnzkNpIuEeMozLMehBgb6//JRg0fXeeJSBOdtQM1J?=
 =?us-ascii?Q?i43Lrw0X5ezgphheEswRH/MtiASvz5wsOX8MS/EGFauxvjVoJNz/+BDLTs0P?=
 =?us-ascii?Q?oYTp8AAueE4pNH96LPRe6BcQDnTCqulmXHG1YEvIbNXaxs6dOnrJcHPiyPOB?=
 =?us-ascii?Q?te/lh6a+gMJgiCYOCafIxsA73n1k3PTNDkAE5aVqvUiHbgV+ctQo4Ype3RDD?=
 =?us-ascii?Q?7ENSVyjbt/o7s8x9VQpubkTfLdf1l4kiJKWDq+CtrxlQ3q+OUhNeW7IjmoAG?=
 =?us-ascii?Q?GYZ7N8HcWji5ZMILT2M1qv1rddGZKcHmJC4kMCWDmtPhEp+QGzZm2/X9l7bl?=
 =?us-ascii?Q?ZYSGfg/qclncHvoWVRK/lZGS15vQRyT0PLxaSEXbvocJlEXM4RN2YYAzQVHe?=
 =?us-ascii?Q?WDoNBJkVujhK44WNJyU9FetLHLoEqFbnSN5D5TVJEQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64080f89-70d8-4249-f575-08dc69f9d1c6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 16:14:47.1453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB4861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_091458_297644_7894990D 
X-CRM114-Status: GOOD (  13.90  )
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

On 64bit OS, when ab->mem_ce is lower than or 4G far away from ab->mem,
u32 is not enough to store the offsets, which makes ath11k_ahb_read32()
and ath11k_ahb_write32() access incorrect address and causes Data Abort
Exception.

Let's use the high bits of offsets to decide where to access, which is
similar as ath11k_pci_get_window_start() done. In the future, we can merge
these functions for unified regs accessing.

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 34 ++++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/hal.c | 17 +++++---------
 drivers/net/wireless/ath/ath11k/hw.c  | 14 +++++------
 drivers/net/wireless/ath/ath11k/hw.h  |  7 +++++-
 4 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7c0a23517949..9e59b4de93a9 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -198,12 +198,30 @@ static const struct ath11k_pci_ops ath11k_ahb_pci_ops_wcn6750 = {
 
 static inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
 {
-	return ioread32(ab->mem + offset);
+	switch (offset & ATH11K_REG_TYPE_MASK) {
+	case ATH11K_REG_TYPE_NORMAL:
+		return ioread32(ab->mem + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
+	case ATH11K_REG_TYPE_CE:
+		return ioread32(ab->mem_ce + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
+	default:
+		BUG();
+		return 0;
+	}
 }
 
 static inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
-	iowrite32(value, ab->mem + offset);
+	switch (offset & ATH11K_REG_TYPE_MASK) {
+	case ATH11K_REG_TYPE_NORMAL:
+		iowrite32(value, ab->mem + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
+		break;
+	case ATH11K_REG_TYPE_CE:
+		iowrite32(value, ab->mem_ce + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
+		break;
+	default:
+		BUG();
+		break;
+	}
 }
 
 static void ath11k_ahb_kill_tasklets(struct ath11k_base *ab)
@@ -275,9 +293,9 @@ static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 	const struct ce_ie_addr *ce_ie_addr = ab->hw_params.ce_ie_addr;
 	u32 ie1_reg_addr, ie2_reg_addr, ie3_reg_addr;
 
-	ie1_reg_addr = ce_ie_addr->ie1_reg_addr + ATH11K_CE_OFFSET(ab);
-	ie2_reg_addr = ce_ie_addr->ie2_reg_addr + ATH11K_CE_OFFSET(ab);
-	ie3_reg_addr = ce_ie_addr->ie3_reg_addr + ATH11K_CE_OFFSET(ab);
+	ie1_reg_addr = ce_ie_addr->ie1_reg_addr;
+	ie2_reg_addr = ce_ie_addr->ie2_reg_addr;
+	ie3_reg_addr = ce_ie_addr->ie3_reg_addr;
 
 	ce_attr = &ab->hw_params.host_ce_config[ce_id];
 	if (ce_attr->src_nentries)
@@ -296,9 +314,9 @@ static void ath11k_ahb_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 	const struct ce_ie_addr *ce_ie_addr = ab->hw_params.ce_ie_addr;
 	u32 ie1_reg_addr, ie2_reg_addr, ie3_reg_addr;
 
-	ie1_reg_addr = ce_ie_addr->ie1_reg_addr + ATH11K_CE_OFFSET(ab);
-	ie2_reg_addr = ce_ie_addr->ie2_reg_addr + ATH11K_CE_OFFSET(ab);
-	ie3_reg_addr = ce_ie_addr->ie3_reg_addr + ATH11K_CE_OFFSET(ab);
+	ie1_reg_addr = ce_ie_addr->ie1_reg_addr;
+	ie2_reg_addr = ce_ie_addr->ie2_reg_addr;
+	ie3_reg_addr = ce_ie_addr->ie3_reg_addr;
 
 	ce_attr = &ab->hw_params.host_ce_config[ce_id];
 	if (ce_attr->src_nentries)
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index f3d04568c221..f9ba2f821108 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1233,20 +1233,16 @@ static int ath11k_hal_srng_create_config(struct ath11k_base *ab)
 	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_TCL_REG + HAL_TCL_STATUS_RING_HP;
 
 	s = &hal->srng_config[HAL_CE_SRC];
-	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab) + HAL_CE_DST_RING_BASE_LSB +
-		ATH11K_CE_OFFSET(ab);
-	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab) + HAL_CE_DST_RING_HP +
-		ATH11K_CE_OFFSET(ab);
+	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab) + HAL_CE_DST_RING_BASE_LSB;
+	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab) + HAL_CE_DST_RING_HP;
 	s->reg_size[0] = HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(ab) -
 		HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab);
 	s->reg_size[1] = HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(ab) -
 		HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab);
 
 	s = &hal->srng_config[HAL_CE_DST];
-	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) + HAL_CE_DST_RING_BASE_LSB +
-		ATH11K_CE_OFFSET(ab);
-	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) + HAL_CE_DST_RING_HP +
-		ATH11K_CE_OFFSET(ab);
+	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) + HAL_CE_DST_RING_BASE_LSB;
+	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) + HAL_CE_DST_RING_HP;
 	s->reg_size[0] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(ab) -
 		HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab);
 	s->reg_size[1] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(ab) -
@@ -1254,9 +1250,8 @@ static int ath11k_hal_srng_create_config(struct ath11k_base *ab)
 
 	s = &hal->srng_config[HAL_CE_DST_STATUS];
 	s->reg_start[0] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) +
-		HAL_CE_DST_STATUS_RING_BASE_LSB + ATH11K_CE_OFFSET(ab);
-	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) + HAL_CE_DST_STATUS_RING_HP +
-		ATH11K_CE_OFFSET(ab);
+		HAL_CE_DST_STATUS_RING_BASE_LSB;
+	s->reg_start[1] = HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) + HAL_CE_DST_STATUS_RING_HP;
 	s->reg_size[0] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(ab) -
 		HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab);
 	s->reg_size[1] = HAL_SEQ_WCSS_UMAC_CE1_DST_REG(ab) -
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index caa6dc12a790..58f39a7eaa1c 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -2268,9 +2268,9 @@ const struct ce_ie_addr ath11k_ce_ie_addr_ipq8074 = {
 };
 
 const struct ce_ie_addr ath11k_ce_ie_addr_ipq5018 = {
-	.ie1_reg_addr = CE_HOST_IPQ5018_IE_ADDRESS - HAL_IPQ5018_CE_WFSS_REG_BASE,
-	.ie2_reg_addr = CE_HOST_IPQ5018_IE_2_ADDRESS - HAL_IPQ5018_CE_WFSS_REG_BASE,
-	.ie3_reg_addr = CE_HOST_IPQ5018_IE_3_ADDRESS - HAL_IPQ5018_CE_WFSS_REG_BASE,
+	.ie1_reg_addr = ATH11K_REG_TYPE_CE + CE_HOST_IPQ5018_IE_ADDRESS - HAL_IPQ5018_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = ATH11K_REG_TYPE_CE + CE_HOST_IPQ5018_IE_2_ADDRESS - HAL_IPQ5018_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = ATH11K_REG_TYPE_CE + CE_HOST_IPQ5018_IE_3_ADDRESS - HAL_IPQ5018_CE_WFSS_REG_BASE,
 };
 
 const struct ce_remap ath11k_ce_remap_ipq5018 = {
@@ -2801,13 +2801,13 @@ const struct ath11k_hw_regs ipq5018_regs = {
 	.hal_reo_status_hp = 0x00003070,
 
 	/* WCSS relative address */
-	.hal_seq_wcss_umac_ce0_src_reg = 0x08400000
+	.hal_seq_wcss_umac_ce0_src_reg = ATH11K_REG_TYPE_CE + 0x08400000
 		- HAL_IPQ5018_CE_WFSS_REG_BASE,
-	.hal_seq_wcss_umac_ce0_dst_reg = 0x08401000
+	.hal_seq_wcss_umac_ce0_dst_reg = ATH11K_REG_TYPE_CE + 0x08401000
 		- HAL_IPQ5018_CE_WFSS_REG_BASE,
-	.hal_seq_wcss_umac_ce1_src_reg = 0x08402000
+	.hal_seq_wcss_umac_ce1_src_reg = ATH11K_REG_TYPE_CE + 0x08402000
 		- HAL_IPQ5018_CE_WFSS_REG_BASE,
-	.hal_seq_wcss_umac_ce1_dst_reg = 0x08403000
+	.hal_seq_wcss_umac_ce1_dst_reg = ATH11K_REG_TYPE_CE + 0x08403000
 		- HAL_IPQ5018_CE_WFSS_REG_BASE,
 
 	/* WBM Idle address */
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 14ef4eb48f80..44593b38fc85 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -81,7 +81,12 @@
 #define ATH11K_M3_FILE			"m3.bin"
 #define ATH11K_REGDB_FILE_NAME		"regdb.bin"
 
-#define ATH11K_CE_OFFSET(ab)	(ab->mem_ce - ab->mem)
+#define ATH11K_REG_TYPE_MASK		GENMASK(31, 28)
+#define  ATH11K_REG_TYPE(x)		FIELD_PREP_CONST(ATH11K_REG_TYPE_MASK, x)
+#define  ATH11K_REG_TYPE_NORMAL		ATH11K_REG_TYPE(0)
+#define  ATH11K_REG_TYPE_DP		ATH11K_REG_TYPE(1)
+#define  ATH11K_REG_TYPE_CE		ATH11K_REG_TYPE(2)
+#define ATH11K_REG_OFFSET_MASK		GENMASK(27, 0)
 
 enum ath11k_hw_rate_cck {
 	ATH11K_HW_RATE_CCK_LP_11M = 0,
-- 
2.40.1


