Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416FAC6FD1F
	for <ath11k@archiver.kernel.org>; Wed, 22 Mar 2023 06:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqWtBGJVs4ULo0t8nhHird+YKL4RlO/GFKlIQt792ls=; b=KZPoO6T53TzEkI
	1kXB+vLQ4dssPVSA9HzlHCN2cqcE6y+jvqiJINUCV0SvDc3HDUbjLm0o1IyCSC09sO+t4bH5QplZk
	7oSEUjau3GsKglP41Em71vQvzMgcQnvid7dkgn9F0kE+XozgJyuZmgPYbQLnCzKMA42mA+rQW1oKI
	w65dAJh/tL0vRx9zkNzQLznAw5/avoq+uyjCJIfUgL5CMdCjQhNbEzZWilWRfsnOhnN2CMy6gxniT
	hfcnywnHRaYEfVdLRjWQ/twhuocF/r6lm6N16lXX9UyIVuJCRetvtf4oooB1asrAJ3w3w6HC4u2au
	ffFQNQOwozf2i3tFTmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1perXO-00EnHB-2O;
	Wed, 22 Mar 2023 06:01:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1perXL-00EnGL-2c
	for ath11k@lists.infradead.org;
	Wed, 22 Mar 2023 06:01:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0FDB2B81B6E;
	Wed, 22 Mar 2023 06:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252D3C433EF;
	Wed, 22 Mar 2023 06:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679464884;
	bh=1PbyDiNq8356uMQ5xQE1fOosfBkAfAEvSTW5NauMxn4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eU+ekPV/0cRUqXSCl04ridhv/zFZBa8VVqZPGcqSJFmyU2os/k/Q/2TmTyKUZfQuu
	 C4ME/Gg22YwxeW8wk5yUbdggz/hhSGh/GPqCfPmkdCaIqBh29gA/luSpvIoHY8JXfj
	 Dpt0xTWy97pD0Ezk60NcbhmaN2NyEIgvCmm4QS1hRuEImsceCuCQmiuWUQ7rtCa78i
	 p2Cu35l6X9sBIMyTPryhpvpqIAthWEEaiG2UiFXK5RzQVMQYfrTqUaZ/D3DfQzNggT
	 VKS1c1qOmXioJ1vbVZqFkv8DQSJOFHsevZ/rjGj7+Cv+fbUH3VO4fq3tHwK/uMu3UG
	 BlKJFkrKvSCbQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Andy Gross <agross@kernel.org>,  Konrad Dybcio <konrad.dybcio@linaro.org>,  Steev Klimaszewski <steev@kali.org>,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: wireless: add ath11k pcie bindings
References: <20230321094011.9759-1-johan+linaro@kernel.org>
	<20230321094011.9759-2-johan+linaro@kernel.org>
Date: Wed, 22 Mar 2023 08:01:18 +0200
In-Reply-To: <20230321094011.9759-2-johan+linaro@kernel.org> (Johan Hovold's
	message of "Tue, 21 Mar 2023 10:40:10 +0100")
Message-ID: <87mt45e34h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_230128_012967_45656AE5 
X-CRM114-Status: GOOD (  11.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Johan Hovold <johan+linaro@kernel.org> writes:

> Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6855
> for which the calibration data variant may need to be described.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../net/wireless/qcom,ath11k-pci.yaml         | 58 +++++++++++++++++++

I talked with Bjorn, our plan is that I take patch 1 to ath-next and he
takes patch 2. I just rename this patch to:

dt-bindings: net: wireless: add ath11k pcie bindings

Everyone ok with the plan?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
