Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612EBC25B75
	for <ath11k@archiver.kernel.org>; Wed, 29 May 2024 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2TXSyatvCn81BU/vsxpojva3z19uCxL/E5qJNcAhcM=; b=TrlzjVbx3coO1vhorDVJvquJbF
	zd0XYsUE/eHN0KEYHLPBveu1qScm7C5Ci6Pu+j6LRJfS9UgklD2xMxuwz/z81Yq/Ty5MfEQCBV8Zr
	MmYpOF5BIheiOJA4IQKyjE8plOhRJxQ+i/vqtbEg9OGRNF75q/KFpFFLeFGIjB21+dpy3wxDWZOVY
	Qw+Foc0h4J3Bxo/uvW5az6AlCt5omjkUQqa/YxPae3NBWoEvl1gSIsUTNlri2bo0yhrVoshBRSinL
	m0rjp4hZrU5h/l6YnZQgtZkPlp88Gx6StlZNg8llKZcV7JSujOQA2Bd3TyrR6xvbTNCgmQVNpVLhV
	VMgc2otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCL22-00000004eCP-2vY4;
	Wed, 29 May 2024 15:16:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCL1y-00000004eBk-27Hi
	for ath11k@lists.infradead.org;
	Wed, 29 May 2024 15:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B764CCE0AC8;
	Wed, 29 May 2024 15:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FFAC113CC;
	Wed, 29 May 2024 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716995754;
	bh=eWUByR0VEiRUW96ijAZ5GiNZ6VAiv1wvv2G+yWAVIMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m9RGkqp0sAdEZhLCuT0KAmONCe0N9V3i3TP9LujkWb1Peph3Bbpm59h01mNhvBp+y
	 zSCtIFc52nB47iBl28g4GxQohnd9QDR1rhbJ7fEitzTvzu6MIWBJYj+gIYnkirIg0M
	 K+c5FOIEaWmJbwRu8FDwktmVMql9TDHUteqS0py5Z066a9TEmj0LNXfuySFY2uXkya
	 /Ry+iD6ktMlxGh23arxufMnZX+sZ+UPD4XqLX6cCB+9S1dCwLO99ssnHTlBqHqRuw9
	 miQpI+h0GCjr8dp/+LJEdmk9pTcGjljxGDFxJNjlJRwPsqrpiVhbllhz+LD8HQcmsc
	 at1XrTcYdKazQ==
Date: Wed, 29 May 2024 10:15:52 -0500
From: Rob Herring <robh@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: ath11k: Drop
 "qcom,ipq8074-wcss-pil" from example
Message-ID: <20240529151552.GA2525043-robh@kernel.org>
References: <20240528134610.4075204-1-robh@kernel.org>
 <171697351470.2158278.1110328163301153386.kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171697351470.2158278.1110328163301153386.kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_081558_762695_F1F38707 
X-CRM114-Status: GOOD (  10.53  )
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

On Wed, May 29, 2024 at 09:05:16AM +0000, Kalle Valo wrote:
> "Rob Herring (Arm)" <robh@kernel.org> wrote:
> 
> > Convention for examples is to only show what's covered by the binding,
> > so drop the provider "qcom,ipq8074-wcss-pil". It is also not documented
> > by a schema which caused a warning.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I'll take this to our ath.git tree, ok?

Yes, that's what I'm expecting.

Rob

