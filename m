Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB47CFB43F
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 14:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWen1NhQzHtIaGJ4wRxojwp6g1EynruN6BWTwP/qJBA=; b=ktOs465zEf66mAyKw+jWy5eoun
	sc0z1ujYRkKWOp+cFcb8y38x44+buSrdRos/7VuXKvQ/J6MW9m2kQACWdq1SZ27thUr7XMDOxAN5+
	+gJWbFSvQ0xYHLiM3XNbwAtadvDoIOfUT/LOX0pCiGMljE+NLe55HtJhPXCzzf722RQxFO5E2OY4g
	AycHyLEYBaXLJW9RmA7oA3suIHj7WqiV9zcsTE5zOOPqBGi+rIljAG+PV/abOQb2DwJjugRZKfx/9
	b+mUn5rMTNO96Zs6bJkGET4Y9ns2ZBHEP94DU1mGD7IoGZ/ckjq+RBSIZZcQ+LTTkXdPNRWF97phh
	3GiHA5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxop9-00000002kdj-1uHT;
	Mon, 07 Oct 2024 14:34:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxogl-00000002iKT-0LKV;
	Mon, 07 Oct 2024 14:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 784B7A40E26;
	Mon,  7 Oct 2024 14:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F93C4CEC6;
	Mon,  7 Oct 2024 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311177;
	bh=wH8KEy7pERDiB2b1ro+1rgsenhn5KPrm+1++yqJVkcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arhisDDG6McfndQojURs3dX0GDLhGHwrO412kzpciXBXJAD/MkXkTqruytoU+Smtk
	 VtZcrI1xqrOXcRkSqX69G6lhvaVJP7v4cqOlyCk4t2Z6jngTlxL1QtsTi8KKSGzL6U
	 PFQV2oSGJl4pDd1c0ZphsJupkyyPBWXSAVf99ZZwL5WeiA9UMus1LynkX0Z7of7Zmr
	 bVTiJwOfh/xRa7zuCCwF6xJgG4vGulf12p/0LwjJBuk/TnYcjGimqKoeksAkEiG3SS
	 48PoZN14gPnFOJSeKOuv/Z5/u4tWdRB1PPdTAoJQM5zlZ6hXkdlOjp9OPXXsWpd+2K
	 WfXAkSfKUsQQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: (subset) [PATCH 0/7] arm64: qcom: sda660-ifc6560: enable GPU and WiFi support
Date: Mon,  7 Oct 2024 09:25:51 -0500
Message-ID: <172831116181.468342.15853869019266363418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_072619_204771_15679C92 
X-CRM114-Status: UNSURE (   7.40  )
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

Applied, thanks!

[2/7] arm64: dts: qcom: sdm630: enable GPU SMMU and GPUCC
      commit: 166b955a8d60b38d4fbbb9a18994a49e607ab17e
[3/7] arm64: dts: qcom: sda660-ifc6560: enable GPU
      commit: deac51aedd1e1e5ba0d46f23ef0012a8754e4871
[4/7] arm64: dts: qcom: sda660-ifc6560: fix l10a voltage ranges
      commit: 1dd7d9d41dedf8d42e04c0f2febd4dbe5a062d4a
[5/7] arm64: dts: qcom: sdm630: enable A2NOC and LPASS SMMU
      commit: 41caaf517014d11c17b2e6f3b057f7b6c9507cb0
[6/7] arm64: dts: qcom: sdm630: add WiFI device node
      commit: d7e67846c08f46974da26c54af7793d47037d452
[7/7] arm64: dts: qcom: sda660-ifc6560: enable mDSP and WiFi devices
      commit: 04d8ed02cb9b86a0e231ae0271527fbbfb411695

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

