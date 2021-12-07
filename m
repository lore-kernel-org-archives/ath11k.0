Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A28CC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jIFVw9EvFzHNhVhV+OuxKhLPwqPste6FeIoqmQ+MAM=; b=0ot9clZNO3ytl2
	PnUOPkbciP3dYJ4whZj/dV7Yo1exN+TKU1ROGRwi7ctlIavQAVP+BDWIFr4yj3p7VH1Bm3yR1mhJt
	DHbs5SbC4e5PT7hcnLukAslSJK07VUsWMxIYEy0X5uhNI02ZlMv1OkdUPP/a+1ZKGDMrqqVPazyKg
	OgVmim9JlNOLlAcAYuqpdPObHon1V1CTX5dRyK1PRzEEfNjSBPRM+h8qVDhQgKa1PxzLfJlUWZdnk
	PuEQX87iwr+Nl5Iv6ZzEeA4NxVgXAGThy8xtdcx1X6hIze1ljHwmJu86XwNmaTzh6mov0xYfg4M9O
	KqJljTV4GDFYnAz0l/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mua0d-008ZE8-PY; Tue, 07 Dec 2021 12:55:51 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mua01-008Yyo-4W
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 12:55:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638881713; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WEJ0/ZFtyQS3WqQORa4Z21qWdgkBHxpeHse109EMgLc=;
 b=OYTAY5k/GpSTYn6sF/NV/LYn45gEl1xQ+jJNYsbYnirAaVhAU1aSRt5WpaNFGvyPU8c15GZC
 uQnovmvD1KfI6VnFelSQSugSQotJtrPKo3I1HToQxf/Uk7HYseImSRPPTiTaONeV0paj0JU9
 CjEJL2et3Xf/Bmvj6N4yH1b83Ck=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61af59b0642caac3180a1317 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Dec 2021 12:55:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 83ED0C4360D; Tue,  7 Dec 2021 12:55:11 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D5ECC43618;
 Tue,  7 Dec 2021 12:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5D5ECC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v2 2/3] ath11k: add software monitor ring descriptor for full
 monitor
Date: Tue,  7 Dec 2021 18:24:54 +0530
Message-Id: <1638881695-22155-3-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638881695-22155-1-git-send-email-akolli@codeaurora.org>
References: <1638881695-22155-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_045513_270222_0B0D217A 
X-CRM114-Status: GOOD (  11.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In full monitor mode, monitor destination ring is read in
software monitor ring descriptor format instead of
reo_entrance_ring format. Add new sw_mon_ring descriptor.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_desc.h | 19 +++++++++++++
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 44 ++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hal_rx.h   | 17 ++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index 00b595b84939..406767672844 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -858,6 +858,25 @@ struct hal_reo_entrance_ring {
  *		this ring has looped around the ring.
  */
 
+#define HAL_SW_MON_RING_INFO0_RXDMA_PUSH_REASON	GENMASK(1, 0)
+#define HAL_SW_MON_RING_INFO0_RXDMA_ERROR_CODE	GENMASK(6, 2)
+#define HAL_SW_MON_RING_INFO0_MPDU_FRAG_NUMBER	GENMASK(10, 7)
+#define HAL_SW_MON_RING_INFO0_FRAMELESS_BAR	BIT(11)
+#define HAL_SW_MON_RING_INFO0_STATUS_BUF_CNT	GENMASK(15, 12)
+#define HAL_SW_MON_RING_INFO0_END_OF_PPDU	BIT(16)
+
+#define HAL_SW_MON_RING_INFO1_PHY_PPDU_ID	GENMASK(15, 0)
+#define HAL_SW_MON_RING_INFO1_RING_ID		GENMASK(27, 20)
+#define HAL_SW_MON_RING_INFO1_LOOPING_COUNT	GENMASK(31, 28)
+
+struct hal_sw_monitor_ring {
+	struct ath11k_buffer_addr buf_addr_info;
+	struct rx_mpdu_desc rx_mpdu_info;
+	struct ath11k_buffer_addr status_buf_addr_info;
+	u32 info0;
+	u32 info1;
+} __packed;
+
 #define HAL_REO_CMD_HDR_INFO0_CMD_NUMBER	GENMASK(15, 0)
 #define HAL_REO_CMD_HDR_INFO0_STATUS_REQUIRED	BIT(16)
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 0e43e215c10a..1e279e99baa8 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1185,3 +1185,47 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc, dma_addr_t *paddr,
 
 	*pp_buf_addr = (void *)buf_addr_info;
 }
+
+void
+ath11k_hal_rx_sw_mon_ring_buf_paddr_get(void *rx_desc,
+					struct hal_sw_mon_ring_entries *sw_mon_entries)
+{
+	struct hal_sw_monitor_ring *sw_mon_ring = rx_desc;
+	struct ath11k_buffer_addr *buf_addr_info;
+	struct ath11k_buffer_addr *status_buf_addr_info;
+	struct rx_mpdu_desc *rx_mpdu_desc_info_details;
+
+	rx_mpdu_desc_info_details = &sw_mon_ring->rx_mpdu_info;
+
+	sw_mon_entries->msdu_cnt = FIELD_GET(RX_MPDU_DESC_INFO0_MSDU_COUNT,
+					     rx_mpdu_desc_info_details->info0);
+
+	buf_addr_info = &sw_mon_ring->buf_addr_info;
+	status_buf_addr_info = &sw_mon_ring->status_buf_addr_info;
+
+	sw_mon_entries->mon_dst_paddr = (((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
+					buf_addr_info->info1)) << 32) |
+					FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
+						  buf_addr_info->info0);
+
+	sw_mon_entries->mon_status_paddr =
+			(((u64)FIELD_GET(BUFFER_ADDR_INFO1_ADDR,
+					 status_buf_addr_info->info1)) << 32) |
+				FIELD_GET(BUFFER_ADDR_INFO0_ADDR,
+					  status_buf_addr_info->info0);
+
+	sw_mon_entries->mon_dst_sw_cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+						      buf_addr_info->info1);
+
+	sw_mon_entries->mon_status_sw_cookie = FIELD_GET(BUFFER_ADDR_INFO1_SW_COOKIE,
+							 status_buf_addr_info->info1);
+
+	sw_mon_entries->status_buf_count = FIELD_GET(HAL_SW_MON_RING_INFO0_STATUS_BUF_CNT,
+						     sw_mon_ring->info0);
+
+	sw_mon_entries->dst_buf_addr_info = buf_addr_info;
+	sw_mon_entries->status_buf_addr_info = status_buf_addr_info;
+
+	sw_mon_entries->ppdu_id =
+		FIELD_GET(HAL_SW_MON_RING_INFO1_PHY_PPDU_ID, sw_mon_ring->info1);
+}
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 0f1f04b812b9..8db420ef6351 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -77,6 +77,20 @@ enum hal_rx_mon_status {
 	HAL_RX_MON_STATUS_BUF_DONE,
 };
 
+struct hal_sw_mon_ring_entries {
+	dma_addr_t mon_dst_paddr;
+	dma_addr_t mon_status_paddr;
+	u32 mon_dst_sw_cookie;
+	u32 mon_status_sw_cookie;
+	void *dst_buf_addr_info;
+	void *status_buf_addr_info;
+	u16 ppdu_id;
+	u8 status_buf_count;
+	u8 msdu_cnt;
+	bool end_of_ppdu;
+	bool drop_ppdu;
+};
+
 struct hal_rx_mon_ppdu_info {
 	u32 ppdu_id;
 	u32 ppdu_ts;
@@ -331,6 +345,9 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc,
 					 dma_addr_t *paddr, u32 *sw_cookie,
 					 void **pp_buf_addr_info, u8 *rbm,
 					 u32 *msdu_cnt);
+void
+ath11k_hal_rx_sw_mon_ring_buf_paddr_get(void *rx_desc,
+					struct hal_sw_mon_ring_entries *sw_mon_ent);
 enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status(struct ath11k_base *ab,
 			       struct hal_rx_mon_ppdu_info *ppdu_info,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
