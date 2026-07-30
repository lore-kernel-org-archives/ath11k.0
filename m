Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBBEC55165
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SVONJagphCYgvWyOuOSu9ImQNoUm/arR9Ke6F2TkUIk=; b=J2qNYK4+GGI1+8j8JkfI8A+yWE
	vPDYAkH/XOWHO0i6oBkjBtmILSFA1f452d4/Dlth/DcfFPwxwEbeOjHcGu04m6pvVXN2VDfbkwtZ7
	oSRKJIvUg/M4vbvzedQN9kk1nCvbCyBIwz+sTLjoXWRKLjof+HVX/LA3jfBVCMQXEP+YFtjEUAyk9
	8ta4cCtEa/ogdt2vjJyqnJSlCwAb3RUACKajlriO8rmoLVoLckbPlkVY5pPuu4RhbfTMqVT5ez6Be
	60hYjzsAPx35bIHsM4YbHsUF+oKOwOjKQMxxEQn8sAn3AoWq7KSJr80vGarOKF8USM1TE2HRo/rpR
	vQPswFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRLK-0000000AgpR-0p78;
	Thu, 30 Jul 2026 14:02:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRLH-0000000Agoh-3SPA
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 14:02:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f97d310caso2120071f8f.2
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420154; x=1786024954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVONJagphCYgvWyOuOSu9ImQNoUm/arR9Ke6F2TkUIk=;
        b=WweUIQaawNZNBnYlHCwowJrchKc/QsgmoG/EnVO9fyz0f0cOvxGcCIQ7oJH8PUzzEr
         3QxVQnlgdsHG3qbLDqWkOZ3fUy1/57xgh2KDf6XipsTlDrdbhgUFRY+i86ZU1kQVSsE2
         qYkNcNRG2OQ5z0LzLe3oGL+mykvdrlt1d0rRJR7IXygYlMC2S7liICFkAPIBYqP31H3s
         NqQxI71yxsoGTng3dKcditmWXBVLd5flsIIY76sgaMd/BcydwCX75tl/KG8wHw9GrHh5
         twJ35elNE5OECs8UeeiX3nnulvlGHvH+lLsO5dlTLWNPGpVNpaUCTtxvN9YpCRHqvuOf
         agbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420154; x=1786024954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVONJagphCYgvWyOuOSu9ImQNoUm/arR9Ke6F2TkUIk=;
        b=lBrQiPRFFe7/WDjGD6bjbUI1pe3nks6INao/v2cBFbUxllZ7cgDGThD+2IWNFOLVLe
         jZYtRtvJc9Ye8DFKoh29B9Zln2pw7fV3LkO9B0pAMSCC9cymyoZUQF4qJDm2CJbP/LKo
         P4OymBJlars4IGfkjGz3B5H1MaDOgvJwJJlBsFFaJlZnv3aDfdSYMAXqBeUFXMAMt6C2
         dzQdqhAiFy0Yi8kG9Gwhw4XFxIpPpWmNqiRuD318PdEzwB3o17vOfvmSJcwwlme7fuZl
         Fj5ioJAY+Sda7Nk7vaQiFuc8b0TiO14vmzkNEaNbTMAPzm4oSZ2gYdlE5potvyUSBhQR
         2PYw==
X-Gm-Message-State: AOJu0YxEmuGTiKDabsiCjr1LZS1P5bNoVjvzlUu5UDG6QFs5YSk+3jec
	BoHqts4Qv0hgPo8FnyASQnv4dprm6yYI+2kWuVwxW5vqsnAzhz7GMogg3ZwuZA==
X-Gm-Gg: AR+sD11ooYZ9wVxrPrH36JgoRRzd75G9zhPI42BeA0Ab4ZFeYSc1eSy/uXZPTvp6G0L
	J/UqBFXa0nATFUYtQGkJ5bv4Y/jGD6gvpCKJK56yTAJEVSoj6hwXq8PmbZDVh8cUhdtA1xHKAuc
	nf3KKl5/TX9Kg+2/rlQDhPBpIMRnlCrI4Kslk77WJtgnMa22jzvfMqIweiPLh1plPmi8bSFOQ4O
	RA+BfT+dz9mcFCJ90XofiLHj8Dlu93iH94tTsq2fhGg5qz8zs6/Ch0lxbEZ91LeA5v5DfPCJPDW
	Bi+EqTKHvivu5TjABkMZ/DeireKK5l+2iJVY9tlNIOYUJ1vHXodUdVltguaKg1vbRhaCXK7cAPa
	drl1seXyPwqQPIeURoNdTmQE9v/cZLMXqajNb04JuFq4BsNlad9FBF8wyU6TZbBQfuXPJi1lozB
	Urg+udw+pFL4mKOyXTwpQE/+nVAbLHw9l07MDKPCy9BSg29e3N80G7pnU1rG7/8dBXnTwJinA54
	j5HLf2hzaDD1QgFC8S5lg==
X-Received: by 2002:a5d:5f55:0:b0:47f:873a:6ae7 with SMTP id ffacd0b85a97d-47fc81fbfa7mr3928041f8f.41.1785420153485;
        Thu, 30 Jul 2026 07:02:33 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e3c73sm6973351f8f.10.2026.07.30.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:02:33 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-current v2] wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
Date: Thu, 30 Jul 2026 16:02:32 +0200
Message-ID: <20260730140232.133500-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070235_878878_1FE5D709 
X-CRM114-Status: GOOD (  15.45  )
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

When mac80211 removes a sta, it calls .sta_state() which in turn calls
ath11k_mac_station_remove(). In that function we clean up both  peers &
arsta related resources.

But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
assumes that all driver related resources are cleanup up beforehand. This
cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
in fact free arsta->rx_stats / tx_stats.

So lets extract the arsta cleanup from ath11k_mac_station_remove() into a
new ath11k_mac_station_cleanup() and call it from both there and
ath11k_mac_peer_cleanup_all().

This should handle kmemleaks reports like:
	unreferenced object 0xffffff801ae66400 (size 1024):
	  comm "hostapd", pid 1306, jiffies 4295011565
	  hex dump (first 32 bytes):
	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	  backtrace (crc d61c08ec):
	    kmemleak_alloc+0x3c/0x50
	    __kmalloc_cache_noprof+0x2b0/0x3e0
	    ath11k_mac_op_sta_state+0x1dc/0xb10
	    drv_sta_state+0xac/0x6f8
	    sta_info_insert_rcu+0x314/0x5e0
	    sta_info_insert+0x14/0x38
	    ieee80211_add_station+0x10c/0x1a0
	    nl80211_new_station+0x3e8/0x680
	    genl_family_rcv_msg_doit+0xc0/0x120
	    genl_rcv_msg+0x1b4/0x258
	    netlink_rcv_skb+0x4c/0x108
	    genl_rcv+0x38/0x60
	    netlink_unicast+0x190/0x278
	    netlink_sendmsg+0x15c/0x370
	    ____sys_sendmsg+0x120/0x290
	    ___sys_sendmsg+0x70/0xa0

Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: 9d5f28c1366f ("wifi: ath11k: fix connection failure due to unexpected peer delete")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 Note: this problem is in fact older that the referenced commit, but as
 it would need another patch to backport to older kernel and the leak is
 quite minimal & seldom happens, I was hopping to not have to do it.

v2:
	- rebased on ath/master
	- no code change
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..ae91b57c8422 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -873,6 +873,22 @@ static int ath11k_mac_set_kickout(struct ath11k_vif *arvif)
 	return 0;
 }
 
+static void ath11k_mac_station_cleanup(struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta;
+
+	if (!sta)
+		return;
+
+	arsta = ath11k_sta_to_arsta(sta);
+
+	kfree(arsta->tx_stats);
+	arsta->tx_stats = NULL;
+
+	kfree(arsta->rx_stats);
+	arsta->rx_stats = NULL;
+}
+
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 {
 	struct ath11k_peer *peer, *tmp;
@@ -885,6 +901,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
 		ath11k_peer_rx_tid_cleanup(ar, peer);
 		ath11k_peer_rhash_delete(ab, peer);
+		ath11k_mac_station_cleanup(peer->sta);
 		list_del(&peer->list);
 		kfree(peer);
 	}
@@ -9892,7 +9909,6 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
-	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
 	int ret;
 
 	if (ab->hw_params.vdev_start_delay &&
@@ -9916,12 +9932,7 @@ static int ath11k_mac_station_remove(struct ath11k *ar,
 			   sta->addr, arvif->vdev_id);
 
 	ath11k_mac_dec_num_stations(arvif, sta);
-
-	kfree(arsta->tx_stats);
-	arsta->tx_stats = NULL;
-
-	kfree(arsta->rx_stats);
-	arsta->rx_stats = NULL;
+	ath11k_mac_station_cleanup(sta);
 
 	return ret;
 }
-- 
2.55.0


