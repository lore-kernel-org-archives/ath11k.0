Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18710C3DA64
	for <ath11k@archiver.kernel.org>; Thu,  1 Aug 2024 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2MuNRngTjRNZg45OwLqn7x8yBpIjWaP4Zw7ZiCoJz4=; b=3zCQQjIi+Uqvs5YO17oSM1NrT2
	jQDG6eW4ZYGHN8PUwXnysFj19G17ez3t+Er6nWob+8upOWpDahFkfAyTSCM1mAzy2ABlZY/3zy//O
	+d5gIxHX4LUiBon5QyOIv3IoxVwfjqzLFwEFHfKqHK+owwaoB1krCkoEs//624kAmFG5Tcx7t4U10
	B5ob15lRPkrM9BOuzkVb5/kZo2npbM8lxwcnbb6feFCUQ/3Xd38gwBCz3mItQoKnzfYhuETo9Ppaq
	q11MMOA95ikd6W1uGmhl1MNuxrOp6c4EzVqUBTT2z5WwcJH3hDFNzzD0ovGj+DJcuLFEGMvvlnFVV
	57TfdaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJhM-000000030jq-2jEG;
	Thu, 01 Aug 2024 00:29:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJhK-000000030i9-16IV
	for ath11k@lists.infradead.org;
	Thu, 01 Aug 2024 00:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 896C8CE185D;
	Thu,  1 Aug 2024 00:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A77EC116B1;
	Thu,  1 Aug 2024 00:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722472176;
	bh=kNxJXrEdScUdF1a16Z9Du17I+OiwChLQGQxU4a1UgOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=COAoqR6nIOISuDojkXarqVGcfrJXn1rfUDXMvCSeJkthO5O6bZLrXGEdnYAYXyyzB
	 TESDyluBIkCXFh6Xlt2YjEzSozLvHyv5mPfhi4KmyoeoeYQj2PKeD60g6BkmxgMIVK
	 MMDL5ozaz3btHxibbXY06564+bjwJtC72WJQvLMAs8Mq4NIBgpCdo9VCgjkQHZATMx
	 4r9ztlc4QWD1hU9xyG7ZZQqIcWqcjMt3jJYaC/o7XHVKnY11CBGXYFPtx7l0RttcdB
	 uyq1abEqFArTbANOtq7iRdyT6k+DVyd9Kgkz9x8ggqtlGKTtYC1obtdy4HqVWaFlND
	 aQuwUy0rmQeWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 21/61] wifi: ath11k: initialize 'ret' in ath11k_qmi_load_file_target_mem()
Date: Wed, 31 Jul 2024 20:25:39 -0400
Message-ID: <20240801002803.3935985-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002803.3935985-1-sashal@kernel.org>
References: <20240801002803.3935985-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_172938_509189_5AC6AF23 
X-CRM114-Status: GOOD (  11.20  )
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

From: Jeff Johnson <quic_jjohnson@quicinc.com>

[ Upstream commit 199f149e97dc7be80e5eed4b232529c1d1aa8055 ]

smatch flagged the following issue:

drivers/net/wireless/ath/ath11k/qmi.c:2401 ath11k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.

The reality is that 'ret' is initialized in every path through
ath11k_qmi_load_file_target_mem() except one, the case where the input
'len' is 0, and hence the "while (remaining)" loop is never entered.
But to make sure this case is also handled, add an initializer to the
declaration of 'ret'.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240504-qmi_load_file_target_mem-v1-2-069fc44c45eb@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 01b02c03fa89c..764cd320c6c18 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2293,7 +2293,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	struct qmi_txn txn;
 	const u8 *temp = data;
 	void __iomem *bdf_addr = NULL;
-	int ret;
+	int ret = 0;
 	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
-- 
2.43.0


