Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0003CF6495
	for <ath11k@archiver.kernel.org>; Sat, 28 Sep 2024 09:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksr3AyvKYmZI90T6ypyVccCGBbqrpk2w+xcVfkG79iw=; b=cV2Q1cJQGvdHIe+LZfsC671ZBP
	DC15wMHa9elfXIa3n1R36ShbrmeZHjFHcKSkqejX0qWl6qjufMNqQq157WKE2kOBy/M5sAxNLM1JQ
	/ZF2rnAswRrdMXxkvt+7otG/jFnUgYqo+WNc8YyF81sP5JeTUbTtI4axDEaR5GSSCpaPt59aYN4VJ
	4Elhj8oLZXoDM4D4kEdKW1lmOieX6q1rS+gXtvLT/kNVmmxpJPBksACHBpmtsq4oWrRJSpBMRzd4i
	FkVMjd589k8D7uCPkE0lAf+rd8VWDf8YgPy93GekDffF0CfGEZdtSqjk77QQclKs/v5Q16QPxTHAw
	0XcSUXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTeT-0000000CsMc-1CdE;
	Sat, 28 Sep 2024 09:22:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTeQ-0000000CsME-1dFi
	for ath11k@lists.infradead.org;
	Sat, 28 Sep 2024 09:22:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43676A40232;
	Sat, 28 Sep 2024 09:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AFFC4CEC3;
	Sat, 28 Sep 2024 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727515324;
	bh=uCgtAKSgxvi3oFwpCxLapBxV0u9+nUh8QinzO5ofaro=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=E2BoSkdh7EcgYYncu4sHIzlPwyxK84ixHU61HX94xf4KZ9JD7nreUCTEsGbmO+lG2
	 HgMXEICrW1wWK412VPQxVkq/mGRiaKWq1VOeKoUxyMpcW8Xsh27MpECLeoeyfE+vtQ
	 uIkaFrRfka/77Z3/VCSkrTI4gVuaDjxWgUr6ntUk9gYe3e2WzBbVx3R3YGXE57oYTM
	 gKgO6xmhJYUy7DweOn8V0vSr2mv/0Wh8gWSKvNuKhsxsKO4oV4n25qeDguJw9clhwv
	 fl6NfrkVvzoSO+TJRx00tMBelSYI8PtP+iasBcJRCIOYaF8XdXnspNAB/lDCK7BJrj
	 8vybX7HEsILMQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of
 the ath11k on WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240814082301.8091-1-brgl@bgdev.pl>
References: <20240814082301.8091-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751531994.2249584.3150490336155869162.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:22:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_022206_532209_E5F34959 
X-CRM114-Status: UNSURE (   4.89  )
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

Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Describe the inputs from the PMU of the ath11k module on WCN6855.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

02d697272cc6 dt-bindings: net: ath11k: document the inputs of the ath11k on WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240814082301.8091-1-brgl@bgdev.pl/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


