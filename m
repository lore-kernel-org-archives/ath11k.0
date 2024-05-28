Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C78C25B78
	for <ath11k@archiver.kernel.org>; Tue, 28 May 2024 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huLiadmUz+IKovUjcSJbnzDkoK16xIfjWSoucG+1C78=; b=WPfwcjoQY36BD2BnKb1HWHbTRU
	H9oNRcGnW7HS539v3G/KXXHykHK38cfzgPHi6ohD5jOTYMguwIQMuMrJHsivnfaO94VWwq1mFw4O6
	env6vVV0ShlJ0Qy0NdJJpQG7eHI2zvoXkw93rA3QzuCRI3904gvrfSa8+afljre7vpAtlq9lXV3xB
	OA6bpuNyYS19EFu4IbCA2CB7ahhYmuA2WnIj7C5ppIcotSaONWBDL6fGvpnwGulWC2posUB63m0eY
	DH94KfjlUpMLXF1glhlAhYOnK/Ln38yUboWYRPM8LXv+AOLqXYR8TwNE+r5k4/2K+EJGmqYympYbU
	GUcXFsrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27H-00000001jtZ-2E8M;
	Tue, 28 May 2024 19:04:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC272-00000001jeY-1M8T
	for ath11k@lists.infradead.org;
	Tue, 28 May 2024 19:03:57 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5295a66e775so1547741e87.0
        for <ath11k@lists.infradead.org>; Tue, 28 May 2024 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923033; x=1717527833; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huLiadmUz+IKovUjcSJbnzDkoK16xIfjWSoucG+1C78=;
        b=U7FhH9N+eWoaWFa+trylRdSoovnf2cqPuD3BdU46HSho30xsHy2/UFJcg/igOueiHY
         1mK8cO47t5HW9BgdEnMVHNVItR0dR7YYCAodR0SNsu1xlhtwYuG7eAFpNXXZD7CDz3+K
         m6bD0xhA7Uj06YkpBdhADa9owqH1BU849w+lWtGQ3WUalu8TJ7Z6ZYMzCyKbZ9mHQWnD
         aKpRF9G995STrwB/gZWd+w1Gx3bwknzaNx2WxPNxJPazMeaGGuA1/SxmSmgIjLPMEFa/
         kPOQIBlxXl35DgujmqotyJMx+b1poq1OSALyG0hufjSjr2AyPb6TpcCmwmtQ6tKGgrq+
         Vn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923033; x=1717527833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huLiadmUz+IKovUjcSJbnzDkoK16xIfjWSoucG+1C78=;
        b=nqXwX3yfsF6Vx34zO8MjHW89EGvi0B5mppSHlnEiPopTjMuwctIEeiQiv4LUKShhrl
         qfw3yOiE2TsBvLGicWmeh/tA2/PJe3arriqL7PH3R9IbCmCy5bJ4KQ3Jsol83jGPa55m
         mBECxqEhFKvO+9pVqtf0v6HwYZ5cf+MJplBMvr2jQePFRPpiEyfIQIFPGHCV7z0RNvwa
         qCTTaK9SCDK1aVmZTtw7l4+VC3MhWjN9L5sMOSdQdRI7d+bGRbMR93TJmm1Xi/OTFFY+
         gqMJGp4BDkOh/N5BJ8XeGU3MEuWSEgKymj1a3uSy381zq6MYBnNUrdSIX67Veytj1WIs
         OWDg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9CU6Ge75JrV5U6dcg926r0LY4VpxBjgRShIuSl9jBMwbtjQ7xyTxv+ubGoJAAJvRNSSy+O4towFDz68kT9j4wve8+9KwyDUswA==
X-Gm-Message-State: AOJu0YybqS1wa97Df8nGbKMTB5oPUBmxjA27U4WGKG9OUgXkD85gNYMP
	BYhlqs0hToAQjQMBS5qIsb4WFZTo2685qGx7hgXYA5seg4ncxF3mRFWUCuiE+NY=
X-Google-Smtp-Source: AGHT+IGFGGk0GMudsEze7kMtpyQJ8IBvfOB3ee+pM19AIHFnbjGqUee/tlRtalt4CsxR0dQKz7CsVA==
X-Received: by 2002:a19:f017:0:b0:51b:4df3:540e with SMTP id 2adb3069b0e04-52967465414mr10858521e87.65.1716923032974;
        Tue, 28 May 2024 12:03:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:03:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:12 +0200
Subject: [PATCH v8 04/17] dt-bindings: net: wireless: qcom,ath11k: describe
 the ath11k on QCA6390
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-4-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pd2tdTUrKzxnMcTe6bYRN1TYgIvngJc2eLHs9UA91ec=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqN+kfChui5js4evaxmA30HWm4lKFUb+3rJ2
 Yb+lm7qdqeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjQAKCRARpy6gFHHX
 cuhRD/4laLPrXaMS8hVWtDgWhYJYFOorDw9gabUO1iP0fRSOx7T+NRx7JAG8R0dmDflPmpm9lCz
 nYYQtKqqc4GHl1szH5GAemRFwnZhPLkn34Y8dNBt/puruKuDEAgVFnQhsugClW9kytmY9xut0aF
 nSbanQgQjgLSlumQr/lVE+xi36pVpg7h3p9cNbUMyIbOxHb8AWptNw1jzp6E2DUJ6s2Sh3CNUWC
 gwE2YEppiAUcHNdfPv8HJNciTJr2Rpw3F91K/ZqwzPKi/TB4N7aTwjYizPoK/R9owVtBq6cfl3G
 JplasZ3EhcP6sKcxBBxsYs2VYbPeue4f6/oYHBBa2QtgUkkqEBRJ8x2iuZwS7/nRIPj/EZ8l0ob
 Vgl7spB52PHoGQOqjq9hjOSz9Z/D62D62pJgBPFMbwVdBrBdpDq9jryH9JI9PX8t7uBu7nxyyiy
 CC1q99TenfPStNBerx70x3TW4vnd6LYewxyPukvGVGk7FPqlyqsTyoP9a5g5r5dULN3kuZZWZ4m
 LckKHfbaBj9e+YO1DsF0MSF8DiKjQt2kQTuSx8sryZO0W816+/8ul6v8IyR+Kd7TpXhi4uFhzzZ
 /CQrRYrYMMwSdL3R9u1l9zJV5qh5d4AzfkSpnG8UIHgPWmjiMpkPd5kElyqWK/fi9/F1crbZERS
 YtG7I7WjbIuzAXA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120356_561060_4C87041A 
X-CRM114-Status: UNSURE (   9.69  )
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

Add a PCI compatible for the ATH11K module on QCA6390 and describe the
power inputs from the PMU that it consumes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../bindings/net/wireless/qcom,ath11k-pci.yaml     | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 41d023797d7d..8675d7d0215c 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - pci17cb,1101  # QCA6390
       - pci17cb,1103  # WCN6855
 
   reg:
@@ -28,10 +29,55 @@ properties:
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
+  vddrfacmn-supply:
+    description: VDD_RFA_CMN supply regulator handle
+
+  vddaon-supply:
+    description: VDD_AON supply regulator handle
+
+  vddwlcx-supply:
+    description: VDD_WL_CX supply regulator handle
+
+  vddwlmx-supply:
+    description: VDD_WL_MX supply regulator handle
+
+  vddrfa0p8-supply:
+    description: VDD_RFA_0P8 supply regulator handle
+
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
+  vddrfa1p7-supply:
+    description: VDD_RFA_1P7 supply regulator handle
+
+  vddpcie0p9-supply:
+    description: VDD_PCIE_0P9 supply regulator handle
+
+  vddpcie1p8-supply:
+    description: VDD_PCIE_1P8 supply regulator handle
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: pci17cb,1101
+    then:
+      required:
+        - vddrfacmn-supply
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p7-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
+
 additionalProperties: false
 
 examples:

-- 
2.43.0


