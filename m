Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C579BC433F5
	for <ath11k@archiver.kernel.org>; Tue, 23 Nov 2021 18:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cELaAHUwr+PxS27Olv78sUIRitv/H/O0aXzfUWeiFMY=; b=eiNYfvNHdJsXYi
	688m/ayhZVhtMUi37aAc7sLHeSifNZ+5ioVEXse2bc/d1LfTMKSKmOAtnwtKBgi0a8PBeLHPNKX0F
	9HfCXQh6x5R7uw9l+FCcjwVZeamVi5gU8I5okSjomhv/N1pUx0hfdNzebES6oNUzk8/gXwauUCMmq
	xFB72Lu1tB7IjpQzZ9gQUvRy5nTMLvYYL/AWX0xvNIz7ao9LJGJYO3W6Y0RdF8kfusJsaP4GmM2XZ
	y5H8mvgjU56VGOE+Yv+hGaHEexLEEt8SKpYh15J+qsGHrybbasx/OEXSD21K5xrLfmG7+f3K24XqB
	t3qp793Maz00aMm4jNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpatw-003FfD-1d; Tue, 23 Nov 2021 18:52:20 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpatp-003FVs-Ms
 for ath11k@lists.infradead.org; Tue, 23 Nov 2021 18:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637693533; x=1669229533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RSAzOsp5INzI4dXN9ZEirn6BQ4nQckkNyomjvzka2GQ=;
 b=kymfvVYRJl9OHX9S95myMTWjOI1enGSq+1ZUYZ18YoahkKBzRYhuBUVM
 mpHkWA5F/neJSCvdrXP3WOyJPD6JGVWpOqFJ/fEUN5eRkXJSmMup+QDVf
 dKx3fIX5t7X3pQ+ZqKW4tOtqBbrdQ9LJzH4ySuj4VIM+07Qt1/7f3cJol k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Nov 2021 10:52:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 10:52:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 10:51:47 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 10:51:45 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH 13/19] ath11k: Fix RX de-fragmentation issue on WCN6750
Date: Wed, 24 Nov 2021 00:20:28 +0530
Message-ID: <1637693434-15462-14-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637693434-15462-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1637693434-15462-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_105213_814892_96B829FC 
X-CRM114-Status: GOOD (  13.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The offset of REO register where the RX fragment destination ring
is configured is different in WCN6750 as compared to WCN6855.
Due to this differnce in offsets, on WCN6750, fragment destination
ring will be configured incorrectly, leading to RX fragments not
getting delivered to the driver. Fix this by defining HW specific
offset for the REO MISC CTL register.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal.h |  2 +-
 drivers/net/wireless/ath/ath11k/hw.c  | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/hw.h  |  1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index b5be323..bd706f3 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -121,7 +121,7 @@ struct ath11k_base;
 #define HAL_REO1_DEST_RING_CTRL_IX_1		0x00000008
 #define HAL_REO1_DEST_RING_CTRL_IX_2		0x0000000c
 #define HAL_REO1_DEST_RING_CTRL_IX_3		0x00000010
-#define HAL_REO1_MISC_CTL			0x00000630
+#define HAL_REO1_MISC_CTL(ab)			ab->hw_params.regs->hal_reo1_misc_ctl
 #define HAL_REO1_RING_BASE_LSB(ab)		ab->hw_params.regs->hal_reo1_ring_base_lsb
 #define HAL_REO1_RING_BASE_MSB(ab)		ab->hw_params.regs->hal_reo1_ring_base_msb
 #define HAL_REO1_RING_ID(ab)			ab->hw_params.regs->hal_reo1_ring_id
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index a3a141b..2ec80d0 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -759,10 +759,10 @@ static void ath11k_hw_wcn6855_reo_setup(struct ath11k_base *ab)
 		FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_FLUSH_ENABLE, 1);
 	ath11k_hif_write32(ab, reo_base + HAL_REO1_GEN_ENABLE, val);
 
-	val = ath11k_hif_read32(ab, reo_base + HAL_REO1_MISC_CTL);
+	val = ath11k_hif_read32(ab, reo_base + HAL_REO1_MISC_CTL(ab));
 	val &= ~HAL_REO1_MISC_CTL_FRAGMENT_DST_RING;
 	val |= FIELD_PREP(HAL_REO1_MISC_CTL_FRAGMENT_DST_RING, HAL_SRNG_RING_ID_REO2SW1);
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_MISC_CTL, val);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_MISC_CTL(ab), val);
 
 	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_0(ab),
 			   HAL_DEFAULT_REO_TIMEOUT_USEC);
@@ -2205,6 +2205,9 @@ const struct ath11k_hw_regs wcn6855_regs = {
 
 	/* Shadow register area */
 	.hal_shadow_base_addr = 0x000008fc,
+
+	/* REO MISC CTRL */
+	.hal_reo1_misc_ctl = 0x00000630,
 };
 
 const struct ath11k_hw_regs wcn6750_regs = {
@@ -2287,6 +2290,9 @@ const struct ath11k_hw_regs wcn6750_regs = {
 
 	/* Shadow register area */
 	.hal_shadow_base_addr = 0x00000504,
+
+	/* REO MISC CTRL */
+	.hal_reo1_misc_ctl = 0x000005d8,
 };
 
 const struct ath11k_hw_hal_params ath11k_hw_hal_params_ipq8074 = {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index a4067e7..c8d5951 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -349,6 +349,7 @@ struct ath11k_hw_regs {
 	u32 pcie_pcs_osc_dtct_config_base;
 
 	u32 hal_shadow_base_addr;
+	u32 hal_reo1_misc_ctl;
 };
 
 extern const struct ath11k_hw_regs ipq8074_regs;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
