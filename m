Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2F9CA5FDD
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLZRDyv5CTca4S0S1McTqMKZPbZhg51Wnca9mh1+pZQ=; b=aLW7TJWaOChc0xdVw+RRZZgONq
	rD6owIETdhKkQYZC0uh3DljzY6yHYbjakH1W0GGhQzoiHvjgCbcjVb3pcVfUQ/Whs3nX+lei+5xHA
	nyZhTNw5JS6YBnHSFX6E1iek2Lupr/KJ5N6TewohtfHCB7y9goSiI8WxWmCz7d8WJo9YYn6liEuiy
	/7apB4pVeBtOc7mF9VCZv6DI/s5WT/FOTWMbWT75n4u6e3FRMIM9EUSmErxm8GWpgm+ew+NxP6qeW
	QrqLU0kCu/oTi9LYcAxNNoOmVdn7DCs4JN12kR5SeUiTpMfrW7vH2FyY6M+Y/6cFwpx+8L+RIJ044
	M9mW2hQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvu-0000000DG3s-2lxw;
	Sat, 03 Oct 2026 09:21:30 +0000
Received: from [117.135.210.2] (helo=m16.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvvr-0000000DFyo-1a64
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 09:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rL
	ZRDyv5CTca4S0S1McTqMKZPbZhg51Wnca9mh1+pZQ=; b=eYbGMiZFCLueTO10eu
	680QyIMQwnICq3WFNl//EGEnYXckRw4I0or6DYegnTw0T3tOaZ4dpi9MzhhAvNOE
	ZNY0XPvYA/LZDMJhxCsv56yzfx9pwXMYpzR/XFoglxr9FWfFiBbTfv6Hr86dnC1e
	mP1bwlNt4HvX6C38SvN0hzT90=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n1YCycBqC7WjCQ--.62376S5;
	Sat, 03 Oct 2026 17:21:11 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	Sriram R <quic_srirrama@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 3/5] wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
Date: Sat,  3 Oct 2026 17:21:00 +0800
Message-Id: <20261003092104.520135-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
References: <20261003092104.520135-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n1YCycBqC7WjCQ--.62376S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4UtFW8Jry7ZryrWFW5trb_yoW8tFykpF
	4UW342kFy8AF47Xr4rCw45A3WrXas8K39Ikr45G34rJFnFyF1SgFyFvF1ayrWFya18GFy2
	krWUtr15G3yDG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5rchUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQc+eGrAyQeNCQAA3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_022127_796045_D133847A 
X-CRM114-Status: GOOD (  11.67  )
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
index f9af403a2f0d..e7ece258f142 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6176,16 +6176,18 @@ void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar)
 		ath11k_mac_tx_mgmt_free(ar, buf_id);
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
@@ -7416,8 +7418,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 
 	ath11k_peer_cleanup(ar, arvif->vdev_id);
 
-	idr_for_each(&ar->txmgmt_idr,
-		     ath11k_mac_vif_txmgmt_idr_remove, vif);
+	ath11k_mac_vif_txmgmt_cleanup(ar, vif);
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&ab->dp.tx_ring[i].tx_idr_lock);
-- 
2.34.1


