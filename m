Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC1FCCF2C4
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xsuOl66B+NTjagROmLIHJ/ZmiibRBs0hE2dnTH1r3+4=; b=uIj2BKaIJto1/OCbP7hDQJMxUu
	zBz6kzD0Y6QVpPFLa5Z6PBwEfAEstiCh5nxT2ljS91MU2Tw/bNWWGIz4Ftirqg4Wz5xgPrSpnSgHq
	Gvwf9yemqgLWl09mJjUdWBIDxl5Fi0WmyihGlsimZ0gEWaUXPy15SXUfjupxI3y/rW7qSjvJc8qJj
	rgCVtG0UeHjltlgCxrkPuPHYHaPa+vUfd0rIl1uSjdGPUGpSmTKnLXb9WI/D+YOA3HVohtABhFq+y
	5AnkW+cT1Ywv6Fob5CHYBbvLTYd03Fl0fjj/FUuPQ+oX0n4STA5hTO+AH3hncXdkzXVeI46NUZMxm
	BTw5jLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUWR-000000065Hj-1QAE;
	Sun, 18 Oct 2026 17:18:11 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUWO-000000065HP-3Eg9
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:18:09 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso2135614a12.3
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792343887; x=1792948687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsuOl66B+NTjagROmLIHJ/ZmiibRBs0hE2dnTH1r3+4=;
        b=UIAGoNMvP8YppsmjVEQIlqUz7q/IvorNWoQQoX2Yvd6bDvpJIwP6fQNi8Q47JD6wsM
         eVbxgKBqUjzN0M5XUg9Qu35qHzRU/GEX6XoQk2u2G77eGeE2vFZzHeDkFfMP+Q91ZzsG
         Z8plevKZo7UlTbVHcc7+jaKfX8pMzXyo/Rh3fQR9husRcrTLf65O5vYebIo/72jy1ZN6
         NIKtAM2bmi5X7Wj2jVc9efrDdhUjehAaCxdlpkxO9qnl+GPN+f5JGK5pe+0kpT5zkJit
         KBYR+fHHbPUPguuJkAaMU1AE3WjdMJechw8bleutePAxvttcEeAlXtrtN2ijTY/2dvih
         aZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343887; x=1792948687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsuOl66B+NTjagROmLIHJ/ZmiibRBs0hE2dnTH1r3+4=;
        b=Twt8JnP/CY6RbZr8AqMws/GGu0OaAu2orzgJTCpuhKFfSXZBQ4T6HJC+5VNo8/86ys
         IJ1okfZeB4eSq7Cs1kGf/VFYskbg80Xxc8erbwJGXSG7PuBK462kmFNn8r8brhupOYEr
         BmlsSDdlrxyILo3O/lr5onHAHvPDsRhDvOXwjXXhlLGoyjhKpSG27OTmCB3f1BAg7j8h
         UqcoGRKRnV54d4KPPXfC7t7wjsGLsbO5Cp3jxK52YJQefp089wWwcDeuXi6UjLBSLgMj
         okzLU1v2+smA6YFAED3EqKfWdNcBa8LMexGsBscWwN+X2a+zaGaI+Ei46Hfr+d5dtpsr
         1rjA==
X-Forwarded-Encrypted: i=1; AKwUvByNc5VQdnPn+DJVuoOgL4DYpxa3O1TsVL9nxTMiUcpt8cI+qMeaesvCJ1LvaMAb3jwACMYbxII=@lists.infradead.org
X-Gm-Message-State: AFq9FYLH+FcpHLyoJROyvEinounTtaYZrf+Dz9Su3z0zfZUrCVCcynUP
	hbLcGe7F4LYuOJOrrJJyvTuqBoSP44zSq0KlvSG4UtV5oNqXm2oiCNVrYABpAyI1RldFRzobdkM
	+/sBsHRIgpv0=
X-Gm-Gg: AYBFou1PlUP2NNvu4G12NIDujaHo1O4u8JmLExEX873gF1ygX2M6MbcnAfsDZjXe9YA
	P7NIRBaz2mVACVcnPYZZ3Nv9ve72+NtstblAIT7bQxX+lsJ6XekX5W8ImPO922f95ne4soKPOV7
	OJ04kSvOuw8Ae00fSbABSn12CjjmKPksqQw//g95cD7tLOE9v/qdEPljmwstjcjHfM2G+Ottq3Q
	202PWQEIzhWRXtrsEzSGZAAOlBSEHrpV7JKLM1pOQg95ixNAB8j4DhpffwoQTw0fnjAgvpFAxcQ
	K31txNZccDewpMF9MClGT0+q9TTyIkOEp7KZ99CO/pU7PprB0PmvQuAk5WJ0sTTM/F0+dxg43K4
	9iHNiOS6zGU6fSzbzU/zkbS510+5Sk4eBnO9GsyjoUDbZYA4AIvTjRADfg4in3nbFiTOIMdZh0T
	tS7TLU0k+FTSOH2C4+zt8fdSpfCsoX60phh1l6dIW4vesVH+KQQkkHE1DeX9g7mseuDo5nS/NFd
	YmA8DEQLLhwmorEbEOeEfy9w6oYdydGeDq9PFER05V61AIW+iEQjkqnxs+MuLmI4Xa0e9MYWylD
	atIwqFlQ3n5Xjt7yiHFyugRoKTtvb87UUMJBD6xdkwZ8nbC9nUmKjwLcmyibZ52iHlrXUbGQod2
	GMMwRa61uTIEGJeS3yYDf3fNDs5RsLJ0e1YOWg+vUHoEJTyO17+7aBWDujuV8opSdN2YhpU/mg+
	eBwa4NsbqJKStDRZ0nS7w=
X-Received: by 2002:a05:6402:404f:20b0:6b1:c2ed:d027 with SMTP id 4fb4d7f45d1cf-6b3a81abaa0mr2274193a12.29.1792343886584;
        Sun, 18 Oct 2026 10:18:06 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3cbe98563sm525698a12.27.2026.10.18.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:18:05 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	john@phrozen.org,
	kvalo@kernel.org
Subject: [PATCH ath-next] wifi: ath11k: report TX retries in station statistics
Date: Sun, 18 Oct 2026 19:18:03 +0200
Message-ID: <20261018171803.1545946-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_101808_840758_3FC0EEC3 
X-CRM114-Status: UNSURE (   9.58  )
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

ath11k does not fill NL80211_STA_INFO_TX_RETRIES, and mac80211's TX
status accounting leaves it at zero because the driver reports no
per-rate try counts. The HTT PPDU statistics carry the MPDUs tried and
acknowledged per user. Report the unacknowledged MPDUs per station as TX
retries and leave TX failures to mac80211. Over 6 runs of 30 s the
station's TX retries track the firmware's pdev mpdu_requeued counter to
within 57 MPDUs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 drivers/net/wireless/ath/ath11k/mac.c   | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923e..f7ba888b61 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -556,6 +556,7 @@ struct ath11k_sta {
 	struct rate_info last_txrate;
 	u64 rx_duration;
 	u64 tx_duration;
+	u32 tx_retries;
 	u8 rssi_comb;
 	struct ewma_avg_rssi avg_rssi;
 	s8 rssi_beacon;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343..726a9fc807 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1454,6 +1454,11 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	sta = peer->sta;
 	arsta = ath11k_sta_to_arsta(sta);
 
+	if (usr_stats->cmpltn_cmn.mpdu_tried >
+	    usr_stats->cmpltn_cmn.mpdu_success)
+		arsta->tx_retries += usr_stats->cmpltn_cmn.mpdu_tried -
+				     usr_stats->cmpltn_cmn.mpdu_success;
+
 	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
 
 	switch (flags) {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa3..066a503d76 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9435,6 +9435,9 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->tx_duration = arsta->tx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
 
+	sinfo->tx_retries = arsta->tx_retries;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+
 	if (arsta->txrate.legacy || arsta->txrate.nss) {
 		if (arsta->txrate.legacy) {
 			sinfo->txrate.legacy = arsta->txrate.legacy;
-- 
2.53.0


