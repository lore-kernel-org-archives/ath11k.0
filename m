Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9713FC12002
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 17:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C92760FDA
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 17:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C92760FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtU2wxGF48qcPr/dK1iEGdERiIp94oIm19HtShy0otM=; b=ZcPObjQ4EL4AaL
	DbMSrlrBSpalag8Chn5O80KMZZK0pHs1yVd5f2foX1fO2eo5DSq0UiPDasCSvmeOMZUakFc1Z5lws
	fh7s7oHKaFH303VO14BbtfUEDfOS9L4igxcTcXVBNf7Wbgvvmhh+YY9vnnQBkeJIxklAizeJWxET4
	MmiV5qA669gQPVnyeXu/PeLGFYGNgFlwH/janVH7hu9rWbsRTG3CMkKC9/kdv122A1mQ+K94uHtUp
	9obhPNZBiCNFPb9VofIg8vJ55WLSY42UHiB46ROjEf4EUwaOkJ1u73nuy1isrpJrIqNww6yjKHXiU
	gz7Ir/1IGopXwrQclLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6FtC-00GiaB-EX; Wed, 21 Jul 2021 17:20:10 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ft3-00GiVn-OV
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 17:20:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626888007; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XHNrHFHDfJabT2L9fA+kqFjT5vfeYT7Mo8C4jaFosjo=;
 b=OW7dcjrKcRWYXLsWNVGU6sCO0dJ2RoTcxnR16iqV9jCFaMptHB9SPWaOmdx2tGA/Gnb3yu9j
 dbaIYruQrtcFBHr7W1P7WHcJiyUaid77Z17G7uI7Ki24QG9UoxiR8wNSClMLpaY3NqP+AMu8
 y6Jgo73jWNQzCo5fPn+0krqDftI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f85735b653fbdadd82c686 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 17:19:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BA98FC4338A; Wed, 21 Jul 2021 17:19:48 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E997C433F1;
 Wed, 21 Jul 2021 17:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E997C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: add software monitor ring descriptor for full
 monitor
Date: Wed, 21 Jul 2021 20:19:04 +0300
Message-Id: <20210721171905.61838-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721171905.61838-1-jouni@codeaurora.org>
References: <20210721171905.61838-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_102007_694343_3F4963CA 
X-CRM114-Status: GOOD (  12.91  )
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

From: Anilkumar Kolli <akolli@codeaurora.org>

In full monitor mode, monitor destination ring is read in
software monitor ring descriptor format instead of
reo_entrance_ring format. Add new sw_mon_ring descriptor.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal_desc.h | 19 ++++++++++
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 44 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hal_rx.h   | 17 +++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index d54ec6aa6281..0be0e8939783 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -856,6 +856,25 @@ struct hal_reo_entrance_ring {
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
index 325055ca41ab..f072c95e7434 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1184,3 +1184,47 @@ void ath11k_hal_rx_reo_ent_buf_paddr_get(void *rx_desc, dma_addr_t *paddr,
 
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
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
