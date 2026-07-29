Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9EDC53200
	for <ath11k@archiver.kernel.org>; Wed, 29 Jul 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bnmnf9SqJG6mZgDQIIp9mSuGnfZpkLOn/2WYJqyjMdA=; b=Fl0fv5MRX0t6Ny5wqDbjNMQUsd
	V5rYXPZwr3g+9fEqx/KAq1EZA1JP9YJ+Un1igFShC6ebwHtuP3iY02avfrIxBes9yYIkn02R5xioe
	ROa0qhQqrUU88IMDP1QnL1Zl4/4wptpYuEzkWbTWBrGg5DTZUlCb8BVatZi/YpFiJSD/bdnjMsVVE
	DdajhznFK7FvGFH4X9bkc1jO6AxR0VHMw1fSsMx2/bg6KLbuDH7oLen2f8Ifn73F3EDCKCnahv5/9
	bh7fMre/i0AcHPgOHBHT13Gx81mdFlXsJotOqQ/B/9wZbW5OTTcQI1yyUwhTx0HN1GFcOUe+wkFvN
	cYRt6pJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Bq-00000007J38-1EiH;
	Wed, 29 Jul 2026 09:03:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0Bl-00000007J2L-25zd
	for ath11k@lists.infradead.org;
	Wed, 29 Jul 2026 09:03:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4956869750eso4924885e9.2
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785315776; x=1785920576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bnmnf9SqJG6mZgDQIIp9mSuGnfZpkLOn/2WYJqyjMdA=;
        b=LAupIAGQK4Rz7hawUwOUEeyXs8PxIDgJh++vNrCy8Eo6XStsqgBGMLzibFoab06srY
         xx3yWuX0DxE/ACMM1xBS6wIMqHk1VQFiFZBVyMPkw1aSnqUSJ45cW4xVKJenP4HgMXEG
         +25HtRLB9OmGf8mUiUC7tARZ3LH3MO91g4nYUme0G3jb+F87p8VB79XRhYGJHkBVnZMS
         js7Rnx/TnYzBWs+5dch5LpsyxD3r5OObLvJ4EQc9CR7cmVG9SqeaJG57MUjQRNlHYe/7
         F7Ut8HLrBrebjhdE+1u13UDuthynUscedya66cGyZUbi6/oEmk5CvcMYWxJjU1xjOV8X
         Muww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315776; x=1785920576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bnmnf9SqJG6mZgDQIIp9mSuGnfZpkLOn/2WYJqyjMdA=;
        b=FYsv4kcdeuX8jZCoTb8Ci+G/s6hv3jxCU4weq0HsYWGNT1MVVytomPx/WeAwXJCZk7
         sRx/SDxjVafuDLjhGxbcql09tpjbHEVA8PwYJ0f14UQ1bfBOWBkWQLrKmzngKLWt0fsN
         Uy7f04VwKHYHWZvslr1Em4gJIF0zrSK6b84b3xdxJEJkYrpJb+sUtCcMljf5Mdr8C5gG
         wAYSScHF12Ezkh7UW4omyfDnZGg7F00T/E9l4z4D94ayglHhPkWs501xkk3a9vpwD3TN
         ajaws742QW2MFqrX6XFtTpb/HHMp2+p/VYUG2XgKB8KDvD8UpCHizLW4eH18RI6DQnui
         YtJw==
X-Gm-Message-State: AOJu0Yy+fA5E9LApNEOAUGEdmG4htvLQhQ6yCfxH3/GUHvw4JXlbnu1j
	35RgcnJstEMtHTGwE9ZWT/wJzR2QxPjSdpIWMH01U27Lf5fWO3pmqJHMt/NFdw==
X-Gm-Gg: AR+sD10z81hX1msf6NFiL6Laeny+sKkyO9lmXjdJaRd++JtP7Tg8eEkUGXA4QBMSrH4
	fOiUoF9WEDVUoMOwtzB0pFk0PEI+QZtGU4fGqBgtVDpPXYYMGH5hRW3wWTZ4f5CeLXqMB7VODSv
	pybe5SUt80hsjS8+ZJjPUv+i0cwYNemwtVlIZAisWjSUtsZ28vCbuAn6vZkOdTHsORAHfPHdl46
	mDXR8KBe6uyKi/AcWPx6O8a2cLfmKFzVfwPwjbec9Q/HhorTVjiU9akWdwx56B7L0dRlxUG19Sb
	BWHzg0zu0gMio6Kr3l8IYPFriBx580+73kCSHgs4xIma5dsKeTs5Yzjxvw+3qWBmtDb4WzhROOv
	0haFtY1WDoGQerGm8QVrdeWwepStNWm6rZUyWglnmLM6aWg6RnDHwLQtRTJxjmQuN7z8y0+LAbE
	Xh/QSKch7/BNiz+3AL8tbFVIIJR5MLV3jc435JZMdwd40+QYytsOc1WaO7q9EpQqywVKi4QPaTG
	ig8uUWZsvM1mG2I/gHOECJfFIATvA0g
X-Received: by 2002:a05:600c:1d19:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-496c641518dmr74184585e9.2.1785315775341;
        Wed, 29 Jul 2026 02:02:55 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b0535sm135375355e9.4.2026.07.29.02.02.54
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:02:55 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Subject: [PATCH ath-current] wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
Date: Wed, 29 Jul 2026 11:02:54 +0200
Message-ID: <20260729090254.3487856-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_020257_574642_A8256903 
X-CRM114-Status: GOOD (  15.07  )
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
 Note the problem this is in fact older that the referenced commit, but as
 it would need another patch to backport to older kernel and the leak is
 quite minimal & seldom happens, I was hopping to not have to do it.

 Sent by mistake to ath12k list, sorry for the noise.
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


