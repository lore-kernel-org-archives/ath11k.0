Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C8EC531DC
	for <ath11k@archiver.kernel.org>; Fri, 16 Aug 2024 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpArPKSFnEhddYN9c/u4m+J1Wg/L4+0PMVs30j4sg0A=; b=KqJdmNqxeguCh+h5odOeAMKSIG
	GMmL3lcmSkyLvtUAxJdbxnREXgdhV7Vl3ELCsNQDFFLmH+fjVFuioxXMXIpgerkUoKrtEFDSeedqX
	yDBq/JJgymt1UnVbVWE3DvTIvE7CP86ErvrOVmL1i+oqR6CYHus2slfQXwv7mC7cZm9lpSHVz9+dr
	D9gnQmRPFK08fnZqIsmuMMPC7zCXPcjca8dATuQhwezwy7+LW2pxQkk901C89m5X7+6lVzajzx2P3
	SkU2WMPcdcNqMxNMyMLvOAgz7U1pSUBvJVXjxmp/CO0pV72ppGOyY3qWKCSuomLdUOrIqDtTIgJMi
	umE1iesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sesJR-0000000CHRI-2LfJ;
	Fri, 16 Aug 2024 08:27:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sesIH-0000000CGyt-2kLi
	for ath11k@lists.infradead.org;
	Fri, 16 Aug 2024 08:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AEFDACE1CE0;
	Fri, 16 Aug 2024 08:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAE0C4AF09;
	Fri, 16 Aug 2024 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723796802;
	bh=5ikcztOYc3gzW8Il3p4V24J5xZfO6EdqRiPvi15rElM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RgtbtAOpiH+y/spQ6gWgAnLqBhhg9cXWVihT2rfsZDpCBEfYfdNBpShYeRutSCBEF
	 LwNKg5MkRKzDrtXirB7v6jeF5X3b5A2fT1XA1xcxtKNzBhBkVpKIzQnZUPo45m33Fl
	 l6/jHEZnnDgbaIOzQH9YLRNUx1Rsojw1Btw8HjXbiJwdCNRPiZ2HFwUt0os+YpSPJ0
	 2BGnPOAjeBi3yMYWsilO7e128zHSVFMDKl+S4G0XnYj/8XgXO5dx15tjhcmS4+RBuA
	 h7BUSakYiPQwCmc57V+h01UDRJHzMzv+qlOS+nForN4LU/06WLCkn7FdFcxpFYV+wx
	 VB4oBtniP5xNg==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,  Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
References: <20240814082301.8091-1-brgl@bgdev.pl>
Date: Fri, 16 Aug 2024 11:26:37 +0300
In-Reply-To: <20240814082301.8091-1-brgl@bgdev.pl> (Bartosz Golaszewski's
	message of "Wed, 14 Aug 2024 10:23:01 +0200")
Message-ID: <87a5hcyite.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_012645_890570_4E13BBAB 
X-CRM114-Status: GOOD (  12.23  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Describe the inputs from the PMU of the ath11k module on WCN6855.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - update the example
>
>  .../net/wireless/qcom,ath11k-pci.yaml         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)

This goes to ath-next, not net-next.

> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> index 8675d7d0215c..a71fdf05bc1e 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> @@ -50,6 +50,9 @@ properties:
>    vddrfa1p7-supply:
>      description: VDD_RFA_1P7 supply regulator handle
>  
> +  vddrfa1p8-supply:
> +    description: VDD_RFA_1P8 supply regulator handle
> +
>    vddpcie0p9-supply:
>      description: VDD_PCIE_0P9 supply regulator handle
>  
> @@ -77,6 +80,22 @@ allOf:
>          - vddrfa1p7-supply
>          - vddpcie0p9-supply
>          - vddpcie1p8-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: pci17cb,1103
> +    then:
> +      required:
> +        - vddrfacmn-supply
> +        - vddaon-supply
> +        - vddwlcx-supply
> +        - vddwlmx-supply
> +        - vddrfa0p8-supply
> +        - vddrfa1p2-supply
> +        - vddrfa1p8-supply
> +        - vddpcie0p9-supply
> +        - vddpcie1p8-supply

Like we discussed before, shouldn't these supplies be optional as not
all modules need them?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

