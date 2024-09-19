Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D2DCE8D5C
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u00Brbn4ZEYT4D/26vzmZGEgoQQTcNP/YH6W9k7aIX4=; b=Bu3lM8J1J6pabCW+C+i7j6GU65
	sEv8SnyGHprj6SQS3NXhdrxQNt6en+w0gxPNg987JVvpfte09MEcLyY/9i1iy0uZDstE9EE4pwTN9
	AexsnJSDe1IRZhQF4BHbP6QXKf9w4imZBKuWTgrVuzH7tSHA5SvmWpWZI3KmDCi9aXrkNbdrBnmJk
	4vo3pKXImsYjAInoegsx848Jeg82ou8rYiJOjMxFS+2snFiZRvS0QxY3I6wkUPhjCXLesHJVs1dN0
	lMZTxO42wmh98mTrxEPPP09GT+HzT1kY5Rnnh46FWyLm3uXO/7Kpa6wSKkR5EJWuAAZMVnWzYQAFS
	3OznFkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srC11-00000009ivH-2uxk;
	Thu, 19 Sep 2024 07:55:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBuC-00000009hME-1sj1
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 07:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F375D5C5C3C;
	Thu, 19 Sep 2024 07:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63F6C4CECF;
	Thu, 19 Sep 2024 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726732126;
	bh=5i1YXeZcMX46ZW9/4GfFPwm8EbpuGNMp3b6EfmSvDeI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Lc4q2SMLW7byQ3nu3pq6Ke7JkI84zZIi5tgrvBMxTozrFDt/cprQepzOCsji+dKY9
	 X7FyF7gee3j75ZnwvleP4p7AJxqDfI5/iMRbU23K/BikE66k1aX3rqwsCsYlUEWKdQ
	 FyywpazeYqTz0t/lxgtfKq4Rj4Lk0K0nxAhdIvaSvZwy10qd932Sh3NZ8Cxt+J72Mw
	 PPLvqFAi+fKRXfD+8ZuW/rNiFX+ShQIMCmrO2w5VcAjO99l+w0Y0P5x0YYE2rHPM9e
	 PkmPPfwmMjtOxmqu7mKEZe4b8FtFWeYCtTljKmoYnE1NMvDh3x7qsH7Q7PFTz+aOSS
	 4wzKxa5YYqEAg==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
References: <20240814082301.8091-1-brgl@bgdev.pl>
	<83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
Date: Thu, 19 Sep 2024 10:48:41 +0300
In-Reply-To: <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 19 Sep 2024 08:55:36 +0200")
Message-ID: <87msk49j8m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004848_571423_808282BC 
X-CRM114-Status: GOOD (  12.46  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 14/08/2024 10:23, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> 
>> Describe the inputs from the PMU of the ath11k module on WCN6855.
>> 
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> v1 -> v2:
>> - update the example
>
> I don't understand why this patch is no being picked up. The code
> correct represents the piece of hardware. The supplies should be
> required, because this one particular device - the one described in this
> binding - cannot work without them.

I have already explained the situation. With supplies changed to
optional I'm happy take the patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

