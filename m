Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C64C433F5
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 02:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWc2kFokUreOG1M0nmAYql6RH9RKa0ql0nwGOHZ1zLs=; b=yx+4+0IaF2/Ikv
	wCHEckDE/UnCmJgU82Uh2ipo3TorCSc9AJA2nOCM9r8U8pUrcmHIJCksOS8fQ8Qbw7SLJDf7UUP/M
	7x9bMUs+sGe+T8L8orAZ8MudUdMtS+N1yWV2Dkthx6pYS52OiHbdN1ZJQpg90o4zJV+5fccD77U2B
	YhhffuMdLpWYH2n1HKWfdiaPFsuTmWULPphdDnEmqxEbZfVnwBmzI4KZnAGIz4RKUNOiXWs/yIlrd
	8All29SpAqKJE7TTxI59djTln07sIddLptZvcSE+0EFRFt9CDPmnP/GSBBXQ3LP8AtMiVPks385B5
	PvqLVV8vNoA/5s/68jpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9eQN-00H3Dz-J6; Tue, 18 Jan 2022 02:40:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eFF-00GxEQ-2Z
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:29:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0C4FB81244;
 Tue, 18 Jan 2022 02:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566EBC36AF3;
 Tue, 18 Jan 2022 02:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472950;
 bh=X1Ks8FvRuAMpRB/m8dyQVbxEYAjsGrrkW6v02oHlFys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UiCbOvrvEGOo6binK/73+Tm1KJIRrHYjB1/vt5zTmCbgQArBZlSpoAPa+UifEOt2J
 G2fQFeqwsl4yBXdWxarQDzR0nVitFLFjcGuy3lFWKUfsQSn978N7gzQCqmqs31zR+w
 1heiRxxrRhk5XaSBnayYCagNTChvdvr8wbHMdc0mJ/0M6ybdZUmEN76sWyTS1BZ3Oz
 2xPc+f21At697R1dWh7PmTXy/NFIQSb8r4Z7+SIHZ4VvHWF/IrJ6PDejTqWTTrJHbm
 pqcnJ8BzAFLtXhd6zu4Naypf4Ca0Y0LkuRkredlusDTgVQTMsgkXBS0hT6EONYYPdq
 I/49PInSpOizQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, Kalle Valo <quic_kvalo@quicinc.com>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 172/217] ath11k: Fix napi related hang
Date: Mon, 17 Jan 2022 21:18:55 -0500
Message-Id: <20220118021940.1942199-172-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182913_438108_8D4AAAC1 
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
index 31d234a51c79b..62ceee363fea0 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -136,6 +136,7 @@ struct ath11k_ext_irq_grp {
 	u32 num_irq;
 	u32 grp_id;
 	u64 timestamp;
+	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device napi_ndev;
 };
@@ -713,7 +714,6 @@ struct ath11k_base {
 	u32 wlan_init_status;
 	int irq_num[ATH11K_IRQ_NUM_MAX];
 	struct ath11k_ext_irq_grp ext_irq_grp[ATH11K_EXT_IRQ_GRP_NUM_MAX];
-	struct napi_struct *napi;
 	struct ath11k_targ_cap target_caps;
 	u32 ext_service_bitmap[WMI_SERVICE_EXT_BM_SIZE];
 	bool pdevs_macaddr_valid;
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 3d353e7c9d5c2..5a78a7cb65f5e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -634,8 +634,11 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
 
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
 
@@ -654,7 +657,10 @@ static void ath11k_pci_ext_irq_enable(struct ath11k_base *ab)
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
