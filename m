Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F65C433F5
	for <ath11k@archiver.kernel.org>; Tue, 17 May 2022 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j6hDR2g2mAu5HJF+4Tg4xGjojWHXd6QFCK9wF4amYxA=; b=jRXXcPwk3b9WqL
	SOnt9OGgZdcxvMlKmSMiD4KAtCpZZ558B+vPgLWu8Bt1mWusoInCP8F9+M+nR6oWsnPtfPt9AYm2X
	J4Y9g0mZUKFxHIcIXmXtDfvAE+Z0AaBPv8Uz0bBLBQSsujXU/677FlERoG3G0HxUiZ2aIPLv9nLFt
	/oLRScfQThqpmdLZxcS+2MpenCW9bPce6G70mBcGfohoj4Dh8ZY4cF7QuL99ofwWbxwhuyTSLF5NW
	H35Ku6/tljzy1YQW5ac0TLWCZ7629vPhBfDH3WCGTfN0fZa/9r8g7fjnwkLN/Frep/BsLR2wFCngd
	B5JealorQu1ACs1bL4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquYg-00D8do-U5; Tue, 17 May 2022 10:36:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquYd-00D8av-47
 for ath11k@lists.infradead.org; Tue, 17 May 2022 10:36:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6237ECE19B0;
 Tue, 17 May 2022 10:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6701C385B8;
 Tue, 17 May 2022 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652783758;
 bh=lAksy8oepqE8iH2ITwCihZnI9L3nnQyBWYqoVUXqlUo=;
 h=From:To:Cc:Subject:Date:From;
 b=J4VVh6cFjDb1jIJK8SYjto2TV3c/jw1kHwiDZN006Xmam81unpFPSThWn4ldxHTYE
 DKpLfJC312AWUUSiZ4/T7FCDwjprWzSu4EWs/G0YLfZL8Zor4UUK+KMtDudRLjJU0X
 tNiMAYBysrP0AAoM6IgFtmeQeUz+Nxo5PMA+gPR1XgeFUmmp6gcCcUjBzCVFYRvBIP
 kxB3p4o/cCq+jdbZzhkIJ58GRY8uzjGbTRG7imw25kyUCbfjbzrF0YmqB370oE1zgz
 GslT0WoKU0CbEadEdAAMZxd9ilOd3HbshVQ1irycMGx81GI0UXmJue+znaU9kgM4nW
 EHSC/xgMTuKjg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1nquYX-00048Z-OB; Tue, 17 May 2022 12:35:57 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: [RFC] ath11k: fix netdev open race
Date: Tue, 17 May 2022 12:34:36 +0200
Message-Id: <20220517103436.15867-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_033603_584151_D65B4157 
X-CRM114-Status: GOOD (  14.65  )
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

Make sure to allocate resources needed before registering the device.

This specifically avoids having a racing open() trigger a BUG_ON() in
mod_timer() when ath11k_mac_op_start() is called before the
mon_reap_timer as been set up.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Fixes: 840c36fa727a ("ath11k: dp: stop rx pktlog before suspend")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

I started hitting a BUG_ON() during ath11k probe due to a timer which
hasn't been initialised. Turns out the netdev is registered before
having been fully set up:

[  421.232410] ath11k_core_pdev_create
[  421.233854] ath11k_dp_pdev_alloc
[  421.233863] ath11k_dp_rx_pdev_srng_alloc
[  421.259161] ath11k_mac_config_mon_status_default - NULL reap timer function
[  421.259165] ath11k_pci 0006:01:00.0: failed to configure monitor status ring with default rx_filter: (-22)
[  421.373066] ath11k_dp_rx_pdev_srng_alloc - reap timer setup

Sending as an RFC as I'm not familiar with the code. It looks like
ath11k_dp_pdev_alloc() may need to be split in an alloc and attach
function.

Johan


 drivers/net/wireless/ath/ath11k/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index ea073be60c12..e090dfbfa4e2 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1218,23 +1218,23 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 		return ret;
 	}
 
-	ret = ath11k_mac_register(ab);
+	ret = ath11k_dp_pdev_alloc(ab);
 	if (ret) {
-		ath11k_err(ab, "failed register the radio with mac80211: %d\n", ret);
+		ath11k_err(ab, "failed to attach DP pdev: %d\n", ret);
 		goto err_pdev_debug;
 	}
 
-	ret = ath11k_dp_pdev_alloc(ab);
+	ret = ath11k_mac_register(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to attach DP pdev: %d\n", ret);
-		goto err_mac_unregister;
+		ath11k_err(ab, "failed register the radio with mac80211: %d\n", ret);
+		goto err_dp_pdev_free;
 	}
 
 	ret = ath11k_thermal_register(ab);
 	if (ret) {
 		ath11k_err(ab, "could not register thermal device: %d\n",
 			   ret);
-		goto err_dp_pdev_free;
+		goto err_mac_unregister;
 	}
 
 	ret = ath11k_spectral_init(ab);
@@ -1247,10 +1247,10 @@ static int ath11k_core_pdev_create(struct ath11k_base *ab)
 
 err_thermal_unregister:
 	ath11k_thermal_unregister(ab);
-err_dp_pdev_free:
-	ath11k_dp_pdev_free(ab);
 err_mac_unregister:
 	ath11k_mac_unregister(ab);
+err_dp_pdev_free:
+	ath11k_dp_pdev_free(ab);
 err_pdev_debug:
 	ath11k_debugfs_pdev_destroy(ab);
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
