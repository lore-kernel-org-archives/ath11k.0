Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifiZt-0008Hg-1a
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 10:53:46 +0000
Date: Fri, 13 Dec 2019 13:53:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] ath11k: driver for Qualcomm IEEE 802.11ax devices
Message-ID: <20191213105335.lg7n627mhas6spcy@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org

Hello Kalle Valo,

This is a semi-automatic email about new static checker warnings.

The patch d5c65159f289: "ath11k: driver for Qualcomm IEEE 802.11ax 
devices" from Nov 23, 2019, leads to the following Smatch complaint:

    drivers/net/wireless/ath/ath11k/ce.c:192 ath11k_ce_rx_post_pipe()
     error: we previously assumed 'pipe->dest_ring' could be null (see line 167)

drivers/net/wireless/ath/ath11k/ce.c
   166	
   167		if (!(pipe->dest_ring || pipe->status_ring))
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This checks that at least one is non-NULL but it should check that both
are non-NULL, probably?

		if (!pipe->dest_ring || !pipe->status_ring)

   168			return 0;
   169	
   170		spin_lock_bh(&ab->ce.ce_lock);
   171		while (pipe->rx_buf_needed) {
   172			skb = dev_alloc_skb(pipe->buf_sz);
   173			if (!skb) {
   174				ret = -ENOMEM;
   175				goto exit;
   176			}
   177	
   178			WARN_ON_ONCE(!IS_ALIGNED((unsigned long)skb->data, 4));
   179	
   180			paddr = dma_map_single(ab->dev, skb->data,
   181					       skb->len + skb_tailroom(skb),
   182					       DMA_FROM_DEVICE);
   183			if (unlikely(dma_mapping_error(ab->dev, paddr))) {
   184				ath11k_warn(ab, "failed to dma map ce rx buf\n");
   185				dev_kfree_skb_any(skb);
   186				ret = -EIO;
   187				goto exit;
   188			}
   189	
   190			ATH11K_SKB_RXCB(skb)->paddr = paddr;
   191	
   192			ret = ath11k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
                                                            ^^^^
pipe->dest_ring is dereferenced inside the function.

   193	
   194			if (ret) {

regards,
dan carpenter

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
