Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54837606A32D
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycliiCtM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWUUB8qK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6Bljr1uC7IbWpOg6SVLCyxLBHvHmsEA9na/XTcirQ6A=; b=ycliiCtMjLferQC1J5QwuFHznh
	1Kz6Kynwd9bQL0uKevj7AoUvsoF4TRghn2F16GDP6qmp8iYxKwJ1YFL9sm+NWgWGZqKHfDbjnGTjA
	GyzsRC7vSyfgS0gD6mMcKDf5B5ja6vg8fFJd41NAh/6tnWqCdk2RwOi3kpUB+T2z+8NjI9C3xEXuE
	Z/FF1d52rl22RqEaXfD8DHdBUrGbtmpgy5juozhTHNNLD6Ox3vOUMtkhbQlYhJOCMy/t+26iFh71R
	cW4HwA/1iKBFJ0jqEXOMZRfvkQAez/QpaggPPV0tEBhxBZFZC9boA4udcD5mBTsYvHI5xMBf3jF76
	rgHv/Z7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP30d-0000000AJT2-2M6Y;
	Thu, 05 Nov 2026 19:20:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP30W-0000000AJRu-466C
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 19:20:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3267E601AC;
	Thu,  5 Nov 2026 19:20:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793906419;
	b=CGIkOrBfFqzG/0QFZAe2wl9bcRAK0qEAoDQNpiY+AEDqn/ECeKejK5RpSP3aLzQrvSXq
	 sd3GNEOOtiFd8/9Vn+YgI7DzlwNwruP8i3S/b8qEnBamynNLIad7iYQaqGuH08wOvKDWR
	 5cbb0mL/eTdZ9TMA8JDWOCVemROvSicsI/hzTrHmDZDuJIhBGHirPs93M0jvnhmyFhGIL
	 lkzb1kp/H1O11oTUrBVzbPiI1JFMYpxlziVuSLvE1YSFCtajRliM3xjNFGlc9E7QytIIZ
	 QACk/j94c82AowIcbkMt+SGNLGYKzi2Wn6iFBMys7s3C2ghVGpVmQXhtwkYrMXgrOJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906419;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6Bljr1uC7IbWpOg6SVLCyxLBHvHmsEA9na/XTcirQ6A=;
	b=0yUiHNigWA9ECRCBM37b9vC2PS90ohFJE0CaC/Io80vQspuDdWDU2Cuor8/BVaRP/f6c
	 RffzHAI+Xdf1EX69ckQ2zQVhJDlHBawrm5bsPalfvri8QE1smFDPJSe0xfYIKR5qngy0+
	 wD0YHSx3uC1E16Rfi6sDcxNppLUPPrs/t5M4w2V+0s+SaRdXQMbABt45mZoZ6Tx0RRa3n
	 B+7o0la6oSdjr9NIAobRUpn3jnQgWJB/DT9y3NBlt5gIZhulL/Hxo4dsgjwChe45qgdpC
	 AW2HrefwSsli3c56/uCZ5oMNLAb5AQKDe5E5iPHDgHl0wWzwNhBnCZEhDHvtRgdy9zg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44EE41F000C1;
	Thu,  5 Nov 2026 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906419;
	bh=6Bljr1uC7IbWpOg6SVLCyxLBHvHmsEA9na/XTcirQ6A=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=SWUUB8qKgkBoNjcRM2a9/aa9bkjMy0tgY0yC9p5tYU7JJR2U1lMcUMSovPuvi/LiF
	 DIVV/pzEtuZS5bghYLatfE42B76KrDRu4g+eHhTpDu10sb/A/IyU0sCz2LsC2+ycI+
	 7a4IZk3bpp9t/luGMNxSSS7oaOyLfNzBxjgGoyEuxvjP5cusnkqUlWiuLRLbvZ4SVY
	 NDGJenvO/4GkxuEdvW0We4IrDj43uRFEr91v0hxiV1tclJllYN81shIHyvXc8BkVWN
	 p1Xs70PIaz4QlW5pFp1cEx9aNrJ0ZOKS1FVieQqlI3VWnEyIi6+MaXtP2J6SVCeHPg
	 NhiqAJ11uNC+A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 96DED473D0;
	Thu,  5 Nov 2026 19:20:18 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 13:20:18 -0600
Subject: [PATCH] wifi: ath11k: keep the PPDU status for the full monitor
 delivery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath11k-full-mon-ppdu-status-v1-1-819a3e225b9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPHW7GoC/yXMwQ6CMAwA0F8hPduEzcDBXzEexlqkiGNZN2JC+
 HenHN/l7aCchBVuzQ6JN1FZQ4W5NOAnF56MQtVgW9sb03bo8mTMC8eyLPheA8ZIBTW7XBRp8D0
 RdXy1HuoQE4/y+e/3x2ktw8w+/0o4ji9o+0FSfwAAAA==
X-Change-ID: 20261105-ath11k-full-mon-ppdu-status-dbc6ddd5e32c
To: Jeff Johnson <jjohnson@kernel.org>, 
 Aloka Dixit <quic_alokad@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Matthew Leach <matthew.leach@collabora.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793906418; l=3067;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=4fc48RxbyexxMZuKcYsZ86QAk9wyIus7mswxJpeNaL4=;
 b=WK2YA9h1OGQghson9ByDiVw1Yk8uOT5wEVWfCpprjGXlhy4pmBnjrs0003SkGBXpkiJhACRHO
 rkV3EfhvuD3AunvDGwOYvlu78FVAhnPm60sL1gMENVBq2FgoAarSVdq
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

In full monitor mode (QCN9074), ath11k_dp_rx_process_full_mon_status_ring()
reaps the status buffer of the held PPDU with
ath11k_dp_rx_process_mon_status() and then delivers the PPDU's MPDUs with
pmon->mon_ppdu_info, the status that function parsed. But
ath11k_dp_rx_process_mon_status() clears mon_ppdu_info again after each
status buffer whose PPDU names a peer ID, whether the peer is found or
not. Since commit 2a2451a34afd ("wifi: ath11k: fix peer resolution on rx
path when peer_id=0") a PPDU from a station without a peer, which is
every frame a monitor hears from other BSSs, names peer ID 0 and is
cleared too. Every frame a QCN9074 monitor delivers then has an empty
status: signal -95 dBm (the default noise floor and a zero rssi_comb),
no TSFT, and the rate of its rx descriptor instead of its PPDU's.

Each status buffer is already parsed from a cleared status. Drop the
clear after it, so that the status of the last parsed PPDU stays for the
delivery. The other monitor path is not affected: it delivers from
within the loop, before the clear.

On a QCN9074 alone in monitor mode on 6 GHz (5975, 6135 and 6455 MHz,
frames from neighbouring APs), 311 of 313 frames had signal -95 dBm and
TSFT 0 before. After, 307 of 309 had their received level (-79 and
-80 dBm for the nearest AP's beacons) and their TSFT, and the beacons
their 6 Mb/s rate instead of 48.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Fixes: 67a9d399fcb0 ("ath11k: enable RX PPDU stats in monitor co-exist mode")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..8bee3bfe33dfe 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5290,6 +5290,10 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		if (log_type != ATH11K_PKTLOG_TYPE_INVALID)
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
+		/* Each status buffer is parsed from a clear status. The last one's
+		 * stays in mon_ppdu_info: full monitor mode delivers its PPDU after
+		 * this returns, with that status (signal, TSFT, rate).
+		 */
 		memset(ppdu_info, 0, sizeof(*ppdu_info));
 		ppdu_info->peer_id = HAL_INVALID_PEERID;
 		hal_status = ath11k_hal_rx_parse_mon_status(ab, ppdu_info, skb);
@@ -5334,8 +5338,6 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
-		memset(ppdu_info, 0, sizeof(*ppdu_info));
-		ppdu_info->peer_id = HAL_INVALID_PEERID;
 	}
 exit:
 	return num_buffs_reaped;

---
base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
change-id: 20261105-ath11k-full-mon-ppdu-status-dbc6ddd5e32c

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



