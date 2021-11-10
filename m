Return-Path: <SRS0=jp2b=P5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BA0C433EF
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 16:21:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A70561246
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 16:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A70561246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+81cLa4p3goTX4/TyEpTxIouH3KLnMtp3BjISMdMelk=; b=Jtxuzgsg5ysu5u
	obYEAEcdzrw8rXS1o9czrtG5CMgqHfEXbuxTgk9BWGMJQ3ROMHt5swZtpBOknaG2XG1JZwBF3YZX1
	YqccOAk6VPVSvl1fc+R6zHF4gTuycOYgfLgUixxKx70dyrAD9fGrFpmdT16XiH2CrUUk8siyw7uyI
	ddh9dO5aZP0hQ88zeKYtDCnwmgvQPaEPLCHL1ix8T9/43Yfw7KSSMC4Mxh0A5g/mg2iU5eZpcVZwq
	fKr6tY1w8WBrYEkbxPeGl8CvGp5Wm11HQQP6yt73+ZaKNcypJ1FLmz0VGgKBaqto2iErco50HD33c
	vysCxpVzsrTOiW0tZx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkqM5-005ojR-Kx; Wed, 10 Nov 2021 16:21:45 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkqM3-005oj3-Fy
 for ath11k@lists.infradead.org; Wed, 10 Nov 2021 16:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636561303; x=1668097303;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=yGMS5MC/wpZ6wEgWJkC5EdriNiGXW4Sd1OxBytFB5Go=;
 b=IvUTNjqCSe+YLsiyqfeNA3FLHTmCNQLa4GZ5NxAzJ8fYuI1h1Beo1hgu
 RNvMDcUenTBL3nB44/5VRZ58twyOLD6vhHMDjc8QG9Erwo7TdMh/fN26g
 b527xak2KvPkfndyp4fUIZXkx7oKrTyw3M2ChdZmsKvSGIbcgBhFZyiBg U=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Nov 2021 08:21:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 08:21:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 08:21:42 -0800
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 08:21:40 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>
Subject: [PATCH] ath11k: fix DMA memory free in CE pipe cleanup
Date: Wed, 10 Nov 2021 21:51:30 +0530
Message-ID: <1636561290-18966-1-git-send-email-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_082143_582680_3650643F 
X-CRM114-Status: GOOD (  10.00  )
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

In CE pipe cleanup, DMA memory gets freed by the aligned address
(base_addr_owner_space) which is wrong. It needs to be freed
by the address (base_addr_owner_space_unaligned) returned by
dma_alloc. So free the dma memory by the proper address.
This was found in code review.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index de8b632..4249c2e 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -953,6 +953,7 @@ int ath11k_ce_init_pipes(struct ath11k_base *ab)
 void ath11k_ce_free_pipes(struct ath11k_base *ab)
 {
 	struct ath11k_ce_pipe *pipe;
+	struct ath11k_ce_ring *ce_ring;
 	int desc_sz;
 	int i;
 
@@ -964,22 +965,24 @@ void ath11k_ce_free_pipes(struct ath11k_base *ab)
 
 		if (pipe->src_ring) {
 			desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_SRC);
+			ce_ring = pipe->src_ring;
 			dma_free_coherent(ab->dev,
 					  pipe->src_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
-					  pipe->src_ring->base_addr_owner_space,
-					  pipe->src_ring->base_addr_ce_space);
+					  ce_ring->base_addr_owner_space_unaligned,
+					  ce_ring->base_addr_ce_space_unaligned);
 			kfree(pipe->src_ring);
 			pipe->src_ring = NULL;
 		}
 
 		if (pipe->dest_ring) {
 			desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST);
+			ce_ring = pipe->dest_ring;
 			dma_free_coherent(ab->dev,
 					  pipe->dest_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
-					  pipe->dest_ring->base_addr_owner_space,
-					  pipe->dest_ring->base_addr_ce_space);
+					  ce_ring->base_addr_owner_space_unaligned,
+					  ce_ring->base_addr_ce_space_unaligned);
 			kfree(pipe->dest_ring);
 			pipe->dest_ring = NULL;
 		}
@@ -987,11 +990,12 @@ void ath11k_ce_free_pipes(struct ath11k_base *ab)
 		if (pipe->status_ring) {
 			desc_sz =
 			  ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST_STATUS);
+			ce_ring = pipe->status_ring;
 			dma_free_coherent(ab->dev,
 					  pipe->status_ring->nentries * desc_sz +
 					  CE_DESC_RING_ALIGN,
-					  pipe->status_ring->base_addr_owner_space,
-					  pipe->status_ring->base_addr_ce_space);
+					  ce_ring->base_addr_owner_space_unaligned,
+					  ce_ring->base_addr_ce_space_unaligned);
 			kfree(pipe->status_ring);
 			pipe->status_ring = NULL;
 		}
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
