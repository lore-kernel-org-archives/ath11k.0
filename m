Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DFFC54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fOkuna8tbHEYxapex9XJjFmWsjd27rKeJXMC9tHNkGk=; b=YROHQvL1JvMKgOgyt5tzgsWEqt
	my82euore6kiZMLLhVAJohDtrcSPtQVwKPLOyBKdarZ1Je15KECaEkbTyOqWpzf8UeiLXgupJ1sE/
	oT+u5k9OeNZ47gR6K/sPP3GNJzo8Rh8CJOHIk3BDcKQu7bhcAW3sCcfz8IJf512uDHVwJbqeKeMYM
	luP3KJ6/u2sKnx5V1ZpvxBwspSXc2uVkAEj6LRvj5lGYerZRTyfQnWEJ6R+b8SNXX+4GSmZq8pKfK
	ZjiX3jMcKEzDXqfeqwwd0pN8GX76fR85iGiGCYbI+6bV8Dr4S/ygP7ZC7ZqK1X8RW1hotQQc3xFud
	4OfjZ5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoh1-0000000Cqu2-118F;
	Fri, 31 Jul 2026 14:58:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpogz-0000000CqtR-1CoW
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 14:58:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f96c5b722so685056f8f.0
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785509911; x=1786114711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOkuna8tbHEYxapex9XJjFmWsjd27rKeJXMC9tHNkGk=;
        b=ZxDJcE2kkNAV8Ln3cqlIZfytJYe4LPQ5mQrH1l2PK6+FIUf13vrGdtrmGose7UaQ5K
         w6C8lnGZ0LkGY+r1jk9cZBRCQ62XF+tNni4pyJcLeOdijS+DswphLix7qiwwdOgRhQC5
         XLjeahy09udJE18hnGParrDE9Y0asKNX3IZ6Au5z3mBwDjSpoyYEpopZfCltc1kBGJai
         +tMtMV6D99LvzsJ2EWY5sp6VV7UfT5Zg/jEUwxtzBUrrG7u8yGYSsVNSwvp7x7MscyLJ
         uRO/n7YA7uB6SI8Z0scanjCGqlKAviVWLXnUI8Eqr47sP0IHsriCSS/PN8gp+LM86sXR
         VVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509911; x=1786114711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOkuna8tbHEYxapex9XJjFmWsjd27rKeJXMC9tHNkGk=;
        b=qH0SMeG/DieQxasi9JDfqiwE8hEVkji48hDN0vXtXhOwY5lUJZCm5uOKXSqo7fs48c
         hrhE48mBHOOEmDf4Y8pc3MFy0NXvXiyvgt0pMj5WXOyjJF91cGnA7/tP4RqkWiLrJKfs
         CyYj6SFIZJSU+nrYg14OeGm96kMMWIXibejgIckBtzFyr5ReGha5rKXA/ql3nLrjhGc4
         UiLDB05c7UUU3oBvUtM+uF/hkpO6JoJzX4NXqPqnTy7snAbMiqTyEsqiRYDmid7asgls
         OVUpYJxLQrdAbJ+emF6Fwr/k3KqkS9q+RqNfgWBEKBxhtVMOoghpP2b4zgApA0ykTiyH
         niRg==
X-Gm-Message-State: AOJu0YzXCCfiVjqCuaKm3Y3aZc3HA4emoUxfiGN/XHXZKzlNuefdWt2v
	S/wrcxYpUNHwxvr4h1O3Mpv+/gJsZYiODOm1gZoMz/ss8BcoYWEgwzJjx9YvJw==
X-Gm-Gg: AR+sD10/NYmqeKlheFOTpfOE5tIVJoRbxhTshlUI1HnoKNx8cFHGOMRwsa7v6udR8mb
	ciTyDi6WhSZh8rydibRgs/0CJNz1noy+EczD+eM3fJdm6gtL6zy7m1i1WR0HxJVUVGPPR8sFMgh
	lyLGJxvC5AU5NEmVEa2zuWDngV/aqpbp3858LguiwReTFEsGEgGvHGpvLcN+LR9uYwoMydinpAN
	MKslOCIbFrRduj9JwCw3GgSDyIkG4Gx9csFXHHb+e8EoCsQ0nDAcO+b8Vkf8byCrbolKQHIPSG3
	2KJg0Gp35229TRr00i7wI3SBanQeHd4vkY/7+qoRDzIYloyl2qgWFW2mw6ko9OtYwkxgrpkxQKg
	Prz8Kn7N6ARHWPIArki6+irBi+kSGs+nfNTrXwP4vL3UB5Wj2jXRTGeke78nfIF8yQTUhZMJGZB
	RWI/kvBdNef5Xvf1KDh6sbSld9Nx+PEM++ggDdPTTeh+1kc5fCefVO5IKvSu9wMuRcqZQoCpLf8
	OLFA89d4NVJRxgYi6AN9w==
X-Received: by 2002:a05:6000:2f84:b0:47f:9ac6:ca60 with SMTP id ffacd0b85a97d-47fd726220emr53142f8f.0.1785509911380;
        Fri, 31 Jul 2026 07:58:31 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm5881665f8f.1.2026.07.31.07.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:58:30 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-current v3] wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
Date: Fri, 31 Jul 2026 16:58:30 +0200
Message-ID: <20260731145830.769811-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_075833_348702_52462A6E 
X-CRM114-Status: GOOD (  13.98  )
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
ath11k_mac_station_remove(). In that function we clean up both peers &
arsta related resources.

But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
assumes that all driver related resources are cleaned up beforehand. This
cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
in fact free arsta->rx_stats / tx_stats.

This extract the arsta cleanup from ath11k_mac_station_remove() into a
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

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
v3:
	- changed the fixes to the first one that introduced the issue
	- addressed the commit message nits from review
	- fixed the Tested-on to include hw version
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


