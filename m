Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F53D0C603
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 12:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Tve6K6/2GtRx+LQEfZ1ETrclHMCbwyQTfkIGYNvRGg=; b=QY4Zx759rXhCTt9KxRETuQeG1y
	wSNDy9s/YZ0D7XskMbNmC36SN+AnDPKGtyVykO5JxkhbvoX12/yY9Mh+uyecfrgFE3FWQwM/YFw7a
	l1ujMV4KuJ+yqvOL2wSzWz3OzANCmooPFDOhVGTWd6rCIH3Cujfc5XhBSYI8VzC6FBoybUyvzgtMh
	YWYxrUFWYZFuFWwwZajUrsNYvcul/+V8k+f2nn23ayB+6NZwX2vk1WwihEtOv4fVaT7UzS2NXHn+U
	VAMPbc2nQUR3mGTPNDM/Bg8NylWQX+l7kM6haH/Rfdr2m/1+iQFkrvOnoyFn1szb8bnRFvrZNBmLC
	HDFtRb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JXT-00000003ffq-0Tyc;
	Fri, 25 Oct 2024 12:35:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JXP-00000003ffD-2dOs
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 12:35:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4649AA42E6B;
	Fri, 25 Oct 2024 12:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360EAC4CECC;
	Fri, 25 Oct 2024 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729859730;
	bh=NA66e2iqCnEkVY1lqjeKFf0Jyb7rhPBlZOP6atg66ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SElkjssLyRg4Mp2WWV1UBP28ZwKRHI226LRR9un//LTMBDmUsF7n6lqrtna1ar9Ww
	 iP4+cAmWYOInJ4lfrf0ybfWMLdrbdVPeq8wgMmhHv7dagcOJl26FvTWKfrZt9fSSso
	 jZWreBf5JpG9X+es4LA3yEg0+EKsuA1FeQ8C+cOaAhpWiGj+NE6deZiOpiECqheIh7
	 JcXQxlAMQ3HIUuAqpEBYUQhdi0L0iCJlDeev5CBjOmMcyAftfM6wiUGLTLLMTIAeVR
	 qokX9Hjl2UTeptsgrTMPpKXy8aCmf75zn5EWgjyCr+i7cQ++gu0tXfc+zt1NmdBQ1N
	 UMphlzajmu/uw==
Date: Fri, 25 Oct 2024 14:35:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jjohnson@quicinc.com, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: net: wireless: ath11k-pci: add
 firmware-name property
Message-ID: <aismpshqdh6pgya5fjxbem2kaqydbiyh72jwuh2hrismli2ysx@zxlos3etmhzc>
References: <20241025100419.2128604-1-quic_miaoqing@quicinc.com>
 <20241025100419.2128604-2-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025100419.2128604-2-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_053531_750119_324D6368 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, Oct 25, 2024 at 06:04:18PM +0800, Miaoqing Pan wrote:
> This is the same optional property that defined in qcom,ath10k.yaml. It's
> useful for the platform / board to specify firmware through device-tree.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Please do not send new versions while old version is being discussed.

Best regards,
Krzysztof


