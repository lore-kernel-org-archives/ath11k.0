Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A037CC9832F
	for <ath11k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N90PVcEBaJjmtFZtExELpFQU0K3QU2o0KNqwUaSuAI8=; b=SVikG+lmt0Z4Mv65srBUofUr/c
	PN/0ijciGCKdnrahTh3BOgXWUSZOwRMcKeHJIAByCCss5pDNXFon/qnPcgd2/aroIRG+1xYM+4UeP
	vYQWw2ULqs4K7mRuJkJzqTPs2Lz0syL+IOhPKLnjN/NBZ8le/thmoz+XvLeRRo4s5z2GThjkQFsvC
	W6xC7rk+ax2KRVI3C86C9ViR8C2Hp99CrNMmPOhF+snH/eu8qmlzHCEF5alhONxsWb/j2zSdH9ziy
	pSL85yWvAHqK95pOwCdRfTEDcDaGAQnhlT2fD/QDbh1j1CN3NndQ065E2i5cfX0j+BS3+TDYo7Z9F
	tMapvshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe8-0000000FbiJ-26q4;
	Sat, 26 Sep 2026 15:49:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbfk-34xQ;
	Sat, 26 Sep 2026 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N90PVcEBaJjmtFZtExELpFQU0K3QU2o0KNqwUaSuAI8=; b=OLDDT7CVu1OiodaFd0cXqIu8iN
	y7Vm+xbUMC7kNkUO76YPpVpkEkXfjrbcOc0rvJOZCA5VPE9LY9K5nmfe2bYcZBZCAZCIWIUmLFO9G
	UdD8RdyV3ohrgyqA/CCJVM+3FBv7919vdoPZUvFS1/Z7tiKG8vS/3eJotxHST09KVoXB0px6z5m4f
	WveBRlXhdsKE5Puio58VrnZnGvBSxwrRQNFIC2daZAnAvkB7Bm/BZMwuEmHtQrOlehJW6Xi7WJfkE
	Z/wcGuZh5XkNcIjyvsinm0MIrXOLU48oSD1hGscQXLKFt5lUkAzQP+Fu8EKmKvt1CYf5IwNEDuj6p
	LvycDkSQ==;
Received: from m16.mail.163.com ([220.197.31.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe1-00000000GIC-2tq9;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=N9
	0PVcEBaJjmtFZtExELpFQU0K3QU2o0KNqwUaSuAI8=; b=EiLm0ZvCe5CBHYTiLl
	W9lY7Yjk1P4AVlRDElfr5VxaNsuCIdp9fzP1fEqz04TBwVk6hZ5GXKIQGXX+4Wyn
	C4yc6fvzAohOPPB4N1S9lXUQ+V9Vx1zqEhQrk4z+mLvkKpoDR2HmQ6xFCMg1CvlF
	BE4qimdsMkxwrF31lecIHr7UA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S2;
	Sat, 26 Sep 2026 23:48:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Bhagavathi Perumal S <bperumal@codeaurora.org>,
	Sriram R <quic_srirrama@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/5] wifi: ath: avoid IDR mutation while iterating
Date: Sat, 26 Sep 2026 23:48:19 +0800
Message-Id: <20260926154824.75224-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKr4xur4kGr1xCw4xXr4UXFb_yoW8JF15pr
	4fu3W3uF1xZr97tFnxJa18WF1rWFn3CF4jgrZFk3WrWrn5CF18tF98tF1fZFy7GFWfJw12
	93yUtr1fCryDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piY9akUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQwWUGq36Uz7GgAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164858_261360_2E2A9732 
X-CRM114-Status: UNSURE (   3.74  )
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

The ath10k, ath11k, and ath12k cleanup paths walk an IDR while their
callbacks remove the current entry. idr_for_each() retains radix-tree
iterator state across the callback, so that removal can invalidate the
walk.

For ath11k and ath12k full teardown, keep the callback limited to
releasing the supplied skb and leave IDR teardown to the following
idr_destroy(), matching the established SCMI fix. For selective per-vif
cleanup, use idr_for_each_entry() so each iteration starts with a fresh
lookup before removing a matching entry. ath10k also uses
idr_for_each_entry() because its shared TX completion helper must retain
the per-entry removal.

Jiale Yao (5):
  wifi: ath10k: avoid IDR mutation during TX cleanup
  wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
  wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
  wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
  wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup

 drivers/net/wireless/ath/ath10k/htt_tx.c |  7 +++-
 drivers/net/wireless/ath/ath11k/mac.c    | 46 +++++++++++++-----------
 drivers/net/wireless/ath/ath12k/mac.c    | 46 +++++++++++++-----------
 3 files changed, 58 insertions(+), 41 deletions(-)

-- 
2.34.1


