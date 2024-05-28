Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3D3C27C50
	for <ath11k@archiver.kernel.org>; Tue, 28 May 2024 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLB0YN7N63SKOKotZw1GpntJgaecWBJiaVtpBcrO/S0=; b=Hyyv1FOdICWP/Au5vlUWFArvlY
	iUDYfVwALACYDjWKh4Mf4OyI5+HW1bOLOz9/hAgR34/U7exmoRoqIrU1vcAQtXUO9p1eyzA7AmxLB
	v4SlpBd2KWqZ/Wfp+bcWJzlp8Nx1T26Lqf8uYSgXwVVdL1KKQdxbYdsoHdEU12dYJqpzzT9pHmlyc
	PdCd8IXluTYAHLdr6u2ps9fFzF1dHbbU6jvJ7JX/B6phyx9zUUS5ib5CKhoXtTkcskyjZAq7d82LW
	J/rBnUrKlkCxLmfZhBSSL1yuGsoV0LhWEivfqelOrkKCI6oIhzMBd5XyxFK6WUKTO/pj11YGa4mQx
	6YKIn9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC279-00000001jmN-2CZL;
	Tue, 28 May 2024 19:04:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC26z-00000001jcH-0xJ6
	for ath11k@lists.infradead.org;
	Tue, 28 May 2024 19:03:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42108856c33so625585e9.1
        for <ath11k@lists.infradead.org>; Tue, 28 May 2024 12:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923030; x=1717527830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLB0YN7N63SKOKotZw1GpntJgaecWBJiaVtpBcrO/S0=;
        b=LJSgyyseQPwfuqmuo3tVopS5hRMyZd7E4Gxp4Fn6YStktO+/5okxj5tgH0myOd//ev
         k1n61vdvRcTWI5Xhs66BtoZOZEkiY2+s98Rj7ZjtZUYSEMU9wsHachmZU7droBW5K7Hz
         WZ8zHw+SgZQSc3oVTLw3IwHTVzZJlYQdvEbnTeUyyarVUUyHsH4sOIgQ8oUy4RJoBU2Z
         NXXRVjSDLSNL10gw14NW+O2WkF/5J9xaP8x3iO8ft3taSZWrc+w5UAQkL73P8nxJ2UEe
         Kds2uwwypND8+M++8U7mtWCODKqDV4ng/IlY5wz2NKEw+AgV4VdZZP2ySEl42y9v2GqU
         +M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923030; x=1717527830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLB0YN7N63SKOKotZw1GpntJgaecWBJiaVtpBcrO/S0=;
        b=VDlyw29T3Sl34xg+o+ctXPwJNxJxpXY79UlalhJyYNpMW9KevgO2t1THmsGgYKq7J0
         Si7nLbIHu086oBzg1j/z0zVw8eiBHwvGSXvb5VgV+T+JBRHYh2/UVf5rVx3q/OC3CniL
         PAPM/ZbruoSZpQx5fye8FxoTNoYVVzeWa+CCGOE3/LKbxPLggbNAz4KXqfTXmZlxPvVg
         5HTbgWHLAfZ7OiV/B9u4JLw9vRFfN5TSEfV8s83LcAb/+/iowHAIMMAdVbwEZxQEt+uA
         WNTSbmx8KamD0UfLiLUmMUYbRazpsY1tFW0laggcmB8jYMwke00ktZipPXdy1TA8tE8i
         akvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJmrACWSaw93VcEE2nA+zSWeaGDMTZzBHsUDAWEkgejFLA580FhdNA+Syzfh7crTgfKZJP5vBEmuna7rD5Sf0dIr7sRyUjeB3K+g==
X-Gm-Message-State: AOJu0YwCy9sxQxUhmZD4oPtZS7NrHvosNFQXixhlQWmDQLHOzu8BKred
	usHH7ZZ5oSRWz8BE3HDHYWuAD766PxYSe7JpMDBrEI8JHRABGPLTTPp3oSkPQbc=
X-Google-Smtp-Source: AGHT+IGkTRJM5BqJwxMkgY3NJwBdsKQTISnjb7z3O7SzLivMCfj6/1CLTbKr3BOipAl3zMJM/jdDxQ==
X-Received: by 2002:a05:6000:180a:b0:354:df9a:f99a with SMTP id ffacd0b85a97d-354f750f95fmr12748159f8f.11.1716923030222;
        Tue, 28 May 2024 12:03:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:03:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:10 +0200
Subject: [PATCH v8 02/17] regulator: dt-bindings: describe the PMU module
 of the WCN7850 package
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-2-d354d52b763c@linaro.org>
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nIq2ZrI+2J8wWzUlSGNJuD+/fuNY97wIAceF1yEhqMY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqMCMh0XlDYXajqmjXXmuj8/4NW5g5yO6PrS
 V94gVmLw5GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjAAKCRARpy6gFHHX
 ckfyD/kBiPhd5RtEIWrboqOXgS0zbovWj36MTcHNi2ZlVV2hPQ+fx5L44A+Liypg3s8bKsIRZO6
 iSJxOpQUKsND1M1eV76xNp5dwEwPOFXUvgvpXfoMNVmDqfHFisBAdPAuZgQWT7L/hbDJsMAlgfa
 zL5p+YQE8cgFPjQ5g2AUOK6jxwTIN5gDrtwRWg7G7m67/jToqRPkk6wksPbbthckUZLJ1QMTjaV
 bJzeuQBa3kDX8lPqD8WZHKwWyuBaiMShy2e8MIXJ4CPIzgwWQkgJ6omxkwFpJeeAd6qjrXOlE3D
 DzjSvKpReD/tS7xfejwZwHwvS+HLUhzPMopsHkCRpznIDOVL4swvKYgaZrMnFe3IINMOnH+rhO8
 zzzU97xT5cJhs9OfC5u4JwDCHFfJ6XGAG1RK/cZo4P0pA3P9rkA89gO2WQw/1IJgVh0x/4hSyZW
 FnYn60tOGi7fe7m9CJ4q+VftA2JYfPbtbPk9GeJk8CG2OZbkbZkXeeZUpv+IKg+tihbArxm8Nl8
 e+FdfSjVNGpKxQC2aVIRhfY34/xXrId9Ggqu7Ho4PF+Ki2lRwhbT1NoBBwjE3v4alEFd8uTnoWb
 Gzr5/MEU8hfh05PMd7wOkQeigMrSinrGUCJnBhBChnPi8qIbq/URbJf0GM0YNqUIVNC2Ku5D/4a
 2xy+3VAujkLYrQA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120353_376563_3B3713CA 
X-CRM114-Status: GOOD (  10.28  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The WCN7850 package contains discreet modules for WLAN and Bluetooth. They
are powered by the Power Management Unit (PMU) that takes inputs from the
host and provides LDO outputs. Extend the bindings for QCA6390 to also
document this model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/regulator/qcom,qca6390-pmu.yaml       | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 9d39ff9a75fd..2e543661a1e2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,20 +16,37 @@ description:
 
 properties:
   compatible:
-    const: qcom,qca6390-pmu
+    enum:
+      - qcom,qca6390-pmu
+      - qcom,wcn7850-pmu
+
+  vdd-supply:
+    description: VDD supply regulator handle
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
+  vdddig-supply:
+    description: VDD_DIG supply regulator handle
+
   vddpmu-supply:
     description: VDD_PMU supply regulator handle
 
+  vddio1p2-supply:
+    description: VDD_IO_1P2 supply regulator handle
+
   vddrfa0p95-supply:
     description: VDD_RFA_0P95 supply regulator handle
 
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
   vddrfa1p3-supply:
     description: VDD_RFA_1P3 supply regulator handle
 
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
 
@@ -50,6 +67,10 @@ properties:
     maxItems: 1
     description: GPIO line enabling the ATH11K Bluetooth module supplied by the PMU
 
+  clocks:
+    maxItems: 1
+    description: Reference clock handle
+
   regulators:
     type: object
     description:
@@ -83,6 +104,19 @@ allOf:
         - vddpcie1p3-supply
         - vddpcie1p9-supply
         - vddio-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,wcn7850-pmu
+    then:
+      required:
+        - vdd-supply
+        - vddio-supply
+        - vddaon-supply
+        - vdddig-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
 
 additionalProperties: false
 

-- 
2.43.0


