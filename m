Return-Path: <SRS0=Hkj5=GP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D37AC433DB
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 12:55:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B44A523130
	for <ath11k@archiver.kernel.org>; Tue, 12 Jan 2021 12:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B44A523130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dxi+tsB5rgUthCR5HsBK5no+Dq6nlgTjLKJxEn+42oA=; b=Y1Q3XBYqG771wjCqSZgqvCZj3
	sF1Dtfnsvxi+F6/368pE0KKlQ/k3nhHZq8bcjw37hTl0R/zLlRzlrjII3YLg6r9z0eWuuKkwoMbqD
	kVHuJF0TY9raP0Gp3PBbj+Y+ZMhVmHi+49jCN5pF5Txol9GOpoOC+GHt5ugXOHwnD9mQMByuJs064
	CopYJuyriYPi4BXn+gzNOMP5XceX9XWDIl/eJl2vtcc/2HfYM3sGQy1/dPli+JIRw+s1zt+obV/Ib
	bhuVZjVCwqlb77/1X6lEWSfkK8oq3DeAgqp7miPSvESLLfz2UxJgRiafUZELLLjeVq8Nu9k8DCA0k
	j+mVD6d7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJDC-0008Tb-Ey; Tue, 12 Jan 2021 12:55:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJD5-0008Pl-9h
 for ath11k@lists.infradead.org; Tue, 12 Jan 2021 12:55:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 927E02311C;
 Tue, 12 Jan 2021 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456142;
 bh=NjnX7vpBdEObQj3DwhFQMHbnPeyqEPEVzfFPPN/J79E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LrZFA5NkW+JrBdZU//FW5B0aGq5yuKD0m2yGiIl+bPnXXeBlVSh4DPzuu8T5qA8Qu
 L6fPmmnPDXyUn/GawuskNvm/N7m2xzrehC/Y3nXpDEEl4PLa4+aDEQFUQW8uVA1Jmc
 QGSPs3bqGUISiuBjSauKo4VuXk90n0eprd2jxOCutlYuvWfsNM+ENxyYG6oXeE/TbM
 PzVqnWS+4LaQCof4gz0ra7hOZXctz228xmJXBIdQn6/uq2RaXRoJbILLFyXApw6wUT
 tmTbqxFVrzRoKFnDZu8TXQt1sJ1FGfcMdGsYzD0bWZtLlENTSo0JC77kgDAdUrr0ty
 bit2IEIrWGEwg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/51] ath11k: fix crash caused by NULL rx_channel
Date: Tue, 12 Jan 2021 07:54:48 -0500
Message-Id: <20210112125534.70280-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075543_457244_AE5067D0 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Carl Huang <cjhuang@codeaurora.org>

[ Upstream commit 3597010630d0aa96f5778901e691c6068bb86318 ]

During connect and disconnect stress test, crashed happened
because ar->rx_channel is NULL. Fix it by checking whether
ar->rx_channel is NULL.

Crash stack is as below:
RIP: 0010:ath11k_dp_rx_h_ppdu+0x110/0x230 [ath11k]
[ 5028.808963]  ath11k_dp_rx_wbm_err+0x14a/0x360 [ath11k]
[ 5028.808970]  ath11k_dp_rx_process_wbm_err+0x41c/0x520 [ath11k]
[ 5028.808978]  ath11k_dp_service_srng+0x25e/0x2d0 [ath11k]
[ 5028.808982]  ath11k_pci_ext_grp_napi_poll+0x23/0x80 [ath11k_pci]
[ 5028.808986]  net_rx_action+0x27e/0x400
[ 5028.808990]  __do_softirq+0xfd/0x2bb
[ 5028.808993]  irq_exit+0xa6/0xb0
[ 5028.808995]  do_IRQ+0x56/0xe0
[ 5028.808997]  common_interrupt+0xf/0xf

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20201211055613.9310-1-cjhuang@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 01625327eef7c..3638501a09593 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2272,6 +2272,7 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 {
 	u8 channel_num;
 	u32 center_freq;
+	struct ieee80211_channel *channel;
 
 	rx_status->freq = 0;
 	rx_status->rate_idx = 0;
@@ -2292,9 +2293,12 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->band = NL80211_BAND_5GHZ;
 	} else {
 		spin_lock_bh(&ar->data_lock);
-		rx_status->band = ar->rx_channel->band;
-		channel_num =
-			ieee80211_frequency_to_channel(ar->rx_channel->center_freq);
+		channel = ar->rx_channel;
+		if (channel) {
+			rx_status->band = channel->band;
+			channel_num =
+				ieee80211_frequency_to_channel(channel->center_freq);
+		}
 		spin_unlock_bh(&ar->data_lock);
 		ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "rx_desc: ",
 				rx_desc, sizeof(struct hal_rx_desc));
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
