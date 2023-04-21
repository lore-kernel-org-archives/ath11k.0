Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABEBC7618E
	for <ath11k@archiver.kernel.org>; Fri, 21 Apr 2023 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ulgeUZIoXs3Expuqu/12pVBfR+UEMkyojDayU/Z6p2A=; b=x3Q3MLPrs4Y8Gz
	KlJuOr4PsUZoWrPrslbXxGTlJMH1dPmJkNctYg9YJTt39KkBSP6Kvo/6A/dHpn5PelErGyGRzeiLv
	mBfdZRGqgN6H78qr8ySL0475gdLM2qxKMxMUViRr71aHXr/446Rqm5cTaeZi5ZJoarp6frapukkwv
	uGfC87SeIjismlT4gwo9HHodfnl0NAqHVrj/RceXgKL5okJKyOE+TKr57xmbkS/2s5XPNtwLsaU46
	Y06ZPJ5HE84Vfw/8Ere8m4Hos7flEXQc3oOMcMsrPT3Gw3GtK/zf73vSjAbjdw2WcnOPPsR94Ci4T
	kMZasYpmWMj/D6beVlFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppsJo-00BEnJ-0o;
	Fri, 21 Apr 2023 15:05:00 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppsJj-00BEmq-2i
	for ath11k@lists.infradead.org;
	Fri, 21 Apr 2023 15:04:58 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 8842C203D5;
	Fri, 21 Apr 2023 16:55:04 +0200 (CEST)
Received: from sakura.iliad.local (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 6EBF1200FC;
	Fri, 21 Apr 2023 16:55:04 +0200 (CEST)
From: Maxime Bizon <mbizon@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Maxime Bizon <mbizon@freebox.fr>
Subject: [PATCH] ath11k: fix registration of 6Ghz-only phy without the full channel range
Date: Fri, 21 Apr 2023 16:54:45 +0200
Message-Id: <20230421145445.2612280-1-mbizon@freebox.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_080456_035346_9CA99961 
X-CRM114-Status: GOOD (  10.48  )
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

Because of what seems to be a typo, a 6Ghz-only phy for which the BDF
does not allow the 7115Mhz channel will fail to register:

  WARNING: CPU: 2 PID: 106 at net/wireless/core.c:907 wiphy_register+0x914/0x954
  Modules linked in: ath11k_pci sbsa_gwdt
  CPU: 2 PID: 106 Comm: kworker/u8:5 Not tainted 6.3.0-rc7-next-20230418-00549-g1e096a17625a-dirty #9
  Hardware name: Freebox V7R Board (DT)
  Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work
  pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : wiphy_register+0x914/0x954
  lr : ieee80211_register_hw+0x67c/0xc10
  sp : ffffff800b123aa0
  x29: ffffff800b123aa0 x28: 0000000000000000 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000006 x24: ffffffc008d51418
  x23: ffffffc008cb0838 x22: ffffff80176c2460 x21: 0000000000000168
  x20: ffffff80176c0000 x19: ffffff80176c03e0 x18: 0000000000000014
  x17: 00000000cbef338c x16: 00000000d2a26f21 x15: 00000000ad6bb85f
  x14: 0000000000000020 x13: 0000000000000020 x12: 00000000ffffffbd
  x11: 0000000000000208 x10: 00000000fffffdf7 x9 : ffffffc009394718
  x8 : ffffff80176c0528 x7 : 000000007fffffff x6 : 0000000000000006
  x5 : 0000000000000005 x4 : ffffff800b304284 x3 : ffffff800b304284
  x2 : ffffff800b304d98 x1 : 0000000000000000 x0 : 0000000000000000
  Call trace:
   wiphy_register+0x914/0x954
   ieee80211_register_hw+0x67c/0xc10
   ath11k_mac_register+0x7c4/0xe10
   ath11k_core_qmi_firmware_ready+0x1f4/0x570
   ath11k_qmi_driver_event_work+0x198/0x590
   process_one_work+0x1b8/0x328
   worker_thread+0x6c/0x414
   kthread+0x100/0x104
   ret_from_fork+0x10/0x20
  ---[ end trace 0000000000000000 ]---
  ath11k_pci 0002:01:00.0: ieee80211 registration failed: -22
  ath11k_pci 0002:01:00.0: failed register the radio with mac80211: -22
  ath11k_pci 0002:01:00.0: failed to create pdev core: -22

Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 110a38cce0a7..850ef35c1f75 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8778,7 +8778,7 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
-		if (reg_cap->high_5ghz_chan >= ATH11K_MAX_6G_FREQ) {
+		if (reg_cap->high_5ghz_chan >= ATH11K_MIN_6G_FREQ) {
 			channels = kmemdup(ath11k_6ghz_channels,
 					   sizeof(ath11k_6ghz_channels), GFP_KERNEL);
 			if (!channels) {
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
