Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDAFC433F5
	for <ath11k@archiver.kernel.org>; Tue,  3 May 2022 06:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31xbutGqAeqBPUpSZnmxJwmZbbb55Qm9t83zQSfL+p8=; b=DPOaKnoDwvhhyP
	y6xHCW41WolMdkriaVL5X8/kNiTZgki5OlZ1rB6AY90vUMxnHnwHCI+lWynodPg98RcSmxAz3z9wy
	/uVY+0Wfb4Yxi5pw6gAVeBc32BGrQdbEcIxKeiP3yA8SV01B2xeBIV9uykSRAGgaAGAgTL2Bkwiu/
	Lew58gvY+EzKk7LJi83u2NerzY23KZ6YD9Wod9rw0Yzo+68nTZlga4L6Gvq4BIqZSa670NBFLIi+9
	ZOHN8vszbFJIlVKcr03TCVIo832bDoIOk5j4DeLRcs6dc+c87hY9+zBxf+vXxZSblzRmsM4eF7/9B
	oK2u3jAGOWLna5KtCZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlle6-003nze-6t; Tue, 03 May 2022 06:04:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlle2-003nvg-Sc
 for ath11k@lists.infradead.org; Tue, 03 May 2022 06:04:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57C0CB81A99
 for <ath11k@lists.infradead.org>; Tue,  3 May 2022 06:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643EBC385AF;
 Tue,  3 May 2022 06:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651557859;
 bh=EvdgrcgpdiBbXp+X43whOkPl5MOnDiwPgm4Llg/4DbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ekjL7rR0faEVTP1ESde3+frYFdxJjhLBcFe39c4k3cFA8XCdO4uT38ENex3X32npZ
 i5CupZg1VnT+R4J9AL1nkZj/Pc74LZ0QsX6cBuIWAG78bK0G4tMyXryTFDh/cDNpNY
 Bc7JsfTwHqZ6OntjewQoYIXbapc3Big5meisW5i3m8+F3GkJWsHThUb/HswY3t1w/8
 RGnuT368GHAlrchbbPUAtwzU8nzBVV0ZiEU6jCFF3LfeEkt3hH+oTaEcZ3zxLRVdNe
 aEsfdrqqz9IWAv5aFeAgk5z81jo25FtA/1nOmE774ysxWxSU+Vf+fssOw6NwD89qWV
 RN9TNhfmiGTvw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] ath10k: mac: fix too long lines
Date: Tue,  3 May 2022 09:04:15 +0300
Message-Id: <20220503060415.24499-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503060415.24499-1-kvalo@kernel.org>
References: <20220503060415.24499-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_230423_248668_C1C6A2B3 
X-CRM114-Status: GOOD (  12.88  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

checkpatch warns:

drivers/net/wireless/ath/ath10k/mac.c:2696: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath10k/mac.c:6942: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath10k/mac.c:6948: line length of 91 exceeds 90 columns

These were introduced by commit 046d2e7c50e3 ("mac80211: prepare sta handling
for MLO support").

Compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 06a51a48c1d9..3570a5895ea8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2692,8 +2692,10 @@ static bool ath10k_mac_sta_has_ofdm_only(struct ieee80211_sta *sta)
 static enum wmi_phy_mode ath10k_mac_get_phymode_vht(struct ath10k *ar,
 						    struct ieee80211_sta *sta)
 {
+	struct ieee80211_sta_vht_cap *vht_cap = &sta->deflink.vht_cap;
+
 	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_160) {
-		switch (sta->deflink.vht_cap.cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK) {
+		switch (vht_cap->cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK) {
 		case IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ:
 			return MODE_11AC_VHT160;
 		case IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ:
@@ -6926,6 +6928,9 @@ static int ath10k_mac_validate_rate_mask(struct ath10k *ar,
 					 struct ieee80211_sta *sta,
 					 u32 rate_ctrl_flag, u8 nss)
 {
+	struct ieee80211_sta_ht_cap *ht_cap = &sta->deflink.ht_cap;
+	struct ieee80211_sta_vht_cap *vht_cap = &sta->deflink.vht_cap;
+
 	if (nss > sta->deflink.rx_nss) {
 		ath10k_warn(ar, "Invalid nss field, configured %u limit %u\n",
 			    nss, sta->deflink.rx_nss);
@@ -6933,19 +6938,19 @@ static int ath10k_mac_validate_rate_mask(struct ath10k *ar,
 	}
 
 	if (ATH10K_HW_PREAMBLE(rate_ctrl_flag) == WMI_RATE_PREAMBLE_VHT) {
-		if (!sta->deflink.vht_cap.vht_supported) {
+		if (!vht_cap->vht_supported) {
 			ath10k_warn(ar, "Invalid VHT rate for sta %pM\n",
 				    sta->addr);
 			return -EINVAL;
 		}
 	} else if (ATH10K_HW_PREAMBLE(rate_ctrl_flag) == WMI_RATE_PREAMBLE_HT) {
-		if (!sta->deflink.ht_cap.ht_supported || sta->deflink.vht_cap.vht_supported) {
+		if (!ht_cap->ht_supported || vht_cap->vht_supported) {
 			ath10k_warn(ar, "Invalid HT rate for sta %pM\n",
 				    sta->addr);
 			return -EINVAL;
 		}
 	} else {
-		if (sta->deflink.ht_cap.ht_supported || sta->deflink.vht_cap.vht_supported)
+		if (ht_cap->ht_supported || vht_cap->vht_supported)
 			return -EINVAL;
 	}
 
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
