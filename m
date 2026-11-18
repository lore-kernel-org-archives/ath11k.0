Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10560A3804
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lr7oCgYZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1tnI4jC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=; b=Lr7oCgYZ7bV7ER
	KQakyRA/diilwTm1UV0ntK7b65dlY5kzDBUGrauHShWP3HpUqQRjIcfWHsgsCkuoseF5vdo29TW6f
	3rdlOOmEYRtPDf+C++FnwKYgA1IKtztQs6KvaXryLSjbRZ3mn/S+Dbt2mUbudpVc7dveV7CSSwG6O
	r3d67RjYol/CcAe6zo7LfqwZI1n+L3X3MIiVOeJOSPY5FgbnPHnT+34Zs0iEGIW26teltvzNsOrmv
	LbcikKKYp5b8C6y5+NY86DN0pVmD+TuDYhm3F6vy7TWojCRTj9S2i6XPY5KXoJsLc3bt0Uj8z/2zq
	FjY/rorrslveUwRDWO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcM-00000009IwL-2UtF;
	Wed, 18 Nov 2026 15:30:38 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcK-00000009Iu3-1a29
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:37 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-381d542bc29so2165945eec.1
        for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015836; x=1795620636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
        b=Q1tnI4jCgHNRWOUMkRndTRhkMZqLDie/KTvtqX6Ro9xw+UIEZmWrb9sm6B1aIgt9qX
         GBXL4kYE4iV7aRt9E1WEUzY6IHTg4EzJs5TRaLuosutb8tDyMF6M0igZiMRwjDX2Rh0J
         wEJPdz6LDGTlYA2c0Srnl347sxqqLUzzjM+dez4bU/PlyM9PYW5O29DN7yopE3BedcNY
         FvLjmaHqRvlkS1tjfyG8HTZgNKZP0JJcIhIEvANUnGtOkGYQQ3mSMfwx/tGC0XXMB/s1
         d41kCnuoyFovlQeksJd93wjNdW8XgVyDHBKzrYAOiytSoMpGxG1fJ41mSFITcFaFST2L
         MZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015836; x=1795620636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0Wbxu7fm6/y8ipzcr+Pib3IjmOX46dTwli0BjlLQ+A=;
        b=TWcIY4e95xKX0OC2Oks/U30JHZtHIaYHsW/WYFgbGXb97j4xzy0YGaZAuV/7UDtR5A
         SuMLl08ciA944pm8HSWTMwfNj5CsRSELPIh81Yf0cfCvtzq/rU01nDToygKFM6zaoYJ5
         /yyX400hGsJ67FAtuSYjKFcxqxOeBVthH6Teo+Gcc+jlqy5+HyGv74YSP8Uy3PUa0jza
         Iux1fKR262N5r9iMIwckdZkdYEOKaoDuLjb+8KTzDD8bi6ewIumcfDWsOB/Trb5L/uvk
         zSVKxTke3CzntjzTjQXWMLxasutzleiowJ+3fAz46nYYdkJMLkf9qvYaNf5R/xnn6plq
         rGXA==
X-Forwarded-Encrypted: i=1; AL+hErH9oZROv7i4WKXA1KWfeQsg+++5a74TQdk1b11ZIwuH5t4co5yB8P4Jd8r8uIhn8eTymDxDnBE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+J3KhGxsVy4xlsuTDJd6TcJJdVN8aikMxNLvQ0SwP69S8sm5fH
	O/2EnJzTkMt7H7kGbc2hFGpwdPMBE+B1fLNEH5jRbg+ZIbZtmlQZJK0o
X-Gm-Gg: AZFdTZfURcA1I3HNO/NM66d3GJEFAVybkkRfVU2ileedKMl/TEaFEPAMerkQIz3BtwE
	qk5W9izWD+iJsxymYaseMeyAQ+goKLsqyZUGrGl8E9HJ0gkakaP29ODjayFwTRnZ41ra2d9A42K
	01GJYsUEnODFVT60d9lR5GOOZxGrSYXytfldJTWGuLSY7Vxjkyt3nstC/R7X4RBkz9drqoBTLjS
	iv8LBSdCYAuS6ZJMtrSfytvjFcviteBqgCZ1Fn+0WotdvAKKEu982qtSNuqvumIHnxjfWaTaceB
	fQgmTdzm131hDzVgy4hBEBZTLUbncNYDy5P1uDdtvg2QTMqPGsqQgx8mfmvsAYCFQ/IBCTCokIC
	354LggZSDB0jTfbjG00VvqfxWs2f3lqU13DnN0g6hM5d8OFvCV4aaw5NtcM+ZDd4Onkp4fxjYBh
	v/+xn1KLaG8ICsloFhuIQWtUV9FeCfqR682z7Z61dSn1JfuP2RJ/6/qLTqpUSCSUNYEWxP9wxnx
	eu9HTxi6NKAa66mIu6HNmZ4b/YwNYVhhkmVSs7iRuNSSvjCHgdikN7w50aevObjH0J1OxBYXukZ
	p/2iCJuuOCxvOVKxQa2DoBbVcsGhSY6/V3GXD580xyX0ax2VfVTdIIBuqRo=
X-Received: by 2002:a05:7300:d210:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3828083e094mr2685513eec.18.1795015834724;
        Wed, 18 Nov 2026 07:30:34 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:34 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 2/3] wifi: ath11k: free the regulatory state when the device is freed
Date: Wed, 18 Nov 2026 23:29:41 +0800
Message-ID: <20261118152942.62838-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073036_444292_7A288B95 
X-CRM114-Status: GOOD (  13.08  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The regulatory state of struct ath11k_base, the reg_info_store array
with the rules it holds and the default_regd[] and new_regd[] domains,
lives as long as the device, but ath11k_reg_free() runs from
ath11k_core_soc_destroy(), which only ath11k_core_deinit() calls. The
teardown paths that follow a failed start skip ath11k_core_deinit():
ath11k_pci_remove() when ATH11K_FLAG_QMI_FAIL is set, and
ath11k_ahb_remove() and ath11k_ahb_shutdown() when
ATH11K_FLAG_REGISTERED is clear. They reach ath11k_core_free(), which
frees ab, and whatever regulatory state the failed start allocated
leaks.

Free the regulatory state in ath11k_core_free(), which every teardown
path reaches, right before ab itself.

AI assistance was used.

Fixes: 61a57e51e46e ("ath11k: fix rmmod failure if qmi sequence fails")
Cc: stable@vger.kernel.org # needs adjustments for <= 5.15
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
that frees a synthetic device through ath11k_core_free() after a
SERVICE_READY_EXT event allocated the store, then reads the store to
see whether it was freed: without this change the read succeeds, so the
store leaks; with the series applied KASAN reports the read as a
use-after-free of the store that ath11k_reg_free() freed from
ath11k_core_free().

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..90124a826088 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2021,7 +2021,6 @@ static void ath11k_core_soc_destroy(struct ath11k_base *ab)
 {
 	ath11k_debugfs_soc_destroy(ab);
 	ath11k_dp_free(ab);
-	ath11k_reg_free(ab);
 	ath11k_qmi_deinit_service(ab);
 }
 
@@ -2734,6 +2733,7 @@ void ath11k_core_free(struct ath11k_base *ab)
 {
 	destroy_workqueue(ab->workqueue_aux);
 	destroy_workqueue(ab->workqueue);
+	ath11k_reg_free(ab);
 
 	kfree(ab);
 }
-- 
2.56.1


