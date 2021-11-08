Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D307C433EF
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE93614C8
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BE93614C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zgNDDpfs2KjX9Se+SMAXwQK12BZ+TQqV77wuAj9suY=; b=qwxsp1TK8TPTAl
	gsstfrjpJPtboL/IL461rE6/JR4ZzKeE9wleMO1OqH2tD9McBVdKS/QjHFwH+hQwAli4kzMYuVEgK
	c2A5irRl4IsqKxQ5YDXN5tuonTnucmyOBxLBoXyjuhLmFDdNNxFVCkkI1ukk+SZLRxHevhj1qQSiS
	SNODsgFiVZ2zfmKBpLzO45ycoe+NtkxaK8z+nOw8tV6vNAysGCH3d0iEAZbL8FT3tW6wN0dM0h7qu
	jt88raG68Yir9SwtjI94kD4QJTCofcnUPpBZjYoCDDAjSPBQ++stfA8lp/uAhucHEjgjOq/AmMB8E
	z3Mb07uophc9zPDNaPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFa2-000CsK-1e; Tue, 09 Nov 2021 01:05:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFVR-000Aiz-U6
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 01:00:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CB2A6134F;
 Tue,  9 Nov 2021 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419657;
 bh=j4DogJZl2Vu+zsxMLerayzNIup6aEJcDiqFmY097EUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jr/BBwlZUhINg51Yg3cpPZcrf+XQEtnjGfJJ3EKze+6vf9sgLpvQcbG6V79j0mEfw
 sYh3WChTYIV+4WBj2HmMEEtn3uQ/tRcyK44EE/tJIewahdHYmF4I0bsXIgvrCTMO2a
 ubg7XEF2ntoUDIJzdi7QLGn8ssks595CgKiXFv1MdPVTxRfKyZjeHkLQigJ2E1prfw
 Vq6AYBgwprkMVMZDfPo/22cAekvSjhBjwdqHZ5igerlM5mTnE9vkVfCCmykehaXNj4
 QX2OGL0oFtXvTLSDGwUUKI/Kh+PDPrguyuRmKHzF4T6KB9F87KMDT1wykl5gNyXy3h
 FQMgHDpe1uLeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sriram R <srirrama@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>,
 Kalle Valo <kvalo@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 033/146] ath11k: Avoid reg rules update during
 firmware recovery
Date: Mon,  8 Nov 2021 12:43:00 -0500
Message-Id: <20211108174453.1187052-33-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174453.1187052-1-sashal@kernel.org>
References: <20211108174453.1187052-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170058_049531_D1630540 
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
index 27c060dd3fb47..fa27115483c6c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5793,6 +5793,17 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 
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
