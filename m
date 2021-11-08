Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BA9C433FE
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D55D7610A0
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D55D7610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8wYn/BX7DkPgGLfzVvHvMdYuR9ubakulqeBLjk5PpI=; b=QdKscymFjSN/SE
	vUOntIY6AHIa4+AHzMXeJ6p9OXQlnW4fIcRIPr0e417zCTexBJ2RWEI3pIyNGZ7uWcMvjWbod/HW4
	jK2UvyVK+y8G2Nn/edMsiY+t2/Wmra1qMZCHjveGD7/urhNGj5ZywFyaXK0EanfDxmbcUTdTmH6Jx
	gV4ulVZxWPwxln7xdmwjhliMtFtq8QwKq0OI0YVFgS/3nGE2hJhbSZ3FhsvK+3EC2T2iXcNPeY6r0
	9vweCWxmtafZW2kUyJKqxrvsVbeEyELf4/Jm7Fodg5LldBjFqYKf13oEFaANw+BlZRWB0pTa3vRij
	zvpMfv+P7/5HzMRLDArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFlW-000HAw-PZ; Tue, 09 Nov 2021 01:17:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFYT-000C8k-NE
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 01:04:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2013761A71;
 Tue,  9 Nov 2021 01:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419845;
 bh=7aameh29KZ7F4eWJbvaEzI58laStKlQ9gTUJIFvTU8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u6l8jHbZ0i6o2NB24E5iIiXxIUFAi2dkVnz0QTfmH3iHqYiLbnIqez9UEWCSl7JGh
 5CMbT9CNHH8rcnCp6ENp7+huQCsrTMCzq45LULY0Dqgki87BnD5t3tcxRcZBrybH2q
 p0PUvawY6u+BtTWFqrqCdPsB/NsWEzpD6o62x1ycaVdy6miaiMoV+dYkUoP8YPSeWL
 DHUUCrs7a2UnTn5jFmt9evF2pv5h1QWLsr7evaGuiXGmmqF6bvVBGQCbTmyKqCcTzn
 nKuF+L8orQXHBA5+faMuzyQYfHcUBtk2VoijUrruwCIDwAA5JhF+U9sGyqNCkBX1lp
 wj9AjoBoZsyrg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <bqiang@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, davem@davemloft.net, kuba@kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 025/101] ath11k: Change DMA_FROM_DEVICE to
 DMA_TO_DEVICE when map reinjected packets
Date: Mon,  8 Nov 2021 12:47:15 -0500
Message-Id: <20211108174832.1189312-25-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174832.1189312-1-sashal@kernel.org>
References: <20211108174832.1189312-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170405_813162_EAAB5AD2 
X-CRM114-Status: GOOD (  11.24  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

[ Upstream commit 86a03dad0f5ad8182ed5fcf7bf3eec71cd96577c ]

For fragmented packets, ath11k reassembles each fragment as a normal
packet and then reinjects it into HW ring. In this case, the DMA
direction should be DMA_TO_DEVICE, not DMA_FROM_DEVICE, otherwise
invalid payload will be reinjected to HW and then delivered to host.
What is more, since arbitrary memory could be allocated to the frame, we
don't know what kind of data is contained in the buffer reinjected.
Thus, as a bad result, private info may be leaked.

Note that this issue is only found on Intel platform.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210916064617.20006-1-bqiang@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 2bff8eb507d4d..7d6fd8155bb22 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3273,7 +3273,7 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 
 	paddr = dma_map_single(ab->dev, defrag_skb->data,
 			       defrag_skb->len + skb_tailroom(defrag_skb),
-			       DMA_FROM_DEVICE);
+			       DMA_TO_DEVICE);
 	if (dma_mapping_error(ab->dev, paddr))
 		return -ENOMEM;
 
@@ -3338,7 +3338,7 @@ static int ath11k_dp_rx_h_defrag_reo_reinject(struct ath11k *ar, struct dp_rx_ti
 	spin_unlock_bh(&rx_refill_ring->idr_lock);
 err_unmap_dma:
 	dma_unmap_single(ab->dev, paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_FROM_DEVICE);
+			 DMA_TO_DEVICE);
 	return ret;
 }
 
-- 
2.33.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
