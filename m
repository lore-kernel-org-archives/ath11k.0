Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6DEC433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 15:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6117C61B39
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 15:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6117C61B39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f6jHfGISZdKpktWom+nMKKFWp3E2cCAhN4jwtuE+Pwc=; b=E8RzSLbvRpEvxc
	Iqm0X7pFT1yrMgQsB2j9BqTCwPP8jK4TFH2iDy3qoawh18m/E9krvF6sLyNUgrPR8wP2Y8fQ8dgQY
	pBdW+1GzrWHM3jLPWaeScdJp+wZMr2/t0/X2ckRPZ9+yw6hY+QIf6iUYa4+eCLkWbWDg1fBpJBfa9
	n9wdHH2ASPT29dkpT+7Ou1PapmrlXjYqBsiR4qWf8UqMGixvjka0Yv8eI+vIf2ON1rpaXpzLT95pW
	iTqPv+7yMlVPt0UicgFtcV7hlJaDnzAQHlr0WpJoW4NiW+CEn7tymmimhQ165bzvBzeR/9yv9FykB
	Cr56tLhF0zkiqB0oIodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnjNO-008HHc-6I; Thu, 18 Nov 2021 15:31:02 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnjNI-008HFm-Ds
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 15:31:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637249459; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=l1loVmW1RjXrsW56hTFBKN42k0XbXDloDMuDK0Tg1ks=;
 b=T751YdymP8Y19VRpyiJItUSoIPRVoOqOz9VrIA9SfjzA9ikMsYLL3ryOcmZIwaKrAUYxvrgH
 8XBecK78Kh3YW0aaT1VMU24pfb5uD/xbjPqDDugo8KispPa6ukjuVoHsrrivi1D/b6jgRZrT
 acpDYeLQEY9HoVLOxG7NaCOBVMA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 619671a4638a2f4d613df92b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 15:30:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CECB1C43618; Thu, 18 Nov 2021 15:30:43 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DD6EC43460;
 Thu, 18 Nov 2021 15:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0DD6EC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: Fix mon status ring rx tlv processing
Date: Thu, 18 Nov 2021 21:00:33 +0530
Message-Id: <1637249433-10316-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_073059_565211_2A90AF97 
X-CRM114-Status: UNSURE (   9.98  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In HE monitor capture, HAL_TLV_STATUS_PPDU_DONE is received
on processing multiple skb. Do not clear the ppdu_info
till the HAL_TLV_STATUS_PPDU_DONE is received.

This fixes below warning and packet drops in monitor mode.
 "Rate marked as an HE rate but data is invalid: MCS: 6, NSS: 0"
 WARNING: at
 PC is at ieee80211_rx_napi+0x624/0x840 [mac80211]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01693-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c5320847b80a..f7968aefaabc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3064,10 +3064,10 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	if (!num_buffs_reaped)
 		goto exit;
 
-	while ((skb = __skb_dequeue(&skb_list))) {
-		memset(&ppdu_info, 0, sizeof(ppdu_info));
-		ppdu_info.peer_id = HAL_INVALID_PEERID;
+	memset(&ppdu_info, 0, sizeof(ppdu_info));
+	ppdu_info.peer_id = HAL_INVALID_PEERID;
 
+	while ((skb = __skb_dequeue(&skb_list))) {
 		if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar)) {
 			log_type = ATH11K_PKTLOG_TYPE_LITE_RX;
 			rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
@@ -3095,10 +3095,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			ath11k_dbg(ab, ATH11K_DBG_DATA,
 				   "failed to find the peer with peer_id %d\n",
 				   ppdu_info.peer_id);
-			spin_unlock_bh(&ab->base_lock);
-			rcu_read_unlock();
-			dev_kfree_skb_any(skb);
-			continue;
+			goto next_skb;
 		}
 
 		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
@@ -3107,10 +3104,13 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
+next_skb:
 		spin_unlock_bh(&ab->base_lock);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
+		memset(&ppdu_info, 0, sizeof(ppdu_info));
+		ppdu_info.peer_id = HAL_INVALID_PEERID;
 	}
 exit:
 	return num_buffs_reaped;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
