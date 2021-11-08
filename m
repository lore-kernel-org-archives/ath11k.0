Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C567C433FE
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:17:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D846112F
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37D846112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxSqVCJIv8m9LqFP3cX9Xa878ClzDTAx2o2FjEYFk5U=; b=ksuLcbldmCKgk7
	Mq8TQ/zyaJVeNmEWxbftcEr13/K9X5Ih83pKAxwGbjvEuxdhLBsWHewG7zVsoWqDWQIjZEYDzWTt5
	qx0l2B5wn1M4EUs10bYOF/sl6d5+SbxmX0pG0Quxt96rpgeqXBwgUJjdqYs7forOvYxUBIFghbp8D
	XiFgVeTTXiVNP6+np81RNb2x7FpwKj0QQ7oI1Rydkjeqof0ygXa5LBdHrBqEFnYVqYLJ5hUbW8xnI
	jtHVxsM9iyTJIjUIk/ubsu8JTyKpgupAiuwedL8blDUNcjbKN2nr4n8i+tJPv6otEN911X8PwG4lu
	XAmlBwKn1LHwubbzEBUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFlR-000H85-DN; Tue, 09 Nov 2021 01:17:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFYQ-000C6x-H3
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 01:04:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0334961361;
 Tue,  9 Nov 2021 01:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419842;
 bh=SqMwSJlsmhRnzp2vM6XUPwpHBdW+FdUM2Grw036Ydhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QXY86Hk3UBksnZoIJikSuIpj8pGbNA/9S5cC/JnzL9MADPEYlvtOPH6hTdoH2uyD7
 oemV5i0dikhtbAkI0v1NcyL6OrHmCec46qDvU7ImFAUNvMRzAQxz/kNXZh5KqXk1yM
 +aynRbNbMNI5aD9GplZeMFaewNyoWkLcurVbKto7K+Z2pPQGblyZeRzSX8gZK4nRLx
 0lwSWGh7/qfC42pYH2UPL8TnjyuHy14urWFIZSWXWIpVdp19RYJqD/Jp//FeIRHZf2
 SiIuZQaL6hC883XBDza8byK5KYirD4vVcx0dJWUwkmF79fC254CAfGQ6KBYOSQ7Y9C
 1YmrEZ9jOXSAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sriram R <srirrama@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>,
 Kalle Valo <kvalo@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 023/101] ath11k: Avoid reg rules update during
 firmware recovery
Date: Mon,  8 Nov 2021 12:47:13 -0500
Message-Id: <20211108174832.1189312-23-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174832.1189312-1-sashal@kernel.org>
References: <20211108174832.1189312-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170402_661270_5825C52F 
X-CRM114-Status: GOOD (  12.28  )
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

From: Sriram R <srirrama@codeaurora.org>

[ Upstream commit 69a0fcf8a9f2273040d03e5ee77c9689c09e9d3a ]

During firmware recovery, the default reg rules which are
received via WMI_REG_CHAN_LIST_CC_EVENT can overwrite
the currently configured user regd.

See below snap for example,

root@OpenWrt:/# iw reg get | grep country
country FR: DFS-ETSI
country FR: DFS-ETSI
country FR: DFS-ETSI
country FR: DFS-ETSI

root@OpenWrt:/# echo assert > /sys/kernel/debug/ath11k/ipq8074\ hw2.0/simulate_f
w_crash
<snip>
[ 5290.471696] ath11k c000000.wifi1: pdev 1 successfully recovered

root@OpenWrt:/# iw reg get | grep country
country FR: DFS-ETSI
country US: DFS-FCC
country US: DFS-FCC
country US: DFS-FCC

In the above, the user configured country 'FR' is overwritten
when the rules of default country 'US' are received and updated during
recovery. Hence avoid processing of these rules in general
during firmware recovery as they have been already applied during
driver registration or after last set user country is configured.

This scenario applies for both AP and STA devices basically because
cfg80211 is not aware of the recovery and only the driver recovers, but
changing or resetting of the reg domain during recovery is not needed so
as to continue with the configured regdomain currently in use.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210721212029.142388-3-jouni@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index fca71e00123d9..2f777d61f9065 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5362,6 +5362,17 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 
 	pdev_idx = reg_info->phy_id;
 
+	/* Avoid default reg rule updates sent during FW recovery if
+	 * it is already available
+	 */
+	spin_lock(&ab->base_lock);
+	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
+	    ab->default_regd[pdev_idx]) {
+		spin_unlock(&ab->base_lock);
+		goto mem_free;
+	}
+	spin_unlock(&ab->base_lock);
+
 	if (pdev_idx >= ab->num_radios) {
 		/* Process the event for phy0 only if single_pdev_only
 		 * is true. If pdev_idx is valid but not 0, discard the
-- 
2.33.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
