Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E9606D801
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulSejpKq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uvsj/Kzd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h8r1VGcPDNnPxIY04XIKG5IMdGlTDl1N3L8FqBps7F4=; b=ulSejpKq+UYGViA5GTQDnY39Fz
	iKAMWK9PuWZ1cB4LapKZN6j52thjPPJV4/aPhcmkduwJPjWrm2I66hGws58beEcsTYrdarxSVaCR4
	3P4YEgBtWt/oQg2t8wrNv45FRum1oBVShtKv+UmK/w94Nz4uovcio/kCF63izxdhpuZGlhxy78iYF
	oJsCP1FOMI2x/GblYxVpJXGXF1GSfjRuYWkQqS7qPieOGYBmdxvj+T97JxDz9aPKaDHpKVR9oaaqm
	5zcIt6jmows4cT0iIU/wfBJmLMAcmOg9EVysEZ7cR/tmvko6mGs+wDl7AJCiay12s7Z+a4C7z1HVW
	UpnDUV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1wH-0000000A58E-1Yz8;
	Thu, 05 Nov 2026 18:11:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1w5-0000000A55G-3RdF;
	Thu, 05 Nov 2026 18:11:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A4F343EB4;
	Thu,  5 Nov 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793902301;
	b=YTiMvr/pkIpMzNIF3iPhfW3zs2v2YHIgzomcwe/WAsHz/fPgbXN204H6LYufhenTUR5p
	 6QsBW60nmF+KP4lfe3S6QiFx061k5Bk0EtO8D5ebTcfE//elvsbAdfig7NIl+OD29QfE5
	 buIIANXbLCGMLHtja9r4Szh9QcP3cwW4593Y1dgXtk9vWo+Wum6f7VCLwLUZSWqbDxfeC
	 gy95l+oerH3P6+ftDg4gPzfbkLH9rUoc4I3Ax+CvkQ5OO//6kISUZoekTYZFRyi1rhs3i
	 plxCfqRIZXFf7N/rFgBPS1pFSXNLY8wV37XbJVtqOWDS+i5cWyDYjZUiwDFKyppBztg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793902301;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h8r1VGcPDNnPxIY04XIKG5IMdGlTDl1N3L8FqBps7F4=;
	b=mHgf+EbL7hAjt8lFSq2/DkT1sX3lpzWmOE7NjTQQ+iUOAJy6GeW/bi+rjxA4IqEu/tLv
	 2lgr385g9a71TISxmBlXqWo4XNWOx+w7FKDkYegqUJoEXA0a4kJDxXTfIN5Uwh/gXBZyZ
	 173hAhdtbqxWCfYurTfIDFMev3NWn1G9EWJ4hW78C43M2UrpH7Hm9bI4h+MeyXn/f5DII
	 ue+Mr58cQmbOIM7DLJK0sR/lWU/IjpWm3bG5fc/MNhx/lVoCs5h2TD6E5C029z6MusLG0
	 NxfbtV/vWNWw2Uw+qXL932qfW+DQWZLkJS1CmwX+VhLwPUkyX0PhjKTQRqOsdeFX0dQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C47C1F000C1;
	Thu,  5 Nov 2026 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793902301;
	bh=h8r1VGcPDNnPxIY04XIKG5IMdGlTDl1N3L8FqBps7F4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Uvsj/Kzdo1x0SW5964/3jHesWe+iIPd3iLlKc5n7cgq4rRCYXPzz63TgfGjpq+SwW
	 CEXfjkx+B0b/ky/enmhSXg3GQKZ+scRVdw1tD9LCQAEvLsQgTtGdGboNc6UEtNXFMo
	 1T7uN8mnpDw9Lroqq1MyjEdD3HngIgvfuCQMVODMmfzG4gJCG0lwDoWfbQrZuYv0vX
	 /W0r5E0/0CUe8X2Q+u0evSRQp88ZNdZsf0gPOdvG6faDdsZAdUH1sjH2OFv8TQQ22u
	 lIjL4XlS34JZy9ba4r/NAnTeqJNzcAJFHg4eNoOigiAY6yICFEr9ySgQU8EfYFwjCQ
	 h/fCAjJVPWOaw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 107FE473B9;
	Thu,  5 Nov 2026 18:11:40 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 12:11:37 -0600
Subject: [PATCH 2/3] wifi: ath11k: don't arm the scan timeout for a scan
 that did not start
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-ath-recovery-scan-timeout-v1-2-99a70d89e114@gmail.com>
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
In-Reply-To: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
 Hari Chandrakanthan <quic_haric@quicinc.com>, 
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, 
 John Crispin <john@phrozen.org>, 
 Govindaraj Saminathan <quic_gsamin@quicinc.com>, ath10k@lists.infradead.org, 
 Wen Gong <quic_wgong@quicinc.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793902298; l=1793;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=BE7ZZiDwoQohf3HNv1LT97zdlpVPS1QyfAViwcyIEvw=;
 b=4AlrQNqA3KWa7YCP1sXjptaRVGnoAzA5IAx2wXQGw1d0U8pJn0rz7yoO1o0HcMCcSHAIBt146
 5szc68Ym6OzDfsmxpQFIzXVq0IwLJFtMi5uuaZ3c2HvXsATbt0BpG5/
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

When ath11k_start_scan() fails, ath11k_mac_op_hw_scan() sets the scan
state back to idle and returns the error to mac80211, but first still
queues ar->scan.timeout. The timeout then stays pending for the full
scan time (20 s by default) although no scan is running. A scan started
within that time gets no timeout of its own, as the work is already
pending, and the stale one aborts it early.

The stale timeout can also outlive the radio. On a QCN9074 whose
firmware crashed during a scan, recovery failed and the driver was
unbound and bound again; the failed scan's timeout then fired from the
freed ath11k:

  [  145.937344] ath11k_pci 0001:01:00.0: failed to start hw scan: -110
  [  166.251148] workqueue: cannot queue ath11k_scan_timeout_work [ath11k] on wq D@\x7f\xff \x05\xb6...
  [  166.254814] WARNING: CPU: 2 PID: 0 at kernel/workqueue.c:2292 __queue_work+0x3c4/0x4d8

Don't queue the timeout when the scan did not start, as
ath11k_mac_op_remain_on_channel() and ath12k already do.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5e4bb0ad057dd..291077c551476 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4335,6 +4335,7 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH11K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
+		goto exit;
 	}
 
 	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,

-- 
2.43.0



