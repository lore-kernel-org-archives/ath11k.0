Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E56EE49A3
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0J6pJYSGXOibmM7rLpz1z1Q4KyOK/YDj+rta89VmNEk=; b=qbRExx9FQwK52J
	nJIZY0pBq07LGcyqetL029iyrNkrM1idt+Wm3zDNQT0x+ui3FskODH2XM5qocBlqTqUvQmRyVxatQ
	HfaEjPxjA9onYngNQAxxojyprlAmyiqmJrQB8xRAbyZFxUTg6MtynK/EwPehTjmkZpzOYi8wC22GY
	2CHHeIZ9RMOUN3zVWcIK3Vnop2S5IbkQCiaaKdyJnHjnR2YBE+WF9mZU43nNso6MivV3l0kjXZSLa
	jUObKy9iuHtQTvSgDqCrxvViYJCfmRXsgs7BzM7yr5EYTazBofPsIkdbYuO3FLl6kTsGgObb7zW5t
	jwl0RARWs0y5wjPf0LYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPbo-00Fp4Z-2G;
	Tue, 22 Aug 2023 11:31:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPbl-00Fp3z-2L
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 11:31:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 339C5639AE;
	Tue, 22 Aug 2023 11:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A441C433CA;
	Tue, 22 Aug 2023 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692703896;
	bh=QkC640psDqZzHVrH2pj1SLaMBwAO0XRqN6ukHG1V6ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zia2jntrOru3nmrVkXTk3r2b1V+L4sDABlDSp3bKDJhNooHAP81otgxiJjv28Mpvq
	 5cG/WZ7gimdp6VyO/HjSLC/uXAo3y6TObzNy4r0khQhGDMC+hbaHrpv1U18V5QQdlE
	 OyBxeIi6CJESqZ8l6v2xxEjhQSswadwPucCe5i3tUSahaZC0aT0XAMnAidjIk0qw/Z
	 nNgHILI78/XBM8ELiQxZ6xFhxQC6Zq3yzsqzusdGlGyuSW3M50OOQDreqWvbTxEdR4
	 3OQ7oc1IV8NdBpWMwozRRSE/+UQjiHZPjW6zIPtQ01iciRuDSbfhz+UWx8+JciEwpn
	 D9WSNIggZ2moA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	quic_jjohnson@quicinc.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 3/9] Revert "wifi: ath11k: Enable threaded NAPI"
Date: Tue, 22 Aug 2023 07:31:24 -0400
Message-Id: <20230822113130.3550050-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113130.3550050-1-sashal@kernel.org>
References: <20230822113130.3550050-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_043137_802876_2421C03E 
X-CRM114-Status: GOOD (  10.01  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

[ Upstream commit d265ebe41c911314bd273c218a37088835959fa1 ]

This reverts commit 13aa2fb692d3717767303817f35b3e650109add3.

This commit broke QCN9074 initialisation:

[  358.960477] ath11k_pci 0000:04:00.0: ce desc not available for wmi command 36866
[  358.960481] ath11k_pci 0000:04:00.0: failed to send WMI_STA_POWERSAVE_PARAM_CMDID
[  358.960484] ath11k_pci 0000:04:00.0: could not set uapsd params -105

As there's no fix available let's just revert it to get QCN9074 working again.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217536
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://lore.kernel.org/r/20230720151444.2016637-1-kvalo@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 1 -
 drivers/net/wireless/ath/ath11k/pcic.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 76f275ca53e9c..ff8c0274dde8c 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -361,7 +361,6 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
-			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 380f9d37b6449..3c095f986f4dd 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -459,7 +459,6 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
-			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
-- 
2.40.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
