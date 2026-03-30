Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A3FF495D
	for <ath11k@archiver.kernel.org>; Mon, 30 Mar 2026 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIMC7cDWsrBOtjtJ4eTyTeEKTFa7e1tg8E0vasvRRoM=; b=Z004tnXwPtoZO1JSET+jXL2Wok
	jrVWZ3sEnaaZAw5+d05xmBx3LmHxSm7xKdNPwgQ3va55soKy7UZgjWhCw3FgBFjvtju0Wmuk9auxX
	nQQlsn+aBrEb8sYZNFKDKpLbKIDk3QDP13qr9B4CCWqLyOUHvNLXRZvNRwa/7RXC0u3ZqLTR5TRlh
	lbyybrcpdSYx5ajg/wkUWgVEG4p8GIs855st2m9xycDa3RBFecIxqBvpLZ+XsXOU0wh4t98fqrQ04
	uiqdbJu4UfF3CyQfq2/7WPCzouDXNZJlkun9cSaGZQ4CpA6ylUjtgdsYokL46KQbDomsCk2fVZ4lI
	vRuvI1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Vj-0000000Anmd-2HdX;
	Mon, 30 Mar 2026 07:58:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Vh-0000000Anm7-0F8b
	for ath11k@lists.infradead.org;
	Mon, 30 Mar 2026 07:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774857461; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C0sJnXnikR4x7vtFyrDkiDDQlEJrN293LjqOiOw9RjaSacnlXhzk4Gy3axMvq9gMncqYH2aa7W4ocnQYglUt0dcT6I5xUPreOxtuQeltgN9NkaesNW9ww6BxBDrl+AqdjixsWtMsSEV/e8+NXOam68orpJ5ndrkun8PmCgDdvMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774857461; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eIMC7cDWsrBOtjtJ4eTyTeEKTFa7e1tg8E0vasvRRoM=; 
	b=P+TyzUEi6lRintRdy/j67dC6HcnvswGcA8C+ceVW7lKfkwlnkOXypwA00uTGpEJm5F3Ea4PD3FiSQs/Q1RSi5gIi/ObWbmP8A1mtm0MMMqx6VL1VndtNOWTdzRsYzMtc6dfMlcXwly1k4HArL8QJHJvcOvtX7VM9qSUt1bklGYw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=matthew.leach@collabora.com;
	dmarc=pass header.from=<matthew.leach@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774857457;
	s=zohomail; d=collabora.com; i=matthew.leach@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=eIMC7cDWsrBOtjtJ4eTyTeEKTFa7e1tg8E0vasvRRoM=;
	b=aam+Aiw3NqpnMwNC68ETwmlahVuwUNgeNoS5qUhdAXFFGNnwe1L7elha/C8mu0TT
	Pvo0etGaR+V+Lcp1d+y1woS9ii0NIJyBkcOv7MO6vGQqsxUZXB++igpGDRSxjOYglro
	LiX+zjXZwrcKuJpZ8A538I+8pUEbxTp1wYEll3zc=
Received: by mx.zohomail.com with SMTPS id 1774857454006418.10295521158673;
	Mon, 30 Mar 2026 00:57:34 -0700 (PDT)
From: Matthew Leach <matthew.leach@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel@collabora.com
Subject: Re: [PATCH] ath11k: workaround firmware bug where peer_id=0
In-Reply-To: <20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com>
	(Matthew Leach's message of "Thu, 26 Mar 2026 10:53:53 +0000")
References: <20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 30 Mar 2026 08:57:31 +0100
Message-ID: <87h5pxlpg4.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_005809_147776_33036BFE 
X-CRM114-Status: GOOD (  12.91  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello,

Matthew Leach <matthew.leach@collabora.com> writes:

> This patch caches the peer enctype during the MSDU processing loop,
> caching it on the first AMSDU sub-frame (is_first_msdu=1
> is_last_msdu=0) and setting the correct enctype for any subsequent
> sub-MSDUs.

I've been looking at creating a patch that addresses the root cause,
rather than patching incoming frame's flags:

--8<---------------cut here---------------start------------->8---
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 6d0126c39301..98348ccfdfbe 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -347,7 +347,7 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
 	return 0;
 }
 
-int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
+int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
 {
 	int ret;
 
@@ -372,7 +372,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 {
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
-	int ret, fbret;
+	int ret, fbret, retries = 3;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -400,6 +400,8 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&ar->ab->base_lock);
 	mutex_unlock(&ar->ab->tbl_mtx_lock);
 
+retry:
+
 	ret = ath11k_wmi_send_peer_create_cmd(ar, param);
 	if (ret) {
 		ath11k_warn(ar->ab,
@@ -427,6 +429,18 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		goto cleanup;
 	}
 
+	if (!peer->peer_id) {
+		if (retries--) {
+			spin_unlock_bh(&ar->ab->base_lock);
+			mutex_unlock(&ar->ab->tbl_mtx_lock);
+			ath11k_peer_delete(ar, param->vdev_id, param->peer_addr);
+			goto retry;
+		} else {
+			ath11k_warn(ar->ab, "Null peer workaround failed for peer %pM, adding anyway",
+				    param->peer_addr);
+		}
+	}
+
 	ret = ath11k_peer_rhash_add(ar->ab, peer);
 	if (ret) {
 		spin_unlock_bh(&ar->ab->base_lock);
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 3ad2f3355b14..6325c4d157c7 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -47,7 +47,7 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
 					     const u8 *addr);
 struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
 void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id);
-int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr);
+int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr);
 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		       struct ieee80211_sta *sta, struct peer_create_params *param);
 int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
--8<---------------cut here---------------end--------------->8---

This patch detects the error condition at the point where a peer map
request reply is received from the firmware. If the firmware maps with
peer_id=0, we request that the firmware unmap that peer and map again,
hoping it selects a peer_id!=0. We attempt this up to three times, at
which point we give up and let the peer be mapped with an ID of 0.

This patch addresses the root cause, but I think it's more invasive. I'd
appreciate some comments as to which approach upstream would prefer. If
the preference is for the above, I'll send out a v2.

Regards,
-- 
Matt

