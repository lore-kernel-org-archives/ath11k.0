Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D9B606A330
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 07:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4USACU0M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4hgaTSA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+/uCdGuuR5fSzXmjT42xsc7BpukorOyOL5gWzvLV+lo=; b=4USACU0M+L+U6euxP1pW9k4myl
	TlTjPyjF7iamPtVwq6Smc4zTQJA0T/EgUaNrXKmAYAiauD+c+0f02tmq9L8UJEM+rHi0Pn/sbKT1l
	zIbZeEEl4iH1jf3z6icqXmGpBkc0Bw62uXIZGnH+6GaNWop6KRtXS+4n7tOK37sik0eSHoTIqdbpc
	cTk16pI7S0NSZjbTtecfo4iHHC1/XROC0CpEqFCRednXe9A+sOvTzRVBOEEVGpjP72OZEWKwI3SkX
	Wc5MZXWf0UpH2U8/O6EciCCVVeKOccoscGxRocNatOoQWXjxr0mMYUG22BECTj6tHcm6r4yv2mWaN
	NAsKSALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTa29-0000000802U-3bbW;
	Wed, 18 Nov 2026 07:24:45 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTa27-0000000801n-0RPH
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 07:24:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so331700b3a.3
        for <ath11k@lists.infradead.org>; Tue, 17 Nov 2026 23:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986682; x=1795591482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/uCdGuuR5fSzXmjT42xsc7BpukorOyOL5gWzvLV+lo=;
        b=u4hgaTSAXonmx7i1cnJPL0fcwixL6l3YWhXiMYRdzFiFODhXL1COeYE++YqNIqL3B0
         H1z7nTfN/8v2/PfLUvd20Jgpc0DgL+et51IyIIBT+m+Elb2lnfaVE0Hm0fq5fxwg/LHG
         S/OYJIyTDnEQ1mZQXt3/cseMXTE1W9sDBOnCiWZ5nH9ByAZEIOqpqwzWyxlhZJG/S76X
         t4sBGMLQye41/CP4c3mzlCUHFm0sZWV0znXQas86u3SRIYVFmtzk63WXOUhRP2VoxF8H
         bEhTidm0vqVgNhu8YXsWmOibKcXocIrf3ki6TT6qU4uJuEXX1a/lkLlFHSuSS3UzQL5b
         GH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986682; x=1795591482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/uCdGuuR5fSzXmjT42xsc7BpukorOyOL5gWzvLV+lo=;
        b=ozbiJu+vCQbf7wNJiGaNzFDGXlauEBxEH460Nle5L+7LGo08s53MaBQ65iCk5hGs80
         D/vt6ODR+XUhcGvluGWWaVb7R8ZXYNwFkQJg58H3WMxOC6hitUlKbHo5dozoX4TTLtYp
         BTcJtYU9G3ATVeZ/u2OcjR1++8Li7kfGsh/yaqFJc1hIxQeKfxISbreAbm4dE3rsGY+d
         gqHXpyY4ytO4t5Xrg+S1/azdXrRb9GHtnM9n28eLYqWKRgXGa7RPQlLGElne3H6eGgEe
         1/QGCJ4Hc4ecwaSSkI86YbIe84He0y1Qoa59is0NMFzbt/PjYkWgIj5Hwx6NjjyGNpND
         LP/g==
X-Forwarded-Encrypted: i=1; AL+hErHKxvqEc73VLkLrj+YHusCbg/5VsrBJydW8/0vGXzq8+MEcG4gkU0+dtHytwRunQ8PLKVHwJig=@lists.infradead.org
X-Gm-Message-State: APuU4Z8NOkKGE7YKIjag4DdApqpQu/tNUFM9h4vQUDOnQJBzB8RzxIbx
	xoDcjr2bLUuj0zsMHQpPDJnSBtE/QZvtYZ+MlrMbAYHApp08kzZ22Nm/
X-Gm-Gg: AYBFou3R7QPh46DRXvM0iC3Lsy5Xr/gGLib49BBWyxSYj3iDIMB2bWvQtDj3HCS2sag
	adMEDMiSzMmhSW7jPFQv5RUQlM1pyPK7KhpCbrK7Va5iblAdEEy5ZTWJrronvowLp2e9GLDne4r
	+JXrEnoI5Yes50pK4qtaYjH3uY+C1RfGyiO/rTzbwQzZR/7L+4ffMMSLpA+oLXB/Mx0wKf4oAEO
	Z5qR6siPEiVL8hyLlEm+tim2kbq/erIWTYCknYxTIt9t5hTUNsGqD7EA0ucG5ROHyDX9vY6EK8y
	ucbUQxL1F/auB4I4Yp6PKHPTBz8KL1Hjhm5pZrbP6q76u4Z5Aba82j4lqpZxGrP2UkwOY6PPUPh
	9GtfsxDQIKBAzOZAST4SCPEFWWMVZ7dbJFRxpkfk9ZXolgzkkCzmg6fycux5zCTs5PUl0Cw/nNw
	RMhmYCMj6I/rsWat25x7qTrwkvXlZoyYhR1NtKCtvdqiygdyt3BU/h8HrZDccu3y6i4nlblFAm/
	DMTNBsg5ywdAfnx+1wWnwCunqnfiYLFVOV59C3skPpH6Us/CutdBkIOzncgmEvDFS6xldz5rprQ
	IXUi3AmDAioytp92G3BGnjWosmNBEo3QYzh3SOuyD+tdONxE9ginUtbAHLuO42dsYIc3kRp75cv
	w2LjSeA15ng8n++/JqgZTL+NwS47bR6HnreGUtUYh
X-Received: by 2002:a05:6a00:2e16:b0:8b1:d612:e945 with SMTP id d2e1a72fcca58-8c5d48d7617mr1382905b3a.52.1794986681813;
        Tue, 17 Nov 2026 23:24:41 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa75esm694190b3a.15.2026.11.17.23.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	quic_nmaran@quicinc.com,
	quic_hprem@quicinc.com
Subject: [PATCH] wifi: ath11k: stop the RX paths before tearing down the peer TIDs
Date: Wed, 18 Nov 2026 15:24:33 +0800
Message-Id: <20261118072433.1259877-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_232443_154779_D5B8FCE6 
X-CRM114-Status: GOOD (  21.09  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_peer_cleanup() clears peer->dp_setup_done only after
ath11k_peer_rx_tid_cleanup() has returned, but that cleanup gives up
base_lock around every timer_delete_sync() call.  A fragment that
arrives during one of those windows still sees dp_setup_done set, so it
passes the check ath11k_dp_rx_frag_h_mpdu() makes under base_lock and
goes on to use the rx_tid whose REO entry has just been deleted and
whose fragment queue has just been purged.

Clear the flag first, while base_lock is still held, so an RX path that
runs during the cleanup takes the -ENOENT branch instead of touching
TID state that is being torn down.

ath11k_mac_peer_cleanup_all() walks every peer under base_lock and calls
the same cleanup before freeing the peer; clear the flag there as well
for the same reason.

The RX path has the mirror image of the problem: it drops base_lock
around its own timer_delete_sync() after it has already queued msdu into
rx_tid->rx_frags, and the teardown can purge that queue and free the
peer in that window, so neither the rx_tid pointer nor the ownership of
msdu can be proven afterwards.  The fragment timer callback takes
base_lock itself, so the lock does not have to be dropped at all:
delete the timer with timer_delete() while it is held, which keeps the
whole check-and-reassemble sequence atomic and leaves msdu owned here.

Deleting the timer is not enough on its own, because timer_delete() does
not wait for a callback that has already started and is blocked on
base_lock.  That callback would later run
ath11k_dp_rx_frags_cleanup() against whatever sequence is queued by
then.  Track the armed timeout per TID, clear it whenever the fragments
are cleaned, and let the callback clean up only once the deadline it was
armed for has passed, so a stale callback cannot drop the fragments of a
newer sequence.

The per-TID timeout state is initialised together with the fragment
queue, so the first callback after a peer is set up again cannot act on
values left behind by its previous incarnation.

Fixes: a06bfb3c9f69 ("wifi: ath11k: Ignore frags from uninitialized peer in dp.")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No ath11k hardware was
available, so the race was not run.
 drivers/net/wireless/ath/ath11k/dp.c    |  8 +++-
 drivers/net/wireless/ath/ath11k/dp.h    |  2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 50 ++++++++++++++++++-------
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..c1ec35262bd1 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -35,8 +35,14 @@ void ath11k_dp_peer_cleanup(struct ath11k *ar, int vdev_id, const u8 *addr)
 		return;
 	}
 
-	ath11k_peer_rx_tid_cleanup(ar, peer);
+	/*
+	 * Stop the RX paths before tearing the TIDs down.  The TID cleanup
+	 * drops base_lock around timer_delete_sync(), and a fragment that
+	 * arrives in that window would otherwise still see dp_setup_done set
+	 * and go on to use an rx_tid that is being cleaned up.
+	 */
 	peer->dp_setup_done = false;
+	ath11k_peer_rx_tid_cleanup(ar, peer);
 	spin_unlock_bh(&ab->base_lock);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6..d343f8e6df23 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -35,6 +35,8 @@ struct dp_rx_tid {
 
 	/* Timer info related to fragments */
 	struct timer_list frag_timer;
+	bool frag_timeout_armed;
+	unsigned long frag_deadline;
 	struct ath11k_base *ab;
 	u32 *vaddr_unaligned;
 	dma_addr_t paddr_unaligned;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..37fc116c4996 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -886,6 +886,13 @@ static void ath11k_dp_rx_frags_cleanup(struct dp_rx_tid *rx_tid, bool rel_link_d
 
 	lockdep_assert_held(&ab->base_lock);
 
+	/*
+	 * Whoever cleans the fragments also cancels the sequence that was
+	 * waiting for the timeout, so a callback that already started for it
+	 * has to stay out.
+	 */
+	rx_tid->frag_timeout_armed = false;
+
 	if (rx_tid->dst_ring_desc) {
 		if (rel_link_desc)
 			ath11k_dp_rx_link_desc_return(ab, (u32 *)rx_tid->dst_ring_desc,
@@ -3204,12 +3211,24 @@ static void ath11k_dp_rx_frag_timer(struct timer_list *timer)
 						      frag_timer);
 
 	spin_lock_bh(&rx_tid->ab->base_lock);
+
+	/*
+	 * This callback can have been started for an older fragment sequence
+	 * and only get the lock after a newer one has queued its fragments
+	 * and armed its own timeout.  Only clean up once the timeout of the
+	 * sequence that is currently queued has expired.
+	 */
+	if (!rx_tid->frag_timeout_armed ||
+	    time_before(jiffies, rx_tid->frag_deadline))
+		goto out_unlock;
+
 	if (rx_tid->last_frag_no &&
-	    rx_tid->rx_frag_bitmap == GENMASK(rx_tid->last_frag_no, 0)) {
-		spin_unlock_bh(&rx_tid->ab->base_lock);
-		return;
-	}
+	    rx_tid->rx_frag_bitmap == GENMASK(rx_tid->last_frag_no, 0))
+		goto out_unlock;
+
 	ath11k_dp_rx_frags_cleanup(rx_tid, true);
+
+out_unlock:
 	spin_unlock_bh(&rx_tid->ab->base_lock);
 }
 
@@ -3238,6 +3257,8 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
 		rx_tid = &peer->rx_tid[i];
 		rx_tid->ab = ab;
 		timer_setup(&rx_tid->frag_timer, ath11k_dp_rx_frag_timer, 0);
+		rx_tid->frag_timeout_armed = false;
+		rx_tid->frag_deadline = 0;
 		skb_queue_head_init(&rx_tid->rx_frags);
 	}
 
@@ -3698,18 +3719,21 @@ static int ath11k_dp_rx_frag_h_mpdu(struct ath11k *ar,
 
 	if (!rx_tid->last_frag_no ||
 	    rx_tid->rx_frag_bitmap != GENMASK(rx_tid->last_frag_no, 0)) {
-		mod_timer(&rx_tid->frag_timer, jiffies +
-					       ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS);
+		rx_tid->frag_timeout_armed = true;
+		rx_tid->frag_deadline = jiffies +
+					ATH11K_DP_RX_FRAGMENT_TIMEOUT_MS;
+		mod_timer(&rx_tid->frag_timer, rx_tid->frag_deadline);
 		goto out_unlock;
 	}
 
-	spin_unlock_bh(&ab->base_lock);
-	timer_delete_sync(&rx_tid->frag_timer);
-	spin_lock_bh(&ab->base_lock);
-
-	peer = ath11k_peer_find_by_id(ab, peer_id);
-	if (!peer)
-		goto err_frags_cleanup;
+	/*
+	 * The timer callback takes base_lock itself, so it cannot run while
+	 * the lock is held and deleting the timer here is enough.  Waiting
+	 * for it with timer_delete_sync() would require dropping the lock,
+	 * which lets the peer teardown free rx_tid while this path still
+	 * uses it.
+	 */
+	timer_delete(&rx_tid->frag_timer);
 
 	if (!ath11k_dp_rx_h_defrag_validate_incr_pn(ar, rx_tid))
 		goto err_frags_cleanup;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..4bdc9afbc3c1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -899,6 +899,7 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	mutex_lock(&ab->tbl_mtx_lock);
 	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
+		peer->dp_setup_done = false;
 		ath11k_peer_rx_tid_cleanup(ar, peer);
 		ath11k_peer_rhash_delete(ab, peer);
 		ath11k_mac_station_cleanup(peer->sta);
-- 
2.34.1


