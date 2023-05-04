Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF4C7EE21
	for <ath11k@archiver.kernel.org>; Thu,  4 May 2023 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCGPuBUA3Aktk4t3y++X/KGkIVyecTQVy3TdS8RLt58=; b=Qi/SKInLxqbszQ
	A65quifTKm4hdbBKLiOPg78dlY5Oc05XA/5UuIz+2+BY8rUT199ceA8ha+QqZgW9uZAtakFqMBhyD
	5BGGVxdcwHC0CELlLlP69lkWwW7Y/6ZKi7uor8Q0YUza7ju9Fm/k78CluunYe4O+rt4BKSuQ0JWEH
	IaiKIEvTOQ9hwIwI1oqM3nAN5Rq0+rOlIEuzVsHdn4PukxWAP4MR3Oj6mA3tWNFK4B33fekTzWa8B
	Phj7gQQ5Uuo1CSgtL9JLNnCq70VarpNpm0FMii+3udE3kcicZwqNqDaVQd/s7hvJJCiui1duLOJ4O
	QjemplV+yDy1l3DVt1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugnj-0097Jc-1R;
	Thu, 04 May 2023 21:47:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pugni-0097J5-0D
	for ath11k@bombadil.infradead.org;
	Thu, 04 May 2023 21:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MI/9ZJyjmx95BETHA5iz7dpjLwCl8bEFqIs1+sY3SNI=; b=lblva91yh6x2V7aIvZtOXqXkJf
	pHN3zm2tT4TMpqMny4PCOPVMuoYzBNCp0SEjYgFR3fQlkGc2jz+yKbQhRHusfN0yioZWGmcJ/hmFh
	V9XM+64ksi++HdO5cw+0dDHF/N+kry00zH+c+AWBCFpkhBZziOuTliSF1uP4Uh1hpNRSFFGy94Ndy
	qWJ3iA8AWAHrM8RKY3ng+LW6qJEkWYZExRjIfe4ulZ+HeCwvNZJC5R56nH9Zpp8zD2+SOcSXCfU30
	cRwqG1oLbsRh2Uy5nGzjHvMGqMzJqT3k6GZHsT0Do+8bt4fx63/PLbUcDKnoQluBNozC6Oa22zqaV
	ysos4UHw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puevt-001p42-2D
	for ath11k@lists.infradead.org;
	Thu, 04 May 2023 19:48:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80A076372C;
	Thu,  4 May 2023 19:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8855C4339C;
	Thu,  4 May 2023 19:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683229682;
	bh=ANj1/Mdt11UKjqOjZLYLvGkukMF6iBUj/697rQNawaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bs/+x8yfpnrck5YNa6JgTsrXiD7eS1JQlxdfM5PXXcQ3kZYufu+OOLNkandS+nWcV
	 cRAINo57BXlLWb+AtEE838WsqKGFHUz/Z8BZM//LeWL+CXINU5aXmxyhtzMQvXQjiH
	 v9iizTS5Dmup36eKeqpg7Nzvd4hOBpng4Jxkl6PgCqeMWgjCTeirfbfvllC2bTB22v
	 jp1uCK7qszYt0ll4pb2BziQuCstrP73T/+jr0s0m+faFWswXqlY1TtAnBE/ngoNb/y
	 F0yZcjWbG7zqVn+Cu4HOz3I4W5ByCbVvYAXX2Ukk1IPyCNp96CT6RebIKzUkkipbFh
	 LK7pjxrTYr1ew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nagarajan Maran <quic_nmaran@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 37/49] wifi: ath11k: Fix SKB corruption in REO destination ring
Date: Thu,  4 May 2023 15:46:14 -0400
Message-Id: <20230504194626.3807438-37-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194626.3807438-1-sashal@kernel.org>
References: <20230504194626.3807438-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_204807_463795_684B060F 
X-CRM114-Status: GOOD (  12.79  )
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

From: Nagarajan Maran <quic_nmaran@quicinc.com>

[ Upstream commit f9fff67d2d7ca6fa8066132003a3deef654c55b1 ]

While running traffics for a long time, randomly an RX descriptor
filled with value "0" from REO destination ring is received.
This descriptor which is invalid causes the wrong SKB (SKB stored in
the IDR lookup with buffer id "0") to be fetched which in turn
causes SKB memory corruption issue and the same leads to crash
after some time.

Changed the start id for idr allocation to "1" and the buffer id "0"
is reserved for error validation. Introduced Sanity check to validate
the descriptor, before processing the SKB.

Crash Signature :

Unable to handle kernel paging request at virtual address 3f004900
PC points to "b15_dma_inv_range+0x30/0x50"
LR points to "dma_cache_maint_page+0x8c/0x128".
The Backtrace obtained is as follows:
[<8031716c>] (b15_dma_inv_range) from [<80313a4c>] (dma_cache_maint_page+0x8c/0x128)
[<80313a4c>] (dma_cache_maint_page) from [<80313b90>] (__dma_page_dev_to_cpu+0x28/0xcc)
[<80313b90>] (__dma_page_dev_to_cpu) from [<7fb5dd68>] (ath11k_dp_process_rx+0x1e8/0x4a4 [ath11k])
[<7fb5dd68>] (ath11k_dp_process_rx [ath11k]) from [<7fb53c20>] (ath11k_dp_service_srng+0xb0/0x2ac [ath11k])
[<7fb53c20>] (ath11k_dp_service_srng [ath11k]) from [<7f67bba4>] (ath11k_pci_ext_grp_napi_poll+0x1c/0x78 [ath11k_pci])
[<7f67bba4>] (ath11k_pci_ext_grp_napi_poll [ath11k_pci]) from [<807d5cf4>] (__napi_poll+0x28/0xb8)
[<807d5cf4>] (__napi_poll) from [<807d5f28>] (net_rx_action+0xf0/0x280)
[<807d5f28>] (net_rx_action) from [<80302148>] (__do_softirq+0xd0/0x280)
[<80302148>] (__do_softirq) from [<80320408>] (irq_exit+0x74/0xd4)
[<80320408>] (irq_exit) from [<803638a4>] (__handle_domain_irq+0x90/0xb4)
[<803638a4>] (__handle_domain_irq) from [<805bedec>] (gic_handle_irq+0x58/0x90)
[<805bedec>] (gic_handle_irq) from [<80301a78>] (__irq_svc+0x58/0x8c)

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230403191533.28114-1-quic_nmaran@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1786d83f8f2ed..38be646bc0214 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -389,10 +389,10 @@ int ath11k_dp_rxbufs_replenish(struct ath11k_base *ab, int mac_id,
 			goto fail_free_skb;
 
 		spin_lock_bh(&rx_ring->idr_lock);
-		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 0,
-				   rx_ring->bufs_max * 3, GFP_ATOMIC);
+		buf_id = idr_alloc(&rx_ring->bufs_idr, skb, 1,
+				   (rx_ring->bufs_max * 3) + 1, GFP_ATOMIC);
 		spin_unlock_bh(&rx_ring->idr_lock);
-		if (buf_id < 0)
+		if (buf_id <= 0)
 			goto fail_dma_unmap;
 
 		desc = ath11k_hal_srng_src_get_next_entry(ab, srng);
@@ -2665,6 +2665,9 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 				   cookie);
 		mac_id = FIELD_GET(DP_RXDMA_BUF_COOKIE_PDEV_ID, cookie);
 
+		if (unlikely(buf_id == 0))
+			continue;
+
 		ar = ab->pdevs[mac_id].ar;
 		rx_ring = &ar->dp.rx_refill_buf_ring;
 		spin_lock_bh(&rx_ring->idr_lock);
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
