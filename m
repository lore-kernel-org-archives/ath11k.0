Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3A606A31C
	for <ath11k@archiver.kernel.org>; Thu, 12 Nov 2026 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUMdYJ33;
	dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.a=rsa-sha256 header.s=mail header.b=PPphDpcu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zmhn5X3CWYTsEkK58Y2ANNa/NCUnPop7kpMt3Yw06O4=; b=CUMdYJ33cO68WTuxD2lGwjBe5c
	jwdLdaPIPa3U0U2c8Wmv33YjrIdDfJHSwPkCeVC3/YPQNSsBPpoQvKJTWRoZ6xB7Gdatk/cLdNOgS
	VP6FbzHMB7hFOn7DJmwvapcWoe+p2dx09tRA952My2hTPh9vyX8Ldzx0JicAMm1DlvdAmf42K2U6T
	g/F9sbMu7PjRR+97No104h2ZGsxWUflU2hRQ44imJqzwQDUCQb86ArQVQI0OnRL+7PezoKyWibZil
	0zNaPulfDRnQ6HpmfOUmzhq1h7c8uhVI6xoGGj31gQqm99bEnbR67UkV95ilnNTwz5Vgt6RQzgcR1
	EMaBJOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ3I-000000094Mh-3OgK;
	Thu, 12 Nov 2026 08:21:02 +0000
Received: from mail-gw01.astralinux.ru ([37.230.196.243])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ30-0000000946M-2wZK
	for ath11k@lists.infradead.org;
	Thu, 12 Nov 2026 08:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1794471631;
	bh=AP5wjuHCPtVGPOsgE6fooYfAbISUTGES4rmrzmf3upk=;
	h=From:To:Cc:Subject:Date:From;
	b=PPphDpcuG/Wc4LBIPzfaFmd4dGKGlovLd63NQ6wE52lUDkVTberAXUx63/5svPHAj
	 BBEPZKSR+U+yr44XulXDUpBpjvStSOsE20wwjmaXWmPf/1da0mpqhYUf12I6A9lLjv
	 3mYUnAugMzLV9Z9+JchIMK69NsgdQfPC7DOd78sTS6mqo+5ym+MpS7b9uLdbae2rii
	 Mw0/E6Scln1k1T9Sk/WiJs1RRphTXUZFh4XDjVN63zD8+IzHSan9gLT7MUK9+Zz28y
	 pZxkHnqAkgVwtiA6ypKnzkyEAfBmsiJevyv5QflLQbpuYJqvZvCCxdViz4oiKMNapd
	 TZb64q+13X5Lw==
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id 6436624AAD;
	Thu, 12 Nov 2026 11:20:31 +0300 (MSK)
Received: from mail.astralinux.ru (unknown [10.205.207.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Thu, 12 Nov 2026 11:20:29 +0300 (MSK)
Received: from DESKTOP-D46TNHI (unknown [10.198.52.220])
	by mail.astralinux.ru (Postfix) with ESMTPA id 4jQCxn3VPszPL7;
	Thu, 12 Nov 2026 11:20:29 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH 5.10/5.15] wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
Date: Thu, 12 Nov 2026 11:19:08 +0300
Message-ID: <20261112081910.560-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.54.0.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected, bases: 2026/11/12 08:07:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 134 0.3.134 ce9cca31102af372fedb0df49d70b90f771aea0b, {Tracking_one_susp_tld}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, patch.msgid.link:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;mail.astralinux.ru:7.1.1;astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 207423 [Nov 12 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.27
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/11/12 06:40:00 #28854651
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2026/11/12 08:07:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_002048_115672_E12FD437 
X-CRM114-Status: GOOD (  11.04  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

commit 7a246c72132eb943b5844ba79dad597b47429dba upstream.

Currently, in ath11k_wmi_tlv_mac_phy_caps_parse(), kcalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct wmi_mac_phy_capabilities)). The subsequent
memcpy() destination advances by sizeof(full struct) per slot via C
pointer arithmetic, not by the clamped len. When firmware sends short
TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath11k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Compile tested only.

Fixes: 5b90fc760db5 ("ath11k: fix wmi service ready ext tlv parsing")
Assisted-by: Claude:claude-sonnet-4-6
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Link: https://patch.msgid.link/20260728-mac_phy_caps_parse-stride-mismatch-v1-2-27a9c1a3fbd0@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
[mdmitrichenko: Replace the existing kzalloc() call with kcalloc()
 using sizeof(*svc_rdy_ext->mac_phy_caps). kzalloc_objs() is not
 available in 5.10 or 5.15.]
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
Backport fix for CVE-2026-90398.

 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6434d3ff0ac6..64178ffdc1af 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3645,14 +3645,16 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kzalloc((svc_rdy_ext->tot_phy_id) * len,
-						    GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kcalloc(svc_rdy_ext->tot_phy_id,
+				sizeof(*svc_rdy_ext->mac_phy_caps),
+				GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;
-- 
2.43.0


