Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FAA60A382C
	for <ath11k@archiver.kernel.org>; Tue, 17 Nov 2026 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MAIpWH9S;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHpWSs5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RVmkNy3HhLs7e+G2SnLiYxMF1/jiuEjYVlpspUb0hKo=; b=MAIpWH9S6qrWYl
	LJGuuwK7Dqa6oZ/HM6bANbGl/pKlF9gdO8r5LHJpbR2fDigwtio5Vy9pYv+G5ULGyz+25JLJ3Nlor
	l+Q6/KlAqcgNeIshaw/qOJV5PHGxRnyAvgHjXZP9fAkZWKqzizbIqhH4oVzFQLfn7aFKdrj6kjJNO
	d8hzN6O9eN1IRk/HhX8XX5djZNt3g7VgoIk6msy4qpRngEJaeCgPPlkJse4AdvwoEb0DfT6/l/94g
	f37EL9Xu5DTD5k3bdqAH5SLcHgaA8+UK5XBF/gwCppbHSCFmJa+HTvDbDWcwdvH/zkWZUf6+gkkUw
	LqGG+sTcYpiJOe+aUqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7dV-00000004HYc-1cEV;
	Tue, 17 Nov 2026 01:05:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7dU-00000004HYU-00b5
	for ath11k@lists.infradead.org;
	Tue, 17 Nov 2026 01:05:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6427C410AB;
	Tue, 17 Nov 2026 01:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2F61F000C6;
	Tue, 17 Nov 2026 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877523;
	bh=RVmkNy3HhLs7e+G2SnLiYxMF1/jiuEjYVlpspUb0hKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KHpWSs5DoVE5XTiJPjS4m7c0EurxTZFIwNR0A61WLV1La604KT31s5E53rWc+h8nr
	 TRxrvl+UlR/lGr8KjxRGn+LoD7BqAR2dEFFpFXcYCaj4vnQ/lm9UFPnigefVZHS8ZE
	 q76h9A6D6vrLg59Q6WR5TixIgmndJmvrLTOWmAWwzTuJnj1FZQAKrgPiW8D/NhTU3f
	 9NgsjFyIV9jIFr27fAoax02vK7klxMUN2aqUNz6c+I1PhAmGnO8rMLzaXlBe2ue6gV
	 X6YmURMRtmeZKJd5oPUOY/F7GEtIfqQaRMYIAYKL8sOiwKN594aMhWSnqa+4A5Q7JK
	 J6bA7ez8udGwA==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrei-Alexandru Bleortu <me@andrei-z.com>
Cc: ath11k@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Mon, 16 Nov 2026 19:04:51 -0600
Message-ID: <179487749327.432567.4937281230879206027.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792761470.git.me@andrei-z.com>
References: <cover.1792761470.git.me@andrei-z.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 23 Oct 2026 16:36:56 +0300, Andrei-Alexandru Bleortu wrote:
> Add the Ubiquiti UniFi U6 Enterprise, an IPQ5018 access point with two
> QCN9074 radios on PCIe (5 GHz and 6 GHz). The first patch documents the
> QCN9074's PCI ID in the ath11k PCI binding, so the radios' nodes can
> carry the calibration variants their board data is looked up by.
> 
> The Ethernet port (GMAC1 with a QCA8081 PHY) and the IPQ5018's own
> 2.4 GHz radio are left out until the GMAC and the WCSS remoteproc have
> bindings.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: ipq5018: enable the PRNG by default
      commit: d8e9ecf65afef7cd2bd40e8619b5f32fe6563fc1
[4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
      commit: 97430c2c59285d3c965fbffec6df8d091c47ca5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

