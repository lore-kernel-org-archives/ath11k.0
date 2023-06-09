Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD90C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXd8t+ETBZSWvUsGxNIdFyUg2Bx/4KNPPiQa7Rxg04Y=; b=4wb2Uuv28ZgtLs
	Lh3UJx2u/43cRh8isg5Cgl9sM9r/6jdu2XIWAbbgU8mZYKgjqL2HU2lte4CiCkSimxCW3QHvhwFRi
	Gj6qXb4uFwkzKvd8aDvPcNgMfxNhacYpIrAvaI+jDAzP2XC29401HiwBEPxFEUC2e4wJlvIHkZ5Mo
	DWpyXoCAOcKPOU3mmg8kiYGyDL9st5r4tSBklER1Hef9ZkGyn2u01kGA8KBVnWGAxRY5ROLHUByL2
	7mwGTFM+HR/lDB/5meU30j709ea8io+s0KkLWZ8UBZWEoJh839kfbBb4eaVOTn0Z1aZc0bHeiNswV
	5eVwO2zN/2jG1XUAEeFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d31-00DFjo-28;
	Fri, 09 Jun 2023 14:25:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2y-00DFfw-1m
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:25:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E7D9612DC
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A1AC433EF;
	Fri,  9 Jun 2023 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320699;
	bh=07gyuyD88dqTsWLowHKsvMGA1/8R7H8umcB9wqiN818=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lY16zqZUV+Lcuv8MX9TzNy8PU2SVwg1gNw/FcXdY/yoBNKbzoUIMhl7PT0QOvg5X5
	 gA+3z4Z2O0jDCWO4ohCM8aq5+JebxnlwBO0RGcpRIZfE1ezlfH9gzGMXCfjYiZTo7a
	 PaDinEUipCMC+ny341/4nDonNHb+OrjTqsNKA4td9mZbxUdOeBi+/iV2gyDp8Ptfgm
	 mgjRBCwQdLG/A2ZFnI75GcyrOLpP7A9bkc//AZZdMr4hzOW79I+MIo45b4OgqmdbPN
	 GtCuxazve8B1M5lKzA/rfrlxZa2UfKWnHdVRNcssZxeC3m5GkSWgx5fYlnE9X0H09U
	 Qyzhimg2tKzCQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 15/15] wifi: ath11k: debug: add ATH11K_DBG_CE
Date: Fri,  9 Jun 2023 17:24:40 +0300
Message-Id: <20230609142440.24643-16-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072500_665299_515844CD 
X-CRM114-Status: GOOD (  12.30  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Add a new debug level for CE so that we don't need to use AHB level in ce.c.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ce.c    | 4 ++--
 drivers/net/wireless/ath/ath11k/debug.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index f2da95fd4253..289d47ae92af 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -442,7 +442,7 @@ static void ath11k_ce_recv_process_cb(struct ath11k_ce_pipe *pipe)
 	}
 
 	while ((skb = __skb_dequeue(&list))) {
-		ath11k_dbg(ab, ATH11K_DBG_AHB, "rx ce pipe %d len %d\n",
+		ath11k_dbg(ab, ATH11K_DBG_CE, "rx ce pipe %d len %d\n",
 			   pipe->pipe_num, skb->len);
 		pipe->recv_cb(ab, skb);
 	}
@@ -520,7 +520,7 @@ static void ath11k_ce_tx_process_cb(struct ath11k_ce_pipe *pipe)
 	}
 
 	while ((skb = __skb_dequeue(&list))) {
-		ath11k_dbg(ab, ATH11K_DBG_AHB, "tx ce pipe %d len %d\n",
+		ath11k_dbg(ab, ATH11K_DBG_CE, "tx ce pipe %d len %d\n",
 			   pipe->pipe_num, skb->len);
 		pipe->send_cb(ab, skb);
 	}
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index f0dddd188ef0..9c52804ef8ac 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -26,6 +26,7 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_PCI		= 0x00001000,
 	ATH11K_DBG_DP_TX	= 0x00002000,
 	ATH11K_DBG_DP_RX	= 0x00004000,
+	ATH11K_DBG_CE		= 0x00008000,
 };
 
 static inline const char *ath11k_dbg_str(enum ath11k_debug_mask mask)
@@ -61,6 +62,8 @@ static inline const char *ath11k_dbg_str(enum ath11k_debug_mask mask)
 		return "dp_tx";
 	case ATH11K_DBG_DP_RX:
 		return "dp_rx";
+	case ATH11K_DBG_CE:
+		return "ce";
 
 	/* no default handler to allow compiler to check that the
 	 * enum is fully handled
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
