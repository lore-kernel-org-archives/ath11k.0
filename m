Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92559606A327
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iphT+qVR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ph+E5Rpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eRGWWGhx4P2qAtaaAXKvk7Nog5Hz8VCi7ow8vJBFAQE=; b=iphT+qVRPCGSh04vPM+HovCnfD
	2cn6s0TkroqH/X2Mo83HDbk3YfWr/IVW5XXNlzI71uimgMT+/oODJ4v+l3+u0CWRobuyyg3CglFJ1
	46xM94iuUlgZs5F0rSecMcze+W60brVxU/2eWSdLJjXYRyYGzwKFP22iXcEAg86FffIUsJjU0SKFH
	tWdsBPX8MFIxhc7jpgE8W8S/evtJiFUeUBzVp9B9pfT3PnBpojgLPnT/KfuullCYBtrTp6WSXh38c
	NwOd1BKNuF3hm6apV5gbdv3DGg5BPg/RxSW4Hq5gxuK3wHgdDsd+aKXLYQsGacfJe+kbpwqBjrP/L
	W1d5yDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNY4f-0000000Eerr-39MU;
	Sun, 01 Nov 2026 16:06:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNY4e-0000000Eerl-1zeT
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 16:06:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDFA6410CC;
	Sun,  1 Nov 2026 16:06:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793549183;
	b=XhgKXj9cJ0ZJUMDgtmZjqXZR6st6mP4cs7+kK8tKEwZmQz/gJXJF/1mPxHZsoHLhfHpD
	 thMHW4U9u/SijcF31JL3uc8UBoDvtkG/sMAJAUnfibsU0BmxKZPKqPUHlJkF7L4Zr6aaz
	 0GAlkOs5XD7BgNJw6X/EVAi57v76KSMwuPqthqe4blK5Wh+2Ax4arjWcI0gvDeQmEZ1cf
	 X3pJA+ZvRaedOJlp19y8DgX59uyJd2OclLu2KV0GFffMhVNhIsrqgtnQvXnS4jpgeoIUv
	 nf1aEc4ubcdj4XzjdBh31SFP4CuyMj1xZPMBl7TJwFulJSQ9hV/1nsRW7TCCNjt//eA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793549183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eRGWWGhx4P2qAtaaAXKvk7Nog5Hz8VCi7ow8vJBFAQE=;
	b=g/ZQmaFOfZYFvzWpqS9JMAy2u4LoW4ZgblmiJf4jVODTHSEZobb0TFrVebWWxPMkId+T
	 72Euar3KrHE7NNbpiKpmCMk4I2L0Qsg0vxNmFeGNjQNA+fmx9Bx2bI8x3Ko1TztU28nFe
	 98sjumZVT6lupGo6tupRBb+GADGc9/z6+gy9ZJi2+z9ImVlQYW7j5j0/UB3ORddt0C4wn
	 6q3DDdtz96Myz1w847uhh7D44qsyts/tPL4xsJlAJRRd6qmOs7B0Twx2npDgz38aytcB5
	 YTFZD5+gOsHnAyiYJIE007kD+cJTGNXaFIq0EsKdpK6DbkTudTBreXjfjetGdTnLmjg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26BB51F000C1;
	Sun,  1 Nov 2026 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793549183;
	bh=eRGWWGhx4P2qAtaaAXKvk7Nog5Hz8VCi7ow8vJBFAQE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Ph+E5RpvrZl8qamsd+ujCZ+QpTReY6f+BIhFiG85T5/qTB5MTb8elCFG28KAWqAh2
	 vjcCTIk1mFJkQUwvEB+zvk3z6nQo+wGojfEVWD7ch1+7gLLsqhOXQlxsg5K5aZ4LUp
	 R4yCHfZYQHMW9UwpVqjLUtKyEH3dCv36I+GTGbVLSz8ltsl38UuhLkpsES/Y6LaBLu
	 K+Xx8Ff05MkBbeNvsYS/MJRSVGBDeP3aEUXJGjWuE2Y+hYQeplDXPKzyvsPJYV+hCe
	 RPtyYdBaJg9yvG7jKEi8EIx4rfCj7Z4mg6/zJtqvOLhabirymDDW9a86P258B+p/E3
	 HZl9ZcQQQnONg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7F8D9461DD;
	Sun,  1 Nov 2026 16:06:22 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 10:06:23 -0600
Subject: [PATCH ath-next] wifi: ath11k: look for firmware-N.bin without the
 user-space fallback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-b123-fw-api-n-direct-v1-1-a9b734520abc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH5j52oC/yWMwQrCMBAFf6W8swvZBBX9FfGQpBu7HmJJohZK/
 92ox2GYWVGlqFSchxVFXlr1kTvwbkCcfL4J6dgZ1tgDs2EKbB2lN/lZKdOoRWKjozuZkPZJYnD
 o6Vwk6fLbXuDbRFmWhuvf1Ge49+h7xbZ9APsX/sCCAAAA
X-Change-ID: 20261101-b123-fw-api-n-direct-7390bf5fecb3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793549182; l=2493;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=7FihErGI/rxuO2qBCwtRnH7nsLSwQjP+NG+2mzhjaCw=;
 b=h5I/GzmP40OJbuvR6vdmnMCQvlkWlbMBtyvvZuVKywePUAm6injCk7McFvQia3eyFTa035Mz2
 +DeBUl+boJqDIyAJvZC0EQ9KE88czoNVyp3pgM0+Oi68FG+UZlGNV89
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_fw_pre_init() asks for firmware-2.bin through
ath11k_core_firmware_request(), that is firmware_request_nowarn(), and
falls back to API 1 when the file is not there. The file is optional,
and many installations have none: on an Arista C-360 the QCN9074 runs
from amss.bin alone. With CONFIG_FW_LOADER_USER_HELPER_FALLBACK, which
OpenWrt sets, firmware_request_nowarn() still hands a missing file to
the user-space loader, so every probe of such a device waits on a
uevent and its answer, and the loader logs the miss; when the device
goes away before the answer, as when it is unbound right after probing,
the loader then fails to write its answer:

  procd: Failed to write to .../firmware/ath11k!QCN9074!hw1.0!firmware-2.bin/loading: Bad file descriptor

Request it with request_firmware_direct() instead, which looks on the
filesystem only, as ath11k already does for the optional calibration
file in ath11k_qmi_load_bdf_qmi().

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Seen on an Arista C-360 with OpenWrt: its QCN9074 has no firmware-2.bin,
and its scan radio is unbound right after probing.
---
 drivers/net/wireless/ath/ath11k/fw.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index ef1b4c81843a3..3628e33e57f6e 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -16,10 +16,14 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
 	struct ath11k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
-
-	ab->fw.fw = ath11k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	char path[100];
+
+	/* The file is optional: look for it on the filesystem only, so a
+	 * missing one does not go through the user-space fallback loader.
+	 */
+	ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;

---
base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
change-id: 20261101-b123-fw-api-n-direct-7390bf5fecb3

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



