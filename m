Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA85C41513
	for <ath11k@archiver.kernel.org>; Thu, 10 Aug 2023 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VLVKRNSQao9sdi3KBKoRTE5BpUQ2Y9xjs43akvZcOs=; b=jqk76Unu97+Ihi
	biumC+nuxjY1o3m8OliZ08aQzfV20lIQ6RzuNFlmrunyyKujf0sb7vF6jVBBOx6iJ+T+3MIK8uEfA
	pbsZAiYwPPXrfT0lEYbIS/BKZ1lccUMwt9ZStSMxzP8irq5FahnAqYTA8N3KRyujTMcqdq60BXSd6
	OggeI7BPsQXdZeoKjkfTyVIJUPc5jkBdpdP7j07KdOvzpCJ+EPjhlUrpDiao9MyV7sraDeRYmY0YF
	gShbHB0w+lZ0umOAAHPZXLSuEb4qMhCMiqdM5DgnnArFPl/g1jXviicnibzpjKgpZR6mEROGPpKb/
	Bthse6D3B3R82CKYFm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ic-006wkI-28;
	Thu, 10 Aug 2023 09:12:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU1ia-006wj5-0Q
	for ath11k@lists.infradead.org;
	Thu, 10 Aug 2023 09:12:33 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe3678010eso992611e87.3
        for <ath11k@lists.infradead.org>; Thu, 10 Aug 2023 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691658747; x=1692263547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Htd/z2F7UUScMygTNeT7Itp1hTM2TNM8XLM8S0EeMbk=;
        b=yfSdVESMRpRIqdOLo9ElSeY5VhUcLrAhe9vvR74OF27QX7tn8JvLFYN4qIXSQ6LrKN
         zp+rtZscwMT2u+cliOkOlI1ijhyLrQGZrXZoH0eK4YjoUBqzb4kx2Y5xvHKJHHOhBOSF
         ddS9gdY/ynd4QmvcGEidd6g4tBy0SeQn/MveMwxc6E3OiP9b9FqGGsc8xojcC+70Iyeh
         8jsbbsFVH50wP/LCTkQK6IKVj6KjYqj4c52N/xVsV/5vgAJz74xTZmP4FzoA3SXDKxUi
         jB4hLTNv7+RzEyai3VX/XuaexBUx56HlEoacEgR9I56wKQVGZ7lI67JVKAZI8TO7lmVn
         5wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658747; x=1692263547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Htd/z2F7UUScMygTNeT7Itp1hTM2TNM8XLM8S0EeMbk=;
        b=k0DjtCfOpjICv7WZ+5ZhuFhPngdCKCiqEACYJtfnd9EVhGqbhH+KNoYL4HFRDJFzxq
         DOwuMR6e1nxuTRBQ0Mhpv3sibNJw0K7cdJ17SIJk+/2G9Iyb/8Fyp5MLFNPm9Wwdo+yN
         Yy/lwfWVpYd6rhjU4/wnQVFSx7mteHftzpaT1PCK4ErBL4eXiHwdqcVCrlRfLyTxgLkW
         hrwouhJjgj7mJxq4/YIIdpKsUvPtPW6xtY29Hwkpq0yG+Wt2sA/zIPWHVi0+KlpQ+zIk
         OnBGXVV6N8oznhWdyhyUdyx1vVDyAj03LcADAxlYZ/NeamNSRS0KZ3WOdV6jn8ysB5Kj
         DsOg==
X-Gm-Message-State: AOJu0YwKbaQyLUxpVEV7U55G+aet8q3VOKfuR/FakeM6QHBiLNn4OaWG
	KPIdrhDpm1zlWSRH4heKTHxt4cSbn8QrEyFaoCiTAg==
X-Google-Smtp-Source: AGHT+IE6Iks4Spr/j3fclN0BH0yxXPY85IWHUb1d17wuwqtArGFuIGsqA+mNTYIL5i+q7A7/N7gOfQ==
X-Received: by 2002:a19:7111:0:b0:4fb:cff5:3963 with SMTP id m17-20020a197111000000b004fbcff53963mr1104029lfc.60.1691658747473;
        Thu, 10 Aug 2023 02:12:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id f14-20020a50ee8e000000b0051ded17b30bsm531961edr.40.2023.08.10.02.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:12:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH net-next 1/2] wifi: ath11k: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 11:12:23 +0200
Message-Id: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_021232_220559_6BEE0E0D 
X-CRM114-Status: UNSURE (   9.87  )
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

'hw_rev' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  h11k/ahb.c:1124:11: error: cast to smaller integer type 'enum ath11k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 139da578831a..ada4d68c7421 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1121,7 +1121,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hw_rev = (enum ath11k_hw_rev)of_id->data;
+	hw_rev = (uintptr_t)of_id->data;
 
 	switch (hw_rev) {
 	case ATH11K_HW_IPQ8074:
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
