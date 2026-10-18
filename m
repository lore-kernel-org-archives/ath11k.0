Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8BCCF2C9
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj8L+YVgxbyCy/bomk7t39g1PV2NuQ1DlfD7Gi2csFY=; b=OYJMLWaca0ZZL6YR9ZCfyGvi03
	X11NGz0PUO/GshBdsttxFxdfl5KfgO845cfbG62r0kod0r1TFBj1ZO5O6vb0jzxpTFGkB6SS5IgZW
	sAd6c7HV2YnfjZJiN5BQ9ulPaatE9B09nP0xvJTMG6kNyQwstyzLrcINIYr2mQUmr5zvE5O3SmyLX
	9ST1k+OjpGBSBg1vUmzuYMYG3a7aWW9Es8ZdQvKQij5mTVC2yU35dKrdU/DBK69B+QaoJtjBVVb/2
	tnMSklNpKx5mAFqq1laNi6Ftu04LhIpF0rSnxlUqfPXOeJvmu/9XeRkgm+5jSzXVB23O+Iiq1IRvO
	rMMNAdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY1A-00000006EFN-27mD;
	Sun, 18 Oct 2026 21:02:08 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY16-00000006ECZ-3Z21
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:02:07 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso4357533a12.0
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357323; x=1792962123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aj8L+YVgxbyCy/bomk7t39g1PV2NuQ1DlfD7Gi2csFY=;
        b=vL7G8EhSedk7JYqeDo0FKu/nW5jZL+x99NkkUrieUv+zFE4znTHGvBO//nGuSRStts
         yYbI/mjG4C9l8fDhQpjYjrrYeollFePWC2c7A5dGGv3dl03YCZCX14saXprV3Os4pEUi
         sKuiMkIO2bsGM+z4NTHgzF8Tm8/clLz/o/CCD84AKXz/Il0xXTNK/4CoOZMSFZ5Fc9aH
         jaJ+Qc3p6d78ImA4cmfBkVPjrjUhmwmbiB0/qxRaOXpwv7UKg20nu11JoPjGL/Uql7S3
         TVgB/hTfewBI1Y0RNEN5UDGfaOwAXWmuXaTs7CP746sCY81jXhaJr0Pjd8AE7ukQ7PWC
         SlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357323; x=1792962123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aj8L+YVgxbyCy/bomk7t39g1PV2NuQ1DlfD7Gi2csFY=;
        b=0VEFduV37nYjudJS8MO4a9p17dlhpb9gS2siRmIPJFesf4dJfh7ne3EeH2wHiWsmKh
         O/2h9Yhzd4jUdB7pKPTRm1uSo+D1nElrby3kCx2cxOnQ8N/KFNQ9fTt8DeSKUl28tdQG
         OGIH+aQ0kyUNc/eFR1X5w41yKMLT//zizEkz2tZbeJf+jtJP4WOQgdnQ8WhXpHRBOxmZ
         IAC5Rbv+luuTh5KO5oQNwguaEJf+KODZUuE8oYpt78uSGmQiBV10pZD/4EuoiKG7uOAP
         NKzdqiEaOXgoiLIK0iaFMPRUuM4+5Q+iQ4YQ8kz5BTBgVK108QUld6Wj9w2TnN8I7QXF
         MPyw==
X-Gm-Message-State: AFq9FYIB4XHNbAI8lqRO7vLB0zSGzg26AMVJ0dqmJg//GQEDz+YNhT4e
	Aqj7AsKIH85rMk8CBBVAAHLqNtWoF6/pA4EJ7IJP8Em/QWs+fngznx+RePtYhO6low==
X-Gm-Gg: AYBFou1AkE/gVtmvbxjfmxFx1U0j2xpGziiOJrrWjYDlOGmIfEkotc3YJ+o586zon5x
	XJr+/5bo/WzqC6zuGc4ci1ratyIBIO/64dtTKyDoe4nbICiJPlztxAW3eG5/1EIwO+3BwSIPWDv
	9bUdfBZZkJ0BnZXHI92GRdGyBSAFjCaoOp7n+nSYVdBVgO/p1W+yYzKN6+v5RI0Hk+ak7zO0Q7S
	F89woGoewXq9Awt+g7TpKrhdlo3KnQhm+7cPfTkWDm1LdTH3EmNbU7oDE2CETJGI/UQTa0mD/z4
	NjGnioMd3sGu8zf+EaW/iHGD3jSp52YZODMYV1h5geK2ipPmFZ2pV+FdMFZVPI5vULm4RlFS3NE
	zG5QAQqPzo+xflgMOu3oKc9Skcw7a+3ull7wLu7okzE5Bz1/zDKI1XwV2x1n21J37hNEoTXc+ji
	SKCxdbi4PohqxkCSCHCySNQs1Pt15XuzMNTAwRUY/G/EzH0hHS6cQQ9Ue7mPhUQ75ShA4IiOdhU
	TbWih557d31B5RmQcJg0Ot9WjKdJt8ftpF2dTB6XfLEIGiUPw4sO6D1jeEFFF0F/RYKRJ2B3nDs
	punvrItD+ObLVBq+Tj/80/sdrETxew6plE7okrTEp4FfEuB1f7iKRg6BSNFZzTJh4WajLOnBPQn
	VoPEr3+daRkSm3f4A4nH4N5K5n838gf6H/latxKJL7Cd+5EN+tXGBsVmTUW+4qeD1IidYXUHJCW
	t6DGju+P9V
X-Received: by 2002:a17:907:c510:b0:c2d:cdc6:8271 with SMTP id a640c23a62f3a-c4020cf900amr786044966b.13.1792357322673;
        Sun, 18 Oct 2026 14:02:02 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:01 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/5] wifi: ath11k: keep the srng allocations when a firmware recovery fails
Date: Sun, 18 Oct 2026 23:01:51 +0200
Message-ID: <20261018210153.1925962-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140206_179776_0593AE6A 
X-CRM114-Status: GOOD (  10.19  )
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

Since commit 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize
and re-initialize again") recovery zeroes the hal state instead of
freeing and reallocating it, but a failed recovery still calls
ath11k_hal_srng_deinit(). This frees the ring pointer buffers and the
ring configuration, which only probe allocates, while the rings still
point into them. Driver removal then walks the copy engine rings through
the freed buffers:

  ath11k c000000.wifi: failed to reconfigure driver on crash recovery
  ...
  Unable to handle kernel paging request at virtual address
  ffffffc080ee5090
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_ce_cleanup_pipes+0x16c/0x4cc [ath11k]
   ath11k_ahb_stop+0x2c/0x3c [ath11k_ahb]
   ath11k_core_deinit+0xec/0x168 [ath11k]
   ath11k_ahb_remove+0x30/0x90 [ath11k_ahb]

Return the error and keep the allocations for ath11k_ahb_remove() and
ath11k_pci_remove() to free.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: 32be3ca4cf78 ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index dd256853bab57..daa3751d75233 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2352,15 +2352,11 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
-		goto err_hal_srng_deinit;
+		return ret;
 
 	clear_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags);
 
 	return 0;
-
-err_hal_srng_deinit:
-	ath11k_hal_srng_deinit(ab);
-	return ret;
 }
 
 void ath11k_core_halt(struct ath11k *ar)
-- 
2.53.0


