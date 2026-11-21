Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1C606A332
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Sn6YHD1;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ky+mlmOM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=; b=1Sn6YHD1KAqmjV
	7NHgvIclyXuPDVIcseQ5XtgLaB7O1mXbrP6fdYzFtaXX0xojnRFkQHjX6sDltmcPwcWe6c75HO1sF
	kJJL4ANiC4jBA52cy/3i3Wy5g4gfTjlWgjyi869TS8KzKwKUy8vRjuQRmbHH7602eLRyGyB3aXuiF
	WwapYNjmpPKSzi4xJzJF82EGbevLlVaMByEE8amToqnhjIMzecWYfRLkvITpj5M2+l0b9NEhsNTLw
	Sf4B3yMHWdomq1iPNMTFFsFozOIaR3BMhpdk29RhnBPAbmhdcUbfdw5/ww5DXwyeBeHtYdLKLlgZP
	6reYmf4Inzg3T5DueXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBm-00000000SR2-2KeX;
	Sat, 21 Nov 2026 23:08:11 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBV-00000000SDF-3fYi
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:08:03 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4d28f75d62so360121066b.0
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302472; x=1795907272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
        b=ky+mlmOM36KPwrPtGDndtFdatRtjbvTTC6UlFCsm5AHShUfaYoNlUJpKKs5pSf+QCC
         hLE+LWjwofMjaMjm8x0xB94WBcWNru/b5U3cXacThOnachxd/Yl0ZgbgoWH2eAAdfhs7
         Mf0kQ0+W+UB4Trz/vNoUJ2f7HtOywnjwThx5QhuRhXWej5CUGIeUW77JZYb/1XP0FQot
         MTGUzdgBJ8AzVOrkaximxe+uGgzizWqmfd/fhbu+CFt0pMp1AizMHFS3yyCwFABUHlhV
         tWhlnr8X1zY9O8o5RcYWbuXfIr5ylG6lOYXHc2WutufJ79LOxfHX/1p1cwxXohdfQYrE
         bGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302472; x=1795907272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70WNgqL5GZRExFkcGtbsYLJh4cOMmVFtlMmJCmnLrEM=;
        b=S+kh2ePgNTSZBAZvSf8exB7gRNCw0Ja719gOTn1yoQegkmDhINIqB7ECuDtB0DitQ3
         71L8B+w+b3nXAKG7SvtNs5fRHPQpi8HvZ7Y+88yCslE/Yq+OXVyWIfZcD9ybv2B2a0pL
         Llw7AigB5MawY9ufBWvxnOpInKo73n6hgN+irv12fFnpGxqAhf1uyIh0FrpdyXH2wkK1
         lTiF06Us/eWk8oFCDGOkv1Cg6sGClkV9FTXdv7DAlz8MlUf6HJiNG28/cOxnzOSTytKv
         euPr0r/TcLgiBk7Hg4HhH9ta+S2AGZh/9hnxawaPRhLoXrEk/EqGoMzzbeLfoqn2M/pf
         eJ+Q==
X-Gm-Message-State: APuU4Z+SjQIziDrgq2KeitltTXB6MVOP7q5RMwOLAd7zVPXs6BeFO/rd
	tDBbiEn7n2pYnn00muMbFAWtFutWKe5fXIJZjuLcD+bQ+WG5EOy49aY70HcIdFOtWg==
X-Gm-Gg: AZFdTZfo2kTpuGZWOQjOTjeYnUbnV/HHPF1hbko+ZWVqFj++ljdL1aBsv+ibFKajyPd
	nOm5PJIy0iH7+8BF0EOn1V12n0p28Bkm1baQDKe4SG3pFLZ/pRr3fPvy89/vPQ8DKvUFI/4lSxt
	lcuehtGZBSpy52SdEfV3HLqIAGBQ31UQEP2pGDDy8bHUXKgZLkUfAvMNHWXeu1yt+93opvV95T4
	nRfmob/bZtzyekbEkYf0tPh7+b/ZuhLfLso4vcr1zPb19HOljq8xcgQNr5kT12hEtVbnR5HUBNV
	Yxp/jJi79Figro2wPRDUygwtfjCS2OxjITctiSDPN2MioVlhnJr5K/uGgnJK5cmF+zjBvs4OTjV
	g/d7yNoMAy5CEKSDrfMRyGk5D/8IIfENauEKFJwL5ESRpa0OulPxV3eGqWIMw0ujaWBx3QZHftS
	byaLVeMpSqTIQ6G/JZUMUu4zQElQIYD5zt5sUB7uWBpuL8UYtEbsrLUh1QLmpxBuCZND8XhtPUE
	/neQGhUwlMhLvLyT25PDqcdfdp93R3Bn8jDYgI6NV9kOiX2ioEla/Y5SOR9GmFBPlDTxpgDG3dO
	NAQANOJRM28jJve7EgzGGC5H5z/+nfZkfxmYhC8B9YUmov64mKP8bT2Nu7v7FjQiy6Br1ZCXP8A
	IxVGMs/+pQEX9f+vin+ncDQ+XkarH6932/Ov++W7L4sFToZ8JCfmKmP90LsHHbamhIJTQetQmQ4
	DS59ajAu9jtbTOmitsZkcEe2P27gdUlwQV637+pClRiiBkDDQDpCDmgiwfouWcIPuUfZlGORl+1
	r90Nb9EF4DtTYcfOx+9vS/vpUN1GBzVm6B7NfbHXPFpiiTN3+SD6X8sqU77zBtE8ES0eSO8az1i
	jmps6HOJ98rYUbaLa6ZP5xSYyB7NsXfxMR0KytlNayTwDzYbuuqxJacYtWpL7Hfih2zn9/Xf0ww
	=
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr425452666b.30.1795302471991;
        Sat, 21 Nov 2026 15:07:51 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:50 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 10/13] wifi: ath11k: ahb: configure the IRQs before the firmware is booted
Date: Sun, 22 Nov 2026 00:07:28 +0100
Message-ID: <20261121230731.1206043-11-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121230731.1206043-1-julius@bairaktaris.de>
References: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150756_836887_D95ECA77 
X-CRM114-Status: GOOD (  11.63  )
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

ath11k_ahb_probe() calls ath11k_ahb_config_irq() after ath11k_core_init(),
which has already initialised the QMI client, created the debugfs
directory, registered the PM notifier and booted the remote processor.
When the IRQ configuration fails, the error path only unregisters the
SSR notifier and frees the CE pipes and the resources below them, then
frees ab: the firmware keeps running and the QMI client, whose callbacks
post events into ab->qmi, the debugfs files and the PM notifier stay
behind.

The order was swapped by commit 166e22b38aa3 ("ath11k: ahb: call
ath11k_core_init() before irq configuration") because the ext IRQ setup
needs hw_params.max_radios. hw_params is now set in
ath11k_core_pre_init(), which ath11k_ahb_probe() calls before it maps
the resources, so configure the IRQs before ath11k_core_init() again,
as ath11k_pci_probe() does, and free them when ath11k_core_init() fails.
Nothing can fail after the firmware is booted then. The SSR notifier is
now registered after the IRQ setup, which it disables on a shutdown, and
unregistered in the new err_free_irq path.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 166e22b38aa3 ("ath11k: ahb: call ath11k_core_init() before irq configuration")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v3: new.

 drivers/net/wireless/ath/ath11k/ahb.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 893a3270394e..736fd368f8c6 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1285,26 +1285,29 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_ce_free;
 
-	ath11k_ahb_register_ssr_notifier(ab);
-
-	ret = ath11k_core_init(ab);
+	ret = ath11k_ahb_config_irq(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to init core: %d\n", ret);
+		ath11k_err(ab, "failed to configure irq: %d\n", ret);
 		goto err_ce_free;
 	}
 
-	ret = ath11k_ahb_config_irq(ab);
+	ath11k_ahb_register_ssr_notifier(ab);
+
+	ret = ath11k_core_init(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to configure irq: %d\n", ret);
-		goto err_ce_free;
+		ath11k_err(ab, "failed to init core: %d\n", ret);
+		goto err_free_irq;
 	}
 
 	ath11k_qmi_fwreset_from_cold_boot(ab);
 
 	return 0;
 
-err_ce_free:
+err_free_irq:
 	ath11k_ahb_unregister_ssr_notifier(ab);
+	ath11k_ahb_free_irq(ab);
+
+err_ce_free:
 	ath11k_ce_free_pipes(ab);
 
 err_hal_srng_deinit:
-- 
2.53.0


