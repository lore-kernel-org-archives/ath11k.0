Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91B606A328
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jrxYLrag;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=Lo4XvNwy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jQJ8dhA2iKUXZKusDvMRU3BFsb6qq9+2GC+fIDmWGXA=; b=jrxYLragolsfHYYalfbacRD2/q
	7MR2rseClNfyOgO0LUuIvAHH8/wFULt83VRF/4Au+rJUIXCNIL5EnPsilo5W1ah5tx7a7B2V/dMJV
	aX+u+uR68Y5pDDpC4NjR98lanmly+5ZkEkGx1r5WB3RoJvhB2VbFtACDPUJgEpiqPGTYeaAp3W/I0
	EjkFVCG0MoLF/5a57GnBgkllIa1vKBqLiuyH3QWqb/Y0MdM8LUME0UOcCP4EmQHfB/HanljM6cJOz
	V+tF4LX4Qatg8doC+3LBjvjqJAf/ZDjW1QV+sAb+LuHULwlaMdops8k5ILBjXsLkMb0/TRmcohtnR
	5hpWWF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFUV-0000000GOgT-17o1;
	Fri, 23 Oct 2026 13:39:27 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFUM-0000000GOfx-1FFo
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 13:39:25 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 697CBFC2B;
	Fri, 23 Oct 2026 16:39:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=jQJ8dhA2iKUXZKusDvMR
	U3BFsb6qq9+2GC+fIDmWGXA=; b=Lo4XvNwy/QaAkX7p29t05+GqQDnMF6BWKlg7
	SYI3mrq23IGm69YT4fzByMcj3Vdb8EIaGj039hz3dJ8rOi0M52qpuBphIuCaMFVp
	PfPq3LaIP61yatHSePaJlSY8J6qPoZn4suI4Jl5J4Fp5/zEaYCTtSGyJUMe/b3Bv
	QDsbZXDwmQvOpRnL/UCOXaro6//uGUUCyNEmJJb/b4XcWU1psWIn17WPPjta1cC6
	PD03brjcSw3TtW0N/olShm5JoeaqTbKlsV6CuA13ZTUyyRhBYnMpJcTyvkCHXg3o
	1/p84mzSB9ZLqIH4gJq83Jns23uP4BcEYJLZPaXFEiAQc4l/zw==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 3FFDBFC2A;
	Fri, 23 Oct 2026 16:39:16 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:39:16 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
Date: Fri, 23 Oct 2026 16:36:58 +0300
Message-ID: <19dda5d7c7a003452019eff0311a574e4b37bb84.1792761470.git.me@andrei-z.com>
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
X-CRM114-CacheID: sfid-20261023_063921_197724_21683805 
X-CRM114-Status: UNSURE (   7.38  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Ubiquiti UniFi U6 Enterprise, an IPQ5018 based access
point.

Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4524f76b4b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -113,6 +113,7 @@ properties:
           - enum:
               - qcom,ipq5018-rdp432-c2
               - tplink,archer-ax55-v1
+              - ubnt,u6-enterprise
           - const: qcom,ipq5018
 
       - items:
-- 
2.47.3



