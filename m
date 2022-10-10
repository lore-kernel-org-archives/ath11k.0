Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3BEC433F5
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LikMXUIno75B5dV/cpkMPYzdIHNstFtettlSPrweT08=; b=PWnSZNfhm9tJln
	DNAS1CZEs38cOJpw9Bl6Shjk1Bg6kxBgwm/yAHw/GQr/1XG6U1gk0YgDG/cvxOCkQQfmICCXtI248
	mcSeawAVBxPxWOONJnPwlCLtsDX1yt4A6dEsQFazlmJeZmX9xic+uaocpgYj+GwAc3oqQg3ScsCR4
	aCUUSSyND1urcY21a0LsUclPha27dwiMmq/g7OvWkkdCXd/OQSbCSCsQ/wPtPPyadhsLfBgdwTJWp
	9/ccPMyjDixZjlTtCkYsxP5B34PjuVR3ex3d7XU0ym70oW6z+maGtXJqAwXaJlseBEX3ggR5eQZFs
	ahDbMAGO8Vb1oLFMNaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohvIl-001S2Z-JP; Mon, 10 Oct 2022 16:06:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohvIj-001S1o-6Q
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 16:06:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AE4D60FA0
	for <ath11k@lists.infradead.org>; Mon, 10 Oct 2022 16:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F778C433D6;
	Mon, 10 Oct 2022 16:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665418003;
	bh=sbvF2C30pyi/WD894jgQd/CyRHVu2fPpNAY/vCIpK48=;
	h=From:To:Cc:Subject:Date:From;
	b=P6EBdnTGtpl1YROEAzxB1EWWF0YWNUyAtdwqcRZohRumUyb1fcJh0BPrVSimtFhLB
	 44xHJMov7z8BBmAm877xOTkeFEolUXeskcH6LHyu7yJ0DTfu0u5FL5IiPD0keaZyCB
	 DM2P+NLvrMr0jCVZInfTOcmLLyuXHL+Jt3NPegmUZSH4t8WznMGGqEQk4/6m3ecKRk
	 ySAYZBCHnQaqDg+FmBOqyiY67TE2rHQPyISqyDM2u9kvnM8Ehp5THRbYkKznd0GOjq
	 15ge2mfHBjcc5K6/pp/SkQFCRBNrh8Rg8XH05tTfWhGmMrpwSeWCh30hmw3eJPV+vm
	 FY0fKqX8rfhxA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v6.1] wifi: ath11k: mac: fix reading 16 bytes from a region of size 0 warning
Date: Mon, 10 Oct 2022 19:06:38 +0300
Message-Id: <20221010160638.20152-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_090645_298396_74B2883B 
X-CRM114-Status: GOOD (  14.46  )
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

Linaro reported stringop-overread warnings in ath11k (this is one of many):

drivers/net/wireless/ath/ath11k/mac.c:2238:29: error: 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Werror=stringop-overread]

My further investigation showed that these warnings happen on GCC 11.3 but not
with GCC 12.2, and with only the kernel config Linaro provided:

https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/config

I saw the same warnings both with arm64 and x86_64 builds but couldn't figure
out what exactly triggers the warnings, or why I didn't see them earlier.
Nobody else has reported this either. This is also why I can't provide a Fixes
tag as I don't know what's causing this. The function hasn't been touched for
a year.

I decided to fix this by converting the pointer to a new array in stack, and
then copying the data to the new array. It's only 16 bytes anyway and this is
executed during association, so not in a hotpath.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Link: https://lore.kernel.org/all/CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com/
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 84d956ad4093..2d1e3fd9b526 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2081,7 +2081,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	struct cfg80211_chan_def def;
 	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
 	enum nl80211_band band;
-	u16 *he_mcs_mask;
+	u16 he_mcs_mask[NL80211_HE_NSS_MAX];
 	u8 max_nss, he_mcs;
 	u16 he_tx_mcs = 0, v = 0;
 	int i, he_nss, nss_idx;
@@ -2098,7 +2098,8 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 		return;
 
 	band = def.chan->band;
-	he_mcs_mask = arvif->bitrate_mask.control[band].he_mcs;
+	memcpy(he_mcs_mask, arvif->bitrate_mask.control[band].he_mcs,
+	       sizeof(he_mcs_mask));
 
 	if (ath11k_peer_assoc_h_he_masked(he_mcs_mask))
 		return;

base-commit: 10d5ea5a436da8d60cdb5845f454d595accdbce0
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
