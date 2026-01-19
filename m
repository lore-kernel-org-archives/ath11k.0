Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A460D29C2E
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ukCZIDe90pweupxmfBDddRCcGudFsX1bV9Oymu5CYL8=; b=CIUcpT3pEc/EtTOhubfyBBObrr
	Kq64bbVIPXPRS7rQBWCFd4bDRAKSugnLJxgp/zkdHvYuSY8ftI1TPv/dcZdluKkTP66LuBAZ4cA6n
	EbjIoC3RLf17wuIGVzjxyHxsSlRGvGQxE8nTUmDPPu44IJiJYfDNuHD72EF7t2k4YxMEOwYr2FaCb
	Y3xFW9ZfduZgX0NK12mApxk6esXW7Wpja4hjHz2gOeWv6tClJdRjvKelRKRQ8ApIquzlRj9a0eFhW
	XA4NFrApc+nMeLoZxxf8A4t6CayOJQdFCNYu8t7p2OgJHekwLpMOM7CG5VkC33Ac1TMk0NkGUEr3j
	0xDU5ZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrlf-00000002QHj-1FX4;
	Mon, 19 Jan 2026 16:06:15 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrlU-00000002QGD-1xsg
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 16:06:14 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 312e1bd95;
	Tue, 20 Jan 2026 00:05:39 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] wifi: ath11k: fix memory leaks in beacon template setup
Date: Mon, 19 Jan 2026 16:05:35 +0000
Message-Id: <20260119160535.1874628-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bd701313303a1kunm9c9edabf1c1830
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUwaVkxPSUIfTxhJSExIT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dH+S3Pf6sKuXArTTtv9klJcxVxwQ1rlL9S21y1vTYJl5J8GlaBhtYjPPOqFPa86QA5Nv39qMKVEga5Px1Xwu/hhI7ERna9jaImuajK3ZH7TjYI4wNsbmXP/lQ9fjaqfoZb6itSrLjyTsj+Q8mtzVY4Yj8jY9D/4qUVUjyvgqOAQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=ukCZIDe90pweupxmfBDddRCcGudFsX1bV9Oymu5CYL8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_080605_218489_23EB9516 
X-CRM114-Status: GOOD (  10.97  )
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

The functions ath11k_mac_setup_bcn_tmpl_ema() and
ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
but fail to free it when parameter setup returns an error.

Since beacon templates must be released during normal execution, they
must also be released in the error handling paths to prevent memory
leaks.

Fix this by adding the missing deallocation calls in the respective
error paths.

Compile tested only. Issue found using a prototype static analysis tool
and code review.

Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
Fixes: 335a92765d30 ("wifi: ath11k: MBSSID beacon support")
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4dfd08b58416..005cc81a3244 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1561,8 +1561,10 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
 	}
 
 	if (tx_arvif == arvif) {
-		if (ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb))
+		if (ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb)) {
+			ieee80211_beacon_free_ema_list(beacons);
 			return -EINVAL;
+		}
 	} else {
 		arvif->wpaie_present = tx_arvif->wpaie_present;
 	}
@@ -1623,9 +1625,9 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
 
 	if (tx_arvif == arvif) {
 		if (ath11k_mac_set_vif_params(tx_arvif, bcn))
-			return -EINVAL;
+			goto err;
 	} else if (!ath11k_mac_set_nontx_vif_params(tx_arvif, arvif, bcn)) {
-		return -EINVAL;
+		goto err;
 	}
 
 	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn, 0);
@@ -1636,6 +1638,10 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
 			    ret);
 
 	return ret;
+
+err:
+	kfree_skb(bcn);
+	return -EINVAL;
 }
 
 static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
-- 
2.34.1


