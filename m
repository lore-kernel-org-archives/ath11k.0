Return-Path: <SRS0=rYI7=KU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7D0C2B9F8
	for <ath11k@archiver.kernel.org>; Tue, 25 May 2021 13:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE896141B
	for <ath11k@archiver.kernel.org>; Tue, 25 May 2021 13:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE896141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+MdquMjgvWS/UpFM7jVAkyk9EZAf09Kqv6MMIRDMwjk=; b=SEFc4/N82+1M2d
	l+hwiQNwCYQMmEQqoZqF9AV4ASCSldjsLRKNA86I/Zik6NcQZzyoOpxHqwYzAHXtbqhQq9dSBaic5
	ZIwKWOefVC3OlPTb0Wi7S9acKkRunkB59hw/WUG/ZzgHX8pdh8pHqrtOxIQ6uKDGPl3zOCwfLqzyz
	mjefYkMw142nXNltnB7MpjWhs5Y7NZxHZjhaoeCQ/bl5SCl+f/WaRb3ZbpJMQ+gT2YFduVtpsmwW9
	q0x2OIN95f8p9SBSaNP6IHExerwIjxMeFR2rCZVQEF6rAL/bWRq3lNWVnm6+KcLzSjRRryEktYsTa
	sELcvSoI0q/X3ELoZF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llXK1-005P4J-Iu; Tue, 25 May 2021 13:42:13 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llX96-005Ksg-Jb
 for ath11k@lists.infradead.org; Tue, 25 May 2021 13:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1621949450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+usSC3YkdJ2wuce4/zm7jv3o4NfSTiNDKsYzW2Edm5M=;
 b=K1p6aZbpa29Z6vmjMizTRCkEp414eRbKlsfITYgunehLMVdvgOPxOztfDZW9SMriEtC7Zs
 zSebA6NRKAInf1T4dzJ+qJOl/FQqHrFRPjiAVD8PbQ19oQpmy6dzdizppP9TI+nBrC1ZB/
 t3uAU1ifIXGs5vruus1QmeiLBwQF7HM=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Sven Eckelmann <sven@narfation.org>
Subject: [PATCH] ath11k: send beacon template after vdev_start/restart during
 csa
Date: Tue, 25 May 2021 15:30:28 +0200
Message-Id: <20210525133028.2805615-1-sven@narfation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_063056_835323_2C01032E 
X-CRM114-Status: GOOD (  11.19  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

Firmware has added assert if beacon template is received after
vdev_down. Firmware expects beacon template after vdev_start
and before vdev_up. This change is needed to support MBSSID EMA
cases in firmware.

Hence, Change the sequence in ath11k as expected from firmware.
This new change is not causing any issues with older
firmware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1.r3-00011-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1.r4-00008-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
[sven@narfation.org: added tested-on/fixes information]
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Patch from
https://source.codeaurora.org/quic/cc-qrdk/oss/system/feeds/wlan-open/tree/mac80211/patches/303-ath11k-send-beacon-template-after-vdev_start-restart.patch?h=NHSS.QSDK.11.4.0.5.r5

There are a lot more fixes which should have been submitted to upstream by
the actual developer

 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9d0ff150ec30..eb52332dbe3f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5379,11 +5379,6 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 		if (WARN_ON(!arvif->is_up))
 			continue;
 
-		ret = ath11k_mac_setup_bcn_tmpl(arvif);
-		if (ret)
-			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
-				    ret);
-
 		ret = ath11k_mac_vdev_restart(arvif, &vifs[i].new_ctx->def);
 		if (ret) {
 			ath11k_warn(ab, "failed to restart vdev %d: %d\n",
@@ -5391,6 +5386,11 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			continue;
 		}
 
+		ret = ath11k_mac_setup_bcn_tmpl(arvif);
+		if (ret)
+			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
+				    ret);
+
 		ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 					 arvif->bssid);
 		if (ret) {
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
