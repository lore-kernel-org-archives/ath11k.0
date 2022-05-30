Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57CBC433EF
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jcpkJmGdkLTIA++hGq0wIgBuDsClaNTfjuH0GslyPE4=; b=PQw8UFRNK4zxCh
	ikptue9u26S8jdIzkd3vpXsnnYpiP6BiB82+rbopYFitfBGfCG69OXAkuL/S+8TQl5knkILAN0UAX
	Y+x27BiwClmqTfUzeHFLkZDd6fym7KnkQJp3BdBL+gx+lSt2J3Z6d5qNGrB05M4g2iDI8JEG/CZNK
	zlVtyWhrPvMSjqzBdsNVDZaKfrejlllaYzEyaUgYVIk/Hpz6IrPqooIfbd50vLP4UG3+Wfmpw8HeV
	AIBv/C8Ki0cE4gE1/gH/YFIVY0UPejHjtqxq4aTZ9cu2dWUWjVXDf39cs6BzUliIG9jBKq0Y3Ouqq
	D1Y5UcKmFYENV4IVCNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaQW-005qPQ-Em; Mon, 30 May 2022 08:07:00 +0000
Received: from mail-m972.mail.163.com ([123.126.97.2])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaQT-005qNT-4d
	for ath11k@lists.infradead.org; Mon, 30 May 2022 08:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Tj+2x
	aAcY6dalUpOJzC6dld8hSXl1LyIhtvLrJnzwZg=; b=G2nvkRL8UJQWrrTBpV3WZ
	5YFO1arfhl1hIgRxGmzdR1lx5RDQUfUGDMEf4dKLIuCs/e2zVNU9yt4Zo1DC5NC8
	kaZFOUHIEWfvn+ctFmTsdztfZM7YvbvauTEks6ER/dkBuNVm2Ot6rB4b5iNWSOrv
	z5xEGHBmplGj7cUBFLr9a4=
Received: from localhost.localdomain (unknown [123.112.69.106])
	by smtp2 (Coremail) with SMTP id GtxpCgBXFQj0epRilgL9FQ--.40673S4;
	Mon, 30 May 2022 16:06:33 +0800 (CST)
From: Jianglei Nie <niejianglei2021@163.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianglei Nie <niejianglei2021@163.com>
Subject: [PATCH v2] ath11k: mhi: fix potential memory leak in ath11k_mhi_register()
Date: Mon, 30 May 2022 16:06:10 +0800
Message-Id: <20220530080610.143925-1-niejianglei2021@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: GtxpCgBXFQj0epRilgL9FQ--.40673S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1Dtw1fGF4UZryxuFy8Xwb_yoW8KrW5pF
	4fWw47AFyrAF4fWFWrtF1kJFy3Wa93Ar1DK39rG34rCrnavF90q345JFyrXFyakw4xGFyU
	ZF4Ut3W3Gas8AF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pibo7AUUUUU=
X-Originating-IP: [123.112.69.106]
X-CM-SenderInfo: xqlhyxxdqjzvrlsqjii6rwjhhfrp/1tbiFQkRjF5mK76qWwAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_010657_637859_F8A909B8 
X-CRM114-Status: GOOD (  11.30  )
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

mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
ab_pci->mhi_ctrl = NULL because ab_pci->mhi_ctrl has a dangling pointer
to the freed memory. But when ath11k_mhi_read_addr_from_dt() fails, the
function returns without calling mhi_free_controller(), which will lead
to a memory leak.

We can fix it by calling mhi_free_controller() when
ath11k_mhi_read_addr_from_dt() fails and set ab_pci->mhi_ctrl = NULL in
all of the places where we call mhi_free_controller().

Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index fc3524e83e52..fc1bbf91c58e 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -367,8 +367,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to get msi for mhi\n");
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
@@ -377,7 +376,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	if (test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
 		ret = ath11k_mhi_read_addr_from_dt(mhi_ctrl);
 		if (ret < 0)
-			return ret;
+			goto free_controller;
 	} else {
 		mhi_ctrl->iova_start = 0;
 		mhi_ctrl->iova_stop = 0xFFFFFFFF;
@@ -405,18 +404,22 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	default:
 		ath11k_err(ab, "failed assign mhi_config for unknown hw rev %d\n",
 			   ab->hw_rev);
-		mhi_free_controller(mhi_ctrl);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_controller;
 	}
 
 	ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
 	if (ret) {
 		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
-		mhi_free_controller(mhi_ctrl);
-		return ret;
+		goto free_controller;
 	}
 
 	return 0;
+
+free_controller:
+	mhi_free_controller(mhi_ctrl);
+	ab_pci->mhi_ctrl = NULL;
+	return ret;
 }
 
 void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
