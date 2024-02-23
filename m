Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD820C54798
	for <ath11k@archiver.kernel.org>; Fri, 23 Feb 2024 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGjLXSZkiunnfrafd5aUWKAqCtwmzyOCP7twZ67xQBE=; b=ya0CWW/rLXaC9cqAbmRXtX61Se
	psCXDsypyJZJgtgrA0QzKEn8vAQ3lceXFNAVMgut+1xXg1MLWPg7betuCE3kfkvfOCvsJF/eafQSD
	z4WlQn0CMsU0D7wzwAXV2PQrTxaKN5+CMmVccEj9gI4nCu/XUaT9vL3hTP4pTMsNZjWmus7uJ/NQX
	crMs+dNTgpzlTVZY3DsWy00LNB+u2jJq4V5IklTuLoiLs6ydzXKndY8QyPdiR7RHyQp4WQGQYMnIi
	7KAIFNf2NjPN6dnGN2+CCPC7FamZxGtpkgduw8KRwJv+mKTjZyMvcZWhWbk62g/FM9Rr2vB1JAV/K
	nlMwp2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdXra-0000000A5Cg-3nn8;
	Fri, 23 Feb 2024 15:53:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdXrC-0000000A53t-22n2;
	Fri, 23 Feb 2024 15:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6E2563545;
	Fri, 23 Feb 2024 15:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED244C433C7;
	Fri, 23 Feb 2024 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708703581;
	bh=9dJjw/4ASVXyYXTHVJ8CtjzaR84BLmXeR7uCeqpDAVk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=X3uZmWyMABZem3n0ZFvetZzC/ay7OAqtKsH83kW+KJ2wSe+YelPo5SiGBNARf2tDE
	 6hC9bbVjtSYHbZhZcck+T5R57fRIruTbI1kRXVr549bxvldma7QyaFhjoxd1wTp49+
	 NIjojNO1V9CU+RkPrSrlpkf9dCCtqucmFYVRhsm55NXdFRPkcTUDYo7Si9nxy0zLVn
	 13JTfiE12k0HoPCVr7ZwASAoqgFqBVzgzpxp94zC//hbtz7r6b0+XIVj9fR/IUhsmQ
	 +c1xp9lnW8lYJRhJEBGp8EX+uH7VGhz+y9kVfpHZ6g4FQgvt6uCGd+ud51fVwr49bI
	 BNW6BMLyCbKDg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom: Update maintainers
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240217-ath1xk-maintainer-v1-1-9f7ff5fb6bf4@quicinc.com>
References: <20240217-ath1xk-maintainer-v1-1-9f7ff5fb6bf4@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170870357604.2702005.6563808747303592523.kvalo@kernel.org>
Date: Fri, 23 Feb 2024 15:52:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_075315_030947_635CFAEE 
X-CRM114-Status: UNSURE (   4.74  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Add Jeff Johnson as a maintainer of the qcom,ath1*k.yaml files.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1098eb62433c dt-bindings: net: wireless: qcom: Update maintainers

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240217-ath1xk-maintainer-v1-1-9f7ff5fb6bf4@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


