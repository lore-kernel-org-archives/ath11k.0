Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1E6C4829D
	for <ath11k@archiver.kernel.org>; Thu,  8 Feb 2024 12:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F7zquc5IKWhfzSma4+aKZDpv/ZcV006Donj44WtG74c=; b=3unFDhKr3Gzy99QDkZLbdjvplJ
	TBHJyAHYNyqo0W1aPpwOqEJnMkKUaSfuCDpt02viF4IlwapfrZ3nmaPlWpWLUuV0hdflM53JL3Gbd
	iqwNWBEd1Par5C4vTjIPb0S7QFeM0gTsBhm+fALnT+bwj3Ryl+wjl83Bzkw2nnmR/Qp10irgGcgFL
	G51pJ7hUkK4cXQwES9fwMF062v/9K5ETJ+kNqj9On5aRSl9RRFTL1rijdV3le35qYnT3gOb+W3wba
	JCXKU8atqYGqyPKIcWXjVJ+VGDHQCGseP4HrlMpsFSP46BPlaW7gxc6VEKaWMrsSg6wVM/p+urb4G
	RX9TCs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3KZ-0000000Dgii-3u4v;
	Thu, 08 Feb 2024 12:16:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2AO-0000000DUKh-0nFc
	for ath11k@lists.infradead.org;
	Thu, 08 Feb 2024 11:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F007CCE1BCD;
	Thu,  8 Feb 2024 11:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF297C43330;
	Thu,  8 Feb 2024 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707390121;
	bh=dItiFEyA2KueSNhG56f3Chh7xB70o07OSUkqS9fGMtM=;
	h=From:To:Cc:Subject:Date:From;
	b=PbBX3W1yDcAjPLgkxDF9uaB0Mgsr5KZ43QsSes8aAbE2RwUN/c/FTDf89G3inawqa
	 J4w4aL03fZbBFIWVenSLc7dTq2vA8pEltqoYHWGBiE2wu+tCWCuPEKUYFEG/hRsOSY
	 5QAbrV6WDrxXChsToh3I5Hx/Qb8TLDNd79Ly2npTv3+H6sw7KJxhKbGL08pZPgq0Gi
	 8rlGtNK2zaaPX/3dN8hxOUOwVWa5RDkGUCJIOXZVcyaGLvSx1j2PNGTBMEoMx8wevC
	 8xF32JT05zUhA/EfD1d8dnkJLQYX/fT186ZoE98Vdbuh0aYTJh2weYJnQkxf0UOHF9
	 YGP2O3uT/QM3w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	ath11k@lists.infradead.org,
	johannes@sipsolutions.net,
	lorenzo.bianconi@redhat.com,
	kvalo@kernel.org
Subject: [PATCH wireless] wifi: mac80211: remove gfp parameter from ieee80211_obss_color_collision_notify signature
Date: Thu,  8 Feb 2024 12:01:43 +0100
Message-ID: <f91e1c78896408ac556586ba8c99e4e389aeba02.1707389901.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_030204_834375_E7C8D7FF 
X-CRM114-Status: UNSURE (   9.52  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Get rid of gfp parameter from ieee80211_obss_color_collision_notify
signature since it is no longer used.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +--
 include/net/mac80211.h                | 3 +--
 net/mac80211/cfg.c                    | 2 +-
 net/mac80211/rx.c                     | 3 +--
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8a65fa04b48d..ad22f8d775db 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3956,8 +3956,7 @@ ath11k_wmi_obss_color_collision_event(struct ath11k_base *ab, struct sk_buff *sk
 
 	switch (ev->evt_type) {
 	case WMI_BSS_COLOR_COLLISION_DETECTION:
-		ieee80211_obss_color_collision_notify(arvif->vif, ev->obss_color_bitmap,
-						      GFP_KERNEL);
+		ieee80211_obss_color_collision_notify(arvif->vif, ev->obss_color_bitmap);
 		ath11k_dbg(ab, ATH11K_DBG_WMI,
 			   "OBSS color collision detected vdev:%d, event:%d, bitmap:%08llx\n",
 			   ev->vdev_id, ev->evt_type, ev->obss_color_bitmap);
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index d400fe2e8668..9cae95a0c300 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -7416,11 +7416,10 @@ ieee80211_get_unsol_bcast_probe_resp_tmpl(struct ieee80211_hw *hw,
  * @vif: &struct ieee80211_vif pointer from the add_interface callback.
  * @color_bitmap: a 64 bit bitmap representing the colors that the local BSS is
  *	aware of.
- * @gfp: allocation flags
  */
 void
 ieee80211_obss_color_collision_notify(struct ieee80211_vif *vif,
-				      u64 color_bitmap, gfp_t gfp);
+				      u64 color_bitmap);
 
 /**
  * ieee80211_is_tx_data - check if frame is a data frame
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 327682995c92..382b4208cc6a 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4749,7 +4749,7 @@ EXPORT_SYMBOL_GPL(ieee80211_color_change_finish);
 
 void
 ieee80211_obss_color_collision_notify(struct ieee80211_vif *vif,
-				       u64 color_bitmap, gfp_t gfp)
+				      u64 color_bitmap)
 {
 	struct ieee80211_sub_if_data *sdata = vif_to_sdata(vif);
 	struct ieee80211_link_data *link = &sdata->deflink;
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 0bf72928ccfc..73717875e3f6 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3369,8 +3369,7 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 				      IEEE80211_HE_OPERATION_BSS_COLOR_MASK);
 		if (color == bss_conf->he_bss_color.color)
 			ieee80211_obss_color_collision_notify(&rx->sdata->vif,
-							      BIT_ULL(color),
-							      GFP_ATOMIC);
+							      BIT_ULL(color));
 	}
 }
 
-- 
2.43.0


