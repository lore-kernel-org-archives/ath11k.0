Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEEECA5FA0
	for <ath11k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j274234qXl6Adx9NrOYpzzR9WSPKXvomignRM47Vgdo=; b=ZsEzTUWe+B7hZjTGRWuXUY2IKy
	6lJa34gN/cXI42f4Uc2YxTjhdDDMfldged9wILd8KiwAJE79AVK5QS3TMdEmiWxVi43Xhrbp06+7W
	YhC9Avjvx63eZrtKdMDHn+JT7j/6WiYdHLZaJk7rBy+mY4+uhw1Z6lqK1/mn9cnSf1rEYLTNePzbl
	HQnwlwVH3rsLXwpysmRL7oWmCp4UcIdoGCd3iwwL41XfOtx/M9UCEt/5qyy9nwRUwZl5QZlal+4cO
	rY/FCaF3QMIru37wuagksha+WkZ0PJ3Mim5H6j1QDVJ0nB6+cEZZp0hwkwDOQLjbT0gbZJaGeRNma
	Ad7teF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbfl-3LYN;
	Sat, 26 Sep 2026 15:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe4-0000000FbfQ-1QMH
	for ath11k@bombadil.infradead.org;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j274234qXl6Adx9NrOYpzzR9WSPKXvomignRM47Vgdo=; b=mouaxB49pLgFyc8cxDBG5KB388
	86AX1VHbOVyvIlheptnsiAaSfnfnZk95iZV0CmaWPFZCjLmKlJsEslrqF23CUu+5JPrCMzCP4bAGl
	nNI682TTSmp7KTsga4b75MCypq9VGOegyiQullHUr60QaSZW1obx4uIlxZoq72DdKKvBUX9u7W3kJ
	w0EI3Q+ftO2gV1jSISAaq6vGPyii2v3WWsxGj0BcNrakYYdc0iAa0HnooVeNcYdfq3kBNROly6Mh9
	86Yo2TyZkZ94jaf6yRzS8tDNAGdWW1QQIf3xCxesacyFCWjR3BMZQU84xqg8JmuUsTuV0L4itTtt+
	SK3L+F+g==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe0-00000000GIK-2gva
	for ath11k@lists.infradead.org;
	Sat, 26 Sep 2026 15:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=j2
	74234qXl6Adx9NrOYpzzR9WSPKXvomignRM47Vgdo=; b=aztHeWkv6gCCyd9w15
	XuUvdy1SNYmuzbEw+yEhJX/4g6nij3jiPlMfHaS1l7yPiBa19jxkXmAdWuMbJTTH
	MjebKXhnagdTjP1jk1ASR0C7TZHwLT1wJUoLKdpFbSeKqKr4AW3T8DVkkHg4GLBF
	LlPvNuGmLEbdk3W89DCSAD5CA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S5;
	Sat, 26 Sep 2026 23:48:31 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sven Eckelmann <sven@narfation.org>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/5] wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
Date: Sat, 26 Sep 2026 23:48:22 +0800
Message-Id: <20260926154824.75224-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926154824.75224-1-yaojiale02@163.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4UtFW8Jry7ZryrWFW5trb_yoW8tF4rpF
	47W342yFy8AF47Xr4rCw4rA3WrXas8K39F9r4DG34rJFnFyF1SgFyFvF1avrWrta18GFy2
	krWUtr15G34qk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5rchUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BAXUWq36VC7YQAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164857_207961_13841BF8 
X-CRM114-Status: GOOD (  11.20  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ath11k_mac_op_remove_interface() walks txmgmt_idr with idr_for_each(),
and its callback removes each entry belonging to the interface. Removing
the current entry can invalidate the radix-tree iterator retained by
idr_for_each().

Move the walk into a helper that uses idr_for_each_entry(). It performs a
fresh lookup for every iteration, so each matching entry can be removed
through the locked removal helper without retaining iterator state across
the removal.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 696f9dd65ad4..07de423086c9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6181,16 +6181,18 @@ int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 	return 0;
 }
 
-static int ath11k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
+static void ath11k_mac_vif_txmgmt_cleanup(struct ath11k *ar,
+					  struct ieee80211_vif *vif)
 {
-	struct ieee80211_vif *vif = ctx;
-	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);
-	struct ath11k *ar = skb_cb->ar;
-
-	if (skb_cb->vif == vif)
-		ath11k_mac_tx_mgmt_free(ar, buf_id);
+	struct ath11k_skb_cb *skb_cb;
+	struct sk_buff *skb;
+	int buf_id;
 
-	return 0;
+	idr_for_each_entry(&ar->txmgmt_idr, skb, buf_id) {
+		skb_cb = ATH11K_SKB_CB(skb);
+		if (skb_cb->vif == vif)
+			ath11k_mac_tx_mgmt_free(ar, buf_id);
+	}
 }
 
 static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
@@ -7421,8 +7423,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 
 	ath11k_peer_cleanup(ar, arvif->vdev_id);
 
-	idr_for_each(&ar->txmgmt_idr,
-		     ath11k_mac_vif_txmgmt_idr_remove, vif);
+	ath11k_mac_vif_txmgmt_cleanup(ar, vif);
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
-- 
2.34.1


