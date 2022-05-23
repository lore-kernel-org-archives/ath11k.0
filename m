Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827A2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uthpYlauwExN3obUY7ksiceB/yYPekfd/qBRZB8QwcE=; b=WSlCXmmxQogbqB
	UsyvBIW6TNZUEH0mDbnE/SV+M8ofBOC86oJG/dfb0rVVGrQa1NF3/ZHzbVxhLzTBLQ1+wmgn0dvuM
	PeDQ5nle7KwHed0eYEiOmHLy5hBQ4lbizq3Xb3iLl2sPwXM8YMXyTAbycpTPi66eaBSF6GnkwgJiC
	YZsg2DRRtNcF3zKWw+ZOC0IvQV0QIzlUGbYmrVjXZkMruOO925SI1CtsQRmwS7pZRMYy7A8nZTidA
	OigVRih2Ud3DpzNFa/WI21t6EWe/P5euufMzqwlNvAukKM9hNggpEXxdAwMaUFKkhU1WPC/33WbV3
	xQXeTyuOeWW2TOfBI0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt982-004jjQ-Tg; Mon, 23 May 2022 14:33:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt97z-004jff-Tv
 for ath11k@lists.infradead.org; Mon, 23 May 2022 14:33:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C513611D0;
 Mon, 23 May 2022 14:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24D9C385AA;
 Mon, 23 May 2022 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653316421;
 bh=6r/B2OiSPv2B6dH1KlUZS6QI0noV85NyqC24Oc19PEo=;
 h=From:To:Cc:Subject:Date:From;
 b=lOs2ImVwgVmmINHSludw0yNi1tbrS3ywDZ2SfgkBtafqAZswN4yzgTqV9IF//YBmk
 8QS4lcNCnRkaHau7Vkk/6hCF8iB2ULjSDbWrIITHFz7BCHGVusWg9jkBBKLmnV0bUS
 rIQKTCrxgBr0klOfwKBUgrazCgNgC7GoqRnVagX+urlz4Mhn/+yKv5moFKHn/Kaqsd
 S4EuLecAlegL7wm+R2XrBidnYA/w1wcF27a8MQSZk1qeChz3T9zxc+UjB9ZfUAp33a
 dFCIGc2ucp4JoMgBApju9s8Qkke1fvexvLh3o8hQuHSJNDRh6FjJCuphrFsf5FTUlT
 EuvlRrb/SkOuw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1nt97p-0006Sw-T1; Mon, 23 May 2022 16:33:37 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] ath11k: fix IRQ affinity warning on shutdown
Date: Mon, 23 May 2022 16:32:58 +0200
Message-Id: <20220523143258.24818-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_073348_022076_541AA305 
X-CRM114-Status: GOOD (  10.75  )
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

Make sure to clear the IRQ affinity hint also on shutdown to avoid
triggering a WARN_ON_ONCE() in __free_irq() when stopping MHI while
using a single MSI vector.

Fixes: e94b07493da3 ("ath11k: Set IRQ affinity to CPU0 in case of one MSI vector")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index dedf1b88ddf6..487a303b3077 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -920,7 +920,9 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 static void ath11k_pci_shutdown(struct pci_dev *pdev)
 {
 	struct ath11k_base *ab = pci_get_drvdata(pdev);
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
+	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
 	ath11k_pci_power_down(ab);
 }
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
