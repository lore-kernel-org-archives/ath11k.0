Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55426C25B74
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVOOTGF6bgfnRwZMwtqKlUHyiYPAgAX2oIIBCPf7gX8=; b=0B0Wqn1eAgSI5hRq9Hu2znO4Ae
	QclCd6v4331bSYf9EN/2iVimxnaHgFEjiSoq25vAB7kfHY9d06KU9xlfIV9Ssw5gQGbByo2lTGrp1
	XWIYvn1dmjNoaYUAEKPRygkvVL+pLfpYgPhirndTvtpjynMDSmkKemMcY34SrBxL5vXM7xFhts+/W
	TmgIx2s9bL9r7Yd5ckkMENKRSWpncuuDzJi6EP1fSyLhuw2I1+Ykoa0WfLIBT94lZZZp8qtm++Yd4
	uvabpL0BDEJPhIkKLpap0/cbdgCvLg6RjUFCtxWFB5P+kLGEIfoY/77PltN0uXPmA+oCJ5x74T1Q/
	ubr2nU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi3E-00000007lrz-01kQ;
	Thu, 30 May 2024 15:50:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi3A-00000007lrO-1xSy
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 15:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91D02CE1AC2;
	Thu, 30 May 2024 15:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF31C32781;
	Thu, 30 May 2024 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717084241;
	bh=xygDBTFplFvzRM5DN63ShuFxOVfO34VSI62/KLcs6/s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=b1+zf4fyZE72cIxWjUctp5CRzeVz6Yl9GpuyUPX96s6q4z3GYoPvqC5zZuB9kz32X
	 Bpqgy1wgUJWUAbFy/PeDuP9ahs9xyzXiTva3+SPp/nMgCZPRKr3bETli2cmKuCjzhN
	 Mf+4lLHUXh/Ivz09NJKqDE66yxVak8yiC24hLT3+VTIiK+oJ97CZPYAMxR/uOfEl7g
	 2+bCXcSgfRyWoYAtjI+/aKxzEfkkbCJMhx7L+8O60uhjc9kInU2r6ZHHZfvQrxHwNG
	 NMiKbpbujXSWOSa0tAP3YmNspTKZ78c0xSit4QNxHdKbIt3JiR2CZRZ+nE/LozBEH6
	 DCokCQareq2mA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] dt-bindings: net: wireless: ath11k: Drop
 "qcom,ipq8074-wcss-pil" from example
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240528134610.4075204-1-robh@kernel.org>
References: <20240528134610.4075204-1-robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171708423701.182911.6673955018823846122.kvalo@kernel.org>
Date: Thu, 30 May 2024 15:50:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_085044_754467_202998CD 
X-CRM114-Status: UNSURE (   6.18  )
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

"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convention for examples is to only show what's covered by the binding,
> so drop the provider "qcom,ipq8074-wcss-pil". It is also not documented
> by a schema which caused a warning.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

43e934360d1d dt-bindings: net: wireless: ath11k: Drop "qcom,ipq8074-wcss-pil" from example

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240528134610.4075204-1-robh@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


