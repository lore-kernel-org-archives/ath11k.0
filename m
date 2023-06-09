Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D74C83005
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re6rY5qNOLM8asc6SeOZHCA99J4Q+gAoCvcS2f93fSI=; b=gsMA1V5I5wo4TV
	fXk42WtNwPjoif22k5iuYJvxOv6WLYIRpAsyKMY6HDF8SXEKzDe1ogodt4zL1AZ3+UZTobStXEZAJ
	ZktHBFT85inSq+QbVmbHzHNVvBUUFahlKkyT7btSBYGdq5I3qiNHvNSftFMey82yvk7TIrFMZenGm
	hwcMfS0agHpBmlVVK660g/tWXa04nTWGdEieeY0wT+SCKrR5JxJVICwO1VqdPb1K6KYF/daJ0vtLl
	8vi48tguBJ+pSrSF4aImsYLtE1SS+VlHTj+dk94pInMmhGJ9pPursjdG6z96JGhnD8I7GSVWn5l7G
	7KdNIwy0MgGsaX5HCioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2w-00DFe0-1K;
	Fri, 09 Jun 2023 14:24:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2t-00DFVn-00
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5F62615D1
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC149C433EF;
	Fri,  9 Jun 2023 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320694;
	bh=gxf6ePnmTtpWbNVitpX5s+VlzfoKLTljRK7KzeC97Z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LHtcx2PQJe1lWlUqeq7AqPD5YvOgs77dF12JSQaw5xXjsFWv/qfB/xCTzksEv7Fga
	 jCkk8BgMNZTBJ52Im5AGAOCrYqSyRfNCM4P3HnJb8zWW1i5jkLVJyNJfk2LIPA/WTf
	 lDwrVOCbRocOpdCm80gpPi9BOWV4x+z4f5ZvrmqG3l3uxseAo0aDMx+ZQECgqenehG
	 cz8WAEDfI5/st7CTgKjYzu9NNvVo0jQqKyFmNIECq/DPz7bUT9oN+Guve4+c0WOpkz
	 YexH33G9Ikm9wLAwF/bwXBlkzQqI9J+PZfmoDC0ASwPrHGYWIdYIKqGVXLvjfPSjQN
	 NWBbF1niCgmRA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 10/15] wifi: ath11k: dp: cleanup debug message
Date: Fri,  9 Jun 2023 17:24:35 +0300
Message-Id: <20230609142440.24643-11-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072455_077008_E5867978 
X-CRM114-Status: UNSURE (   9.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Merge the two debug messages into and fix them to follow the preferred style.

Also change the log level to ATH11K_DBG_DP_TX to match the filename.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 08a28464eb7a..a34833de7c67 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -964,14 +964,10 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 				params.low_threshold);
 	}
 
-	ath11k_dbg(ab, ATH11k_DBG_HAL,
-		   "%s msi_addr_lo:0x%x, msi_addr_hi:0x%x, msi_data:0x%x\n",
-		   __func__, cmd->ring_msi_addr_lo, cmd->ring_msi_addr_hi,
-		   cmd->msi_data);
-
-	ath11k_dbg(ab, ATH11k_DBG_HAL,
-		   "ring_id:%d, ring_type:%d, intr_info:0x%x, flags:0x%x\n",
-		   ring_id, ring_type, cmd->intr_info, cmd->info2);
+	ath11k_dbg(ab, ATH11K_DBG_DP_TX,
+		   "htt srng setup msi_addr_lo 0x%x msi_addr_hi 0x%x msi_data 0x%x ring_id %d ring_type %d intr_info 0x%x flags 0x%x\n",
+		   cmd->ring_msi_addr_lo, cmd->ring_msi_addr_hi,
+		   cmd->msi_data, ring_id, ring_type, cmd->intr_info, cmd->info2);
 
 	ret = ath11k_htc_send(&ab->htc, ab->dp.eid, skb);
 	if (ret)
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
