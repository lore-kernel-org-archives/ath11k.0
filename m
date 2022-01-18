Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF56C433EF
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 03:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKIN3L54+sAiObS+1/iej6TCC5y8PaCblqnvkKoCIq4=; b=k45KVhHlwklsCM
	v5+hPP/7heShjUW/Emgj41cGrlWmJzgM/6H7vEojy+feO2lgcTBstMBH0qyhGnJ+6Pw4n50EgfV2j
	ESeYRsOjbgN+qlZvDWxxECwXvCTPCqML5OkqOBhA+q/yPH8Y3scGtqFIfDUjS8djiVJvzUTSR6pAy
	iwLDlPQSsYZj3DOras6S5yGYYOfxaAS74+t/xazPjP1Sh0NPZjQzc9hjEBP8DNNe9MfSWLme3dhCK
	wRyTQsiZKwqwPHEuToxLvEY3HVpBqR6Yn3gQL1vgvHb23ouHg/Agk8D9en1nnR/4B9RmVERL+IQrK
	n+GJNc4OiGwO5YSyb9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ens-00HHrK-Nl; Tue, 18 Jan 2022 03:05:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eOP-00H290-RY
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:38:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D25E612E2;
 Tue, 18 Jan 2022 02:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C28C36B04;
 Tue, 18 Jan 2022 02:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473521;
 bh=k1sPTXp/OUsKfF7bCMnLd5fIDVSHA+u/eKcXEsG0V5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DHxgp+HPWrblSg3RVCi5LgTzR1IdgRLKWEJ4BOCeZJB6GTQbRCfiBSqda48Q/7q2V
 Efb/Ml375lZWDC/tl7rgOnEyDhbjX7yOq1utoUvJgggvPT8QBYPjeG4Y4ynQLQ2/4O
 8SJYvinJER3rPbM+dwlFE0+3jJM0GhO/1TxU/zbvxDphp2isA0gxeYTELC+70jduuZ
 a8Z/GjZsLHMtZ08TaSJnn4SZho3ICmFo7Hf2itnu3aDGUFxn/3br19jpV9iSwyDUsE
 889uHFEFEZwo2Wftdv4/N8mqT0Kim6TzqJasKVgDw+i7ZVxLkxsYbQM1YJdbxH1nRV
 ibIbsubMgP0ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, Kalle Valo <quic_kvalo@quicinc.com>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 146/188] ath11k: Fix napi related hang
Date: Mon, 17 Jan 2022 21:31:10 -0500
Message-Id: <20220118023152.1948105-146-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_183842_007970_0D50038F 
X-CRM114-Status: GOOD (  14.60  )
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

From: Ben Greear <greearb@candelatech.com>

[ Upstream commit d943fdad7589653065be0e20aadc6dff37725ed4 ]

Similar to the same bug in ath10k, a napi disable w/out it being enabled
will hang forever.  I believe I saw this while trying rmmod after driver
had some failure on startup.  Fix it by keeping state on whether napi is
enabled or not.

And, remove un-used napi pointer in ath11k driver base struct.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20200903195254.29379-1-greearb@candelatech.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 12 +++++++++---
 drivers/net/wireless/ath/ath11k/core.h |  2 +-
 drivers/net/wireless/ath/ath11k/pci.c  | 12 +++++++++---
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 8c9c781afc3e5..b9939057b7baf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -175,8 +175,11 @@ static void __ath11k_ahb_ext_irq_disable(struct ath11k_base *ab)
 
 		ath11k_ahb_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -300,7 +303,10 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
 		ath11k_ahb_ext_grp_enable(irq_grp);
 	}
 }
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 018fb2385f2a3..10d2436f553f6 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -132,6 +132,7 @@ struct ath11k_ext_irq_grp {
 	u32 num_irq;
 	u32 grp_id;
 	u64 timestamp;
+	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device napi_ndev;
 };
@@ -701,7 +702,6 @@ struct ath11k_base {
 	u32 wlan_init_status;
 	int irq_num[ATH11K_IRQ_NUM_MAX];
 	struct ath11k_ext_irq_grp ext_irq_grp[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-	struct napi_struct *napi;
 	struct ath11k_targ_cap target_caps;
 	u32 ext_service_bitmap[WMI_SERVICE_EXT_BM_SIZE];
 	bool pdevs_macaddr_valid;
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 5abb38cc3b55f..81d0eaa13adeb 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -632,8 +632,11 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 
 		ath11k_pci_ext_grp_disable(irq_grp);
 
-		napi_synchronize(&irq_grp->napi);
-		napi_disable(&irq_grp->napi);
+		if (irq_grp->napi_enabled) {
+			napi_synchronize(&irq_grp->napi);
+			napi_disable(&irq_grp->napi);
+			irq_grp->napi_enabled = false;
+		}
 	}
 }
 
@@ -652,7 +655,10 @@ static void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		napi_enable(&irq_grp->napi);
+		if (!irq_grp->napi_enabled) {
+			napi_enable(&irq_grp->napi);
+			irq_grp->napi_enabled = true;
+		}
 		ath11k_pci_ext_grp_enable(irq_grp);
 	}
 }
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
