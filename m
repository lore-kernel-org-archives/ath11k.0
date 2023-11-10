Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF058C4332F
	for <ath11k@archiver.kernel.org>; Fri, 10 Nov 2023 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2EoINcpV/N/eh0zqf09PH+DWEWTHPjQpSslVdcGBCA=; b=wLtZjIW//umy9N
	RdpxeASTmiqYuJuUJSR9tADRQY/isCqo6EQUBukhJc0wZRsxB6yAWnbwO3iz89WCTqCFF2wUxoZWm
	SxYhI5zrZNhd4Ao50JRRroTkczJxhTEdboooBeYAKnPAvdXW9xJZPT9MhIwjoN/wXXKoXmitGVAbt
	6fcSxuqCjxhiutg+n67axw9byNGIVg5k7n32K9ax/aRK7esnRh1IW1wSGqAhnPfKuzeGftOudFlvu
	RimanSs5Wm5vMArZg4vhk7XaDPhZK4nn7raN+GQ/57PfvjE1kKpGRMk13yruZsMLYR7gkDgUqB5d3
	6ltxPRFGWDR89/h55dCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeY-008Hw5-29;
	Fri, 10 Nov 2023 10:22:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeV-008Hsb-1r
	for ath11k@lists.infradead.org;
	Fri, 10 Nov 2023 10:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B349CCE16CD
	for <ath11k@lists.infradead.org>; Fri, 10 Nov 2023 10:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED639C433CA;
	Fri, 10 Nov 2023 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611732;
	bh=jnbhwmRl5zZlAGHpkM5vY+jFOya5KqTgBO3ldORwj7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JRasFlWlr14W9NNPXlOqfKkrUj6oofyQIVxSbSSIMrZzaJPgyA9TGhNzLUUDTA8EZ
	 ZRJcC0nqwAQCCr79/WkN2TlCTWFn+TX65preVjb9bDJZzSau3mOJgcgSG3A7K9VWOF
	 Ue5mM9QHMSFZ24NUtekXB7GHwpakTktKg7HfWsrncCAMVoDraZPodHswdkRx+wRHIw
	 btmNZYUaSi/OpHXhbNBLYjjgBvl1PS4R+AM7GFq3HCLkY4xjyXMNdp8KLpxO2twSQu
	 j/lYKVJkAMa3oFP4DAo9j9JWbNtYZA5JQrySGKmzSQeRqBKI3U3kDosEDGZU5IfAks
	 rD8ilm6xhHJfQ==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 6/8] wifi: ath11k: fix warning on DMA ring capabilities event
Date: Fri, 10 Nov 2023 12:22:00 +0200
Message-Id: <20231110102202.3168243-7-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110102202.3168243-1-kvalo@kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_022215_793241_AB118DFA 
X-CRM114-Status: UNSURE (   7.79  )
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
