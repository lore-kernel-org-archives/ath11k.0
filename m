Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D295EC0755A
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYUlqrSyDKO1WPn8/1FRd57dMLP+n3KFJyJPoN006Mo=; b=PQCR2rPBNfniOp
	miMO2HT/E3IrnMzi/LUBWesrE2bPdUr7DfI2CBV0LukDP/xCQLMeaKt9msMpz2WhAZghYdVCiWOdL
	pNy6Kav6IcSbdqkcxutXg0StPVNQWvFta0V9LF3r2PPx5nA8DFfmWW0jMWVYsMervVBUoxa1Lp5bq
	8saZdYStq3PdtQcBSlnFI4NIMMODiz+Mr35YTZSFnwyAg23glOD0zI39WaJbdfW/7IIr/XDMBbfh+
	HpItu75X6GF7hWPgaVpEVxAcSGpUNDfM3UjFsMA/WhUacPOtQ+Q9lP3YbwYNWmVjsvIXrSJIoJNnz
	VY3PuxdTv6Yeq+yRyhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLx-002xWa-1S;
	Mon, 27 Nov 2023 16:20:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eLb-002xJh-04
	for ath11k@lists.infradead.org;
	Mon, 27 Nov 2023 16:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76A66612E7
	for <ath11k@lists.infradead.org>; Mon, 27 Nov 2023 16:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BFCC433C7;
	Mon, 27 Nov 2023 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102034;
	bh=s8f7ejt6/6A/AIKa6sJs8NlXnpAnYLCNcVR7yofQBJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JsgMvRhKBl6PnzS9ItHmj3EGCaHJXg/wa2vfw54wgB1WF8Umbv12JcXRE1oEldS2X
	 d+tuMKSmovorfeVEd+H8TX0WgncpcYbkyNTp3GVvb4nEzCdnAhv295QB72ozEAxYEM
	 zY9HFQe0u0BCB+sjaI1y1QEVCRFifdt5jUMCOUyMPYEj0iUFlinaDaUWpgU2bTfeEv
	 RWnROdB9hFH1GoXJtYNxBpKRLkGLWiNuXVI6s5xUBEeMoUaifJiu0X57hBthAnP7AJ
	 colAu1cpiPAlC7xqKlfN4Y+EwsO4FE7bln0CMI9CyuW4O7sZWAvps/cE/9ij7uE79R
	 ojQQ2z2Ntc3hQ==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC v2 7/8] wifi: ath11k: thermal: don't try to register multiple times
Date: Mon, 27 Nov 2023 18:20:21 +0200
Message-Id: <20231127162022.518834-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127162022.518834-1-kvalo@kernel.org>
References: <20231127162022.518834-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_082035_196120_4C6DE700 
X-CRM114-Status: GOOD (  10.34  )
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

Every time the firmware boots we call ath11k_core_qmi_firmware_ready() which
ends up calling ath11k_thermal_register(). So we try to register thermal
devices multiple times. And when we power off the firmware during
suspend/hibernation (implemented in the next patch) we get a warning in resume:

hwmon hwmon4: PM: parent phy0 should not be sleeping

Workaround this similarly like ath11k_mac_register() does by testing
ATH11K_FLAG_REGISTERED.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/thermal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index c9b012f97ba5..80abf472fb87 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -162,6 +162,9 @@ int ath11k_thermal_register(struct ath11k_base *ab)
 	struct ath11k_pdev *pdev;
 	int i, ret;
 
+	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
+		return 0;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
