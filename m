Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C55ECE579
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+40mz8MbZKyzs8Gk+lu50gO8i820Z3utwufHjS5oI+U=; b=JK7NKJTFTou/dUZVODXPsePIyV
	rhG+Xe6h1QwcFmuxpgiC2oD1nEJfF73xH5vD6OrVPxAoH23Jf2OsJPT3fegshPt1Wyu40PNJoCipt
	l18nfHJf6wUrQqVtzrFMcHlUK2jCaFg5bQ3LRCZ+IHTBVcb8g2X22W/AwYZG99N2buvArW3okTlVp
	am1YtQ/ERx5tX5iCbTjGGUmiOgrhebTC88wFbeUIdoIGcHEr78ol16fUpa+ff95bmqfT9qQDzyRVd
	2dHNIbfQtN9+IKliiiZcPjX1aiODaTxc66WhH9vADlQgHe6/BZH3JnuL8NyoAQiZnNNKeJnf+EdPo
	RsO7q7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhAk-00000002dXR-1kg9;
	Mon, 09 Sep 2024 16:23:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snh3c-00000002cSz-0a8Q;
	Mon, 09 Sep 2024 16:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AB5E1A4166A;
	Mon,  9 Sep 2024 16:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAABC4CEC5;
	Mon,  9 Sep 2024 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725898562;
	bh=Ls7yNYiJTmMO2LUOs5edmUDMG2W06CnY5cBWHeqDVh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1Il1hiaDR85pEccsSxKJx4hwcoizwSgnKS/STKWucygQg3CRqCAoVLH0KGEPT0ot
	 /k+T8Ed20mV46zrf5iBAm31+kQfMLeaiqFSRz2Rk60P5RYZe7k8djYPSjbLA5XC+0d
	 LrFVap4Kyrf/avuR0ABliJ4fEI8YZbmrXVJ3u1rav+SY3m5sEstYHZ7al1eWVPw8fV
	 c50JhN8Or5dtRjg0WVd3TcaANC4hfy8SuWhi4dLSSLM0foi9+jxq6Zrkj2fKbN3R8W
	 U0jV2L1RBKdlTmXIsRJzFzm5mtWM3VKILKlPJzA0keX7u1sR+X2J/9tQx3iHz9rJl/
	 s2PPsi2mfaTnw==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 0/7] arm64: qcom: sda660-ifc6560: enable GPU and WiFi support
Date: Mon,  9 Sep 2024 17:15:44 +0100
Message-Id: <172589162139.2623853.11488233830217103643.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_091604_265359_A6CF0088 
X-CRM114-Status: UNSURE (   7.91  )
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

On Sat, 07 Sep 2024 21:48:11 +0300, Dmitry Baryshkov wrote:
> Follow the MSM8998 example and limit num_context_banks on SDM630 /
> SDM660 platforms. This allows Linux to make use of the A2NOC and KGSL
> SMMU, making it possible to enable GPU and WiFi on those platforms, and,
> in particular, Inforce IFC6560 SBC.
> 
> Note, while WiFI starts up and can work for a short amount of time, MSS
> starts crashing with the following message:
> 
> [...]

Applied SMMU driver change to will (for-joerg/arm-smmu/updates), thanks!

[1/7] iommu/arm-smmu-qcom: apply num_context_bank fixes for SDM630 / SDM660
      https://git.kernel.org/will/c/19eb465c969f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

