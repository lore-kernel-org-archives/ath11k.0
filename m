Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C3606A335
	for <ath11k@archiver.kernel.org>; Sun,  8 Nov 2026 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DW1AGU/O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1Hkrw6/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j93T7HDIrEE01S1CvxT1EP2HEJdVUqbYJGyOt3zvifs=; b=DW1AGU/OkyoGMMO85VzAAxZn9s
	w9tr5FEB89Cq9QPa3o5zgo6ZecqHY/lzyr8q2LKSfnAqsdNnusoDonHoCJHDTauf0RkjK5Hw/aeHt
	vVDDJ48ON6KetvcAunmc5ZK/yW3EOaiGkf7ppR6iLpg00gqk7C3RvWqNcIykJbMrfkmAW4b/LCJ2u
	o2loBWlnlJ6sS7iOM3DCJYSxvhpN41zr6/K3Gp8hk3ZuVUG/EmvurZjDUUi0Cz23BhDjQe6Z72jss
	1zFiI7i4yYoPe8ePEB0Ff3xB4Kwx1h5F+4HCaliMOxeHMqCFibZo8KTOMY/RSKKr+XmeRD9Um+twb
	ypgM0MaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBdn-0000000GrOO-3Bez;
	Sun, 08 Nov 2026 22:45:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBdk-0000000GrNv-1G6z
	for ath11k@lists.infradead.org;
	Sun, 08 Nov 2026 22:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D77E61E2D;
	Sun,  8 Nov 2026 22:45:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794177931;
	b=FjNfPxRoObpY7cZoBx1FPoYeBIaYQ5Uu0m+FR5dkVGlCNOXmuxwjTRWebCJpPlYGcYDd
	 PgPoCYnMAxIePPHpYrlBJoFYrGlIX4oIiVgEU1za8XPzL0j7c6XaYG9K1Lg3QdDr2PNtT
	 qY9T7iqLu9j3CaOqJqSFFnLthDTkHG/huyqeDI5wEE4mMjIorQ/LpHDK8NtCfXUPhVZTe
	 g0mvGH4iHgx7ziPOJy2ikRlZrwtQm1t7FupF+ODlwvciFWbsXk6lWmtFoS+GnsldsNqK5
	 n8ctQPRb29KJPA03DiPCtnIVMKUx/njRkGWTLpc9D6blWYsTsy16nShvaa09A08d16A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794177931;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=j93T7HDIrEE01S1CvxT1EP2HEJdVUqbYJGyOt3zvifs=;
	b=H8A8r0MMa8QPFDzmGJk6rOZq1HKjMxhUlPyNj0SV3L2jVcVicov4SBpPVj/5wHW5FJp9
	 bh0dhh8girswzjxIlZ26TJoJjIP7uzBoVx80XvA9N+zGdxWGq3GPsV5r+f2iQdRPfvsz5
	 vvtGsSu81ahJ3A8B4y1T51SbwfL+zJd3++ypKcxubC/myDP8XlSXHjmAKQbtQFRvlXJWx
	 6SYVqAa7THKQ8R91dmsiIhO7hh6pJuS8z3HKC56VdQCHAdUzzNfzKqb8Zn2RyRP+nGd+H
	 +Z2Dd88zHqwPY/gecnkmzVs8JFfdVuFVCnBddoHn7ENj5SDlQZeRIP4BIc/bUsYJggw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D88BA1F008A1;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794177931;
	bh=j93T7HDIrEE01S1CvxT1EP2HEJdVUqbYJGyOt3zvifs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A1Hkrw6/WlQhY1quNAtKc5nLElsShZDy8dw4E51FGBt3+Da/pdWFnQsyImM09GMF0
	 NHuIiwdoPuy9Za0jRjkdr3G5i29r0zL9UcBA5aDGww60s2zgPQU5oTnSob/jwq4smc
	 4JV+58A2WdAsaEzI6OfEHfYOBUJqrv4qxk0mEVp22JDPIn1ScNJH7pV8c9d4kVo9Mc
	 J3ccRImNc1jDMuvMbyNrOhOqVcHY+1B18F8KR31p3jcq503n7ir9G29wvEwSAD4sJo
	 QW+5uIVjL/xxc4ZRLXiVWCLrdOy6Ul60kMCqD2hS4GrpU5vDweUfCjs32eWFDqgQKT
	 dUbdG4vmk8FKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4C8F748126;
	Sun,  8 Nov 2026 22:45:29 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 16:45:29 -0600
Subject: [PATCH 1/2] wifi: ath11k: report TX airtime to mac80211
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261108-ath11k-tx-airtime-v1-1-f1a02b2372d4@gmail.com>
References: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
In-Reply-To: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794177928; l=3065;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=zAGNDCci+NrWD77ftsAlGwIki6RsHsOwcH4VFGyismo=;
 b=2vusuqHf4uq8QZiEe/1l+A/qBvkFBYziwTATE3j7XuQXLKs1bcDINSDo5W3GhOWzicy33hUdD
 gQ1j98m4d7pB9Fes4Wt/OF5XWFKnSrU8S3Hr9t/5j2D/JVxPD/S4y/O
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

mac80211's airtime fairness schedules a station's TX queues by the
airtime the driver reports with ieee80211_sta_register_airtime().
ath11k never reports any, so on every ath11k radio each station's
deficit stays where it started and the scheduler falls back to round
robin: the station's airtime file in debugfs reads "TX: 0 us" however
much it sends, though airtime_flags has TX and RX set.

The firmware reports each PPDU's frame exchange duration in the HTT
PPDU stats (fes_duration_us), and ath11k_update_per_peer_tx_stats()
already adds it to arsta->tx_duration for the station dump. Register it
with mac80211 as well, as the station's TX airtime on the PPDU's TID,
split evenly among the users of an MU PPDU. PPDUs without a QoS TID
are skipped, as the peer stats skip them, and the call is made after
base_lock is dropped, since mac80211 takes its own active_txq_lock.
ath10k (htt_rx.c) and mt76 feed mac80211 the same way.

On an IPQ8074 AP with a QCN9074 6 GHz radio at 160 MHz, with this and
the next patch: each station's airtime now accrues (50 s and 20 s of TX
for two clients under load, deficits moving), one client's TCP download
ran 1777 Mbit/s against 1672 before (means of 6 and 12 runs of 30 s),
two clients together 1540 and 1524 against 1569 and 1566, and the 95th
percentile ping under the two-client load fell from 61 to 42-50 ms for
one client and from 56-77 to 31-44 ms for the other.

The change, this message and the test were written with Claude, an AI
coding assistant.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..b394a4cfaaaa9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1380,7 +1380,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
 	u32 succ_bytes = 0;
 	u16 rate = 0, succ_pkts = 0;
-	u32 tx_duration = 0;
+	u32 tx_duration = 0, airtime = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
 	bool is_ampdu = false;
 
@@ -1496,6 +1496,9 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	 * So skip peer stats update for mgmt packets.
 	 */
 	if (tid < HTT_PPDU_STATS_NON_QOS_TID) {
+		/* the users of an MU PPDU share its frame exchange */
+		airtime = tx_duration / max_t(u8, common->num_users, 1);
+
 		memset(peer_stats, 0, sizeof(*peer_stats));
 		peer_stats->succ_pkts = succ_pkts;
 		peer_stats->succ_bytes = succ_bytes;
@@ -1510,6 +1513,10 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	}
 
 	spin_unlock_bh(&ab->base_lock);
+
+	if (airtime)
+		ieee80211_sta_register_airtime(sta, tid, airtime, 0);
+
 	rcu_read_unlock();
 }
 

-- 
2.43.0



