Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2938606A33A
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQ+Zbbsw;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=E5EJZPSK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pIfNXUUzAnEW9sxlKVU/Fkq4i4DueIMJmUOwFcKXTyc=; b=FQ+ZbbswUoLir1
	qa36lxJt99AVMIolxFIiYgJNe4g06tb9SG/G3g+PdT4TN8o1DH2jAmJhHoBgokg4HiYOfdSs7fn+8
	wgiA8aHbfEy+3T9Hxa7q3l2vijErbXHkf/7jMhMB7FfigG+FfoTN69ls31myRlsie7yU9V+VX9Lij
	G61BVkv23UFI0IaeE/eC5zayi4jqa0g41iLwo4nZ5tl4/xoVU/RLQn/aBywcZjaPECVBqGy2nr4Jp
	y/FNzl09OiLC/5u0TMm5z/Ze3Le9xaj+bgNzKbp86AekfUsChDBp3kfS8pAYzYMbiOBZHYTowga0b
	gGig747On2YffTTQxPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9R-0000000EE0t-1LUs;
	Sun, 01 Nov 2026 12:59:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNV9O-0000000EDzR-1GLs
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 12:59:07 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B01880715;
	Sun, 01 Nov 2026 13:59:04 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ln5FNz6_F3d3; Sun,  1 Nov 2026 13:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793537943; bh=08DVDeHKnEqf8i6ckLfRqESk5630Gfkt4/33SEzgJpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E5EJZPSKJCuDhs5OYCMjPhWYXSovkPubjVeWJODxe5wLfoQRXEowyHQw22Ueb3Afn
	 8jiTiS5SCXQT/VNRWxg1DjepGNp20ZBE4kXLJnf5pfuayUtVDXGySCGuoJ+iqWvO21
	 aRN+kGdaRba1bz8gsNILN1Do8BYHsi5eVHXV9ifarT6l2bfOrzET42yZ2xlTPacUjI
	 hKKvb6DTBL1liC4bcMz8WaI+jBq6j/Ri7oEjbvyKN4J8cP5C4qiz+BK0Su4GCkHAdt
	 qAunr/V77sBvwiWY6VUEnV7hOCQpCjwZdfvrhbsMq9xlvunVVwr2Gjx6aO2nZzrKRh
	 lyBkrx5tk07kA==
From: Florian Maurer <fmaurer@disroot.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 2/3] wifi: ath11k: depend on RPMSG instead of selecting it
Date: Sun,  1 Nov 2026 12:58:02 +0000
Message-ID: <f3a540b59266f444ccdf0be22afc9f29edb7b967.1793531790.git.fmaurer@disroot.org>
In-Reply-To: <cover.1793531790.git.fmaurer@disroot.org>
References: <cover.1793531790.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_045906_481096_B15DFE27 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 32ec8488d75d ("wifi: ath11k: fix sporadic WLAN initialization
failures") made ATH11K_AHB select RPMSG, QRTR and QRTR_SMD. Selecting
RPMSG makes it impossible for ATH11K_AHB to depend on
QCOM_RPROC_COMMON, which is needed to use the remoteproc SSR notifier
when ath11k_ahb is built in. Adding that dependency gives a recursive
dependency error:

  symbol RPMSG is selected by ATH11K_AHB
  symbol ATH11K_AHB depends on QCOM_RPROC_COMMON
  symbol QCOM_RPROC_COMMON is selected by QCOM_Q6V5_ADSP
  symbol QCOM_Q6V5_ADSP depends on QCOM_SYSMON
  symbol QCOM_SYSMON depends on RPMSG

RPMSG has no prompt and is selected by the rpmsg bus drivers (GLINK,
SMD, virtio). ath11k_ahb needs one of these transports anyway, so it
can depend on RPMSG like QRTR_SMD and QCOM_SYSMON do. QRTR and QRTR_SMD
are still selected.

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Build-tested on ath-next with [1] for arm64 and x86_64. No functional
change for configs that already have an RPMSG transport enabled, as
IPQ8074 and WCN6750 do (GLINK).

[1] https://lore.kernel.org/linux-wireless/20261018210153.1925962-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath11k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 44b520d2e66e..84b7eb5df253 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -14,7 +14,7 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
-	select RPMSG
+	depends on RPMSG
 	select QRTR
 	select QRTR_SMD
 	help
-- 
2.47.3


