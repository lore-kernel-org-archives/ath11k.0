Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763FAC9833E
	for <ath11k@archiver.kernel.org>; Mon, 28 Sep 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEHWQPy/uASwlHT9tocP9jeHW5JUYL4pbOZUXBAR8Kw=; b=EwDXL9W0DZZhGFjAUq4XSSuptn
	MvooejM4MmWUuDS1dPkVMscMvkfpnDmHvDC4bxQRmALQ2qWSoILcIMlUbyZdBCU3DFw9Pkcjan3rL
	v2RBW8fR5XW4nvqbeYWJtOIh191gx1kq/peeFPEUosMAo9WDshVIlb7VAnPdEKVkLnOPiKZnxsiQk
	M5SWT7yiMQ5LGWRGyS49mj4hJC0ScxjUzfBr9GKu5443jlpTeVyzn+4spmycur7i2fRsXA0TNyfZw
	ZiDUdo3pmHfiTMOGTHN25GeduDw68rgXJllRvfaXgsHj8t5mUlw5t0IAL1dRPmbRQk4KIaPzmuKlU
	drLWaWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8s0-00000000NXd-0Z7O;
	Mon, 28 Sep 2026 10:46:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8ry-00000000NWv-3xMz
	for ath11k@lists.infradead.org;
	Mon, 28 Sep 2026 10:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 643FB600E2;
	Mon, 28 Sep 2026 10:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EFE1F000FF;
	Mon, 28 Sep 2026 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790592362;
	bh=CEHWQPy/uASwlHT9tocP9jeHW5JUYL4pbOZUXBAR8Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d+ObSL7NmVwgZ5CetVsOmta6+zHX0rXHYEv9nuyxlygav4PytvrpEhAD/OO+vqYmG
	 mA/YvV45H2OE0BO+W+yoki5Ho5pRE2K6NFUExGXqQHS++Um+qpXyPSZZoEeDEjccTP
	 pmTbfs/ZalORJDqABrZeOqv9av/qC5lZUd66rslbejulJ2bNoUJU32nWva75wUOtP3
	 ujSKosQyBYoLqmu0q/9UP73WAkwLa1lLMmtJPmbrKuaYXuGa5FMpI4MTqZ1RYRpc/J
	 tsn9VEzHRis7cuA8U/30b1suyPSEaFB1CoV1THE3VQTvqjCTcdmvaq4TrU9GRtNgAG
	 lX21azifF3VXw==
Date: Mon, 28 Sep 2026 12:45:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH ath-next 01/16] dt-bindings: net: wireless: ath11k: Sort
 compatible names alphabetically
Message-ID: <20260928-vengeful-masterful-capybara-c605ff@quoll>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-1-86729521a75c@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-1-86729521a75c@outlook.com>
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

On Wed, Sep 23, 2026 at 04:05:07PM +0400, George Moussalem wrote:
> Sort the compatible names in the binding file alphabetically for
> legibility and correct ordering.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

This could be fine, but your next patch suggests qcom,ipq5018-wifi
should be moved out of here.

Best regards,
Krzysztof


