Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FADEE49B1
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDObwK2YGJugApNFKM3//llkL3nx/kXAdgOrVynQFUY=; b=HG8vKiCPZwqZV0
	67CYF5yhfhJ0astI+rNlbt2B+D7fZDrYw57FK2l6aCEbYzjIOFHfNjhx9ug8/qXYrt/Hs7JExUNfI
	fTCm02o6Mot6pZshJ+srp57bro0um3dzfwCugCXoP80RTFHoMgoZ7AC2oO2u9D3YY3KhpWjZs/b44
	K/Yh9JKZ/hWha0W/G9wcOoUhFg0IwftgjllK/szzGIP13GTttrnFyDjxd5VGBl2UNeEyXwxM3fjT5
	9X6QMVYu9VFL50qOJcLrMHna1L3Dw+VC9AHA2h91pRV4lyxuZa7b3G6tfKO6dNXAoG2SzFS9ft2KF
	LGFVNhd+vYxJcmxJrXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPbL-00Foye-1h;
	Tue, 22 Aug 2023 11:31:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYPbJ-00FoxP-0K
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 11:31:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0041565046;
	Tue, 22 Aug 2023 11:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503CDC433C9;
	Tue, 22 Aug 2023 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692703867;
	bh=ClUbNh5Ba5Ijk1bbKYM7eB7v7clusIUN0C4gBbPZPDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gfp9XaCwnP76zzJNmcmmEERnOZp5wb7aUyJ4dCINIpwE6aC1QlTiujZao070najm0
	 es9nk1ttwJNWAonWlA+2jDhTiD8QctUCMRM0TqlhlzOv2IQs0aHloxl4jRgBmd7F11
	 nOFjSqkdpRw/J4zaK3ob4u5L9LaM9gCxUjv54KCAq5noTVsdsEeGuL/EQfsV1kxQr1
	 5ZcVnzD0EjySmNup2+WEucpJTij+4xrc+RTgVYS5Rbx+Dqa0hJK6qBRJx5guFiGhqL
	 IEqV6afVquJSeIQKU9FIziWcW4dnU5/pG0CQE+Fr7OXUqp8pMZYsw9l+AW1a38nSYE
	 ES2QnTbFQeKJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	quic_jjohnson@quicinc.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 03/10] Revert "wifi: ath11k: Enable threaded NAPI"
Date: Tue, 22 Aug 2023 07:30:53 -0400
Message-Id: <20230822113101.3549915-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113101.3549915-1-sashal@kernel.org>
References: <20230822113101.3549915-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_043109_201719_8283E9F3 
X-CRM114-Status: UNSURE (   9.91  )
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
index 396548e57022f..88aeb36ab2e79 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -376,7 +376,6 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
-			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 30d66147223f4..a8bcffcf2e813 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -466,7 +466,6 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
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
