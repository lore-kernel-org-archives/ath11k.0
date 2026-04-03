Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86878E8536E
	for <ath11k@archiver.kernel.org>; Fri,  3 Apr 2026 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=; b=yd5bfYFUUGN0un
	meRV+5XdU5eQF4HHzpPsoVnovnSZ2D+mQZhpPo2v5rsu65FcC60p6NICBxITHd/ldQBQAcx/PqFer
	2+RBWNRo4M4+F07Pqby4BOhlw4DbLSi8yAseFOrbFEJpYETsXUK3D9d0HWH2TIo7+iU9hpOHHTYeR
	FddJpnzMkqcnaVbXLS5lASZJky4ZV7MYQTZxd71fFD8PfYamBQYNFtvhc8fR0uxokgjwyrJuJBp8N
	XU2reBB5XdTzU5MteAwaNdEkFJLK3haOCZebLvx+H4oyOrBJjK5do88/SsYNCjsKX/sTxIOpt9xhH
	kRQHsroprYYIIdTqj5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezX-000000026Ki-1Vwi;
	Fri, 03 Apr 2026 13:55:19 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ezU-000000026JL-0wGe
	for ath11k@lists.infradead.org;
	Fri, 03 Apr 2026 13:55:17 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b8d7f22d405so283979566b.0
        for <ath11k@lists.infradead.org>; Fri, 03 Apr 2026 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224513; x=1775829313; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=;
        b=y4TRuAUY0ZNl1Hr3iNeEYvAKiwYdyyL1pJjF2wDhkRidHMNCWpK6WrteISvy/JM/oW
         AFHouKTIzvOq4S97DW9a9plVitdapbfIh7BRaU3ZAZvbeeGrC+yDOytL83rg+AFS4lD4
         yOO+P1MvviOpbzm+tLzX/dHedYuBOkGot29Pb6lCZQ9Zbtp/0yZ+gNd/V+nG0fRY4zFW
         2MKXLZvIasKwcU6kCe9cWCgfbh45s1vAp5XcSYbnh81lJ4JiT3n1iT1PVwzIZGvqXxHx
         n5BXH8lz17DFKLqO8t07ktMwLAJQhdzJ2N0LkJh5i3OJG/iWpKV6CWKDJd0u+9IDhI09
         wGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224513; x=1775829313;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr3vVgaHqynfRwr0nQihQQVF1MqwcT9adBqdvMVF6WQ=;
        b=AyoD5GAo3Wnx44eaavc4Zve1jedZ5PWGYz8BMOe79gcj4UWcgxzsVqQiO2Loo4IiSO
         oRv0Twa7fZ1Yc1FGO7T76gAKjDGQPLc8vkSxRVfxc2plyaL8sUyPJadlDZXTq2KkKVDj
         ysigNeM+L0XFHvyOz1GrdCah9CE6BTw5vG7TDXppTmQ4rg3yZw4jwGZGv4R0rDv4yGeu
         7iHT/kqcQHB1At7noHO+v2Pho5KVuClJM5wQIAyUvrqvDIsgI2pFgsChf5P7STj00yL7
         kp5J3z4fDIu8luo/ePY3JMWybenOFBu74VKC/F0db+6i3sTC/mbFcKVMOiZnGrSYNylU
         qlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDgv6WUq/0xBTvk0VJeybditKeEtxHVmVxU2TtVlNxRj8B2SF4XrGGeS17eu5JKiX94bUsR/g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz50gwoUjTg2ObFDKAnK73UL2zIEvp8Efra5sInej591QDTa3aD
	853v1Y9rKRafo5/VkU5mMndOahKDslWWl29ExPJmuQxMLD0v/FEPwebpvZqFJcM2yQs=
X-Gm-Gg: ATEYQzw3urXIBGEh5CYpsEEwjNbfqFlcm6Lp91UmZCreQt3DrgvOKBYepawyUrLw/a4
	4K/7PzMPWyt/EBk/SLV7T/wbLnfk7215Nwj0y9CKBtaDyfGBkXtQ5jArHILNxxrHfqq17jBq8Qc
	vYwaJbx3PQ9zuc/LhShKbLJuNbMYjj4qex4TR4MLiNrKLDambbRPchjOx2l2s512x4jP02h8+Jf
	H4/6S7Cro0qTzJHWsblc0aVA56PL7qsW4dRweWNLqR0zOf7Rc6KOUTBWOMh6Z7EDOzx7nkGMBE+
	DwmiPtGv7x+A3yCIOAmZzmFflX9NzNdvoTKUf2k02X8gOymDGpHwBUJA47rsWQS0t6K50POR3Ks
	5gLzlv2cbl6AdX3wz28SpX+nkEUkSnUK6wTqCsoioHrLDc+g+65iIm35zYTshjLVUQsQlCt5CtN
	b3THLfhZZxQS7yChEg+su8pIPOJEUK21KocD1ONNLZu5C+9zuplw9vidOkZ74AOiCTGMSGA/A0L
	2QO+/mr0gWNozzIa+uXZchTfM+R89gJjP0MyQ==
X-Received: by 2002:a17:906:478e:b0:b9c:69df:4d8e with SMTP id a640c23a62f3a-b9c69df5f1amr156882866b.25.1775224513349;
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone (Gen. 6)
Date: Fri, 03 Apr 2026 15:52:46 +0200
Message-Id: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBBFr0Jm7RjaIFVX3sOwaOtUJhGKbUUM4
 e5W2Lt8k7z3Z4ZIgSnCuZgh0MiRfZ9B7gqwre7vhHzLDLKUdSlEjR0/fEQ31GgSvtkxSum0VkY
 c6Gghe0Mgx9PavDYbB3q+cjptRzA6ElrfdZzORU9TwjVflRJ+Qssx+fBZfxrFavyZHwWWKJWpn
 DFK0clenOYwtL6nfd6AZlmWL7EDcifnAAAA
X-Change-ID: 20260116-milos-fp6-bt-wifi-22faa7b15e8c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=1518;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BF5TJfTjAHAamhIZ3z7tthOS+Ma4qFWW4uI2TjjrfiU=;
 b=ednRrit/bAoAzVhkyGxL0NIrpVGJR0/5C62DiVQLNXJsmwqOGJ0X52r5uAazLmVy1hmNy7lOE
 ooCDQy+mLlJBCy0nu87HL3O/iRHxdVPR3Q8pIcTIF19ewqq5MrpRoDg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_065516_318610_7419EAC2 
X-CRM114-Status: UNSURE (   7.79  )
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

Add the required bits to enable Bluetooth and WiFi on the Milos
SoC-based Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Drop applied pd-mapper patch
- Add compatibles for wcn6755 with fallback to wcn6750 (wifi & bt)
- Rebase on linux-next
- Pick up one tag (discard the rest due to addition of wcn6755
  compatibles)
- Link to v1: https://lore.kernel.org/r/20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com

---
Luca Weiss (7):
      regulator: dt-bindings: qcom,qca6390-pmu: Document WCN6755 PMU
      dt-bindings: bluetooth: qcom,wcn6750-bt: Document WCN6755 Bluetooth
      dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
      arm64: dts: qcom: milos: Split up uart11 pinctrl
      arm64: dts: qcom: milos: Add WCN6755 WiFi node
      arm64: dts: qcom: milos-fairphone-fp6: Enable Bluetooth
      arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi

 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  10 +-
 .../bindings/net/wireless/qcom,ath11k.yaml         |  16 +-
 .../bindings/regulator/qcom,qca6390-pmu.yaml       |  16 +-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   | 191 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |  74 ++++++--
 5 files changed, 285 insertions(+), 22 deletions(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260116-milos-fp6-bt-wifi-22faa7b15e8c

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


