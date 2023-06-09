Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C52C7EE45
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASgaO3DKSd2A/gK6wbGeThv9fFxpX2BNfw34ms/Iwvg=; b=Jdbj6e3zf85L14
	nqUDs3sXYn03CSYqgbAYprlZHnkaKH7mXMhQqS+6TvxPLGfdYbYngyZCi//4unIRS554crd+MRjdl
	3Ug62G+eSw3OJ5ZmSjLBv4n1K/r/zpshGTjZDgVBl7I+DoytkETYuBSfqc+O+ln+FBubf5W3JWD0o
	BZS162BH49xX5BbxP293GE9N+0egVl+6tq+67ETPortvJugNYW1slI+0AlEndvh8tJXMj0QpzekHd
	LSjSFY8/zui+ao/xQhPIKl1Q4oG+WpyqtEefdz6dv8ScdlMptvtOcu48NfGB3qvKKQdy/V5MaoAUY
	7IKPa3Z78Cj24sPnL3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2y-00DFgn-2s;
	Fri, 09 Jun 2023 14:25:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2v-00DFVn-0F
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E691C6587F
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98BCC4339B;
	Fri,  9 Jun 2023 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320696;
	bh=SKsI2rnqa095kjtAjcxr/w6BKVrMdzEtqkylAe3qL70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIxXPx56rm7FRXnEbpsgqgp2c2/Qt33KWXmY/nNz9gEEPCMg6Tq1qr9btZWRQq2mF
	 ZkNYRXuXwXcxBksUTQhROadVQIEMburjemHDto68zUdubpkrU7MCqAlTSjJXa+soAd
	 GGqTAwWfXmg9nxcQGWwTxqYffXCSLGuOVghk9crmh793htf+A6b5bJYp7y8SF7oFal
	 pG9Fk5OV5/fgkOIjeJoI8tljtMKEPN3XvrXmxyckCzHbddiRl74NS6ohHl3d/QdKNs
	 LrCl/3tRmoqrvQQ+PnwwEov5lNJ5hgbW4HwVuDqHK5acbkM2mad8rjlNOhFj3M+IEQ
	 BtMwX27OEzisg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 12/15] wifi: ath11k: hal: cleanup debug message
Date: Fri,  9 Jun 2023 17:24:37 +0300
Message-Id: <20230609142440.24643-13-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072457_148852_864375D0 
X-CRM114-Status: GOOD (  10.07  )
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

Fix the debug message to follow the preferred style.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 148eeb06a906..0a99aa7ddbf4 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1119,7 +1119,7 @@ int ath11k_hal_srng_update_shadow_config(struct ath11k_base *ab,
 					  ring_num);
 
 	ath11k_dbg(ab, ATH11K_DBG_HAL,
-		   "target_reg %x, shadow reg 0x%x shadow_idx 0x%x, ring_type %d, ring num %d",
+		   "update shadow config target_reg %x shadow reg 0x%x shadow_idx 0x%x ring_type %d ring num %d",
 		  target_reg,
 		  HAL_SHADOW_REG(ab, shadow_cfg_idx),
 		  shadow_cfg_idx,
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
