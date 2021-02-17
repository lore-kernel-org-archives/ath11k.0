Return-Path: <SRS0=IuQG=HT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B004AC433E9
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 11:57:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ECAA61481
	for <ath11k@archiver.kernel.org>; Wed, 17 Feb 2021 11:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ECAA61481
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZofhLavozZCZHRtNt/uZAIUdoAi/JPA6/oRmrCe4AhY=; b=ckzYYJ99DE2Ts1lrpqUgWJjPFu
	PswuVq2wLoQqdiHw1KpCsd4Vk91A6ZwB7rwdZahMJf/p2pGQYPQld84uiF0zD8/Fjl1pAqxOCe/wu
	DJpIeGVC9PkgOKYMyFqFWCHPPeqDzrpRNYh44ZSzgvu1CoE8w0UqbZQh9NWiWK+yVurCd3NCJF5M/
	LrSUKA9bsKzb2SwWKpGlWC1CudJ7C54lw2d4iBIIzmdcrOxOktYXiGYeqyT9q5NZi7Hl0Z1tE7ucl
	WqZeiSIoxOZpNscAQsbS2R0x6nbmJh0Ho0rEd8CJTxoP+kGdd9IktuSgWuv845l6QT7rD5RR71cgn
	JccPAWpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCLSM-0007ot-HX; Wed, 17 Feb 2021 11:57:22 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCLSH-0007nd-Mk
 for ath11k@lists.infradead.org; Wed, 17 Feb 2021 11:57:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613563039; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=riFDcM3p4VX4CUlYm2Faw86Y7pJE14LIreXAK+QKenI=;
 b=q5PeqllScsteysXfCRtMuVTcoeskqAalteOluK5Z/y9L1NCKfBXnywHjDvjbPpB40zUdjvti
 1zRRA0p6d4y4O8rs09QjDWNX19rQ7lrOP6+Df42cCLd5ySEEKbb3qj5D2XvwTAxYmP4iGoVT
 f+VIYdy1jraVL9HwAjgLpmDz/EM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 602d0494a294c935b7a506b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 11:57:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C4E3EC433ED; Wed, 17 Feb 2021 11:57:07 +0000 (UTC)
Received: from cdchalpyex0390930-lin.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tmariyap)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B7A7C433CA;
 Wed, 17 Feb 2021 11:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B7A7C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tmariyap@codeaurora.org
From: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCHv2] mac80211: increment rx stats according to USES_RSS flag
Date: Wed, 17 Feb 2021 17:26:50 +0530
Message-Id: <1613563010-1489-1-git-send-email-tmariyap@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_065719_946750_034AEEA1 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Thiraviyam Mariyappan <tmariyap@codeaurora.org>,
 linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently, rx_stats were updated regardless of USES_RSS flag is
enabled/disabled. So, updating the rx_stats from percpu pointers
according to the USES_RSS flag.

Signed-off-by: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
---
v2:
*Subject(mac80211: fix rx byte values not updated on mesh link) and commit
log changed.
---
 net/mac80211/mesh.h       |  2 ++
 net/mac80211/mesh_plink.c |  4 ++-
 net/mac80211/rx.c         | 75 +++++++++++++++++++++++++++++++----------------
 3 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/net/mac80211/mesh.h b/net/mac80211/mesh.h
index 40492d1..c8d9103 100644
--- a/net/mac80211/mesh.h
+++ b/net/mac80211/mesh.h
@@ -318,6 +318,8 @@ void mesh_path_discard_frame(struct ieee80211_sub_if_data *sdata,
 void mesh_path_tx_root_frame(struct ieee80211_sub_if_data *sdata);
 
 bool mesh_action_is_path_sel(struct ieee80211_mgmt *mgmt);
+struct ieee80211_sta_rx_stats *ieee80211_get_rx_stats(struct ieee80211_hw *hw,
+						      struct sta_info *sta);
 
 #ifdef CONFIG_MAC80211_MESH
 static inline
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index aca26df..44b6ebb 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -416,6 +416,7 @@ static void mesh_sta_info_init(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_supported_band *sband;
 	u32 rates, basic_rates = 0, changed = 0;
 	enum ieee80211_sta_rx_bandwidth bw = sta->sta.bandwidth;
+	struct ieee80211_sta_rx_stats *stats;
 
 	sband = ieee80211_get_sband(sdata);
 	if (!sband)
@@ -425,7 +426,8 @@ static void mesh_sta_info_init(struct ieee80211_sub_if_data *sdata,
 					&basic_rates);
 
 	spin_lock_bh(&sta->mesh->plink_lock);
-	sta->rx_stats.last_rx = jiffies;
+	stats = ieee80211_get_rx_stats(&local->hw, sta);
+	stats->last_rx = jiffies;
 
 	/* rates and capabilities don't change during peering */
 	if (sta->mesh->plink_state == NL80211_PLINK_ESTAB &&
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index c1343c0..7c06ea2 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -78,6 +78,15 @@ static struct sk_buff *ieee80211_clean_skb(struct sk_buff *skb,
 	return skb;
 }
 
+struct ieee80211_sta_rx_stats *ieee80211_get_rx_stats(struct ieee80211_hw *hw,
+						      struct sta_info *sta)
+{
+	if (ieee80211_hw_check(hw, USES_RSS))
+		return this_cpu_ptr(sta->pcpu_rx_stats);
+	else
+		return &sta->rx_stats;
+}
+
 static inline bool should_drop_frame(struct sk_buff *skb, int present_fcs_len,
 				     unsigned int rtap_space)
 {
@@ -1720,11 +1729,13 @@ ieee80211_rx_h_sta_process(struct ieee80211_rx_data *rx)
 	struct sk_buff *skb = rx->skb;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_sta_rx_stats *stats;
 	int i;
 
 	if (!sta)
 		return RX_CONTINUE;
 
+	stats = ieee80211_get_rx_stats(&rx->sdata->local->hw, sta);
 	/*
 	 * Update last_rx only for IBSS packets which are for the current
 	 * BSSID and for station already AUTHORIZED to avoid keeping the
@@ -1734,49 +1745,49 @@ ieee80211_rx_h_sta_process(struct ieee80211_rx_data *rx)
 	 * something went wrong the first time.
 	 */
 	if (rx->sdata->vif.type == NL80211_IFTYPE_ADHOC) {
-		u8 *bssid = ieee80211_get_bssid(hdr, rx->skb->len,
+		u8 *bssid = ieee80211_get_bssid(hdr, skb->len,
 						NL80211_IFTYPE_ADHOC);
 		if (ether_addr_equal(bssid, rx->sdata->u.ibss.bssid) &&
 		    test_sta_flag(sta, WLAN_STA_AUTHORIZED)) {
-			sta->rx_stats.last_rx = jiffies;
+			stats->last_rx = jiffies;
 			if (ieee80211_is_data(hdr->frame_control) &&
 			    !is_multicast_ether_addr(hdr->addr1))
-				sta->rx_stats.last_rate =
+				stats->last_rate =
 					sta_stats_encode_rate(status);
 		}
 	} else if (rx->sdata->vif.type == NL80211_IFTYPE_OCB) {
-		sta->rx_stats.last_rx = jiffies;
+		stats->last_rx = jiffies;
 	} else if (!ieee80211_is_s1g_beacon(hdr->frame_control) &&
 		   !is_multicast_ether_addr(hdr->addr1)) {
 		/*
 		 * Mesh beacons will update last_rx when if they are found to
 		 * match the current local configuration when processed.
 		 */
-		sta->rx_stats.last_rx = jiffies;
+		stats->last_rx = jiffies;
 		if (ieee80211_is_data(hdr->frame_control))
-			sta->rx_stats.last_rate = sta_stats_encode_rate(status);
+			stats->last_rate = sta_stats_encode_rate(status);
 	}
 
-	sta->rx_stats.fragments++;
+	stats->fragments++;
 
-	u64_stats_update_begin(&rx->sta->rx_stats.syncp);
-	sta->rx_stats.bytes += rx->skb->len;
-	u64_stats_update_end(&rx->sta->rx_stats.syncp);
+	u64_stats_update_begin(&stats->syncp);
+	stats->bytes += skb->len;
+	u64_stats_update_end(&stats->syncp);
 
 	if (!(status->flag & RX_FLAG_NO_SIGNAL_VAL)) {
-		sta->rx_stats.last_signal = status->signal;
+		stats->last_signal = status->signal;
 		ewma_signal_add(&sta->rx_stats_avg.signal, -status->signal);
 	}
 
 	if (status->chains) {
-		sta->rx_stats.chains = status->chains;
+		stats->chains = status->chains;
 		for (i = 0; i < ARRAY_SIZE(status->chain_signal); i++) {
 			int signal = status->chain_signal[i];
 
 			if (!(status->chains & BIT(i)))
 				continue;
 
-			sta->rx_stats.chain_signal_last[i] = signal;
+			stats->chain_signal_last[i] = signal;
 			ewma_signal_add(&sta->rx_stats_avg.chain_signal[i],
 					-signal);
 		}
@@ -1838,8 +1849,8 @@ ieee80211_rx_h_sta_process(struct ieee80211_rx_data *rx)
 		 * Update counter and free packet here to avoid
 		 * counting this as a dropped packed.
 		 */
-		sta->rx_stats.packets++;
-		dev_kfree_skb(rx->skb);
+		stats->packets++;
+		dev_kfree_skb(skb);
 		return RX_QUEUED;
 	}
 
@@ -2202,6 +2213,7 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
 	unsigned int frag, seq;
 	struct ieee80211_fragment_entry *entry;
 	struct sk_buff *skb;
+	struct ieee80211_sta_rx_stats *stats;
 
 	hdr = (struct ieee80211_hdr *)rx->skb->data;
 	fc = hdr->frame_control;
@@ -2330,8 +2342,10 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
  out:
 	ieee80211_led_rx(rx->local);
  out_no_led:
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = ieee80211_get_rx_stats(&rx->sdata->local->hw, rx->sta);
+		stats->packets++;
+	}
 	return RX_CONTINUE;
 }
 
@@ -3124,6 +3138,7 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *) rx->skb->data;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(rx->skb);
 	int len = rx->skb->len;
+	struct ieee80211_sta_rx_stats *stats;
 
 	if (!ieee80211_is_action(mgmt->frame_control))
 		return RX_CONTINUE;
@@ -3405,16 +3420,20 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	return RX_CONTINUE;
 
  handled:
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = ieee80211_get_rx_stats(&local->hw, rx->sta);
+		stats->packets++;
+	}
 	dev_kfree_skb(rx->skb);
 	return RX_QUEUED;
 
  queue:
 	skb_queue_tail(&sdata->skb_queue, rx->skb);
 	ieee80211_queue_work(&local->hw, &sdata->work);
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = ieee80211_get_rx_stats(&local->hw, rx->sta);
+		stats->packets++;
+	}
 	return RX_QUEUED;
 }
 
@@ -3457,6 +3476,7 @@ ieee80211_rx_h_action_post_userspace(struct ieee80211_rx_data *rx)
 	struct ieee80211_sub_if_data *sdata = rx->sdata;
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *) rx->skb->data;
 	int len = rx->skb->len;
+	struct ieee80211_sta_rx_stats *stats;
 
 	if (!ieee80211_is_action(mgmt->frame_control))
 		return RX_CONTINUE;
@@ -3480,8 +3500,10 @@ ieee80211_rx_h_action_post_userspace(struct ieee80211_rx_data *rx)
 	return RX_CONTINUE;
 
  handled:
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = ieee80211_get_rx_stats(&rx->sdata->local->hw, rx->sta);
+		stats->packets++;
+	}
 	dev_kfree_skb(rx->skb);
 	return RX_QUEUED;
 }
@@ -3575,6 +3597,7 @@ ieee80211_rx_h_mgmt(struct ieee80211_rx_data *rx)
 {
 	struct ieee80211_sub_if_data *sdata = rx->sdata;
 	struct ieee80211_mgmt *mgmt = (void *)rx->skb->data;
+	struct ieee80211_sta_rx_stats *stats;
 	__le16 stype;
 
 	stype = mgmt->frame_control & cpu_to_le16(IEEE80211_FCTL_STYPE);
@@ -3625,8 +3648,10 @@ ieee80211_rx_h_mgmt(struct ieee80211_rx_data *rx)
 	/* queue up frame and kick off work to process it */
 	skb_queue_tail(&sdata->skb_queue, rx->skb);
 	ieee80211_queue_work(&rx->local->hw, &sdata->work);
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = ieee80211_get_rx_stats(&rx->sdata->local->hw, rx->sta);
+		stats->packets++;
+	}
 
 	return RX_QUEUED;
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
