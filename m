Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0D5C47258
	for <ath11k@archiver.kernel.org>; Tue, 16 Jan 2024 19:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlrJ0PyN+vOOhlGcQVUbrzik9S7VmRfKpd/9aehNehc=; b=t82e0ZlGfUV40EotBaw+iVjypk
	Uly0NU6EAspPqtT2jcf3mk8zVpbm/p3K9AoMqs2Rlvmo2MXxBrHd7xT7kv0Nb/6vRdzaOkQZe04o/
	TDcc9g6b9QVV8sR+bYxFijUp/NsYHMk/V8D6grpYuXmxsimCI/awzScIKjklX8h4To8v+KQiYEsRA
	za977p2oN6O+OzBgIiYrDzjWjfTynOyKvNrMakK19r5rrrFNQcaqgnbqw6gIcrLsUWoQcIOLQJmUp
	bzX70ZHzOS89LP1KIqBRoXU6V7UKVl9R0XihfUIEMbJytYZTGReo9JXnY0vNi/RDTUXjk+6OTlAOk
	A7vFCROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpXW-00DH7i-2N;
	Tue, 16 Jan 2024 19:56:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPpXP-00DH3D-28
	for ath11k@lists.infradead.org;
	Tue, 16 Jan 2024 19:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0907760B51;
	Tue, 16 Jan 2024 19:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94A6C433A6;
	Tue, 16 Jan 2024 19:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705434954;
	bh=JQgC8gBEtMvthTY2S1yrwtzHzw2JvYybosFzy5IkWPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gD22OFJ5RvHg+DDXjwLM8dvJ2dJkVNiKJHQgLB2NofsZAS6UVpZnXdFGDYd3ZdkVu
	 Dzpyb/jZoxJ1wl5Sb4PQ/rp52uUzkFPyMSQEA/Hsq1/XvnrojEYFPRL2ld6ZwJZP/9
	 erWpMgfeSUu9QQ72KbzjrU7Kia56n24vCD2+TZHLJF+982xUpmdlU8C+Stw6L8N5N8
	 rW4ZtZpSh0n2ZqbkKueI6/xyNrePi5esr0qsBCxs+TXEnBGxGv1zjHNdz4+Czpvhp+
	 s9hH548mMuqwSPsxhr70aHCfE9yCvHFXiElPA/6eaaw6PqIniDJxEtbEJwXpl8cyzT
	 HJZQr/JN33jTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 19/68] wifi: ath11k: fix race due to setting ATH11K_FLAG_EXT_IRQ_ENABLED too early
Date: Tue, 16 Jan 2024 14:53:18 -0500
Message-ID: <20240116195511.255854-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116195511.255854-1-sashal@kernel.org>
References: <20240116195511.255854-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.73
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_115555_784940_99E7E1F6 
X-CRM114-Status: GOOD (  13.36  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 5082b3e3027eae393a4e86874bffb4ce3f83c26e ]

We are seeing below error randomly in the case where only
one MSI vector is configured:

kernel: ath11k_pci 0000:03:00.0: wmi command 16387 timeout

The reason is, currently, in ath11k_pcic_ext_irq_enable(),
ATH11K_FLAG_EXT_IRQ_ENABLED is set before NAPI is enabled.
This results in a race condition: after
ATH11K_FLAG_EXT_IRQ_ENABLED is set but before NAPI enabled,
CE interrupt breaks in. Since IRQ is shared by CE and data
path, ath11k_pcic_ext_interrupt_handler() is also called
where we call disable_irq_nosync() to disable IRQ. Then
napi_schedule() is called but it does nothing because NAPI
is not enabled at that time, meaning
ath11k_pcic_ext_grp_napi_poll() will never run, so we have
no chance to call enable_irq() to enable IRQ back. Finally
we get above error.

Fix it by setting ATH11K_FLAG_EXT_IRQ_ENABLED after all
NAPI and IRQ work are done. With the fix, we are sure that
by the time ATH11K_FLAG_EXT_IRQ_ENABLED is set, NAPI is
enabled.

Note that the fix above also introduce some side effects:
if ath11k_pcic_ext_interrupt_handler() breaks in after NAPI
enabled but before ATH11K_FLAG_EXT_IRQ_ENABLED set, nothing
will be done by the handler this time, the work will be
postponed till the next time the IRQ fires.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20231117003919.26218-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/pcic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 380f9d37b644..e3b65efcc868 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -453,8 +453,6 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
 {
 	int i;
 
-	set_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
-
 	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
@@ -465,6 +463,8 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
 		}
 		ath11k_pcic_ext_grp_enable(irq_grp);
 	}
+
+	set_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags);
 }
 EXPORT_SYMBOL(ath11k_pcic_ext_irq_enable);
 
-- 
2.43.0


