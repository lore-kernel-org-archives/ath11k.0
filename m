Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8107EB64DD
	for <ath11k@archiver.kernel.org>; Tue,  1 Aug 2023 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=By5zH6VHgf9QtNAMY62frmt3GseBVNsDySa7i+hy4Ww=; b=vg2qI6v2kRbyPK
	fBApK0lq19zfPVeofI4sAidfjDju4cU//rniSMAdsb9rxBI8D1WUJ+Lzw19+Sm/E8bjzGnQk8vhEN
	b2mtIaMKDtf0/vb+0LSw5Mrtn9M0lXeFIjx9J57GI7xXlUwr1n0rrNlxKiH0mdbqKzpZFSLuk4FBQ
	p0eT4Sz/zS/YKzh/BPu9m1wOwwzwmdfQhUpuHtO6TAKOtLWKDDWwHo4qEnF1k8W5V5qjjzdAbJ5yt
	BMc3Bczd8Q8NPi/1NQunyYA6N9dOvBcR7Cl/RY+cvbr/BWlx0SzTGjeyREaVCLdYN+9I7URDBkylx
	0WRCE9F5fTrP7rR4E7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQy96-003THp-0b;
	Tue, 01 Aug 2023 22:47:16 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQy93-003TH7-0y
	for ath11k@lists.infradead.org;
	Tue, 01 Aug 2023 22:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1690930031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjSNp+Fc9Jt5MpoNE1r7E2tP2kQ/WOKZT6GzBaVgttM=;
	b=lcy/qjy21U7uUH8ft3i6bvD8CxwKsT0RiNOeNR+shWQkcPAZqI0vH9Zdv6p42G2+huThrm
	sMf/gHIaHmEgjEKcqFqY8q74SQATnsScxxq2uFJ4CwVFr5V3za6fNddmAdGO5ol3qPaOlD
	y0Jb8ATZqKLKwE0cAqyCFkDXuGNo8gQ=
From: Sven Eckelmann <sven@narfation.org>
Date: Wed, 02 Aug 2023 00:46:27 +0200
Subject: [PATCH v2 2/2] ath11k: Cleanup mac80211 references on failure
 during tx_complete
MIME-Version: 1.0
Message-Id: <20230802-ath11k-ack_status_leak-v2-2-c0af729d6229@narfation.org>
References: <20230802-ath11k-ack_status_leak-v2-0-c0af729d6229@narfation.org>
In-Reply-To: <20230802-ath11k-ack_status_leak-v2-0-c0af729d6229@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=sven@narfation.org;
 h=from:subject:message-id; bh=V0GmeAeeQt0aCXU2oj7g+5cgKTE+OL2dACM9u/oszNE=;
 b=owEBbQKS/ZANAwAKAV2HCgfBJntGAcsmYgBkyYtPfA2Rq4V9mZUnkITk5Gm63v2GRPrKuBSv6
 6ajaM6q+F+JAjMEAAEKAB0WIQQXXSuHYSVz3OMy4AJdhwoHwSZ7RgUCZMmLTwAKCRBdhwoHwSZ7
 RvadD/46pI0BWWi3m/aXoJQ8jAZK4ubVCvQ3WEWaNeq9m8r9Pc10Uy514F69GxAZCvlIuAPhNQv
 HXUw+Py6JuM+qXG4tuP5r2n41CAIP3NnP9uIQ9yw83QkL+qXaZoPqWVoFyDyV6RvmSLii1GdotF
 k5sCnHEQ4A6FGpMKSbEdzxVVIgJ6TzSGDYf8+BaCC3M6bWTyq9WbtZe3Yzuym4Nbjrs6KkxbnK/
 sDxmkDoGgAnlMtydM6MFVcxuuSLdVoHvwVOl1AtI+guVY8eQkuxiDxx0UBzG4HtpbkREVEW7Vjs
 QaubdsFrH+9A293KKPkDwR0dxNaGa17ODPQlG0HuWbqrYSCqKr9Lbr9I17dRMLUYj3pxbmwob60
 c8NoT3bHIPIP1izPfofUKysAaQQzYeFnsXxoc0D5gdUxK/l6B3zrxfT4jSm1QvzEjsickcE9qHQ
 786/m0jICjaZdnYr7gKqrr3csyq3OiC1Ammul0936X9jcYe88Tl1s6xEXXUlqirk/+b8kGxr6O6
 D+3xcGcGEcenMwn86Fo2Of3ZjQ7X6pM4kN8+yf83jQKkxZxQxR2/kRoVDEttKxbD6FgQcSiU2W3
 sqckPRQgLkTaDbTZELhZCyOi6a9dhqbkYQsF2MmHVL5rCJu7Sz8rMo9lqAIQgOwL+WXJDbdhrZe
 Kqk98ePOKEtqcjw==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_154713_480160_A5A9BB80 
X-CRM114-Status: UNSURE (   9.66  )
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

When a function is using functions from mac80211 to free an skb then it
should do it consistently and not switch to the generic dev_kfree_skb_any
(or similar functions). Otherwise (like in the error handlers), mac80211
will will not be aware of the freed skb and thus not clean up related
information in its internal data structures.

Not doing so lead in the past to filled up structure which then prevented
new clients to connect.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Fixes: 6257c702264c ("wifi: ath11k: fix tx status reporting in encap offload mode")
Cc: stable@vger.kernel.org
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 27c976f52c7a..b85a4a03b37a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -344,7 +344,7 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	if (!skb_cb->vif) {
-		dev_kfree_skb_any(msdu);
+		ieee80211_free_txskb(ar->hw, msdu);
 		return;
 	}
 
@@ -566,12 +566,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	if (unlikely(!rcu_access_pointer(ab->pdevs_active[ar->pdev_idx]))) {
-		dev_kfree_skb_any(msdu);
+		ieee80211_free_txskb(ar->hw, msdu);
 		return;
 	}
 
 	if (unlikely(!skb_cb->vif)) {
-		dev_kfree_skb_any(msdu);
+		ieee80211_free_txskb(ar->hw, msdu);
 		return;
 	}
 

-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
