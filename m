Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A1D60A260A
	for <ath11k@archiver.kernel.org>; Mon,  2 Nov 2026 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qNbe43g2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqP57x08
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b1mZsSOMetU/Ho2p5NPS0yaILwy9cETrZxqZYB3+uRw=; b=qNbe43g2wUudmLWrS25ToOChcO
	WKMaHpNV6ewoQ9D6vJVI3oZfNrruxBgqRHKngmP/Mq3FUf1yO3BdKr4yRC3iMupBnHHmarkgn4fJq
	ZaZsp8QYKuvasrzYjDLFFjwRH81fFOjhcawwy/D9HiXY0VwbYARMmSfhh0oiVcf4WqjLujR52q7aN
	A6TcpdY5v+fm+QlYtgLpbDDPQFLYQdBuvMdkXd/pV9VduuE5ZU7doca7zffZ2BF7OgRr+svslwGNP
	jDpPBF2gtLUkgerf4+7rJrJpq9eP2TSVfH40BvCYOcInHuso72U7LAspjORSl+TwFz4DCjnO2syHm
	EkizPT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN1-0000000FXx8-319B;
	Mon, 02 Nov 2026 05:14:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN1-0000000FXwd-0kDm
	for ath11k@lists.infradead.org;
	Mon, 02 Nov 2026 05:14:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E526B440AC;
	Mon,  2 Nov 2026 05:14:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793596450;
	b=SoM6v+SgMq6uLs4sMzY/0mr0PcECPEGOJpSOTFTsjA71ih7oAyFNp1v5lB63j+jHOg1F
	 3sxsaHDM+Nxq2IDZ3ykRVsxUySQjfCYHbyfHULIGUijTNmzQYeojzqtRvnQIhGueznQea
	 PDJPQ3Xe8Oc33OQ016Ux56Ul4mtmd6PYB810lKvlQ7pFEsLjBfkcC4n4FOb/XAs4uAtzP
	 7cCbMoFzVoGwt/fHEv57AwUKQuXt0GBJ3i7orhCa931j/TfENmo0VFYBnon6w7riQtBE9
	 sB/EVca7+MWMLXrh80gcsVHhjJqFhPgxKkL4dBjisW53NErY41TxkIjLSfqSVhpIxaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793596450;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b1mZsSOMetU/Ho2p5NPS0yaILwy9cETrZxqZYB3+uRw=;
	b=c3SaLZ0KxE89cipnrTrCpGoH9FKDYMjT12wyq1XPbs55qUKxJSAL6W/caCczlWOPH00U
	 KtZKR6+YTAAqVBV7cT9rcM5qEXBZEcir0tl+2RvpxNi76vUJXrjdDSmrnkm5V6pnpdwft
	 GW+SpFup8hSzJsmi/i50iuGdfewihy21NIGt99klKEdb0B7oveXuiwXLO+iX7aG9jky2/
	 HH/25sAc3GJ4/dSi1AhXYpMXpPdJ1GEaaph7Uj3p60BKBEG2zU5/EEbPGx+8bVFl3DAiD
	 IB4uyPw+AL6pdcGypTccSHohfLLVydbJhEAxqe1zS24R+2H8DoclW1PsIKX/h4wXe7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A88CA1F0093A;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793596450;
	bh=b1mZsSOMetU/Ho2p5NPS0yaILwy9cETrZxqZYB3+uRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HqP57x08xXgAV4+IcSNMYiSRhppxzDB2W05ITydjgI7sEpu9HI7kVXxGjC1SpTCiD
	 d79TT+BmAwSrbToheRxVvP7HepkVwYagY1gKQgk8QhloUxr9mFO7SxmOInTAZObA8k
	 bdccDXXufuAjE8mHHKhbs/g356J9lEuhuG2sACN+FSgtZxZmG5Q/4XOEda/lk3BF7q
	 wpKJ6VvpD/YxdH9d7fzo4+7hLBl3TKy6aEDkai2BDqt6rapcPDMi0x+yd3jrD7RxA2
	 h+Uo6/3hJzvrT5pmCpr7xRYsOhl/vwgvrluanRYgYYWAJBvPJm2I7Ui/2q705y+JMZ
	 eCrG+pVJ33O1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 25ACE46382;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:14:10 -0600
Subject: [PATCH ath-next 2/3] wifi: ath11k: hold back FCS-failed monitor
 frames unless asked for
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-b8-monitor-frames-v1-2-f0a43d9630e5@gmail.com>
References: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
In-Reply-To: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Julia Lawall <julia.lawall@lip6.fr>, kbuild test robot <lkp@intel.com>, 
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, Miles Hu <milehu@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Govindaraj Saminathan <quic_gsamin@quicinc.com>, 
 Sriram R <sriram.ramachandran@oss.qualcomm.com>, 
 Shashidhar Lakkavalli <slakkavalli@datto.com>, 
 Rajkumar Manoharan <rmanohar@codeaurora.org>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793596448; l=3200;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=gW5/j2hiiWOOFjn6ouakRd7VONDoZcdzfhX/IthW4Vo=;
 b=Unx/VLGUd03Y0E20Qd3syMAamP4RBCNzYP78JySeJPZc2vyvfug+SX7i6SocFG0/VJvLBY9kS
 TL7D2W2rPNeA+rc3+SuG5IF1Qd6PIFCKu7Phky9JXOCVwHbAaNRY9Il
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

ath11k accepts FIF_FCSFAIL in configure_filter() but never looks at
the filter: its monitor path hands every MPDU whose FCS failed to
mac80211, flagged RX_FLAG_FAILED_FCS_CRC. mac80211 passes such a frame
to every monitor interface, whatever that interface's flags. It leaves
holding these frames back to the driver unless a monitor asked for them
with the "fcsfail" flag, which turns on FIF_FCSFAIL. So a monitor made
without that flag gets them anyway. On an Arista C-360 the QCN9072 scan
radio's monitor saw a bad FCS on 6 to 10 % of the beacons it heard.

Drop an FCS-failed MPDU in the monitor path unless FIF_FCSFAIL is set,
as ath10k does in ath10k_process_rx(). filter_flags is now read outside
conf_mutex, so write it with WRITE_ONCE().

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 12 +++++++++++-
 drivers/net/wireless/ath/ath11k/mac.c   |  3 ++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 4e0b717b6f06d..7809c92baa325 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5115,6 +5115,7 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	struct sk_buff *mon_skb, *skb_next, *header;
 	struct ieee80211_rx_status *rxs = &dp->rx_status;
 	bool fcs_err = false;
+	int ret = 0;
 
 	mon_skb = ath11k_dp_rx_mon_merg_msdus(ar, mac_id, head_msdu,
 					      tail_msdu, rxs, &fcs_err);
@@ -5122,6 +5123,13 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	if (!mon_skb)
 		goto mon_deliver_fail;
 
+	/* mac80211 passes a frame whose FCS failed to every monitor
+	 * interface. Holding such frames back unless a monitor asked for
+	 * them (FIF_FCSFAIL) is left to the driver.
+	 */
+	if (fcs_err && !(READ_ONCE(ar->filter_flags) & FIF_FCSFAIL))
+		goto mon_drop;
+
 	header = mon_skb;
 
 	rxs->flag = 0;
@@ -5153,13 +5161,15 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	return 0;
 
 mon_deliver_fail:
+	ret = -EINVAL;
+mon_drop:
 	mon_skb = head_msdu;
 	while (mon_skb) {
 		skb_next = mon_skb->next;
 		dev_kfree_skb_any(mon_skb);
 		mon_skb = skb_next;
 	}
-	return -EINVAL;
+	return ret;
 }
 
 /* The destination ring processing is stuck if the destination is not
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ada0f3a3c8565..0b7371ad808d5 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7456,7 +7456,8 @@ static void ath11k_mac_op_configure_filter(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	*total_flags &= SUPPORTED_FILTERS;
-	ar->filter_flags = *total_flags;
+	/* read without the lock in the monitor rx path */
+	WRITE_ONCE(ar->filter_flags, *total_flags);
 
 	mutex_unlock(&ar->conf_mutex);
 }

-- 
2.43.0



