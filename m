Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D6C25B7C
	for <ath11k@archiver.kernel.org>; Tue, 28 May 2024 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0/NnHyoKeM0XhRCj3UC7p4SIPxKuu882nEwdGXEuzs=; b=c6GBepygYEMdBMOpph+uRURqEo
	iWOQblNI27VPvFmJE2OKSdwmAjPoJywxH0+bxADx7Tig/5/hPL2VysmQoCuq0IcUGjv/wIyHLg2hz
	RsF1Zf37NMdNdAjrCjPUKEhAz6RIY8e44FUOvKxuHwOxDNguOicYFafYufycyg4cWPTZSatvPo5uZ
	Su/D0yb1X71g4qAwH7fyOwCgG4/jBXxUQQpJtMvLBL27lbQX/1BwSjOEi+cvKLDPxDa0aOSSTmgVy
	Dwto2M+ndSANHBpVhr4t7bshiFVimwAMfxaSD1LbuCtw5f3OU6rkbrTFcCiWMBzWlSd39qScLmfyD
	WDcvj8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBx9s-00000000rmx-0NWl;
	Tue, 28 May 2024 13:46:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBx9p-00000000rmM-48iB
	for ath11k@lists.infradead.org;
	Tue, 28 May 2024 13:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 021D3CE12E8;
	Tue, 28 May 2024 13:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EA6C3277B;
	Tue, 28 May 2024 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716903984;
	bh=Ts9yUWNKtkjmp8jkRt/lYz8+oFlaYVa9VT7q+TSy+GA=;
	h=From:To:Cc:Subject:Date:From;
	b=jIIXfed2H9nZ3neZm7Uy5Y4sQ5Kij55dKAmJaqx4068TDpoLN2N9onFvTKo7AV51p
	 t4BfzcZqr+fmT3b0D+o41yznt/cIcfvJPGZxG6aBMdFfxvS76mP9FdFA3/0lvQpv+Z
	 vC28fE2X6+8jVIfzkCjJk780MmrUWUzvKVSnvJGo+abTi7Adna192KwVeg5pROLzzq
	 BMgbafBsQj4BT4/LJj/O/NduHqm5lZupm0As1xch35eClyUEiHKwv33/BKYqOa74Vl
	 2e7LapBvTLYw6lOqvJP3Wtv2vVkEblQ35Wems/zYBv6W1oPStgh/G54XOS9N2Q/G4L
	 AxONyfICITszA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: wireless: ath11k: Drop "qcom,ipq8074-wcss-pil" from example
Date: Tue, 28 May 2024 08:46:09 -0500
Message-ID: <20240528134610.4075204-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_064630_307126_6EF24E83 
X-CRM114-Status: UNSURE (   6.75  )
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

Convention for examples is to only show what's covered by the binding,
so drop the provider "qcom,ipq8074-wcss-pil". It is also not documented
by a schema which caused a warning.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a2d55bf4c7a5..ff5763dc66a8 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -265,15 +265,6 @@ allOf:
 
 examples:
   - |
-
-    q6v5_wcss: remoteproc@cd00000 {
-        compatible = "qcom,ipq8074-wcss-pil";
-        reg = <0xcd00000 0x4040>,
-              <0x4ab000 0x20>;
-        reg-names = "qdsp6",
-                    "rmb";
-    };
-
     wifi0: wifi@c000000 {
         compatible = "qcom,ipq8074-wifi";
         reg = <0xc000000 0x2000000>;
-- 
2.43.0


