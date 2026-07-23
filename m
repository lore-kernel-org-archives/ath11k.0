Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B33AC44524
	for <ath11k@archiver.kernel.org>; Thu, 23 Jul 2026 08:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNpq27tB3nSmwYwX0wcczUDMon2N3d5uNtInLRxUpos=; b=igieFE6p6etDDTY99A2z2spF/1
	/LJwNKXVcyUqNIydB/JatKGjEBKtXn+ZL+otHguKJipbGDGQOj5zFXb4Wyn7uHl0lKGVbNPyCxGoE
	gmmUnkAiL4o3SraliJeJfd5jDV7ipVxuVokJWcu3ORShy/P+Va31Z4Pxh6G6J7GLWW3//YjHrKEJe
	1ttdM0/W/92FRpEHitPSZxzd+vRrhiQjkN3xtp4fiOLsoo/oJqg3Ov1Tb0TyeczJWSZ3HPaflOidm
	Hp9NOfoiEARN9NH+WjIEwprZwIp/VHd3YNa2GQIKz82ZZTWzXy8kEaJrg9mnjUi+ipW1dk+ZwhXsF
	PhelA+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoTX-0000000DhLs-4A1y;
	Thu, 23 Jul 2026 08:08:16 +0000
Received: from e3i380.smtp2go.com ([158.120.85.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoTV-0000000DhKn-0xLm
	for ath11k@lists.infradead.org;
	Thu, 23 Jul 2026 08:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1784794079; h=from : subject
 : to : message-id : date;
 bh=rNpq27tB3nSmwYwX0wcczUDMon2N3d5uNtInLRxUpos=;
 b=hYC7U58jp1KnHxj5PtfKQJBE9ylnlT0v8wlcOVK5RqFEDfEwr2wfk0turw5KzwNBGxuzx
 BwAQjtoliWqUHUOPDXYYacQw8Tv5GfzKe8wRYIcUkm31chvY0XtOJHzsmm2sKu2vNHb6rN4
 Em2snwGFj5OJOENT/vI9/GERslKtP77U06m48UQsTA0bcmjCLfPltYzDWYM+1LyIxJNjG7s
 PiACDSJbwq1CnGsJzC0biu5uYXaD4lePdavPCTahTMYgMym1t3Kcemvkl4S4195mJszrXNM
 DTLwTiUSmFcHNq4GevMfHrPffo92sEIlpOAjL5WcIRVybknCfPL26A2SiuQg==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.4)
	(envelope-from <repk@triplefau.lt>)
	id 1wmoTE-4o5NDgrtH57-qbVX;
	Thu, 23 Jul 2026 08:07:56 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH] wifi: ath11k: Avoid adding the same peer twice to a pdev
Date: Thu, 23 Jul 2026 09:43:09 +0200
Message-ID: <1316ed692b84f1d956e4854d9e974569a3961795.1784792420.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sUWJ1d39r3
X-smtpcorp-track: rRHTyrZ8QSo8.IAwY2EDMjMqG.S5rM_AYF8CE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_010813_421299_218BFF4D 
X-CRM114-Status: GOOD (  12.98  )
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

Adding a peer that already exists on the same pdev, even if it belongs
to a different vdev, appears to trigger a firmware crash.

Some devices authenticate with multiple BSSs simultaneously to gather
more information about their wireless environment. When multiple BSSs
are hosted on the same PHY, the same station may be added as a peer
multiple times for the same pdev, which causes the ath11k firmware to
crash.

Prevent the same peer from being added more than once per pdev to avoid
this issue.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/net/wireless/ath/ath11k/peer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index b30a90698544..b7277e4b188b 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -386,7 +386,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_lock_bh(&ar->ab->base_lock);
 	peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
 	if (peer) {
-		if (peer->vdev_id == param->vdev_id) {
+		if (peer->pdev_idx == ar->pdev_idx) {
 			spin_unlock_bh(&ar->ab->base_lock);
 			mutex_unlock(&ar->ab->tbl_mtx_lock);
 			return -EINVAL;
-- 
2.52.0


