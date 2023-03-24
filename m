Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F6C6FD20
	for <ath11k@archiver.kernel.org>; Fri, 24 Mar 2023 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7/uRgza88HNLSeLfyrHnVKkFVuxLzAqwiYyBpH7eCw=; b=XueCtxCondvOwo
	XlyLP/1XnCQegiF3mfC+mfhXj1A+SM+Bxg5ukF81U/X6dp8czLiclKO4pa0PDiG/fr4H2M/EFPh6o
	cXjFk1pq9UfTWEunOtwVlZhMUkxZEHH8ASKLNdqh8GemC2F888uX5d8OHPye4SnO/6+lVwvR/8D/C
	p8wUkjB2DXIztE01+sgQszCAwbgrkd9yLhtF0HxuOMaQw3ncWin/T8LWVOEZcIxEYhpKpCoEPj58k
	1nauh/QnVNfS9Qj/orYGpIqrKQwf9SW2H6xdUEyvaGS4zR2TwxJSrr+3PcuBEgW+ScUIg3Esy+s8m
	bbZSLSdFGugQHhOwR5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfim5-004iY3-0V;
	Fri, 24 Mar 2023 14:52:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfim2-004iWt-2p
	for ath11k@lists.infradead.org;
	Fri, 24 Mar 2023 14:52:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FC8A62B4A;
	Fri, 24 Mar 2023 14:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19939C433D2;
	Fri, 24 Mar 2023 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669529;
	bh=0PpDPmjLSqLkyprFWnCZwIMNanhy8NMfDChEItYUYNA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kvEY9K6hJSrfGheCe0CCWiJvR7+SACqnTDQvORE8gcs3GXKHKrl8XyQh5xdLsjJGN
	 f+RgCo4voThMwXliDU07e4JaZHMnU/A8CXebqL+OYdGaGOthpKlAl8Jjd2fjiSiA5s
	 LjNVYwmpsHVbh0RifGqcwtu7N/6FZO1abie/+uGBq4AsHmCBJqympi80JQxxRt1zsG
	 WYddlOuILALfgxi3bukwSc8UJxrMQmwr5V9JDVU2YHaZRgKZ+KyBzzk2maiI+l4wUb
	 8l9L+PSnRbTvPAdjvn5jwNpzAri92KiyY6B25NGeZ0+VLG/zhWBjvawRHr1iF+R+mv
	 qBASAYbByTAFw==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] dt-bindings: wireless: add ath11k pcie bindings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230321094011.9759-2-johan+linaro@kernel.org>
References: <20230321094011.9759-2-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Steev Klimaszewski <steev@kali.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167966952416.27260.9867436581416631920.kvalo@kernel.org>
Date: Fri, 24 Mar 2023 14:52:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_075210_949715_01190A49 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Johan Hovold <johan+linaro@kernel.org> wrote:

> Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6855
> for which the calibration data variant may need to be described.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b6b88111c0db dt-bindings: net: wireless: add ath11k pcie bindings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230321094011.9759-2-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
