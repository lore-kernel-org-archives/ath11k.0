Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1588EC3DA4A
	for <ath11k@archiver.kernel.org>; Wed, 14 Aug 2024 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yid80DCBncovH6jR5spdivR69CuAKWTUFwGxvj0edc8=; b=kWeBuGO2gn/v3N7pYfjUCFspsF
	HipD75ACY43PgigeNMi6KXQmG7CqMOzaX9hNuFVvqeoQkGuOa+GQxNgFDYbDy+Xgu5r9vresBo45+
	3cpYaPBTiYM1X0NqXMAlBZDe9ky0D+GD1q5n/nwKdH7KEv2tlChirLrierIPC1N59g/NgL0FSQ3ix
	HvXRpn2uq51GudPVElZSsaeVlAtATT9oxKwm/fO8KcHh8eRhcKGyPw2nwfgKoroiJ2nNtk023GZBh
	U1kml/X1CQ5USl1tLJCZIRWOHQ292bw+cfkexl5FeMIlwCMd8XC2X/8/UDOCpOhxT11YLdzPhK7ru
	we8Y4imQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9Hi-00000006EH0-2Ryk;
	Wed, 14 Aug 2024 08:23:10 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9Hf-00000006EGd-1jND
	for ath11k@lists.infradead.org;
	Wed, 14 Aug 2024 08:23:08 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso8672972e87.2
        for <ath11k@lists.infradead.org>; Wed, 14 Aug 2024 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723623785; x=1724228585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yid80DCBncovH6jR5spdivR69CuAKWTUFwGxvj0edc8=;
        b=ixh8ZxpZQ+214HOS7BZIXV6yrkzMvDrn4RCOHw9QaUSEBv5wWQv3Q4L3w2avMWY4W5
         kzyrBzTppW7710y8yowAbOozwXqnh/QLCbAlqLGYe6sNQF43pwbHoFktQTcz5Woirq//
         45Rq8K/zgPpPPPYNKFIGj+IuUyedy4WFFhu4XQovFDEtGYVnQTZo80Et/IrD84MecLpn
         cdZFf6nP2CmOnh1BrDtUQCitgLTwdCiIBSY3AmDJ3djhyBGoUWPexp35J9llgttVx9rB
         kBz402TZfSIL+1WM+QYhktoMKHaVQ+zcWwCDVWOb2EmmltmnyGlgsihHKeGQedy5pSWW
         e6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623785; x=1724228585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yid80DCBncovH6jR5spdivR69CuAKWTUFwGxvj0edc8=;
        b=AXtzK14asG4ORbIuvI7ESefxxpJluhM/lb0pAuoiUWeYu/hqyizxke0wG5L21TRNqq
         n2O/AmCmJP106ISnHIkWtKhn/75MTiwwIYaa2OZhWvvqGewAs/tOOW6bIBMs8KJpD5Ai
         pZPyk44Fh4e+jEDVw7gu7swCfDG21xtuwKnMF0ZNu+0pPldgJG8y0AAkesxo/cJt4lQi
         yU16YEWq4yVrV6R00URznsfeIXWffAOYAINjHDGON0ceH1sseoKIetKAyyLlBKmg7O/P
         SIgWUePHvUHbZ9N5lRxtokho4oUlwIJ1eU4HffsPrxn4F3S9o8kUSA9miJf5e9ULTYVg
         0EDA==
X-Forwarded-Encrypted: i=1; AJvYcCVWaTQ6ZxtL9dUS8/7vWL5mMXoUemswylMHw4t6KNCwEqk7tmtk1GyoeMoDIsyjxoRaWvPQXEY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/EHMdCQcIj8w1qELYDB3iv2xJAn697Zg34Z2vFjMu4ZFf2RIW
	gfJbI2JC5fc/ZQxw/Po3TyyWQ+QnSt/ODzLzbhJ/8N5aQMAzPP6wR1aVUoxD7V4=
X-Google-Smtp-Source: AGHT+IFPWXB9dUnt/qnGZpgUiPgGFQ/Gcyv7ImyYRoukKJSYr8Bd88c9u6QJYgrVy7BunlV81DHiLA==
X-Received: by 2002:a05:6512:3c89:b0:52b:c27c:ea1f with SMTP id 2adb3069b0e04-532edbcdb37mr1268165e87.55.1723623784986;
        Wed, 14 Aug 2024 01:23:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9e78:fb96:21f1:335c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3cd99sm12606325e9.25.2024.08.14.01.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:23:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs of the ath11k on WCN6855
Date: Wed, 14 Aug 2024 10:23:01 +0200
Message-ID: <20240814082301.8091-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_012307_481738_CAD36D80 
X-CRM114-Status: UNSURE (   7.47  )
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

Describe the inputs from the PMU of the ath11k module on WCN6855.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- update the example

 .../net/wireless/qcom,ath11k-pci.yaml         | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 8675d7d0215c..a71fdf05bc1e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -50,6 +50,9 @@ properties:
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
 
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
   vddpcie0p9-supply:
     description: VDD_PCIE_0P9 supply regulator handle
 
@@ -77,6 +80,22 @@ allOf:
         - vddrfa1p7-supply
         - vddpcie0p9-supply
         - vddpcie1p8-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: pci17cb,1103
+    then:
+      required:
+        - vddrfacmn-supply
+        - vddaon-supply
+        - vddwlcx-supply
+        - vddwlmx-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
+        - vddpcie0p9-supply
+        - vddpcie1p8-supply
 
 additionalProperties: false
 
@@ -99,6 +118,16 @@ examples:
                 compatible = "pci17cb,1103";
                 reg = <0x10000 0x0 0x0 0x0 0x0>;
 
+                vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+                vddaon-supply = <&vreg_pmu_aon_0p8>;
+                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+                vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+                vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+
                 qcom,ath11k-calibration-variant = "LE_X13S";
             };
         };
-- 
2.43.0


