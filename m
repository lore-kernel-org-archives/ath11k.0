Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0924F41992
	for <ath11k@archiver.kernel.org>; Wed, 15 Apr 2026 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tt6CH031eOx9t7ge6yGWJdkGnvLUftOnZE7O43UVfmQ=; b=fU2eUaW4n4Zk6RdxOogpZ+M0ID
	4bgHD7pcbSPzSSC1mcacV2L/K7kI7PnoLODPHdc962ftsz4UrZznVB4um7Hi7habZUNqCbTNU1IPW
	Z+FYtT7wCM211+ZD2cDLNHSOWbg+ie6Q0c2eRum6CrqdrTTIQxqTnnBirbf0Bn/0rBu1M39hJDFZZ
	mwICArW8EIhGxv1umykLRv8i+gZMeBm81dILLkzAGnAPSV52P44lk4K9TsjIp89wTFSQ6063vioOq
	TgDTmsoDrzJkIRD5ushbiXUzPjvFSwhHZ+s81F8G691lpQBoFHU0ukv6nVFeVeW2w6Y4D+JihdqGD
	BHmzCCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyaS-000000013K1-3AyK;
	Wed, 15 Apr 2026 11:39:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCyaP-000000013JL-3UFo
	for ath11k@lists.infradead.org;
	Wed, 15 Apr 2026 11:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776253150;
	bh=JxotkZNGGVp6+Jfj35t3XJ8WSJ91VDrnPfRI530PwRw=;
	h=From:Date:Subject:To:Cc:From;
	b=Si79Lpj9kP7EF51Yk6vjhjTvDNw8ncA4HIZtiMvoWpNUHA5xwFI5s2vX1dXlw5cXs
	 RT2XiuHb6o4+kIXzHrW7buAjITQAoPWulGH41VxZrLFMWOJwv6cxjYbDKRtYZtSJ9w
	 bki4UN+/s8r2q2apOpCyV/5BK2NFNKGL7SNlLXQqDCgaSlP31WXoYedwneVFRW2hJU
	 u90JqvtclcEgt9lHnmYXvSnwfaNFQdCXYB7FxSQST7JoMEHCyP6Z86PMQJ3i0R2Lym
	 +MM55Ea2R+Xf3tgePEVXDRXGuX9WLAvHujAF5FsT/C2UR3J35Pkyv4bTws48ZDx0B2
	 w6QGx3XkI5OCQ==
Received: from [192.168.1.53] (unknown [100.64.0.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 461CD17E1356;
	Wed, 15 Apr 2026 13:39:10 +0200 (CEST)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Wed, 15 Apr 2026 12:39:02 +0100
Subject: [PATCH v2] ath11k: fix peer resolution on rx path when peer_id=0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBREr0K69ht+CYiuvIdhUdoildqSX0AN6
 d0teAGXL5l5MysLmowO7JKtjPRigvEuAT9kTPbC3TUYlZjxnFd5wSsQU484gJuthVGnsoKXp0G
 Qn52CipcC+flUY4ssOUbSnXnv/lvz4zC3Dy2nTbolehMmT5/9wIJb7t+tBQEhl7xTZZEqXX2V3
 lrRehJH6Z+siTF+AbW8HBPgAAAA
X-Change-ID: 20260326-ath11k-null-peerid-workaround-625a129781b1
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_043914_018561_C73808A4 
X-CRM114-Status: GOOD (  12.41  )
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

It has been observed that on certain chipsets a peer can be assigned
peer_id=0. For reception of standard MPDUs this is fine as
ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
based upon the source mac address.

However, on an aggregated link, reception of AMSDUs results in the peer
not being resolved for the second (any any subsequent) sub-MSDUs due to
the peer_id guard in ath11k_dp_rx_h_find_peer(). This causes the
encryption type of the frame to be set to an incorrect value, resulting
in the sub-MSDUs being dropped by ieee80211.

ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1

This patch removes the null peer_id check in ath11k_dp_rx_h_find_peer(),
allowing peer's with an assigned ID of 0 to be resolved.

Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
Changes in v2:

- Since peer_id=0 is a valid condition on some chips, remove the guard
  that prevented the peer lookup.
- Link to v1: https://patch.msgid.link/20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com

To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 49d959b2e148..ff2c78a4e5f3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2215,8 +2215,7 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
 
 	lockdep_assert_held(&ab->base_lock);
 
-	if (rxcb->peer_id)
-		peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
+	peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
 
 	if (peer)
 		return peer;

---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260326-ath11k-null-peerid-workaround-625a129781b1

Best regards,
--  
Matt


