Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC8BC41513
	for <ath11k@archiver.kernel.org>; Thu, 11 Apr 2024 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETnqpfx+G77pnJ/fxowRO/fxEqWzHDaFw0QU8+RTG+M=; b=I5pOtvz6fZryT0okswGXhTCd4H
	eWo9f2LTjvW4R6FNK0YpmQrbyHl62tH7ypsgRmU5p6L9EU15fleT/zeMh447RzAgKg/SiBeLu0ism
	vgrULg0GVMmr3aBqbvg5xzFfE+O/pXNSkAbj1QAmuYaRqBPGJ/LwwuT7ItQM8ysItNNvBbHE12RcT
	4e42I7BNyli+ukLWtwqygVQ6yfobAr6AERj9BnXcjct8tK4CjDBnVRFErK0xH7oCBSoCQkPliHyOk
	3bVazzgWKSEND2dRVWGlCXjUpcU2f9RgwC97cFZZF9sqHu0Ma2XZplCATxYio6GPqGxobofSFM6ZN
	s1c0r1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxhv-0000000DCbC-2s0K;
	Thu, 11 Apr 2024 16:55:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxhs-0000000DCZ5-0XI7
	for ath11k@lists.infradead.org;
	Thu, 11 Apr 2024 16:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73599CE12CF
	for <ath11k@lists.infradead.org>; Thu, 11 Apr 2024 16:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262B1C113CD;
	Thu, 11 Apr 2024 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712854521;
	bh=PIuzyiawecI9ZT/F/gvfPSL47CLIFp0J4d/wSzhLX9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r9A7Af92CnZJEYonTzgi1InBB2PCMyMBAtCQe+Q5mpUPxayatA4Yy7eYPs/Xxwn5v
	 YDcdnfplC8Gs3CV2kMpLT3mBU3XvB7DXkTXxiEYLtJDYfJoSJ7iwaWfwrVjLbdgGp5
	 QeSMYdXg89aeySC97kao6KBqwyVoVoMW/eI5X183+ZSziIY09bRJzPMSnS3IBRwsNo
	 8sO/0K3hVvMhRlog80kWlGsMQpDVPVBg411vtH1J2nnsjkB0ro19IYr94XD5YMbsfQ
	 tJ3s5wqHjbdMxYtH+Z1gYnA4CmjZu30ksiXO6ebNBAyj4NzMdUDAOIQnjKm9FDYW+1
	 EzAwQ+3Fvug/Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath11k: ath11k_mac_op_ipv6_changed(): use list_for_each_entry()
Date: Thu, 11 Apr 2024 19:55:16 +0300
Message-Id: <20240411165516.4070649-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411165516.4070649-1-kvalo@kernel.org>
References: <20240411165516.4070649-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_095524_499590_A87A63C9 
X-CRM114-Status: UNSURE (   9.01  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <quic_kvalo@quicinc.com>

Simplify the loop by using list_for_each_entry(). No functional changes.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4fdd56cd30a1..4ff8dd0d157b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9104,7 +9104,6 @@ static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct inet6_ifaddr *ifa6;
 	struct ifacaddr6 *ifaca6;
-	struct list_head *p;
 	u32 count, scope;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "op ipv6 changed\n");
@@ -9120,11 +9119,10 @@ static void ath11k_mac_op_ipv6_changed(struct ieee80211_hw *hw,
 	memcpy(offload->mac_addr, vif->addr, ETH_ALEN);
 
 	/* get unicast address */
-	list_for_each(p, &idev->addr_list) {
+	list_for_each_entry(ifa6, &idev->addr_list, if_list) {
 		if (count >= ATH11K_IPV6_MAX_COUNT)
 			goto generate;
 
-		ifa6 = list_entry(p, struct inet6_ifaddr, if_list);
 		if (ifa6->flags & IFA_F_DADFAILED)
 			continue;
 		scope = ipv6_addr_src_scope(&ifa6->addr);
-- 
2.39.2


