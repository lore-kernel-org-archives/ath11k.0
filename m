Return-Path: <SRS0=2HMb=HY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84823C433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 15:14:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A57764EC3
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 15:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A57764EC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LkvaEnrHeibzYr/m2DZL3YXwrZIJW4lvui+Txy623d4=; b=n/EwxTNOXSDRpbbVVth03WMaHJ
	CHLAqkF8KveFg60EfYvGz9COXYxRLW9TYEuVUklxinsLTvCuFxYqKWKLXkYERrG+fFHoCmksZJqTO
	RF9AWnMc0uKucp1Y2Wtf6muIwgThRnSbSl4KGu1TWsWuSJqeOg09p+TSIvHA67QrOhiAwo5eyGMvM
	AR8YVZ5yAGh0HCzKhwRDxyUYR456x8dWdJX7mYD0fFei35DYyhst5/eKD+hdaEYcoamtRVimSF5uf
	4Wsj4mmrpodaCTmZu5piVier4oSItVLoWn4PxeeX5RY0/kE2I6lfGcq5msaFZdAveCGjs0jcrgNiS
	olmcqSXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lECuu-0001HA-Kv; Mon, 22 Feb 2021 15:14:32 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lECus-0001F5-3K
 for ath11k@lists.infradead.org; Mon, 22 Feb 2021 15:14:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614006862; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MSV/THMzoBnQi6LSC3Z/xQNg2Rkhgq33GnztMeXgZEc=;
 b=dUPSa2VIvObNg+SHHrrErFW5Dv/FoDk0ExH+nEbNIel+HRA7Euxsdo5zOLZ53SOCxd9DUcYL
 +VcVlbSKXNizkZuOoRXvKjAyJAxFH1FW3vKdpDlE1hRnDM55VQpGSQ/ivg/jXDnhPvbMiZgb
 23Qd0KByjUZV18q7v+hfWfPLecc=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6033ca463bd0a42cc9a324d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 15:14:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 55C45C433CA; Mon, 22 Feb 2021 15:14:13 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1020DC43461;
 Mon, 22 Feb 2021 15:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1020DC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 5.12] ath11k: fix AP mode for QCA6390
Date: Mon, 22 Feb 2021 17:14:09 +0200
Message-Id: <1614006849-25764-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_101430_252068_88A001CA 
X-CRM114-Status: GOOD (  14.13  )
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
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Commit c134d1f8c436 ("ath11k: Handle errors if peer creation fails") completely
broke AP mode on QCA6390:

kernel: [  151.230734] ath11k_pci 0000:06:00.0: failed to create peer after vdev start delay: -22
wpa_supplicant[2307]: Failed to set beacon parameters
wpa_supplicant[2307]: Interface initialization failed
wpa_supplicant[2307]: wlan0: interface state UNINITIALIZED->DISABLED
wpa_supplicant[2307]: wlan0: AP-DISABLED
wpa_supplicant[2307]: wlan0: Unable to setup interface.
wpa_supplicant[2307]: Failed to initialize AP interface

This was because commit c134d1f8c436 ("ath11k: Handle errors if peer creation
fails") added error handling for ath11k_peer_create(), which had been failing
all along but was unnoticed due to the missing error handling. The actual bug
was introduced already in commit aa44b2f3ecd4 ("ath11k: start vdev if a bss peer is
already created").

ath11k_peer_create() was failing because for AP mode the peer is created
already earlier op_add_interface() and we should skip creation here, but the
check for modes was wrong.  Fixing that makes AP mode work again.

This shouldn't affect IPQ8074 nor QCN9074 as they have hw_params.vdev_start_delay disabled.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Fixes: c134d1f8c436 ("ath11k: Handle errors if peer creation fails")
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 335d49af7dd5..76f3343183fe 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5450,8 +5450,8 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	}
 
 	if (ab->hw_params.vdev_start_delay &&
-	    (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
-	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)) {
+	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
+	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {
 		param.vdev_id = arvif->vdev_id;
 		param.peer_type = WMI_PEER_TYPE_DEFAULT;
 		param.peer_addr = ar->mac_addr;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
