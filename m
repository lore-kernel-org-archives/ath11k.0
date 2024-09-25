Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160F4C369DB
	for <ath11k@archiver.kernel.org>; Wed, 25 Sep 2024 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVy+pqqVZ689PKR3zzVHYVYu/tivj2qJ8fRj52hjBrE=; b=W1ACXF//QZpGwdjMFPa5ijxlDT
	VOdmx5SjBvJvbCs83g5IrVNBw61fx1NhHjHuIhDOAnJdHmovWcboBEdPsqh92Ul0NM7+o5YNNZHPn
	8OOwJSDOhsLrtJnNc0YLH/a0bv4WjH8cLzpoNDEj7BJ0WS5Q69J3ngz2LD+4MEQxKq1p861PUg796
	OqfDFPYQPa0yR5x2BKiGNqzOn342x+lJoS2Mn++Mj+e+ZmNhDXFSEKDyRDWcKqAewqPMFCxehbtYP
	G8PC8sfUErho9gAkdx7hnPz1Q0765NupVmFTgSAo7+t+CSNF0AR68KvAiUHHm7CMPszW28FEhOGPp
	C4kQU+yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stR0N-000000056cQ-2R5H;
	Wed, 25 Sep 2024 12:20:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stQsr-0000000545T-1T5N
	for ath11k@lists.infradead.org;
	Wed, 25 Sep 2024 12:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FE14A4418E;
	Wed, 25 Sep 2024 12:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CC3C4CEC7;
	Wed, 25 Sep 2024 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266360;
	bh=kxAFvAmx1UL4nDsWMpOIrvG3PSMmFTzJWAQUr8lcJrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPVNAEoizXx2HoqQMRo3HtSOeYK1uVJtWCJreMrrRYhQ2VXQql0XKXFaDwlU/uMF7
	 0CCWvynaDKJP6CDmUoIaft+8VQqfNQp1g9ph5aHobinuTe811epbqX8Jd5SxwjuFvS
	 27FOdN2TB8euqqL9CrJOxLRjV3r5ndly7JDyw3YoA4HFZmZZn36lZzubdiuK44S+CV
	 8eXJ2NdTQz75n5gYQn5VNkiKxR05SoPhf63pKaE+isi8/EMoaVAwsOM2ciwURISHkt
	 cJLLTm7HZL9vkgLL6m053ssNgcQj1d7/w/Mfh7bZuxmDA6cra0WTaONw/9T5+/vJSI
	 V4VyLSd+/U12g==
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
Subject: [PATCH AUTOSEL 6.6 028/139] wifi: ath11k: fix array out-of-bound access in SoC stats
Date: Wed, 25 Sep 2024 08:07:28 -0400
Message-ID: <20240925121137.1307574-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_051241_481645_7CEF7BEA 
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
index b3499f966a9d6..a4d56136f42f7 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2700,7 +2700,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 		if (unlikely(push_reason !=
 			     HAL_REO_DEST_RING_PUSH_REASON_ROUTING_INSTRUCTION)) {
 			dev_kfree_skb_any(msdu);
-			ab->soc_stats.hal_reo_error[dp->reo_dst_ring[ring_id].ring_id]++;
+			ab->soc_stats.hal_reo_error[ring_id]++;
 			continue;
 		}
 
-- 
2.43.0


