Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD76FEB64DC
	for <ath11k@archiver.kernel.org>; Sun,  9 Jul 2023 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeblLxnmJyyr6tD0MoEvhETZgyHM9MZDDvnqxYpz/4Q=; b=UYBEJeY0JrhxFc
	o9jWTZG2CpLMV5YzwDpl2KNwGgqPb4DhoGV5rrUnYkUE2JXqyQ7RpiGVwaggT2xcLpspE4iruJsdy
	WQjGPWplsBJYKRrwcjpJYthrsxP9bqonRofcLq9L7/LlqRzIarI2kE5RN2XEnMmcqsao6IQ1UQd1U
	1J+Y/hlQeEm5px6HRuy6ob0Y8XJPqFEtoVLq7R1qkkqdr8dC7yekabYByyF7OKWvu9HdCzavrZHjz
	ExlHrBtTaIcB4kbEtPntQuZHF25XUWq9k4SdqXgKnq+vpqKYHUay1g0Oct7LrxeJfsVqb79OM0zd4
	FohGUFgBLLAt9OsSuk+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW7v-009Jas-1L;
	Sun, 09 Jul 2023 15:15:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW7s-009JZO-2e
	for ath11k@lists.infradead.org;
	Sun, 09 Jul 2023 15:15:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AECD60C1A;
	Sun,  9 Jul 2023 15:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47499C433CA;
	Sun,  9 Jul 2023 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688915704;
	bh=GrdR5Q7vdb3BWDoBJBU9/vUbDinfvJzNkbJ2rHQ4WyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fyNyFwYluOB1AlEp1dYJ6Zzyd3ylI4uNhhrOhDH26SeR2x3NWtqK/WdHDFmYwjqDc
	 XS5c0ZtfOR+dfAhNXXZYjGOsdSYloVFx61PbZ8FesyTxBjm/4DNeeyNaeb9E4Sd2Wf
	 3VX9hqtPK/iGjB4NZrgZMtQwdOV5slhFKfCalnbqfCxlAFCnzXBFhJdewWSBXNPz5w
	 qsRpBcQf8GvYYXw2OWOzAPn0KINuDH61Cm1M6ceeZWWvtVjlRtaCfFuX+qjWZBfJqM
	 v0itEVQ7IdxfLh4ogJJBMAw8SzNjO2fYXhO6xh4rh0QcmQp2g4OoW3fJoQWR4Sdgd0
	 UHrJN7VUHS84Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Aditya Kumar Singh <quic_adisi@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/18] wifi: ath11k: fix memory leak in WMI firmware stats
Date: Sun,  9 Jul 2023 11:14:38 -0400
Message-Id: <20230709151446.513549-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709151446.513549-1-sashal@kernel.org>
References: <20230709151446.513549-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_081504_901448_6F4DA8C0 
X-CRM114-Status: GOOD (  11.03  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 6aafa1c2d3e3fea2ebe84c018003f2a91722e607 ]

Memory allocated for firmware pdev, vdev and beacon statistics
are not released during rmmod.

Fix it by calling ath11k_fw_stats_free() function before hardware
unregister.

While at it, avoid calling ath11k_fw_stats_free() while processing
the firmware stats received in the WMI event because the local list
is getting spliced and reinitialised and hence there are no elements
in the list after splicing.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230606091128.14202-1-quic_adisi@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 drivers/net/wireless/ath/ath11k/wmi.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b19d44b3f5dfb..cb77dd6ce9665 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9279,6 +9279,7 @@ void ath11k_mac_destroy(struct ath11k_base *ab)
 		if (!ar)
 			continue;
 
+		ath11k_fw_stats_free(&ar->fw_stats);
 		ieee80211_free_hw(ar->hw);
 		pdev->ar = NULL;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index fad9f8d308a20..3e0a47f4a3ebd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7590,6 +7590,11 @@ static void ath11k_update_stats_event(struct ath11k_base *ab, struct sk_buff *sk
 	rcu_read_unlock();
 	spin_unlock_bh(&ar->data_lock);
 
+	/* Since the stats's pdev, vdev and beacon list are spliced and reinitialised
+	 * at this point, no need to free the individual list.
+	 */
+	return;
+
 free:
 	ath11k_fw_stats_free(&stats);
 }
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
