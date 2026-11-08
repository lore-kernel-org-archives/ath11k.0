Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D76077603
	for <ath11k@archiver.kernel.org>; Sun,  8 Nov 2026 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k57G8fjt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RKVaHM5t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PIDH+MAdQFsQS+wGtZgwtO/Ik9s/WC9VAQt3yx3P/nY=; b=k57G8fjtmvZU51
	586ZgzI0kun6kG1kAAQnC9/WYj5DcpXc/wEBbdtiSCE9GRKv2dW8kT/SB/P9P3MOlf3XazR9mRcMs
	IvHUvAK5JzrcWBq67m55ceNXh5vwG+jKGb+TWzBCjS3MkuVZ+XkxQEF11GMJ3XKBfbNqkZVPQibTV
	pJXNqZhfD7crQZr+uUFgvElY9AL5eWtRkl0xHAD2/o0CBFJScQxAIPfTD0WbY9cKjvN1l8MCRL+HJ
	GJjF6L7R1XEYUE/9sHZ+y5ggRqHLoi9h/o+xhKJW8H1fjbX6W9Zrd6DyAkJ+AScCjDcJWKMt7loT2
	EKLCqnvi6riZzrdLnDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Qr-0000000GZeP-0WLo;
	Sun, 08 Nov 2026 20:24:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ9Qp-0000000GZe0-44Zx
	for ath11k@lists.infradead.org;
	Sun, 08 Nov 2026 20:24:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D0B861D55;
	Sun,  8 Nov 2026 20:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31491F008BC;
	Sun,  8 Nov 2026 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169443;
	bh=PIDH+MAdQFsQS+wGtZgwtO/Ik9s/WC9VAQt3yx3P/nY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RKVaHM5tB5dS4XPW+1tN2IRgMisQguCkVRVvYKTcEwK23hsftiLRGwxBxwTrYcLlJ
	 RO1moyXzzdQErKJJiXa27Qxnndsdu4XGmztLVbMSbImPQGw2XQjzN2lgiUY19nfRNV
	 yW3+7gUnSy/ZQRrglu8lGx5/neQG5iZKxHQhrkggWaxS2SMujTtAxwpDKgwznCgCPQ
	 EJy+tIgwNaQNoMzPk9H3Gf7rCwSDY5euCq0fZtpZOA+hmkJ+c87KMB9FMdsnJM1Qqc
	 DqtJfun6uuYdp6XU+/7qVVGsnnzUWoDa0gLZZaC+rmVKgq8pSUM8HbQNyGk5GzyLMB
	 Blbams+yL4pFg==
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
Date: Sun,  8 Nov 2026 14:20:41 -0600
Message-ID: <179416929470.628393.6109143972218065313.b4-ty@b4>
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

[2/4] dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
      commit: c8ad14fa57232bf4a167b0fe2bd1e856e587cf48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

