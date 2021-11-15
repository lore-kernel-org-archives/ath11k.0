Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3443C433F5
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4E561B4D
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E4E561B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCbLX6eGUHyBnvxY/mwIMywlCf+mWiaR6PA/nQc0KyU=; b=VSU27S3y3iQdZw
	Tr3SE++EoPq/xAua+QLLoYUVOn7iz98KsEo292n5b21qgmDKGTai1gcLOKV7H6tXZoDy0TD8owFd5
	mOEX/AsK9KLZdduAylFJzwG3skPyCSZ57tDYjy2G4xs9atMH+t0AQArugJ+MUq3J6HzlC6qkh/0SE
	BHEdhZw60KqEenCXYI8AFvX36If8q4Nm8/4QpWG0lWtXmdL823pfn6eiv6by3pXvmTpg+MfOgUKwA
	Iv3P0CgRvOUrAXbed++CdzrtS7BbcxCrPK3LHI13sOhFz1P5TYqL0hpYSwwlPM9/3jp+zKiNe5DlX
	k4d/dLOzbG0mwSgx5wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZ4d-00F9FU-Tq; Mon, 15 Nov 2021 10:18:51 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYre-00F4zq-3Z
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 10:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1636970723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1RAl74RSYfclV4BpJtdeHfE9dPo62tsTx2/FvVvZCw=;
 b=pi7+u6YyE36e8SuvOZoyskLEgnLCLvocI5zh3rr0TbML/7Rnc5OIB5e3x8vuzLYRuT+jPS
 GoSMYL1b3rXhOl6hbCHpAuKnvOCa0wwFvMnAvP4zwohaFfdFaA66xKtTXsg3PZnNxVM3hT
 3mAYJjedsaXdroelxlHwo9CBxljCFIg=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>,
 Venkateswara Naralasetty <vnaralas@codeaurora.org>,
 Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v2 2/2] ath11k: reset RSN/WPA present state for open BSS
Date: Mon, 15 Nov 2021 11:04:41 +0100
Message-Id: <20211115100441.33771-2-sven@narfation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115100441.33771-1-sven@narfation.org>
References: <20211115100441.33771-1-sven@narfation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_020526_344692_28A6E033 
X-CRM114-Status: GOOD (  11.73  )
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

From: Karthikeyan Kathirvel <kathirve@codeaurora.org>

The ath11k driver is caching the information about RSN/WPA IE in the
configured beacon template. The cached information is used during
associations to figure out whether 4-way PKT/2-way GTK peer flags need to
be set or not.

But the code never cleared the state when no such IE was found. This can
for example happen when moving from an WPA/RSN to an open setup. The
(seemingly connected) peer was then not able to communicate over the
link because the firmware assumed a different (encryption enabled) state
for the peer.

Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

Fixes: 01e34233c645 ("ath11k: fix wmi peer flags in peer assoc command")
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Reported-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>
[sven@narfation.org: split into separate patches, clean up commit message]
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
v2:
* add new patch to really fix the peer handling of the fw after PSK -> open
  switch

 drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cdee7545e876..9ed7eb09bdb7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1137,11 +1137,15 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 
 	if (cfg80211_find_ie(WLAN_EID_RSN, ies, (skb_tail_pointer(bcn) - ies)))
 		arvif->rsnie_present = true;
+	else
+		arvif->rsnie_present = false;
 
 	if (cfg80211_find_vendor_ie(WLAN_OUI_MICROSOFT,
 				    WLAN_OUI_TYPE_MICROSOFT_WPA,
 				    ies, (skb_tail_pointer(bcn) - ies)))
 		arvif->wpaie_present = true;
+	else
+		arvif->wpaie_present = false;
 
 	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
 
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
