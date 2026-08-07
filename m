Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2AC5AC7C
	for <ath11k@archiver.kernel.org>; Fri,  7 Aug 2026 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RDpUyEwEJ0kzf8chyqH2Jx2Y1T40GKQkvwbA8Z0ps60=; b=CPu2MZNHx97s0IiPv7KWa22ZyJ
	lPLGG34rK9NBWCn9N8S5KegEM2YHMovKe1rW+Z001gjqkNvNYYE2bUSLkY6ja8W3x+/W9EnsoQrDz
	nvnbW5GwkNz8Rvcrcu7M54tO5A1u0ZnAQ3BZwrYvvBNxeO6eQAxJTKifaOfx/nJ1I7fExTvVyV2wo
	ZeIOvrh5h1TPu2Pd1T1Wg+OhziYw5s6Wo8dM1aegfOhaaSg9IIvYfiLCeW26x8aOeG03tYL9+8v8X
	J0bcVEdTVyyl6gQHkLSCYVHHVhNKkdEucKWMpbvaKS8H+4jWGnHA90NLirwVVkraToz61fpVmd1HF
	SX2GA8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHCd-00000007YEn-2M3O;
	Fri, 07 Aug 2026 09:49:23 +0000
Received: from mx-relay21-hz2-if1.hornetsecurity.com ([94.100.137.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHCZ-00000007YDu-1gfY
	for ath11k@lists.infradead.org;
	Fri, 07 Aug 2026 09:49:22 +0000
ARC-Authentication-Results: i=1; mx-gate21-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=RDpUyEwEJ0kzf8chyqH2Jx2Y1T40GKQkvwbA8Z0ps60=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1786096145;
 b=TBVTeHjJpwOR9BWr4Kd3BNqv06tT7PzuK03GmhWDYKl4Onpjv7HFFp2cs0SX6Hyy9qiGFVW+
 5UN1KzOECy9gFNYY0HiZPiT83mJxw8DrWzCOJmTQrpHagqTc0ZHhXRWvtsBNxfjSWn012YXUVtS
 uoZmEjliKC4zrv2Wq19Jhh0ccjKB+wWN0uudMlqtbRkALOT2MyLOkxU6soBVsQQUldYidS9/2Lk
 xOyVJHFdsBj3SPKDlB114EcnMwWtagyL9tJmx8daOFXzydyGAquzfJ5Y2V1jRiqpQSXibgXBrR5
 4WBnC+/x2RWIv7quVdchuIVALn7iW1BBlwxX3FFyteCpA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1786096145;
 b=iRN5MQH9U6B5/CRhyc8E43IKbuVYd0Z2KK6rFFR9HFL+mbUhGcwon9NgXrLp+S10o/4iB8t8
 Nc0BWMjlx9pAsCwGbOtnFKpgZ/aIk3FK/g5hON+g1kE3ftqNWbKYBunNelIG6coCXqbn1JyRJFj
 KRb3LNRt9X2UwOlypJPONQhkOHMKuRpcfIPM9oVe9MoU2YfjGvlqGubuorjp+Efj/N9FI86RcTb
 PZ9t23/Y1nZa0u0/uyYv6m6P9smKeWgp1FS7VbfbCOADkWDPSbGPNaYkGpirTAkiKXTYW9uIOoc
 BFT8wsKtfORvlnrlpM1hNohET5i9qrwrdMij03YBuzUrg==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate21-hz2;
 Fri, 07 Aug 2026 11:49:05 +0200
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id 7A6E5960146;
	Fri,  7 Aug 2026 11:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 rossini.marcant.net 7A6E5960146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1786096142;
	bh=RDpUyEwEJ0kzf8chyqH2Jx2Y1T40GKQkvwbA8Z0ps60=;
	h=From:To:Cc:Subject:Date:From;
	b=AC0bk6mnUCQ51txc2loIvXwTZrP8IjdtgCgMflA+o9+RP+0/uQnlJHBMHfpr4xuIx
	 QdFRymlKVMJ3Zd7OzmZah3W2O/03DA9kGY9/fdwoZGCsFJpGsbqdxj3kXUOCHe3PnH
	 XbQdPMP1V6ISHDNEs3ceDdXStQRUjgDVA7wfl9tc=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: avalentin@marcant.net,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	stable@vger.kernel.org,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH] wifi: ath11k: run ahb shutdown() teardown only on WCN6750
Date: Fri,  7 Aug 2026 11:48:58 +0200
Message-ID: <20260807094858.1548216-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: avalentin@marcant.net
X-cloud-security-recipient: ath11k@lists.infradead.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate21-hz2 with 4hGfVk6d1nz17HPR
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest: 4b0cb592f54d16cce5fa190591264bf2
X-cloud-security: scantime:1.148
DKIM-Signature: a=rsa-sha256;
 bh=RDpUyEwEJ0kzf8chyqH2Jx2Y1T40GKQkvwbA8Z0ps60=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1786096145; v=1;
 b=nX045D1WZiaEr3KXXb4VNUDE7JuHNRpd5NhbkxUUmAOyQ7vuiTQQLx6xSER8tGXl/EVZtr04
 /yyBCUvPsIfNOeg4VxRxu/kTitP0Be53X134+2F4oA5/gBYl2KBZmh2NngsVAH6h+J/2cNax5d8
 /05HXsYnG1QsOtc2OgbDwNWWtniQL7Ho/ABHYx24UnaqOoP3XRIIcBeFvLptiAIluDFraWjvaWs
 C/eaYNxXq/rV6CBzTulBAMgq2WSTRkijxDrZkFaouyXQnLiL92NBJVB5a6PhQO+drshYln8Lk6K
 mq3Oq4R+Bwm1pSWJpZYfwqsxUcOwCYS+o75/1IiK0RKLg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_024920_071467_7AE81EC9 
X-CRM114-Status: GOOD (  16.78  )
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

The AHB shutdown() callback was introduced solely for WCN6750, which has
to stop DMA before the SMMU is torn down at system reboot/shutdown. It
was registered unconditionally in the shared ath11k_ahb_driver, so it also
runs on the IPQ AHB targets (IPQ8074/IPQ6018/IPQ5018), which never had a
shutdown() handler before and have no such SMMU requirement.

On IPQ6018 the shutdown teardown stops the WCSS Q6 remote processor
firmware. Stopping the Q6 firmware leaves shared WCSS state such that the
boot ROM (SBL1) hangs during DDR training on the following warm reset;
only a cold (power-on) reset recovers. A plain reboot therefore never
comes back and needs a physical power cycle.

This was pinned by bisecting the teardown at reboot: skipping
ath11k_qmi_firmware_stop() (i.e. not stopping the Q6) is what lets the
warm reset train DDR and boot normally, whereas none of the q6v5 power,
reset or clock steps reproduce it on their own.

Restrict the shutdown() teardown to WCN6750, restoring the pre-regression
behaviour for the IPQ AHB targets. On reboot/shutdown the whole SoC is
reset by the boot chain, which re-initializes the WCSS from scratch, so no
teardown is needed there. Module removal (rmmod / remove()) is unchanged.

Verified on a MikroTik Chateau 5G R17 ax (IPQ6018): before, a plain reboot
froze in SBL1 at "sbl1_ddr_set_params"; after, SBL1 reaches "SBL1, End",
trains DDR and boots the kernel across repeated reboots.

Fixes: ac41c2b642b1 ("wifi: ath11k: Register shutdown handler for WCN6750")
Cc: stable@vger.kernel.org
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1e1dea4..749d8bf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1288,6 +1288,18 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 	 * remove() is invoked during rmmod & shutdown() during
 	 * system reboot/shutdown.
 	 */
+
+	/* The shutdown() callback was added for WCN6750, which has to stop DMA
+	 * before the SMMU is torn down. The other AHB targets (IPQ8074/IPQ6018/
+	 * IPQ5018) have no such requirement, and running the teardown here stops
+	 * the WCSS Q6 firmware, which leaves shared state that hangs the boot ROM
+	 * (SBL1) during DDR training on the following warm reset -- only a cold
+	 * (power-on) reset recovers. Skip it on those targets; the SoC reset
+	 * re-initializes the WCSS from scratch.
+	 */
+	if (ab->hw_rev != ATH11K_HW_WCN6750_HW10)
+		return;
+
 	ath11k_ahb_remove_prepare(ab);
 
 	if (!(test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)))

base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
-- 
2.47.3


