Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613D5EB64DD
	for <ath11k@archiver.kernel.org>; Sun,  9 Jul 2023 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wR+wzxn8ZqfMFlywS4K5cPI4QVRPDhRWe7ZwyhoeAto=; b=vfUCx6O3VCOGZE
	i5QEEuJKAZVqMuzRM5OEr4p8XgaxT4dwyZG2oIcfxg6k2ysWjJlG2H01016+qmCUnDXsn1VUc1K3S
	JdsM4W990KU8msKG1Z978FhCijFtLoZYeBnoqEMdhTbmpnARtKktNZJ1boTj09f1vu5GfkYMksFn+
	ab6aUEwBY21cl0dkXjYsE33oRyghRkv/J0K77TKdPSDNnf14muhlFDFH5dWID33brGxsXPHJJF3vd
	lIq+J4TxmWLVtQtab7PwvLsET/qDKA//r/UYRj//HhsLjaCppc58MreiJYIBIHKeUJiydBkfxxxv3
	nowHBL+QX1PTF4B/wV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW8o-009Jqd-02;
	Sun, 09 Jul 2023 15:16:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIW8l-009Jpl-1m
	for ath11k@lists.infradead.org;
	Sun, 09 Jul 2023 15:16:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 124F060C3E;
	Sun,  9 Jul 2023 15:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A392EC433CC;
	Sun,  9 Jul 2023 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688915758;
	bh=sPSF83Pa+6iysooxDfu1G5Cy7aII/KTDm7x39lE4rhA=;
	h=From:To:Cc:Subject:Date:From;
	b=iXypVHig1/+oCxtqkMeNhwNKdNEN9K2x7LMxJQred1LgGC3lRaiFsPyiULBSrYlWP
	 x/kyBTUjfWgi6MJ+pZRbkHc82455dtAiILTUYDgCu2lsCGjeFK0qVlI9b14YfeYvhf
	 fUzbksGLSkNOCFsQTE46MSgk1hgo/l8aXRIdGA21rC+TX1M0HW+zEbGgl9vPteKK/F
	 YPcRusGbN/VFeES2Vp29WPK7coxSNc81BNxEJ/coAwPpHgy+XdH6GiU2TLwLivg3MO
	 /YY1jiudOl4VJdunb7jp1P4bJmKSR9OXEWEnrA37kJIpVxtGSYfg7dz7yxtiKtVTES
	 G5ftsSvgkQwPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maxime Bizon <mbizon@freebox.fr>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/7] wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range
Date: Sun,  9 Jul 2023 11:15:49 -0400
Message-Id: <20230709151555.513910-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_081559_667840_9F08640D 
X-CRM114-Status: GOOD (  12.11  )
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

From: Maxime Bizon <mbizon@freebox.fr>

[ Upstream commit e2ceb1de2f83aafd8003f0b72dfd4b7441e97d14 ]

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
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230421145445.2612280-1-mbizon@freebox.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 67faf62999ded..3170c54c97b74 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6044,7 +6044,7 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
-		if (reg_cap->high_5ghz_chan >= ATH11K_MAX_6G_FREQ) {
+		if (reg_cap->high_5ghz_chan >= ATH11K_MIN_6G_FREQ) {
 			channels = kmemdup(ath11k_6ghz_channels,
 					   sizeof(ath11k_6ghz_channels), GFP_KERNEL);
 			if (!channels) {
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
