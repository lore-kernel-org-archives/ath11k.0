Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A264C531D0
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s0XKAIuEGEIxxI3CPghYnt+GMKDGWSIvJZSgiwQRsPY=; b=TDZMdJ98fJYkYp/YRKgqx2JAg6
	i1Ul3p/8BWb+xONHjSXA+N0SY5gtuuraTEuNfzYGPFGKjZMClNK7zsXLl5ACMh3FApdOKCc9P0iMR
	bTZSMX0UiqL/j/ppYYeL1xaFPQM9M0ZYAm/fcuYTLn01KaWe66cXE1fK09AsnK6FBgDQ7obQcDhms
	tiy5sYAugLFyDH3obsAUxRBSMdlIjWrcHNh4hapmrWfZpgB68TMK4i18SMnssOgGABp6auIYkRNq7
	zU5egKo1eHBD1VR2KXbzQyfYw5h/9bkq8VtxQNVsq3JQDw6hLQmagWTwXQhLkFBcMAQCXnWx3diJf
	nca9c3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIzp-00000002X5f-1aXr;
	Mon, 27 Jul 2026 10:55:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIzl-00000002X5J-3MLk
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 10:55:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84867f07d63so3070697b3a.2
        for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785149740; x=1785754540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0XKAIuEGEIxxI3CPghYnt+GMKDGWSIvJZSgiwQRsPY=;
        b=cje0+j+2BbupH+How1V+BmAVbncYMIFqa3WXjWygLjE7YISCifqiIwM88aNyFOarui
         7YjM24xYrTEQq0HhcVgpFpcrHn4Npag8X68xXpu7heVQl3MOqSsg9K2QpilvD/i2rTkR
         7JFLkGtlx/eMF/EtvCwJVNdm8DOFPSAa3CZMSJD//nqC8hCramKOp9KhvMcB03VkbxpW
         GSgCuLWDDj+iG+Q3PyQeHc1V9zP0ISc1gWnu/+V4Oztw9j98iYcbAKHe2nl4awFvsyrQ
         wXezT5xGD0bSDvlmRZh+XfD9iyv2JHmNZSVqTHf1V1Ul7mzCzaw5a+6yowQJx+y2FN1d
         IPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149740; x=1785754540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0XKAIuEGEIxxI3CPghYnt+GMKDGWSIvJZSgiwQRsPY=;
        b=FHm/sNEpKweKTxMVDT2Q84QnRVH+p3lTzGu+nCPKgVi+DnxuHn9gAOX600Gu9PcdMt
         pB74aKi4KAgCkCNAM/heTNNc6HQShK3RZeG5T8SqQPOWwET4zFw/ryTxhnqlOAZsRMf5
         KWAtpHeH834xasGd3lth+4j79wws9oEUnVXR0efgEaF4Kljyipsmbbym2gbeE0geRjoq
         iEABzi0A1UeQiKGY9G/l0xsDTJJILUASyOoqixcSUTzX9ue4D/kXWdf49wQhHTQ6jgtu
         7UpJwY9oSKahSu2+WfK5Pl8gP68LNgMno/BgjKyD8M8mquVzyRh8/IbW5U2xk/oDqKup
         SXlA==
X-Forwarded-Encrypted: i=1; AHgh+RpzLTmFPEFTIL5mgCsEUDVE7GCIT3+hQOfimw7137f0af3bmE6O4XHcxmPZ9oNrpmMM/zedP7k=@lists.infradead.org
X-Gm-Message-State: AOJu0YznAa4ImNuxEhO75xWPkmL1mhkNmcgDzKoNG0FhcXqzk1ERrCfd
	kkLeVgNTS3r3Iap+2e+aZznEtt3nBde5Ixvgi77wuamfiA3CJouvbMdAU2CUVfly9OY=
X-Gm-Gg: AR+sD12xYdmuKOGeKLs6376nIwvK/5yoYzm+FgG3Wj5sBTyqFs4P2+SyqCdEGcMl1mF
	UhSe75RYtEP4EFrNA//1nsBNBxl0TMSf27kGElTvAgJR7uoMfAAeZeYaJ4Lw5HZSDdAB9OcHSrr
	Ja2v92xQGCNM9pW8d1e/+OwHZH7buY7E0Q9EgxTTAgwU9jeh+W8STnSlmpWAEkrHcx8cfee8ken
	WEm8O4/oUvSeUf5hGfLcxk27diIdUK7EcoHoTnnWPrcpsooj8rID0e5TF+9AlyWbauDJGJBS7gu
	33fP/juDbHE0KaDlAEv4wELXdsv0AdwPyrJe35f1CAld+j5Ne7RUJc9/uVYWucyqRuVxfZy7z3D
	Pz0Gx/DWQGTLgJ22zwjUGlsaak38T26wYE193YhOAExAYlwL8NQbQX0+Qzs3A4fOvzbd4DwAg1Y
	dsH11i65Jq718l0WUpHKVBwvIUu62MrVkBrFsWYWpC2jyvGavvMdODLZH1BP5AA9kZ/x1gwIRq2
	9AZJBkcDjRJqhZ3ro8Dn5Okg3e9e6QT
X-Received: by 2002:a05:6a21:a45:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3c67dae40f1mr8265553637.3.1785149740172;
        Mon, 27 Jul 2026 03:55:40 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm85269877c88.15.2026.07.27.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:55:39 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: jjohnson@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
Date: Mon, 27 Jul 2026 16:25:31 +0530
Message-ID: <20260727105532.118164-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_035542_007859_EE4C2575 
X-CRM114-Status: UNSURE (   8.95  )
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

In ath11k_dp_srng_setup(), the memory allocated for
ring->vaddr_unaligned is not freed when ath11k_hal_srng_setup() fails.
Fix that by calling ath11k_dp_srng_cleanup() in that error path.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/net/wireless/ath/ath11k/dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f389b97acbdd..c3a16da1cba7 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -324,6 +324,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 
 	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
 	if (ret < 0) {
+		ath11k_dp_srng_cleanup(ab, ring);
 		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
 			    ret, ring_num);
 		return ret;
-- 
2.43.0


