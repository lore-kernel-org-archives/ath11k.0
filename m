Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C4C25B7C
	for <ath11k@archiver.kernel.org>; Tue, 28 May 2024 19:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcKhaZF/3m76T8k+V6gAZs7oJGtFN6fcRMmIkblBf4U=; b=jsbE+HjRtz1aKsWTeRuFhPscjx
	p7xY8nPpzTnnaNGa3Dk87WgX3dUx6xN+xxWMtR89H1+VjMsYBQjcKXyd/rskQBZVeE9FwLcKZt8D/
	0MegZO/rM0n1hf+Fo/Cwo+g2ign7+6XdU+Nzx8P8ULnJUKkkdUVqtm5ewWIiqvEE3LVbQEIf4ifVn
	uN47HgYxIZjtMg6XxfBIVmsM9LOO5M58nFSCn+aXkYfnuKtEuBSHabWK50Bm9KB6jnrXo7af8q8/F
	3vYGHMp4NJleJZ/FbQk+3DyG0V7/7wFycpGPq6cfgREECJextThLDTO5HvfVjp0o8NRXmkOR47OjO
	HGuwsZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27A-00000001jnk-3fva;
	Tue, 28 May 2024 19:04:04 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC270-00000001jdD-1q0c
	for ath11k@lists.infradead.org;
	Tue, 28 May 2024 19:03:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42120fc8d1dso6941665e9.2
        for <ath11k@lists.infradead.org>; Tue, 28 May 2024 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923031; x=1717527831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcKhaZF/3m76T8k+V6gAZs7oJGtFN6fcRMmIkblBf4U=;
        b=0fP/iBduf7JJHQy0M1P3LTWtKJn3eI2yCArVgvOjByklEef1cpFjLufPwJfddglLUK
         NRrFsmYquNWOnNXyJobymnSDwVDMZeqb0+Wz0vPDGLYTbUJ3OQofM12aFClz/V+pPXEF
         jelubA+cvDjMWB8X+uj+H/hzCPvZEcIlCqJvY6lVVmzBkwEhZL8ICHfwN5OgYBcVsJzH
         uy7LnsYmqcPQYJN7aSMHr/kHHkHAVQdWMABeH9eFJma+Y5Ch9joI3qCSDe4tnMtCL/ES
         5EkaE0BFQhMCsx0gpZWzmwBlvjokzk/4scHO/HCEKRwKBEfuw/bb55GHL5RM3ctQ+G02
         AZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923031; x=1717527831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcKhaZF/3m76T8k+V6gAZs7oJGtFN6fcRMmIkblBf4U=;
        b=ABVWVCMPK0Njt+4gsXHqcXHSG8+7N3ypvl4N8dMr26nUEO5VGGy8lR4ofHmRSXKdZq
         fNQ0GEwzIii7kd2yZhT53KF+8Ix/PyU+UyGKfMQRBApcIgjUcBv2cL6Nl+aXeqJBp+PH
         2azYKnbXgvJpkOrYGaXsjB6YecLsxymFCujWVqkFoPHLL+1Ogq/02rG6PKwGrT1ETzTR
         fc6eX9J4UlJuuYbnJd52X0s5BZdIunVDaZN6owhtxAsksVlMO8D7u33+aRE1D8mmKlCv
         Hy29ZjiO6l/3mHs2MINwJeKZaZs53jf3wirgdMAjvVDgHQbxoTFIrWBYmLdhwBsaBHWq
         SfTA==
X-Forwarded-Encrypted: i=1; AJvYcCWlfP94eY6Vbs/n/AITvw4/yZYBCjpbVf9LV/cRVTAja9mMkEpc2VixAzlAejZrPsb7JSKuCqneM79zHHP6SB5EBptdy5B6ecLhcg==
X-Gm-Message-State: AOJu0YzgqAwPOs73aJtE2X96ukbeJlan4kNSy5hcWthloI4d2LR7X1km
	pCAlQrVMBCnxkA4SVIiYHc2m476jOkQKcLo4LDBpBkoexrw+1lScuZwv6adNSrE=
X-Google-Smtp-Source: AGHT+IF/dKVBXTZg7FRNE2nApY7BnYC/zWCFxSOBmiuzEJpp4OoVNhdMhJz26eWOi6yugTJBEg9vIQ==
X-Received: by 2002:a05:600c:1381:b0:41f:b0e7:f299 with SMTP id 5b1f17b1804b1-42108a59292mr87164795e9.9.1716923031568;
        Tue, 28 May 2024 12:03:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:03:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:11 +0200
Subject: [PATCH v8 03/17] dt-bindings: net: bluetooth: qualcomm: describe
 regulators for QCA6390
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-3-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hux33j/WCCoK4y0/gy30fq+au9a8XJPG6iF4mQD3wuY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqMAIW27hbwtUHKtDlPKtGzwQfx8XB4FdKGP
 UwHo+RxVieJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjAAKCRARpy6gFHHX
 cqJ6EACvM49sa2TtM8BCIBqDJ8xsKyv9TAVs0UGYuVEvXoITLzjg3SFZmBLQipM4vrsnINwSrp0
 ggtbDdNjk/cV5MtOkioi25AkPss61r6G8TLGZbbweugEKxzAkgzuqIOUF46FKVjcuIDh9/WDZNg
 f9SzmUHw0TtIxRR+Yigj/atgNMCxESXAUegJ/IIcIWwGR4tUBE5bPbH9epEblv400NMIFqf/X4Q
 oR+X7Gg9Hf0cWY00tODNlEckxN/9DRl0EsA3ZNPFjBmkedks65/F48uX3nfAj3HpSiZ0RDm2cKm
 sXLxqXP4b61rPKTcf9SQ5eqEP1bOWY0jJOEoIc6y/SjH+o0Btx9pKO8cCvL69Eapx7Fzs9D8Pr+
 NdLfzvmslXYNfc8PGPFXGDs/Pb8qcBjr2p6nqL/wRSAEyRaS2MPjmZ6sTtMTlAl8iQXW9yHUcTz
 fnRWy4apTTWT9HFN8K5B0Lrpi41cNiXWFYWDtU4SEV0uRsOw3ydCA3rd1ernAkCRVWHjaCqTO8s
 jwSUpAKYUVSnvNrcAAsyLN2EtxpfdOXBDLejdFtuiVZYow1zb+wGnLGV3vbbUfTy4FSfkY/pfcC
 qCnjp9eTFegybj3kI/PfnfBTRgUnC0dgsYw9aF0W9bcxZhVGyAGQONdqntO90LRZa40f4yhwpEK
 50NWrd07iIfsQkg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120354_575546_0ED6C4CA 
X-CRM114-Status: UNSURE (   8.04  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

QCA6390 has a compatible listed in the bindings but is missing the
regulators description. Add the missing supply property and list the
required ones in the allOf section.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 055a3351880b..48ac9f10ef05 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -62,6 +62,9 @@ properties:
   vdddig-supply:
     description: VDD_DIG supply regulator handle
 
+  vddbtcmx-supply:
+    description: VDD_BT_CMX supply regulator handle
+
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
 
@@ -184,6 +187,20 @@ allOf:
         - vddrfa0p8-supply
         - vddrfa1p2-supply
         - vddrfa1p9-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qca6390-bt
+    then:
+      required:
+        - vddrfacmn-supply
+        - vddaon-supply
+        - vddbtcmx-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p7-supply
 
 examples:
   - |

-- 
2.43.0


