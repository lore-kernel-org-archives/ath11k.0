Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE778C04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kTpVMyKwqxg+Xbv/9qpdcCqTNcEi6pqlPodWIQbmKCM=; b=Ix3zfOHiZUdY85
	1ilD+9uPkmcz+qIFFgcNzBTxPzwHcCfIrVrIgVy2zs66iAmeueMYzYPYFSAQV+sezL/AYXqqSrpoC
	isSXd32y4Gx8iZjMrknMXpuWqVLrE+uqZK8Pamsa0ro31cL7o/rRz0uz4OCimujlwlgU4UvlN+81l
	RVYSh+guqME/rEXojZBWd22s3CvBRG7ty3dy9ZeuRYk2t8bYAiGXmwGbctpmfRdZAGCp+GOqTsJeM
	JbRF3EWVAwSYalvoA6IQNDZF76nFQDimDSgNABD418qA6InkLLYt2XDW2bnl+wj0o5D7H+iTcTmT7
	WvxbNAgyFJVd/EFsHdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYCx-00Gi0W-MC; Wed, 28 Sep 2022 14:38:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYCv-00GhyT-Ci
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 14:38:42 +0000
Received: by mail-wr1-x435.google.com with SMTP id r6so2841516wru.8
        for <ath11k@lists.infradead.org>; Wed, 28 Sep 2022 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jzb2tlFDO7113hwXJyTmEyrv070pVMBorQWNbdu3q1M=;
        b=pBx0BuzdgJDgcsZ8f57VP8/c2/uyQYL9ycGYHrIIRZDcL1Ro2p68mQIBRfzCgvNjnY
         VqKRqE/z07+oRnE+K4Wxw1BU5KlQ3fzHUdPOG1sc7nA94tOjZbyyyJU+e8xXEaHqKpX0
         kKtdPXKPTHNSNxIsowDyubr5YzqTW/XAmPFYC85wX4bgz+nzXHIHreN3SbBV2Z8WgX/F
         wjg29IJrg4y0IGZUDqO6AEYezVmWt1CY5iTzwiiHUfX2Wa1Qosh97IcEJI1FqeMBUtsc
         hWWwAXRbwYVW1/Rq7AMxeMvImunrzyX7Puxj0RnZDi4SlUxIJhKa5bVsy5ngu0Qt8dyK
         JcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jzb2tlFDO7113hwXJyTmEyrv070pVMBorQWNbdu3q1M=;
        b=rIic6Fzt1vC7GlqGMPtCCy/lvdhHSE3B4sZAxzQ0TPBum5PYxpe81itvF1geNA+2SE
         0spB0uJaWhNthbZpYuFmyP4uVAK2NpqXMo0azH9TC9A/pM7W0e+EUgSpjBREjixjBlJv
         bZteig/PjJldbctG5R8EF+EVCmFMP3tA9azc2AQECrnm2WrmeyuriAyJs97y1qyIPWMI
         oX67rcnRQ7erf+JsQpc+5FP+bQoe+y6HHqFovirj1yhNI9zsNbJAqBTJPcQQefQ/8jtH
         5oaUVsdN4T5z+JPR840ydaAoxL8UG26ITzl03iGnWWXnwH6DXg2tP4VFruu8jnKP21Eg
         thkg==
X-Gm-Message-State: ACrzQf1G+DGbC3LJHXHPUAhm5KHv7VmVbXfpAhysD5H7R0dFQTOT5Mwp
	AqWEf3Dw+r9WP0zbsswRRww=
X-Google-Smtp-Source: AMsMyM7D4vDM49WeiylJ/FA5Xb/66OVGI9cD1+tX27Tc7I3mrmERqFSLMPH9fv7f7EwlHDt/UpfGAg==
X-Received: by 2002:a5d:6484:0:b0:226:dd0e:b09c with SMTP id o4-20020a5d6484000000b00226dd0eb09cmr21343882wri.388.1664375916303;
        Wed, 28 Sep 2022 07:38:36 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id p25-20020a1c5459000000b003a5c7a942edsm1940253wmi.28.2022.09.28.07.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:38:35 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: ath11k: Fix spelling mistake "chnange" -> "change"
Date: Wed, 28 Sep 2022 15:38:34 +0100
Message-Id: <20220928143834.35189-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_073841_451790_0BDBB8F7 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

There is a spelling mistake in an ath11k_dbg debug message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index fad9f8d308a2..2a8a3e3dcff6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6829,7 +6829,7 @@ static void ath11k_wmi_event_peer_sta_ps_state_chg(struct ath11k_base *ab,
 	}
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "peer sta ps chnange ev addr %pM state %u sup_bitmap %x ps_valid %u ts %u\n",
+		   "peer sta ps change ev addr %pM state %u sup_bitmap %x ps_valid %u ts %u\n",
 		   ev->peer_macaddr.addr, ev->peer_ps_state,
 		   ev->ps_supported_bitmap, ev->peer_ps_valid,
 		   ev->peer_ps_timestamp);
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
