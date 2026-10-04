Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024FBCA5FEC
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wdFPkKVBD1u4gBOGxIYK1bcdkahVAWWGkvnOUYqIJY=; b=fqTteZ1tn64QVzNon41wG+K1Mc
	1r/g0I1oh8yDPf08SXna1eZyxRVUxAkhhszX3/nRUvvPsYGZGr32vMeDfPXcO2Bp1PKkm4Ei5eFMo
	MjCvBiCyX5k2BiYnbKTujc030YUF+/M+E9b3gb+ZqvU4G88PoR+BXd5Ed33+j6ZXfWf1Gc6XOO/08
	c7Ixr/M4rZ06/v7weGpS5tmvIxB3nex6ZsR9IgWMH+0OtX0pZDyxyfWjqYe0PmwVK0ixQP3/aBKRX
	z3iF/CCZ3dmRX+x5XG5yAAoeW8DxZlLVmtYbOu0VcgUk/ksuXKxw06agSogB3vbxDDo1f0Zbg0ssz
	D6rLQc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKHi-0000000Ej91-3t2Q;
	Sun, 04 Oct 2026 11:21:38 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKHb-0000000Ej7v-2suB
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:21:36 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 8F27413C3A;
	Sun, 04 Oct 2026 14:21:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=8wdFPkKVBD1u4gBOGxIY
	K1bcdkahVAWWGkvnOUYqIJY=; b=bWam9cm/a1SsiVLrPM2IGcwHz9qKJjBImvzw
	AbxiZ/uMx96b6aPmcRjhysoFkaKMcne6TfjZAGXS4GPH7GN9wM87gmwWRublxwEf
	kOAaQdWZrZyKRQBeN9ifMcgGav9btxJfHxDwFlRit+TC52uWSffi55IcFUy5hp8V
	P/SVcxOkmvVACLgx0hmi3uHvneWHomD0EWzTMozrGuMeDmjuup3uFByy1nWvhT4L
	LHKOCoWGNLKyfWfIVbR2VkLSP1pAkJVJw/bNDjLtPe6Bj+aR3O4j9hC4C/yIi9Hf
	5nAsvQL+Ag36iftrWgPKIGrJ/QOuDhEHQuaQMKCYYzjK6f2ihQ==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id C5AF513D27;
	Sun, 04 Oct 2026 14:21:28 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:21:28 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH ath-next 3/5] wifi: ath11k: leave OBSS PD off when spatial reuse is not configured
Date: Sun, 4 Oct 2026 14:18:05 +0300
Message-ID: <794ed7804f86fb8b8b607a703ce110a0b18e9b9f.1791111135.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791111135.2.git.me@andrei-z.com>
References: <cover.1791111135.2.git.me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042131_907398_F2E9D52A 
X-CRM114-Status: UNSURE (   9.92  )
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

mac80211 reports BSS_CHANGED_HE_OBSS_PD when an HE AP starts even if
user space configured no spatial reuse parameters, with he_obss_pd
.enable false. ath11k ignored the flag and, with an empty SR Control,
enabled non-SRG OBSS PD at its default maximum threshold of -62 dBm,
where IEEE Std 802.11-2024, 26.10.2.4 puts the non-SRG OBSS PD maximum
at -82 dBm plus an offset that the AP did not advertise.

Disable OBSS PD unless it is enabled, as ath12k does.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1fa42edd3..a10d191b1a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3373,7 +3373,8 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
 
 	/* Set and enable SRG/non-SRG OBSS PD Threshold */
 	param_id = WMI_PDEV_PARAM_SET_CMD_OBSS_PD_THRESHOLD;
-	if (test_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags)) {
+	if (test_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags) ||
+	    !he_obss_pd->enable) {
 		ret = ath11k_wmi_pdev_set_param(ar, param_id, 0, pdev_id);
 		if (ret)
 			ath11k_warn(ar->ab,
-- 
2.47.3



