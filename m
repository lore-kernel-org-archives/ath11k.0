Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2366CD3431
	for <ath11k@archiver.kernel.org>; Wed,  4 Sep 2024 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u49hiZ4JFDTsCsznJsWvuznonlfqBLResqj2DwZmV/k=; b=1Zno1/XWJ6uNey9E5ZpFbkOtRb
	BtzDeHa0wg1KEH6F4uQNfWpr9GG5LsZXngWxCD3ZCOfSAWl5vgSCt3H7rmKz4Pxneh/BoaA8SjokC
	7Ev/WyPbiJb2N0fM8bTGRPYqBcjbxRX8I9b0+oEjw+vsqm9xr+LYu5TF91jd9jEco4rj+MKYN2QK1
	94HLt/GxdHxNJqkn1dEAftr5si+rmqXvu5XJGAbpXcWwdk4WZ4Gpx+4KFSB7MvX6uvV0A2pkzfBu6
	N0bSs1rnnV4Kx5zSNNQRnMptB4aQ/WFcdzPxW9CGR4iRz+Oaz1q74rCybaLT9djuUxn2zdQSZrRNa
	3IHcWXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sln8t-00000003su2-1Kdb;
	Wed, 04 Sep 2024 10:21:39 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmmp-00000003nYx-3CKm
	for ath11k@lists.infradead.org;
	Wed, 04 Sep 2024 09:58:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a8692bbec79so730628766b.3
        for <ath11k@lists.infradead.org>; Wed, 04 Sep 2024 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443930; x=1726048730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u49hiZ4JFDTsCsznJsWvuznonlfqBLResqj2DwZmV/k=;
        b=p59VZuIAjdpKiwYIPNC5DucmaIxdodZcHRU/DrQkf8Gu17MOuRUTufYqzonyt6IvMk
         Iu1zySaIgdr0/353hdYaUR0RISYwI8dKT6UoZleIeQlEWVJwIw7N/lDWjjj8cqHctlb1
         uM/bEo0UPDgR90dn4LLl6EExktbCUUlklaFtxQIzMNqL/2Rvb81Ssa/wcDiSHQQgLbT3
         vSdiuB/SZMDONUVvK2I1By+VSgQXtQnFQgVsXUPjbSPKLIxPHcFvPr40sc7DyXCEEFWQ
         wHBanTvuZ3xfllStyB27T1zp/ZDtMFcTSjeipHpIrMCeIlAIfUARcIBE+x53+h0wtzVJ
         IuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443930; x=1726048730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u49hiZ4JFDTsCsznJsWvuznonlfqBLResqj2DwZmV/k=;
        b=WXyf+4fZqlZJbkc2Pf/k2MmeVYpCc29l+WsEDhyoNF2FzclpeMn71w5YpahbhJqP6C
         qXw+xVt6oUht6/MkqssRge7Q+hXzXJ8eSYRwufK676Pi4Z/5wUF8WyHXVbDR5KIjQSij
         BSKogxSkF9EsnZ6dFQmw6SLSvw6giRX/74EsKSwNFpdvfkQqQgzbZtRpO5aBPHsG8Hv5
         i7ag3RlwoDZ/xwBuhNLGW4XlL/edZAiHSTUBqaKqC9VGteeMTbbRAx1pfs7x34IgB8+j
         BW8U/PrBoWj6ZzJiJf0kgi3gQNAOnjfiUqmAf6TotKEdRFKpmfwLldXMA5ikIJTe+DGR
         Xh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzS/lp7wxMQWvosoBMrxi1EWoal7hTfTBu1rBYwJki4YO9z3+ADAysHQrnJKOGgiUisJy8adI=@lists.infradead.org
X-Gm-Message-State: AOJu0YymM5uKKcZnVPVL553+RgcRqTM8STon2RwD/Lh7uxF0gipfE4CE
	g1Rv4LZVvkos6s2nWI0d5GCnWYUhmitz4zCopXAJLoQYvcAQehEbXSWrjhgaiN8=
X-Google-Smtp-Source: AGHT+IFT+NniqAPvFhaZv5wvnEdU/zPZtYur5crrxcjBp71lAN2FPFXmfpieiwjHhyHvSVmRM9p8hQ==
X-Received: by 2002:a17:907:8687:b0:a86:ac91:a571 with SMTP id a640c23a62f3a-a89a38221cbmr1169012566b.56.1725443929635;
        Wed, 04 Sep 2024 02:58:49 -0700 (PDT)
Received: from lion.caleb.rex.connolly.tech ([2a02:8109:aa0d:be00::a253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d5d03sm803171666b.143.2024.09.04.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:58:49 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH] ath11k: allow missing memory-regions
Date: Wed,  4 Sep 2024 11:57:41 +0200
Message-ID: <20240904095815.1572186-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_025851_835218_09CCFF1D 
X-CRM114-Status: GOOD (  13.70  )
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

On SC7280 platforms which are running with TrustZone, it is not
necessary to manually map the memory regions used by the wifi hardware.
However, ath11k will currently fail to load unless both memory regions
are specified.

This breaks wifi on the rb3gen2 which only specifies the firmware memory
region and does not use the CE region.

Adjust the order of operations in ath11k_ahb_fw_resources_init() to
check for the wifi-firmware subnode before attempting to parse the
memory regions.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 634d385fd9ad..e24f8da565db 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -999,20 +999,20 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
 	 */
 	if (!ab->hw_params.fixed_fw_mem)
 		return 0;
 
-	ret = ath11k_ahb_setup_msa_resources(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to setup msa resources\n");
-		return ret;
-	}
-
 	node = of_get_child_by_name(host_dev->of_node, "wifi-firmware");
 	if (!node) {
 		ab_ahb->fw.use_tz = true;
 		return 0;
 	}
 
+	ret = ath11k_ahb_setup_msa_resources(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to setup msa resources\n");
+		return ret;
+	}
+
 	info.fwnode = &node->fwnode;
 	info.parent = host_dev;
 	info.name = node->name;
 	info.dma_mask = DMA_BIT_MASK(32);
-- 
2.46.0


