Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAADC10DC3
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2EoINcpV/N/eh0zqf09PH+DWEWTHPjQpSslVdcGBCA=; b=hTuAdiOXwuN5oy
	HkyhvG7BgnEjZ7uLnv0jXFPP9vUyDY+SPQHIhU9K6M8XDCU3O04DuzbF/ssKTHzo2y7M0L8m3Xc0T
	1LareKGiqhvxH1KQMWjuSlrWVaNf0ZikxKDzBZP4XopOMa0GPuqC2pFSjYmSnwvVo7Xvs3hDPZFIz
	746rbRA/TvnsXhZo3LLM8oaRtNXbEa73AyaD46E01lgsUIWDa11Dwgzuv1g3hX2Z8eqiH5quxpOZU
	LYq1fzt5b/TVLSAQvQyzdwYQFmXyOgYVOtRVFuj9QM37K8c5s1Gj4xn5TYfxJ2PIOWTAgR3qV8ESz
	6/v+n4FRrkyzHND8FRAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLy-002xXV-14;
	Mon, 27 Nov 2023 16:20:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLb-002xJJ-0U
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 16:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8E79AB836A6
	for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 16:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ABCC433CA;
	Mon, 27 Nov 2023 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102032;
	bh=jnbhwmRl5zZlAGHpkM5vY+jFOya5KqTgBO3ldORwj7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDte25c/awNiRJwP+2/pSDXAAOOgEj04pV3I73rdGLt6puSaQ4kcF0CoDWBp55WbG
	 jTLKWaBbB8QkzG+sBAHNS38VkGqmzP1kOI0w3+v/q4Pq+oiMuA10Zibi/9z78h0fTD
	 HjzpWZsBdtBNzkFAI1ds9sIRhWNFcQeMz4oiZCUHjOQyGNx7BJkQg+f/N8hYJXuoGj
	 TKmfy95UoKFuTrazxW22ax7QX3vBwwQhTBs1hncfIr/6YiOxnn5qy6Y63r7rOrzy9z
	 5G/MeBe5DQaK4lL0iHeMlAKAw3WvjrqtJRbjrWQHWjn0CI3BAXAxypwDxw3Kf8IOun
	 EFHO/TQ7Htc6g==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 6/8] wifi: ath11k: fix warning on DMA ring capabilities event
Date: Mon, 27 Nov 2023 18:20:20 +0200
Message-Id: <20231127162022.518834-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127162022.518834-1-kvalo@kernel.org>
References: <20231127162022.518834-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_082035_440300_CBAC41CF 
X-CRM114-Status: UNSURE (   7.63  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

We are seeing below warning in both reset and suspend/resume scenarios:

[69663.691847] ath11k_pci 0000:02:00.0: Already processed, so ignoring dma ring caps

This is because ab->num_db_cap is not cleared in
ath11k_wmi_free_dbring_caps(), so clear it to avoid such
warnings.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2845b4313d3a..b73d4286f7d3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4786,6 +4786,7 @@ static void ath11k_wmi_free_dbring_caps(struct ath11k_base *ab)
 {
 	kfree(ab->db_caps);
 	ab->db_caps = NULL;
+	ab->num_db_cap = 0;
 }
 
 static int ath11k_wmi_tlv_dma_ring_caps(struct ath11k_base *ab,
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
