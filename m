Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379FFC3DA7F
	for <ath11k@archiver.kernel.org>; Thu,  1 Aug 2024 00:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x46JHfTIyjd4gHtucVNhL8kF7NNEYiVy5lYtQ2Pf4uc=; b=ibSFXMhAWkfFZT2YJ0B+cl0+Nu
	A16IwgGAjFuorvWiXXy6pkfoFFG6xwdMDu6g94z3jjKu5lJpXO5QQCbhmtIZINnCNKp599rYq4seK
	T26ynW4/yZsUDTZgviYn3S0zgtYenhVYnRRHWMX848GL4V+zEtOmh9GF+4Mdppvrc1HjjUDHDjSVD
	8ND/Zh4nsztTjQA0LGlRDY03aGodpDLFmazzUKXhh3dbdKRL1eEEhocqFJ1YQOZdHpSjHNo34LczB
	NluPUJmtpzu5BVtgqXBatqGvTyXYB+dlRg0tcVi721L32rAFVdXdEvYGLL5KLKVaXIXRaENeTf4U6
	x/ktCEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJbW-00000002yTe-3p40;
	Thu, 01 Aug 2024 00:23:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJbS-00000002yRO-3wEQ
	for ath11k@lists.infradead.org;
	Thu, 01 Aug 2024 00:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2089CCE1870;
	Thu,  1 Aug 2024 00:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496DFC4AF0C;
	Thu,  1 Aug 2024 00:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471812;
	bh=rwVkRkJQ2gD32Y5505C+ZI7WWjlcv5dKaKfOtE875AA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EIlDZ7VsV8szPWzzXfnkuMCpn309/UjxrRJL/Zzf8IHMLys0hl4B5A5wwSbQwbhfd
	 Zs7P9PYjr2QQ8PV3vqXe0o8EllIo5Z0v7H8+C94CYJdfEBUguHkAldARNb1+m3VWyL
	 JSWDczgTDnu17UpAJn3Ycx8yvb3bloJ3AqukbFw321RwJaF4cXhH2x1d7vYY3jMnJA
	 JF1NW6H8kv7ZHOq/ialTLtKtAQB86M/xSiEgGWewiWqlvjEFWGfUZKAVLSSCc3GhIP
	 Cn5qAc5Q/7CxV+6rKW3Vll13e2M9XRLChHji2FgRCct2exDbyBvhmUwwMk8UfMuMfe
	 h4nQzrTT6VoWw==
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
Subject: [PATCH AUTOSEL 6.6 29/83] wifi: ath11k: initialize 'ret' in ath11k_qmi_load_file_target_mem()
Date: Wed, 31 Jul 2024 20:17:44 -0400
Message-ID: <20240801002107.3934037-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801002107.3934037-1-sashal@kernel.org>
References: <20240801002107.3934037-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_172335_190698_147562FC 
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
index 41fad03a3025c..e089df26bac9a 100644
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


