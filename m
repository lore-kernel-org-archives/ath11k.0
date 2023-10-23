Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DC1C004C0
	for <ath11k@archiver.kernel.org>; Mon, 23 Oct 2023 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xGYzv6dysxUIol/aHdX30rHHinhcgbY91GE5yFKKi8Y=; b=kNmXrWQLGmEHgs
	nCsY10UL1sH/GwfwplIe2x/qzB2t8AZFWwvTJTPghXKpCwyJoXKqqDQ1xRxUjAxPCC9ZQL/S8/3fn
	5qOlqKATQtN+lcTcWsR9qEESB9GojlacuxyKFtHLWR60U0WwrgdhbY7kWxtIGiOVMb2A8CFlTNZBe
	3PywU7T8wOmXGfzKlh9yUxONEcevEjhG8plZRb0EV8rS8uMpLi/27gBAFvgy/i8I7Yfl3P21kKCd1
	vLiuQNmEhmWBkbUap0bf9J1VDWL91Lj72JWOowfgmOVKDphO/4XH1KPcX7fqJcuozbblO5970zvd4
	aOVD9rBI4QvMXCSck/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxze-007r5o-2h;
	Mon, 23 Oct 2023 16:41:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxzc-007r4y-07
	for ath11k@lists.infradead.org;
	Mon, 23 Oct 2023 16:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8381CE26B9
	for <ath11k@lists.infradead.org>; Mon, 23 Oct 2023 16:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F4BC433C8;
	Mon, 23 Oct 2023 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698079283;
	bh=WAm74M7mbG38lwboqiQzFnKHRrC1aVyJgkBL0L2vwCk=;
	h=From:To:Cc:Subject:Date:From;
	b=fNrVnAGg0i2rOZZlBmfXG296ACi0jqjRnyBSyE6MKU7LpFq/0GDHqLDM4zwvdL4rE
	 NDYhEp16ThDgBcnTa0XDOI6KXaGjVvn1uxHE0Pir5z7i1TXQBQ5lwceSm9i+BvXu3v
	 0wwDJNO0i5w36JEZkkL1k9PGE1/1HUEzat2vRIPsRzHje/IoF058gKyvbchM67/TOC
	 0+nUAOYPuS7tvo5RlVRxr/9NAMtARBpy/aq8KCyJTTDDlsB/KXEcBv+BoutdGIupPt
	 loZeJWhykrGOAUUmitv681PfTt4LWJB78r+cieWE/rXQ7LR6VTitCFptSw+5IHUUHh
	 ibHbgj8lF5DmA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] Revert "wifi: ath11k: call ath11k_mac_fils_discovery() without condition"
Date: Mon, 23 Oct 2023 19:41:20 +0300
Message-Id: <20231023164120.651151-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_094128_254217_D5495508 
X-CRM114-Status: UNSURE (   8.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

This reverts commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc. The commit caused
QCA6390 hw2.0 firmware WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1 to crash
during disconnect:

[71990.787525] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM

Closes: https://lore.kernel.org/all/87edhu3550.fsf@kernel.org/
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ec46e2ee6ddf..7f7b39817773 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3732,7 +3732,9 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 	}
 
-	ath11k_mac_fils_discovery(arvif, info);
+	if (changed & BSS_CHANGED_FILS_DISCOVERY ||
+	    changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP)
+		ath11k_mac_fils_discovery(arvif, info);
 
 	if (changed & BSS_CHANGED_ARP_FILTER) {
 		ipv4_cnt = min(vif->cfg.arp_addr_cnt, ATH11K_IPV4_MAX_COUNT);

base-commit: 5b6e11406d5c198c402e8b7f7085a8c229198ba4
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
