Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87365C369D6
	for <ath11k@archiver.kernel.org>; Wed, 25 Sep 2024 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN4HYZHI19xYCBYmYwWKZjOMoF/2eEzxKcrk1Kuq+jo=; b=4C6RsxiuIKcZ53pApyCpQuCosV
	pCnBpH/qSUVta7Tld+vuZwHZ26EAFfxZ22HJBsGAubzSIr8CcK7Gp9BvBoI8D5UPrVEZAeeOOaDzL
	4Fmsoy2yBn18qg1HKROum7qF1fEQHD/hU6XJ1Iy16A+1k9i4+hNq3OuXrHs+zZ6vVXADE5vA+XiGj
	VebVNxfkJpx5VWiE8Dilv70J+hZZpAxp98obvUDD4UNU3yXsrohejVHCeA5dnPXBwDVDMsXPiHqmo
	DJwTWAA95QFlmqGmY+aTpqYg5CYqTaXFwldZlHUza9f5Xh3x9KuqjFW9j6+Vya3wljwtONJo/bOby
	9iiU5pnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stQgV-00000004ziF-422Q;
	Wed, 25 Sep 2024 11:59:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQgB-00000004zap-0j5P
	for ath11k@lists.infradead.org;
	Wed, 25 Sep 2024 11:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AA1C5C57F9;
	Wed, 25 Sep 2024 11:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D430C4CEC3;
	Wed, 25 Sep 2024 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727265574;
	bh=lheoXjTr90K/jmtpvSoEgbeXRetvCKbhdHAMSUQmdkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M29vguN5YFchPdjWw4g3rQ1fIT4LKhjyGuJPc25v3CzdQaXsRo2ixsLmCtYt64n4Q
	 N6ZWCkRulD9AM5vD+xsX8bEyJrCkEX+dFqZfqQE7m/qYWMUg6cInQarBoZL+vYv45p
	 zcNeFwt6kdjEXgf9rGq/iKaLWSlYYbqhD1BI5wC2Jbg3lNON+ZLldEsOcVFy2TuAPd
	 CvVeuTlFsKpsUbhf0sEwDmLdsMwpYroonmbeEDzifg84A7QyHsH6kFzSigbdevjOJl
	 Z/K+1UKVQbcztZCAeZT4LKG+1TSsy2lCUNdG+3Vs4FNRujAuS68fzSRcfYw+nmN1Qv
	 KSlJh8ownLtQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 030/197] wifi: ath11k: fix array out-of-bound access in SoC stats
Date: Wed, 25 Sep 2024 07:50:49 -0400
Message-ID: <20240925115823.1303019-30-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_045935_429125_363B6FF8 
X-CRM114-Status: GOOD (  10.71  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[ Upstream commit 69f253e46af98af17e3efa3e5dfa72fcb7d1983d ]

Currently, the ath11k_soc_dp_stats::hal_reo_error array is defined with a
maximum size of DP_REO_DST_RING_MAX. However, the ath11k_dp_process_rx()
function access ath11k_soc_dp_stats::hal_reo_error using the REO
destination SRNG ring ID, which is incorrect. SRNG ring ID differ from
normal ring ID, and this usage leads to out-of-bounds array access. To fix
this issue, modify ath11k_dp_process_rx() to use the normal ring ID
directly instead of the SRNG ring ID to avoid out-of-bounds array access.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://patch.msgid.link/20240704070811.4186543-3-quic_periyasa@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index aabde24d87632..88c7a7289d06e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2697,7 +2697,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		if (unlikely(push_reason !=
 			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
-			ab->soc_stats.hal_reo_error[dp->reo_dst_ring[ring_id].ring_id]++;
+			ab->soc_stats.hal_reo_error[ring_id]++;
 			continue;
 		}
 
-- 
2.43.0


