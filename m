Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92C9C00528
	for <ath11k@archiver.kernel.org>; Sun,  9 Jul 2023 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8cojtJPBiSyxe5tBcoiZEOSlhoxkKlvJaRzEacBKcA=; b=EFtEYqjPQUol0k
	ZzjAoIagFeqmrj0u3GVi3ztvqLnAezYANY7G4Wbrl+p4WEPb6DlzStl2ZLMiUO9hlBGWfn1P4V5gx
	O87En2yL0lTaZ2CdgdmgKMjIniis0PXgeisKeGeLAPzxETQNfEQ/jbJyOqjraIP8tMLgaMrPfXa8b
	DHD7fFXQ254RPyxgXzsETClLYiCIqCZ7rq1Q3mImbvIl76ZHkavNIs8HT917N9mVwZP3eXDArG8ui
	T7kceFrPAywXq7YlqN8k35vP1KhSvgeuWMxGwCDn03VTa3363rNdtM6j1rztg+EOq8yuSEKe/B5ur
	TJFtCPB966x4KKItRK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW7C-009JKo-1W;
	Sun, 09 Jul 2023 15:14:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW79-009JJX-12
	for ath11k@lists.infradead.org;
	Sun, 09 Jul 2023 15:14:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB07E60C04;
	Sun,  9 Jul 2023 15:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC79C433C9;
	Sun,  9 Jul 2023 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688915658;
	bh=CD2lK8E/W6ZnWeWOc+3c8JjIDvvqhN1z8hw73ASqT5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lfnR99q7QItdk593iqluBVfJ5HiMDmdeyNmP09pLfDh82o6Md5hDm/AEDX9hCvGRI
	 bnZ3jhxPbgMVNO0DUBqOrSvzB3qCnLuJMvwZHIzILtSS7tgcRuN5iteDNIXaPJ2PpS
	 oGXv/jhl5XPKxcEtH7nw9hXsiGdQKspjOzK5I7O4brfHHgdtJ7uZop/KdSergtvOja
	 vqeb6UhZkxKsBuZg2ynZ6LnfGHPzRMUZljHTDnx25E22yw33cN43xaDytsMP1Vw8uk
	 gY4t4oRRnwZE7MZW8SPVJEOhkGdN+Vq9t3S0x242HLdQ6XbIYaXeAgHT4EkSv2qvzh
	 aLDPpjK12R29Q==
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
Subject: [PATCH AUTOSEL 6.3 13/22] wifi: ath11k: fix memory leak in WMI firmware stats
Date: Sun,  9 Jul 2023 11:13:47 -0400
Message-Id: <20230709151356.513279-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709151356.513279-1-sashal@kernel.org>
References: <20230709151356.513279-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_081419_399424_DEE6CD77 
X-CRM114-Status: GOOD (  11.33  )
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
index 850ef35c1f75e..07efd48795d33 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9349,6 +9349,7 @@ void ath11k_mac_destroy(struct ath11k_base *ab)
 		if (!ar)
 			continue;
 
+		ath11k_fw_stats_free(&ar->fw_stats);
 		ieee80211_free_hw(ar->hw);
 		pdev->ar = NULL;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b3a7d7bfe17c2..68fbddfd428a6 100644
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
