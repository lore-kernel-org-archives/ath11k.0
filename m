Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C96BCCF2C4
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14A6w5xPMpUCV8gRRYD7ibxrUfMizPY/0c4dLS53tf4=; b=1QWl1Ff2w8WK/svZMCwyRFzeNH
	EDJBTOewxMuyWSUV72Jo1WMGAvvkOiPtdXb4tF9pix42DZoFXGnRyb1WO/hncPKRvCm8dme4UnjGC
	qN+XiT8fqkZePgqqBTPnLSLNtj1UgQ+d98D8BErds9DiPdpt20zqqea/u7aJUg3ndVKsfRpcCau66
	+lE1iDduZrsLtqGh4NvpRrhCZAsxhRzgF2aSa6erDTN+dzzXWUWzGC316Z0HvP18OW7g4+RHbIdax
	F9NuQmQN4wBrUUiXdIMpusOysgVki/TkrVZjMuftXGq7+Cf5vHr9qJPJiegUzJsH6/G/Z4C17tvho
	1VmboQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY1A-00000006EFR-2PZM;
	Sun, 18 Oct 2026 21:02:08 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY18-00000006EDS-1dhE
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:02:07 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c423b145922so100841966b.3
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357324; x=1792962124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14A6w5xPMpUCV8gRRYD7ibxrUfMizPY/0c4dLS53tf4=;
        b=A11Dk2sAcTlKeaN8kh3xGFB/xYEBSqBtNpBuva6UbAfrQdvNB05tVFcuUOm4vf/ElI
         +zlBCEohzNnm8BziMT/sTMLFB0qyfKz9z7U0go2tOKFgMo/gHRrp0P5o0TG0WMBP4xm+
         sIMEyi9RQliilepKW0lzU8nYplFFqhaqB3m31kHtovd0XtCTLN/iSq7DBi1QwXFIYjOh
         6k1fOuWMzbcf24sGlCzLhAZpsjPm5E9ZzbcfbuUZD3DoOkmXaOw/AfGQ0eaC2vDmeWct
         sYIsmHXmY8FrNheBY4C73ddcKV3rEEQdTK4WOOTXXPhPhUuwOjDjzBTTLikG1CFMRbO6
         X90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357324; x=1792962124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14A6w5xPMpUCV8gRRYD7ibxrUfMizPY/0c4dLS53tf4=;
        b=UNDSwBB5EFKBzw1DPmQLrAkbf1VD5xdnUnHMkB+PzmSHwNdQg5ORCx2hhpYBWHFQjn
         aOUvChvnp6wxlnktQ7K9MCXQryw5xGrLN2Fgq8BcBtQiCOJoqeULBHTSoAm1XGdpevrY
         TKPXVmkEMvTCdBjLEnt20J93APVQ8FvQBvkCSZ+uw5u3XXaBkmX7cz1SG3yi2nhrDGuf
         RUU1ot3gF1Cd7eSVKFzcXDDVIWltJrrlMcWKx3O96Y0TrqDcS4PiikLnfq61HWY1MGI1
         2VaBm/LBGN1tbeRXcSNZ8jeuSvu5j7xrIDiTTpB30gbSOJmHt8gP7iFNQjnrBAHm93yK
         63PA==
X-Gm-Message-State: AFq9FYIcv6/Gn8obDDe3jfN6lQa70urW0NNRjR1DnwD++NN8JgUgUKCS
	xj7yTvR+EQnu+wgb0J6GWyIA7NHOZpXJ8M+UdgD2wcqsPwRfLusW3eYJY73KLIBw9g==
X-Gm-Gg: AYBFou36Zr20F/wDwPwcv1SHlmzZNyZ/8CRJJpAhJCytq5U1tcmtTdzQLA4WKzO9Lrq
	hAlsV9s7o8exI2F6j40IxVhmTtqovfDPaLhNOOwNCJvrThcYjBPi6aTAWYNjMcDinMccnLpCYyN
	Fa9kUFSuhiFd8H69u72mGfg4bYdmuHqNTaJ/US+E62WYa88hiJYh2iR3Jtl6fnsul0k8m5or7TW
	wwi6IjcAbwYPDnpGWx2YmXft1TWcKvdmUxzwVdIPB5O7yed9PRZkis8cAHSUoa7V58l5NE/OfwB
	jMQgLtHr4yK3zOnpGpAHl00mMlaO4r1f8L83wE6UIQPsvKr+E+WGA9p0FVnSasmzGENygy26h3a
	mqaYoVhwQxt/GhhXxe+51n8Cm4nxmyTQTabRbHigNdoRItb4lT3X74G2P2GkrCt9GK7X7q+kCRP
	AQWEVXlJxopIDiRyrxYv4OXY+Es8QK5HJyY6EY76GKci0lt6CvJCzrm6SzGtCYl2mOh0zSrMsYc
	1yeJXuXcLtWFZ5P2Bq0lLTLMH3nxgygesIz6MKEFkLIOOmVdo3Y+FABdki9SSUeeyd82uieOGDJ
	3BAoAOkMTirhJ+0j7+JMSZRnhhT5+pRaJB4Dmhv/eArXT74ZGfsCtsRZK67AILlQ+MsTDs5p3l8
	fb/VNXHO6Vc2Am0x6+bAptdpaeSsy7Cf5th+vT0glIc7oBDWgxPdIjq+16DgWIztr2imYOrp4Ao
	oyXmhB1+J1
X-Received: by 2002:a17:907:a2cd:b0:c29:8a0e:4458 with SMTP id a640c23a62f3a-c419996fef0mr351005766b.7.1792357324577;
        Sun, 18 Oct 2026 14:02:04 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:02:03 -0700 (PDT)
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
Subject: [PATCH ath-next v2 4/5] wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
Date: Sun, 18 Oct 2026 23:01:52 +0200
Message-ID: <20261018210153.1925962-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210153.1925962-1-julius@bairaktaris.de>
References: <20261018210153.1925962-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140206_481567_DDCB80A8 
X-CRM114-Status: UNSURE (   9.68  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ath11k_core_reconfigure_on_crash() clears ATH11K_FLAG_CRASH_FLUSH right
after ath11k_hal_srng_clear() zeroes the rings, but
ath11k_ce_init_pipes() and ath11k_dp_alloc() rebuild them only later. A
WMI command sent in between passes the CRASH_FLUSH check in
ath11k_ce_send() and dereferences the NULL tail pointer of the cleared
ring:

  Unable to handle kernel read from unreadable memory at virtual address 0
  pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  lr : ath11k_ce_send+0x114/0x350 [ath11k]
  Call trace:
   ath11k_hal_srng_access_begin+0xc/0x60 [ath11k] (P)
   ath11k_htc_send+0x188/0x3c8 [ath11k]
   ath11k_wmi_cmd_send+0xc8/0x2f4 [ath11k]
   ath11k_wmi_send_peer_create_cmd+0x78/0xe0 [ath11k]
   ath11k_peer_create+0x138/0x500 [ath11k]

Clear the flag once the rings are rebuilt, before ath11k_core_start()
sends the first HTC message.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index daa3751d75233..4666245aee36d 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2294,6 +2294,8 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		goto err_firmware_stop;
 	}
 
+	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
+
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
 		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
 
@@ -2348,8 +2350,6 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
-	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
-
 	ret = ath11k_core_qmi_firmware_ready(ab);
 	if (ret)
 		return ret;
-- 
2.53.0


