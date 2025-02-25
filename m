Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101B4C021B8
	for <ath11k@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCfhYp/tqNoV2tEavI68DM4qQ3+PDh9QaJPfXDvyBHc=; b=i5d1HM/1IJf/4ItYGaEgMj20QU
	ekChoxAiVurWqgc5TFkO0xNzp9jGebsMEjDupgxuM/go5GWk1co7WDzkUC+TbK0M+oPWStaC0QE/j
	Bm9zd+vPjFjedYuHAseywSJXjq4A22vi9yiHuWyB1y6teeqI04EFpzognXwYY3nwyvd7eKSFYrP77
	MQrfa+TvXJzM0pedfVdrMoNx6oti/azGI53EBtqNzUMUOpNKcMxKns2JYPTD27FprHW/6gUMQrbXj
	ue4CjldcOP+r29yd35ld2u1rlBZ/kKK28uY0XDLZkJcU/g2aTPswODHZNULWoy80RtBIM4sDdkVuc
	bWnnwq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNp-0000000GcSc-35mg;
	Tue, 25 Feb 2025 09:37:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsx-0000000GVis-36JF
	for ath11k@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abb76cc6108so68073466b.0
        for <ath11k@lists.infradead.org>; Tue, 25 Feb 2025 01:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474350; x=1741079150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCfhYp/tqNoV2tEavI68DM4qQ3+PDh9QaJPfXDvyBHc=;
        b=qjwvTS6gJY1/4m3eWcyzbunrux5xV7ToBVDYFOjBcyBxGlH0O8obTpomQDN9PHZqb3
         2KRaVj507lQ0F8rJeL6Ur6RvuEsvgyDngwkw9w85qNVmsFISXxJtTw64norNxWK7gA0y
         WlNjFRntz6+w8tjtJIqTnW7jIBB7P4S87eFDkmsBJDqoX5ss2ntxDBEdXYsq+PLm7yYq
         vizus3ycMeEGZcPXTzKBdll7q0QeTKfpyU0vwYCkoUtaaHd+DW7b53vUW4nUksyDcPsB
         MfsLiKVgmAN3rb4SEVKAx/quCvNpNko+6IZjjdYdUE77UmkvrUsT4t71BSz5RfyOR9q9
         r4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474350; x=1741079150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCfhYp/tqNoV2tEavI68DM4qQ3+PDh9QaJPfXDvyBHc=;
        b=Ptsun3VHBKimCtqtHKDVy+jNqeIcYp0KzDhm6Y7ojhYFBUk9D2K3OWSsPTIQmfxK/I
         Jw1GdyHlhgCH994duXkZFBTUjlyp4VFq9xynD6sVl6YK2xkK0MzlTrM/ut/McFp5H/zr
         OkdAB2I2kPpKo2eaCJthlwcmvvBzVWib0mJL8HbFd0glp2dcaYPObT2Z89iEq0crznDT
         pPzauxI5l6b/jYupb+AxY1j9on2UBw5eTJyQehid3OfkYLvQ8duGfakdvPxRPtMsKFSc
         5SeLOqcdDJx8RNyTGbrpvP2KFd8Kn2hMURRA5IX9T14hfE35iZvOxvHndR8H3bNPq6gC
         mbXA==
X-Forwarded-Encrypted: i=1; AJvYcCVoCOOQOsT9oG6WC2AwA3Uppx0M+Et9jRQ5f0QrKZWIaB/5YRqyGMKfo5kUQt+LRAyQXHhlVMo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHGLmLlOwI1fcMbjDCT+asXQTbtjpSLaT88GGQKx136aZ4bQD8
	BRUH1dbYlRJBs1U3DNOphBgYm1fYKQEeNyhFzyMudm+5iJhevUMlKUISkKJwmCw=
X-Gm-Gg: ASbGnct7AxAEhl++HvU1J1l6STsp3ImfTMYJJSK9/mbeqev38pra6TyImXOapYAUQoZ
	biTiLIw+o86VH3fzfre9VowecTaFzH4fk1vTxocEgGTc2AQkw3U4XqzfrAO9wwZFWRsAMaG8qNK
	wUNtpNYgyYTj39DDoJJY8yW5kUxZdBkt4oG2wWAOtRKNg3xXdqp28my8Z7s6hqowqcRBRSwDmD3
	fXhF0qORoeE4xmy0/ieUKvrmLPti2aG1yuG6q1jk+pj4eukhlPTwX+Nj36DGfqJ+P6AxcpdwfUa
	fbANAFfaqIiQ8z91+Ovmymr8sPCNjAKr/lKGVVPjhGzP0U5D4+5K969QbXS6zhUH632fUr3/l96
	R
X-Google-Smtp-Source: AGHT+IHtKrgOP/DE1J4J0Y0A0ldGOKWtPV8QRy1Ye1jhGLz4Lda7FRnPOyCqYEGlT4EJBTKJOYvyIw==
X-Received: by 2002:a17:907:7f17:b0:ab7:63fa:e35a with SMTP id a640c23a62f3a-abc099e1dafmr622362066b.2.1740474350361;
        Tue, 25 Feb 2025 01:05:50 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d58sm106681566b.148.2025.02.25.01.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:05:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:05:35 +0100
Subject: [PATCH 4/5] wifi: ath10k: Deprecate
 qcom,ath10k-calibration-variant properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-b-wifi-qcom-calibration-variant-v1-4-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Dz5yNmE8eSdxa0CmdJl8w6wvj0WWXjGEMcH+7qjSCmE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvYfj60TnvUIEnv7U3Skox2u9XlT7lKh41uz9Y
 LYH4CNb/eSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72H4wAKCRDBN2bmhouD
 161WD/9+7eNP22O1Oi7cVRGHtqvvI7AoMm3h0LaGetUerCD1eAKZJHbQ3ecjiMPTc0nT7VFIOCw
 3QOup8KQRLR2Ad9a8S/wxCAj3co/NXb1sVBb6JYaGjBcDLQLADmaN4emAwavL8SWzD2vy0cL08z
 5OJ3jyibeH1W4qGX8N1BRK5gGpazHOAw6aguwdtqdGT6JTVfbhwXcNhcamzfXvOXfc6O2cKm2dw
 Jt6r36tA914fiY3AHnZX6lE5Zv5mGEleylSa6rtxiCdmUTi3S1P6kWe8kJ6VUzkB5fdbUW5IA3T
 Fp4LCa7ziayx2L0QuJz1mdw5GDW1m8moNDTt/SfGRjQ2SKZMakXPcxkYQHMuhN2WhALPm7aDV3P
 wcB6732IeIZh3ELZHGhy3by02TPGmqey/phS7bhzaoIHdyV9oUd7qAKA+OvbbHmeFdEdFqeHyWq
 CVMNPqCW0ZeF93yytlQEo/n73t951xCiKgqQhNOQ7hkmxxCE2ZXH6m1WzvfhQeBdtLCj0vJwADV
 LnhjWjTsqO7Js2AWCtoK4pUGXI4NNP+rBXvUoxwy+1ovIb8jNiLAb94xArpXOqRpAtgLq0QyIkP
 A5M79qCl+RbiGigr2q+kdL3MtVIXdTMd4+Qnl+RCeKcskpiD1/Q7XYl/nu71067RPMVs41engGh
 0P3cSdAcMOAX2zA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010551_784710_162DA69A 
X-CRM114-Status: GOOD (  10.52  )
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

Add support for calibration-like properties without 'ath10k' prefix,
while still keeping everything backwards compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index b3294287bce1f7785231d3bf0f90cb15806937b2..6d336e39d6738bbe7973a25e073d03a07b9ae733 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1163,8 +1163,11 @@ int ath10k_core_check_dt(struct ath10k *ar)
 	if (!node)
 		return -ENOENT;
 
-	of_property_read_string(node, "qcom,ath10k-calibration-variant",
+	of_property_read_string(node, "qcom,calibration-variant",
 				&variant);
+	if (!variant)
+		of_property_read_string(node, "qcom,ath10k-calibration-variant",
+					&variant);
 	if (!variant)
 		return -ENODATA;
 
@@ -2259,7 +2262,9 @@ static int ath10k_core_pre_cal_download(struct ath10k *ar)
 		   "boot did not find a pre calibration file, try DT next: %d\n",
 		   ret);
 
-	ret = ath10k_download_cal_dt(ar, "qcom,ath10k-pre-calibration-data");
+	ret = ath10k_download_cal_dt(ar, "qcom,pre-calibration-data");
+	if (ret == -ENOENT)
+		ret = ath10k_download_cal_dt(ar, "qcom,ath10k-pre-calibration-data");
 	if (ret) {
 		ath10k_dbg(ar, ATH10K_DBG_BOOT,
 			   "unable to load pre cal data from DT: %d\n", ret);
@@ -2337,7 +2342,9 @@ static int ath10k_download_cal_data(struct ath10k *ar)
 		   "boot did not find a calibration file, try DT next: %d\n",
 		   ret);
 
-	ret = ath10k_download_cal_dt(ar, "qcom,ath10k-calibration-data");
+	ret = ath10k_download_cal_dt(ar, "qcom,calibration-data");
+	if (ret == -ENOENT)
+		ret = ath10k_download_cal_dt(ar, "qcom,ath10k-calibration-data");
 	if (ret == 0) {
 		ar->cal_mode = ATH10K_CAL_MODE_DT;
 		goto done;

-- 
2.43.0


