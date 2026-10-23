Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCE8606A32C
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1j2xuIPV;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=FfyyzXbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d3JCes+bAJNFau57gaORTkxgJhEs5zwwpin5iTYFEKg=; b=1j2xuIPVvB0LBXSNS9t7A7uQzj
	RQtOgT7YjyGYGvDI9tQVHiKhtmOPAd+4WMPKJ1SM1yZDGRyo/Pw4yLkgu7VWkgVpcVzif0MQ8rRIm
	sqmaFBqA8osPNReSoewQMpNCdFzQ2oNUPDcISZY0G+gMajlznHksUsV2M5qUfByw4RmAoc9FHjiZE
	+cP48mLgV/rcbO0ZFG3C/O9+iHgmX73TcNmpeGfSrJzs/UsYX6FsvwOqVBwqfZq7vWe5LnbOf1Guu
	1gTuuPPd7SWoQpp4jMSMSyzs8WVvOymdUpxuLd2DZMLxnLs+p0kMOgT615gsq0i6cgHzBqA2DIf5d
	zAU/zR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVf-0000000GPCk-3sYa;
	Fri, 23 Oct 2026 13:40:40 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVP-0000000GOuu-3fWS
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:26 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id BFCF1216AB;
	Fri, 23 Oct 2026 16:40:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=d3JCes+bAJNFau57gaOR
	TkxgJhEs5zwwpin5iTYFEKg=; b=FfyyzXbfWqkivF2f1aNNklFjEaf2DL9P7xBr
	O7ZbZQj7jrf9BhcTXkKMC5Xk+2SxjTmeQsM0UslpuSbwVt9p9H3vYBImHl3F3BoC
	RD8y2pH38kFrMXEqWWWFpyZjNdPOlnQjKFFpGuZHlac/y0DBVyfnUIKNILdW19yx
	ZJEDezl3Pbk1/P3NnI1fOAbS+WV2yf6Uk+zNzKD8tHYUK1SRyzH3hYfqo/K5H0qJ
	IKrsPJCTkmtsuzpKCmxzkzbM55PPQJigG29tN4QOi5lQm69NWAZSQHfQ7Jg9iU4x
	h6AuT2Hm21XgEKzQZrgYybGow7Lh8uK0hCI9WY0Lq2GcJZUtuw==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 91E27218BA;
	Fri, 23 Oct 2026 16:40:21 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:40:21 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v3 3/4] arm64: dts: qcom: ipq5018: enable the PRNG by default
Date: Fri, 23 Oct 2026 16:36:59 +0300
Message-ID: <8a595ee4a7facd53a25f51790500a642c78c2e59.1792761470.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792761470.git.me@andrei-z.com>
References: <cover.1792761470.git.me@andrei-z.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_064024_425309_13C67189 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PRNG needs nothing from the board: its only resource is a GCC clock,
and no IPQ5018 board has a reason to switch it off. Enable it in the SoC
dtsi, as ipq5332 and ipq9574 do, rather than in every board file.

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index fe1ed240de..dde5435f69 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -340,7 +340,6 @@ prng: rng@e3000 {
 			reg = <0x000e3000 0x1000>;
 			clocks = <&gcc GCC_PRNG_AHB_CLK>;
 			clock-names = "core";
-			status = "disabled";
 		};
 
 		tsens: thermal-sensor@4a9000 {
-- 
2.47.3



