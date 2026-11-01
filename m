Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F20F606A326
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dNRAgCC9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LasUPCyP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nvDPA+NzRyC3DnvcGd1DRI0muHnvZ5aXhyJRCB4IZig=; b=dNRAgCC9lD6pEaHkyeufPJplit
	tP3jhmDenq/LdeJb7VbfBNjyzT1lv8tS/Hs8eRFadxMYZm8RFZOpANcK4/LOmQcfawk6+GN9Z3kXK
	Pw0jCglVWRxzT3MCXJwiIJnoZoFBoYlpsrVm5N0PLFAJiE2KYb6vLTftcqKqqCB6D7oM3RuOd8/Hp
	2AUhrdOpd0FoOftJs+WFynZ14mbg4Hd6M+uqm+ALzqvH5GpCaUMXGnSLvDIvoaAHLXSUhsI1fUFc8
	lOXad2TbRcg7OscmFxyM6oRJMQ6R/83yet8DB323o/oJp0HW9fgt4hguoofC3j2EVGZsprvJpAQkR
	Rm5OWxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNY4v-0000000Eeuy-3Yim;
	Sun, 01 Nov 2026 16:06:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNY4t-0000000Eeu3-3nSR
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 16:06:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC6F7601F8;
	Sun,  1 Nov 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793549198;
	b=GpfDo9VygtKu50pEebHPvknAWFBM9rlBJkSr+QfEYtqjT/alzzSYjxjCuMWdHicWs1mt
	 Lwfhi8DtvO85+Q1Nzo8GOWmG72AMn3tKXZoGaGOF9Javl97mRet7+EmtNNmhiw3BEPzuN
	 GXaBTGqP7eIMM6dJvE550dJcRjCyyuR1JVgjVUme0JGsH6wxL9ycGNThgiQ6ouW8RO720
	 dGwPZpcdRw/zRbqvwOQT4uXchsUxHQRJsU49ps57tNI2jCo4uQovqPlNSTXYmYg6m+H5c
	 XA6zLNlsN9ALKyzLlEpPFmydXL74KZxm+daO0BLgCID+iWpBkhwRx7fwNDr1n9zvYRQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793549198;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nvDPA+NzRyC3DnvcGd1DRI0muHnvZ5aXhyJRCB4IZig=;
	b=QC/EPohRnbe1AarIv3aN55ud5sTEexllMUqjkix6fG6JfApOEpfQuImyxYAdntelQSv8
	 6z1TNi4BTPcVK1Pcnd/amDTZ7K/B9RCy/rSz/8y2toMuf06E6jgOclJRf9XKvbzCG11QV
	 ofmS6RwLee72nOG8dk7jdQ0PqlONBvmRV2nGGfvvrFa6KF4dvovuUWwQeLVlCF7nVrzel
	 vttaCmbf2LMnGsD7Hxafd4v6PRmjqucGJWj1CrTAZBbzQfJdPGR68QYxlINZm9bv5ISDQ
	 rEs/wlC37/9xl6JS0+JH5q6uZgGBy7+O+eExjjcGD2U/FqGZjYdrZWLd9pmcif2bvow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CE451F000C1;
	Sun,  1 Nov 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793549198;
	bh=nvDPA+NzRyC3DnvcGd1DRI0muHnvZ5aXhyJRCB4IZig=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LasUPCyPiJPMnGbkRzW1ROGJj123SAeLju3+fbaB6eh9Wa6qyue3I3+IKoP9qFJpL
	 uHmozmy2A1i5eUlohSyscECZ3G2ZEo/yvUK2X5DKNNibzBjYJFJeLElMNtuEYS0Aqk
	 dPjLxa/TfJIRUE7Om6qgxoQr8cHiAQHJzCACtDQDOV6xt2+ORoWp0CQr3ueW9jj9ae
	 4Oc9ozgHVAJgQXYpM7PdcRb71YCvTWE2x19lX8WxHsLOkEcv3SVv6C/uFhw+lcBntd
	 UDKpi1CXOnyBVDzMvjgWgeEnQSnugGzloWYJhdOQybF3gmUYyGkCeKXzKi7Aaufu82
	 mNnhYPiS9j4nw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C5A17461DD;
	Sun,  1 Nov 2026 16:06:37 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 10:06:38 -0600
Subject: [PATCH ath-next] wifi: ath11k: report a station's TX retries
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-b62-tx-retries-v1-1-c00d4e6e2739@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI1j52oC/yWMwQrCMBAFf6Xs2YXuHtrir4iHND7b9RAlWSVQ+
 u+mehyGmY0KsqHQudso42PFnqmBnDqKa0gL2G6NSXsdRHrheVD2yhl+dAwZJSJMcVKlFr0y7lZ
 /wwsFXzmhOl3/prznB6IfP9r3L43ZscR8AAAA
X-Change-ID: 20261101-b62-tx-retries-e171cea8c822
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793549197; l=3031;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=Pyj7rUa/qALXE2SogX70i3iq6z68HhjTQNXdCtw1Ngg=;
 b=utIthFnUbeVp92VTZjAi8ZhiEUnBoT+e26f339DHFflX3htYp/4WLq8BrY4h79myjasym9hS1
 N17OBjQt0BSB52eCjvUA2sUBtNd8tjcIeorw2vbbsmhK239jzWyBqdn
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_dp_tx_complete_msdu() hands mac80211 a status with no entry in
info->status.rates[], so that mac80211 does not update its rate
statistics from it, and a single rate with a try count of 1. mac80211
takes its retry count from info->status.rates[], so it counts none, and
"iw station dump" shows "tx retries: 0" for every station: on an Arista
C-360 (QCN9074, 6 GHz) a client showed 0 retries after 55284 frames at
HE-MCS 11.

The TX completion carries the frame's transmit count (try_cnt), which
the extended TX stats already use. Count the retransmissions per
station from it and report them as NL80211_STA_INFO_TX_RETRIES, as
ath12k does. mac80211's TX failed count (frames never acked) is
unchanged.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Seen on an Arista C-360 with OpenWrt, on its IPQ8074 and QCN9074 radios.
---
 drivers/net/wireless/ath/ath11k/core.h  | 1 +
 drivers/net/wireless/ath/ath11k/dp_tx.c | 2 ++
 drivers/net/wireless/ath/ath11k/mac.c   | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..ba32063092254 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -556,6 +556,7 @@ struct ath11k_sta {
 	struct rate_info last_txrate;
 	u64 rx_duration;
 	u64 tx_duration;
+	u64 tx_retries;
 	u8 rssi_comb;
 	struct ewma_avg_rssi avg_rssi;
 	s8 rssi_beacon;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806a..2329c2449b572 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -637,6 +637,8 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		return;
 	}
 	arsta = ath11k_sta_to_arsta(peer->sta);
+	if (ts->try_cnt > 1)
+		arsta->tx_retries += ts->try_cnt - 1;
 	status.sta = peer->sta;
 	status.skb = msdu;
 	status.info = info;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..066a503d76d4c 100644
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

---
base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
change-id: 20261101-b62-tx-retries-e171cea8c822

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



