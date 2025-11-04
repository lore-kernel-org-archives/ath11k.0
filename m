Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89AACCF9E3
	for <ath11k@archiver.kernel.org>; Tue,  4 Nov 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BHh6TrXAVBH0dHq7jStQLl3tqNEOJNV4+Rn4oIVUb9k=; b=3gB1WeIzj/gJOFzwk72NLRIeBB
	TjSJ2KI6dr5pAPi74/cn51MYGXaPbcNXPGT05RiomocQXEZE5f8jqfA4fLSzux6lUJK2flQ00LnQ8
	TkvkWMaVXDlh09BRCIH7IDpKXTbhMN69UGapqgPz0mnxNJwAa8zxzDgl522ik1TZ83U3NBhQNXkVb
	SWztcvE4Op+hNb0oSsxMIBkpETSoB/hhnKQBU1/F6RIYmcKcHkqX12sWvywmxvA/mDFZ0UZ/zg8OF
	z3J3gOtEEtohXcU+LyYQDKcs6TOdQ1rjSHXqqgmQDCtRLD2vAViPwm0ArSwtLcwrbgQUngP6MbFyJ
	4tr+BGvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCaB-0000000BRYx-2VLF;
	Tue, 04 Nov 2025 08:40:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCa8-0000000BRYE-39P1
	for ath11k@lists.infradead.org;
	Tue, 04 Nov 2025 08:40:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4711810948aso37105235e9.2
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 00:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762245598; x=1762850398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHh6TrXAVBH0dHq7jStQLl3tqNEOJNV4+Rn4oIVUb9k=;
        b=kuLFS9m4FUHCFNLqguAGBuS4AOcE+4MTWbV+D/hkCEJbdFMwkEo+nXkqt/1aG88kJp
         mshKMl859biXFZCL8nFrpgCBCoZTOsdB/u3I07yDtT4ruC+aSjyFn+dq365QT9R/QYls
         cP/fkkBqNonk+GYSgDSt0djXvSl1rUqyKFOGqocsi+8tp4NP49TOooBUxbapo1VLaeS1
         /iG2mXsDTdBkMue6W53Y8S4DY8BjXucUidVN2ZKgAgUdg2sabZw4SovazI07wOY9Dav2
         ArTotCQ/v1vrnq2KgS3amxQGhVuZpFB34BRJaG6DIPkxXnc8iDPNuRxbi7jab3J929lR
         8alQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245598; x=1762850398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHh6TrXAVBH0dHq7jStQLl3tqNEOJNV4+Rn4oIVUb9k=;
        b=V6jqDEdj1nkSA58Hsy/riwqI9jmHtDKkBMnKy23UW2xNBGhk8x/e7a9JdJkpe344g8
         jLyEhJnGIxl1mX2bzJga79KdPwqF25XSmQqtxDTcwNI+0cH5jCMpkU+NjqZgadSDmsqg
         Y1KKZ+iZyzkW77vASad/BCeb0Huiq4C2czAh14Kjwl81NFGIndkOJ+8g4gJ0iQqDdsec
         PlQJT6i9Dvq4ab7WxcFS3ldTJAgrVXKSR1mOZQabKnQLSBQEuTA7hjCB2xAW34HHdtqB
         iX31b8hWNEVB+XLVbch1Um2MNnLWW//oQjb0VvBTnspQNWo7H/s7dYHGb7swUXHBPPL4
         0xnA==
X-Gm-Message-State: AOJu0YxTcdBI/aMPf6gVeqFLbs1BFRPGf98XBNN8deTVBFDfptWLutF1
	CPNJ4sQfS7CZhnwSNDq2lO08EoK6w3KyrtWYzii6e8MF3pWMKrIATGbFBJFbug==
X-Gm-Gg: ASbGncvym452/HhnBD5hn3KtXbUvfc+vlVmqLYGm+PHHZYISmmxr+AqK/0C4SFCoexa
	HKFnrdqNjoiQgeLJMQ0cCpJlryoNNJatEiU8mWy9P2xd4C/KjpHlZNI6cFFMXW8Xfx87ugCwv/O
	IHHXGqZoido/nnNo0a0vAFrumPO6uD/Af2rV94d4PG+Joef0pZb53AVnrRrb8NhgaUmSLJilvZW
	+7+TY9ZVOZKcSVIMvO3WNTElJbyP4CxTtJi7Xvpw+yHf7QmUKzAbKMONoj5o26w3t7PdjBzWJXY
	x95dql/LBpWIlD/Hkrty49xCaDSiG1NRuBtzgO1F3tT0G7Gm7cF5lCY1OvP+/CSle4nmPaLUtTJ
	95sSrmHrLlbDLkh/MSOvhxoeCrzaHAWVm65SV0S8rfwQy0LFXwWjGMjWvY16Wu1bwx8sE8NBRwS
	wryrXDHK9OQQbY9RjeYbYGfiOMB4RSzjIrqw==
X-Google-Smtp-Source: AGHT+IFUu2PzAgaxKOCecZ51vlKS++CtbRNf5LUtGwN15g4l+qAj8M1AOupS1tHM1aNzaJIrKXLnDg==
X-Received: by 2002:a05:600c:3acd:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-477498de36fmr67708115e9.21.1762245598359;
        Tue, 04 Nov 2025 00:39:58 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c394f0csm198047075e9.16.2025.11.04.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:39:57 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()
Date: Tue,  4 Nov 2025 09:39:57 +0100
Message-ID: <20251104083957.717825-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_004000_803670_DD085ABD 
X-CRM114-Status: GOOD (  10.53  )
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

When reporting tx completion using ieee80211_tx_status_xxx() familly of
functions, the status part of the struct ieee80211_tx_info nested in the
skb is used to report things like transmit rates & retry count to mac80211

On the TX data path, this is correctly memset to 0 before calling
ieee80211_tx_status_ext(), but on the tx mgmt path this was not done.

This leads to mac80211 treating garbage values as valid transmit counters
(like tx retries for example) and accounting them as real statistics that
makes their way to userland via station dump.

The same issue was resolved in ath12k by commit 9903c0986f78 ("wifi:
ath12k: Add memset and update default rate value in wmi tx completion")

Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index edff6fb61344..110035dae8a6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5967,6 +5967,9 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar,
 	dma_unmap_single(ar->ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	info = IEEE80211_SKB_CB(msdu);
+	memset(&info->status, 0, sizeof(info->status));
+	info->status.rates[0].idx = -1;
+
 	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) &&
 	    !tx_compl_param->status) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
-- 
2.51.2


