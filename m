Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C3AC6FD1C
	for <ath11k@archiver.kernel.org>; Wed, 22 Mar 2023 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhBxfp6uHUeFo1bPnFjjFKQvB22z2nS8Ys2uo4cqBXs=; b=1A7qASvmRdS+bS
	GQ5ql0ydler2/yFTJN80rl0a8yXZlaXxrXa0NXorHa59SzT6QJHewG9kiDKFrrFTG2ynDZzK+vyfF
	9fhhY6D9XFW+4NUBv9/+/ZUgyQWTIDSmrmnrICyiCvTzK6BsWjFmQXNKiEbYt0U7IN01DjnoJI+qM
	FPh1EputfjvMyPqErw3WkAhnqe40mgxcIckKNWDBvrXnWm9bWDL7kCEUTpqUiRVWOR7VwsUM+6fEV
	ChmupfZDA2GolwEaQBjiqHtF8fbtMGosk+1xoxIl9PB0eA48BusuHXQJ4IBTESF6lLyrR2oV8987i
	bN3BLDRw2DxUAGiiW4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pesRW-00Ex4G-17;
	Wed, 22 Mar 2023 06:59:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pesRT-00Ex3b-2g
	for ath11k@lists.infradead.org;
	Wed, 22 Mar 2023 06:59:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B54D61F88;
	Wed, 22 Mar 2023 06:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E97C4339C;
	Wed, 22 Mar 2023 06:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679468366;
	bh=PIUEALEH9IIlr4WfA56Zh//ektSNC3wBHU4OOoWuz5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3XOnMn6OPllb+YqXqJ5rZdCd86SIcOzniEXCvCoCYuIZPTI6vNi+W7YzO0kMqusO
	 LlHrTNGdPECskeLSJyNmpsM3QnB2QON2ghsiC9PiHcFY+w7k0kuJB3WRehTz4v5M53
	 rfRbJ51nY/E1Wrs3Awe6tK5aYEYtxNiVUXxVhwSGcCDvQtxSMqO64WqFwX+qRuTzwN
	 oll/GS/W2GZz3X3ED1WoC394VCDG4tARwTI95sgUZisovTGDS4T0ySBMQnAVfy3xdQ
	 0SQgX72bkzdYPLxSoPYeWXojxBlbsaNLbi6tQjoxWZDftsjtdhJ4lmztROHFB84yug
	 OrRKT+emzPUEg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1pesSq-0002BV-1E; Wed, 22 Mar 2023 08:00:52 +0100
Date: Wed, 22 Mar 2023 08:00:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Steev Klimaszewski <steev@kali.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: wireless: add ath11k pcie bindings
Message-ID: <ZBqnpLcJDaaPbNjt@hovoldconsulting.com>
References: <20230321094011.9759-1-johan+linaro@kernel.org>
 <20230321094011.9759-2-johan+linaro@kernel.org>
 <87mt45e34h.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mt45e34h.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_235927_907318_9C36399D 
X-CRM114-Status: GOOD (  13.50  )
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

On Wed, Mar 22, 2023 at 08:01:18AM +0200, Kalle Valo wrote:
> Johan Hovold <johan+linaro@kernel.org> writes:
> 
> > Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6855
> > for which the calibration data variant may need to be described.
> >
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  .../net/wireless/qcom,ath11k-pci.yaml         | 58 +++++++++++++++++++
> 
> I talked with Bjorn, our plan is that I take patch 1 to ath-next and he
> takes patch 2. I just rename this patch to:
> 
> dt-bindings: net: wireless: add ath11k pcie bindings
> 
> Everyone ok with the plan?

Sounds good, thanks!

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
