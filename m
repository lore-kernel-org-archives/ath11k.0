Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA8EC5AD4E
	for <ath11k@archiver.kernel.org>; Sat,  8 Aug 2026 21:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rwRHGIWKNrcw+0UyMxYv++6Gv0JL9gOrsYEbGDhe+A=; b=NDTJjnyMFSDjtrHIMRGM1ZrioR
	m9cuxqI6WLfspu1x4cY5MqwcJ21dssoHC/1MwodIBg+MUTxBXlBDnaUkZKt6KzPRY3S/yx1SLkMMJ
	apoyDEPXvlEMkBhfPcD3mItAhfhSjoiybUOzw7ZQyKPY34cs0NTEy7BWP1fmbjh8Bc1G9XLAUIntb
	wpYQTsYA65oSiCxP97tkgOomssytr5hkJxaH1fmbcZ/wMdTVAVCDZrMVPreuFHI414cNxFba0ck4g
	eRM3MW1x8pax/FGCb4lVey/flVNJSYeW0EQpXQYoCWiQPCSyzS9Fe35ZqM3bFtlkfmUiLngXnQh6L
	mVmIsdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsoiI-00000009kOp-0AMs;
	Sat, 08 Aug 2026 21:36:18 +0000
Received: from mx-relay94-hz2-if1.hornetsecurity.com ([94.100.137.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsoiD-00000009kOH-2Ylw
	for ath11k@lists.infradead.org;
	Sat, 08 Aug 2026 21:36:16 +0000
ARC-Authentication-Results: i=1; mx-gate94-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=217.14.160.69, headerfrom=marcant.net)
 smtp.mailfrom=marcant.net smtp.helo=rossini.marcant.net; dkim=pass
 header.d=marcant.net header.s=gandalf header.a=rsa-sha256; dmarc=pass
 header.from=marcant.net orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7rwRHGIWKNrcw+0UyMxYv++6Gv0JL9gOrsYEbGDhe+A=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1786224955;
 b=e1Ipaat35E3df1KcsUYvIiXLCIm8s9g21hVmiayKqlECqAPDmZQZ2PwcaYEp3//1IUR4S+7i
 wRMDG/JJe1uDmbRswnpAhDeOyoslJwbJBmnYdcld40ijLoxLMLh44lZCO4N3J7svugCycs2RewV
 TR0XMDDPxM7oLS2XWOA1z1Wu1/GP8XqX8X6S/MmicVuLqi9dTFCspwnPpiWKYE3D6K7tjHSZROW
 CrmRrqFA2c3+ES7NL1g3w0lpgl5aUHYSNJMAQIICXo3cW0LaNLurB+ZutYsJvd+ww52UiObGIPF
 CMzesc7yh7HBkJ5qfh2tyOWLBa2kMYkmmzxnuoI+oJVeg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1786224955;
 b=Ij5Mm16tjBAvRl+YjqLUcOouadfI0Cs++etEYJ8G1D6qART2mvxiiExVcpWDkvuayhLwZc+D
 xGKoX+0Z8MHJMHyjJlz01RLyBFeN6Hjie6R8RhPDUUz+/b2yXwhJFjm/HX2BdgJS3zZ3S6ngpop
 RggCfvAhLBlZ8GlhmbKZLx8AxzevKW3V4qLx6X5jFtEJ0RJOo2M6zIl5H+iYlTDMNJRtmngmByj
 KTYQDtiT4h36IgpHPiwjoi9UU3cioFMGFtlxwRlAlkXjXWWPtJSkj8bWsl7WKdYx7OkXcG2/KO9
 v1YrRcsyfOZJyGHuTBkEec6Okim35VE0CZWKJt5dYmOiQ==
Received: from rossini.marcant.net ([217.14.160.69]) by mx-gate94-hz2;
 Sat, 08 Aug 2026 23:35:55 +0200
Received: from futile.kalnet.hooya.de (unknown [192.168.203.16])
	by rossini.marcant.net (Postfix) with ESMTP id 5CEB49600B2;
	Sat,  8 Aug 2026 23:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 rossini.marcant.net 5CEB49600B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marcant.net;
	s=gandalf; t=1786224951;
	bh=7rwRHGIWKNrcw+0UyMxYv++6Gv0JL9gOrsYEbGDhe+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKOT8jIJtjWi/mxqdBIo6tk83rOwvZRdkcWLe18pQ2uHrcnLhCMry7KOEASBHzjmy
	 z1T52gh2/6MPszvyPEoAZm2FhaTqeWBLzu92aDNDtJkL9+e6qoPQyZArb8DwuKJ8Y9
	 xr2CauJ/RKKd8dAkDqA7jiNITzxsFZXlH4D+Er9M=
From: =?UTF-8?q?Andr=C3=A9=20Valentin?= <avalentin@marcant.net>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	avalentin@marcant.net,
	stable@vger.kernel.org,
	Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Subject: [PATCH v2] wifi: ath11k: run ahb shutdown() teardown only on WCN6750
Date: Sat,  8 Aug 2026 23:35:51 +0200
Message-ID: <20260808213551.4169863-1-avalentin@marcant.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807094858.1548216-1-avalentin@marcant.net>
References: <20260807094858.1548216-1-avalentin@marcant.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: avalentin@marcant.net
X-cloud-security-recipient: ath11k@lists.infradead.org
X-cloud-security-Mailarchiv: E-Mail archived for: avalentin@marcant.net
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate94-hz2 with 4hHZ7q73lPz3ckwG
X-cloud-security-connect: rossini.marcant.net[217.14.160.69], TLS=1, IP=217.14.160.69
X-cloud-security-Digest: bbf02fdbf85ecbf72d52eefa7ab56159
X-cloud-security: scantime:1.616
DKIM-Signature: a=rsa-sha256;
 bh=7rwRHGIWKNrcw+0UyMxYv++6Gv0JL9gOrsYEbGDhe+A=; c=relaxed/relaxed;
 d=marcant.net; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1786224955; v=1;
 b=esOKCZsZU+vGmSIe/P1ATFcBtmBPahtMzMh8/mKA1yEeI4qHE3paMHCE4qtP/IbsoV6SWs3H
 O/LLGK/LXfuHcNW6FTdZkSXIEE4n2xT7VncZ44WwfNiRwHdgoQ7YaaKjcDnOvx48WNPLtC3OcCs
 9mvhqlP1WTCsudlQSYfZW+i4O9BehhTWau+po7La6LFe2D49TFwInA/7MFZcdWBHT+2Vds6JsPA
 l/spKbJn0WSwGqCgh3xvH7sQzmlJSlsq2yTSJ4voyV7I3EzAzobDGhBf0GPgZi4qeP3QwffVdLF
 BzvmAGs7+gwqzMKsCVz0Vq93lrjHJ9kwEwcwE5RcwdruA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_143614_313663_E94B50BC 
X-CRM114-Status: GOOD (  20.32  )
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

The AHB shutdown() callback was added solely for WCN6750, which must stop
DMA before the SMMU is torn down at system reboot/shutdown. It was
registered unconditionally in the shared
ath11k_ahb_driver, so it also runs on the IPQ AHB targets (IPQ8074/
IPQ6018/IPQ5018), which never had a shutdown() handler before and have no
such SMMU requirement.

The commit message claimed the change "will not impact other AHB ath11k
devices", but it does: on IPQ6018 the teardown stops the WCSS Q6 remote
processor firmware, which leaves shared WCSS state such that the boot ROM
hangs during DDR training on the following warm reset -- only a cold
(power-on) reset recovers, so a plain reboot never comes back and needs a
physical power cycle. This was pinned by bisecting the teardown: skipping
ath11k_qmi_firmware_stop() (i.e. not stopping the Q6) is what lets the
warm reset train DDR and boot normally, whereas none of the q6v5 power,
reset or clock steps reproduce it on their own.

Restrict the shutdown() teardown to WCN6750 via hw_params, restoring the
pre-regression behaviour for the IPQ AHB targets: they simply have no
shutdown() teardown again, exactly as they did for years before that
change, and on reboot/shutdown the SoC reset re-initializes the WCSS from
scratch. WCN6750 keeps the teardown. Module removal (rmmod / remove()) is
unchanged for all targets.

Verified on a MikroTik Chateau 5G R17 ax (IPQ6018): before, a plain
reboot froze in the boot ROM during DDR training; after, it trains DDR
and boots the kernel across repeated reboots.

Fixes: ac41c2b642b1 ("wifi: ath11k: Register shutdown handler for WCN6750")
Cc: stable@vger.kernel.org
Cc: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Signed-off-by: André Valentin <avalentin@marcant.net>
---
Changes in v2 (per Jeff Johnson's review):
- Drive the difference from hw_params instead of comparing ab->hw_rev in
  ath11k_ahb_shutdown(): add shutdown_teardown, set only for WCN6750.
- Frame it as restoring the pre-regression behaviour for the IPQ AHB
  targets (no shutdown() teardown), rather than a per-SoC quirk.

v1: https://lore.kernel.org/linux-wireless/20260807094858.1548216-1-avalentin@marcant.net/

 drivers/net/wireless/ath/ath11k/ahb.c  | 11 +++++++++++
 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  4 ++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1e1dea4..5d71ff4 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1288,6 +1288,17 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 	 * remove() is invoked during rmmod & shutdown() during
 	 * system reboot/shutdown.
 	 */
+
+	/* The teardown below is only needed on WCN6750 (stop DMA before the
+	 * SMMU is torn down). It was registered for all AHB targets, but on
+	 * the IPQ SoCs it stops the WCSS Q6 firmware and leaves shared state
+	 * that hangs the boot ROM during DDR training on the next warm reset;
+	 * they never had a shutdown() teardown before and the SoC reset
+	 * re-initializes the WCSS from scratch, so skip it there.
+	 */
+	if (!ab->hw_params.shutdown_teardown)
+		return;
+
 	ath11k_ahb_remove_prepare(ab);
 
 	if (!(test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)))
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8dacc87..c6df829 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -578,6 +578,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	{
 		.name = "wcn6750 hw1.0",
 		.hw_rev = ATH11K_HW_WCN6750_HW10,
+		.shutdown_teardown = true,
 		.fw = {
 			.dir = "WCN6750/hw1.0",
 			.board_size = 256 * 1024,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536..8279eb4 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -231,6 +231,10 @@ struct ath11k_hw_params {
 	bool cfr_support;
 	u32 cfr_num_stream_bufs;
 	u32 cfr_stream_buf_size;
+	/* run the ahb shutdown() teardown; only WCN6750 needs it, to stop
+	 * DMA before the SMMU is torn down at reboot/shutdown
+	 */
+	bool shutdown_teardown;
 };
 
 struct ath11k_hw_ops {

base-commit: f9a2394a23482bfd330911e9c8295b71724feacd
-- 
2.47.3


