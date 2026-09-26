Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EB0C9832F
	for <ath11k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIMo/C9HBVn2XTdqyHiurAejlgPCNjRxM5+52AVZcG4=; b=snuqsCatlwT71goLYn6PrOXpG/
	OKHf5+8qtozPd1OnUirjk6sQRQGgY5zuZ2eqJA8S3kjccpWB4aNl4D+f3ENpAk/26F9J+Mt+XkI7C
	HygSPqzdteYRsZXWyq60xEgBimJLx9EDYJulGN/Z0qvyfS7CftH8b+wwWpJAnK2Jy4tBzoUqeh+Ei
	yMRJmgCrQi6/g1/uXE52DF1o4zbu7sSxYQd1BZhH2V+IGiDHTdTLijTM8Fq87HlruFzDMYcohvFS8
	73LN8MRvzfAU1SRuyDjaGiELn5Pg1a+IEYSwlKK6Q8nrPPVLuxSCXxU5ol1ja1LSZ2SVOPcjexD7c
	2DzYkszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbg5-3r1i;
	Sat, 26 Sep 2026 15:49:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe4-0000000FbfR-1QJp
	for ath11k@bombadil.infradead.org;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WIMo/C9HBVn2XTdqyHiurAejlgPCNjRxM5+52AVZcG4=; b=jMQbPzylgU+cGYdawlBYGYNeKK
	rLQ2HMQPjnZ+VWVp3Ehfn8funyOWtLBmSxLTMPG3qqcGtx8h4SfLv70V21gm3e74kot2tJpN2dvku
	MNvJbvPLXOtSlPo5LxTUyAzWPWWFret127KnQM76DRvjlppzGwu5qWRusWMtZFNjbhcNSkKRGawJy
	aREjW90uZI41QsKF8B5xn4wH/M9pNec1Uv5/25pqCxkcpgU3ztE9+42UnQILYqKUDubK5lqIXnEln
	xygFDrTNADhAAU4psHboJJ3Bx0eCPDbws7Pms0ZxaNif3boc5NrGmqRfFhG4ZBmVwqU9EAR+qYzh5
	kwSJhZrw==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe0-00000000GIv-2apv
	for ath11k@lists.infradead.org;
	Sat, 26 Sep 2026 15:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WI
	Mo/C9HBVn2XTdqyHiurAejlgPCNjRxM5+52AVZcG4=; b=GeC5v3kuycr5vyxkf6
	qfjGRAq5zfaHTQYE9NmWs0IpWgbFm43pLRzhExoVUgoqzvANiW8RZ9RVFr17U46h
	/TXgCmlqpQh+1sMlEduVuGhGcH5JDb6byd5T5wHBDb+cfVLLLCPKm3G95xFhhheV
	Kv16ul8zAQ6Et+tI34Kz13jcQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S4;
	Sat, 26 Sep 2026 23:48:30 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Shashidhar Lakkavalli <slakkavalli@datto.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Miles Hu <milehu@codeaurora.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/5] wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
Date: Sat, 26 Sep 2026 23:48:21 +0800
Message-Id: <20260926154824.75224-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926154824.75224-1-yaojiale02@163.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1xJr4fXw4kZw18JF1kZrb_yoW8tw4DpF
	4rW3sFyFyUAr47Xr4vyF48J3WrX3Z5Gw4DKrWrK34rJF9FqFnavFy8Aa42yrW5KFW8XFy5
	ArWUKFy5GrWDtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pK0PTAUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8A8WUGq36U+7UwAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164857_190661_05690084 
X-CRM114-Status: GOOD (  10.12  )
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

ath11k_mac_tx_mgmt_pending_free() is passed as an idr_for_each()
callback and removes the current entry from txmgmt_idr. This can
invalidate the radix-tree iterator retained by idr_for_each().

Both callers destroy the IDR immediately after the walk, so removing
each entry in the callback is unnecessary. Split skb release from IDR
removal and let the callback release the supplied skb without updating
the IDR. The following idr_destroy() tears down the IDR itself.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ae91b57c8422..696f9dd65ad4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6146,18 +6146,11 @@ static void ath11k_mgmt_over_wmi_tx_drop(struct ath11k *ar, struct sk_buff *skb)
 		wake_up(&ar->txmgmt_empty_waitq);
 }
 
-static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
+static void ath11k_mac_tx_mgmt_free_skb(struct ath11k *ar,
+					struct sk_buff *msdu)
 {
-	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 
-	spin_lock_bh(&ar->txmgmt_idr_lock);
-	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
-	spin_unlock_bh(&ar->txmgmt_idr_lock);
-
-	if (!msdu)
-		return;
-
 	dma_unmap_single(ar->ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
 			 DMA_TO_DEVICE);
 
@@ -6167,11 +6160,23 @@ static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
 	ath11k_mgmt_over_wmi_tx_drop(ar, msdu);
 }
 
+static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
+{
+	struct sk_buff *msdu;
+
+	spin_lock_bh(&ar->txmgmt_idr_lock);
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
+	spin_unlock_bh(&ar->txmgmt_idr_lock);
+
+	if (msdu)
+		ath11k_mac_tx_mgmt_free_skb(ar, msdu);
+}
+
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 {
 	struct ath11k *ar = ctx;
 
-	ath11k_mac_tx_mgmt_free(ar, buf_id);
+	ath11k_mac_tx_mgmt_free_skb(ar, skb);
 
 	return 0;
 }
-- 
2.34.1


