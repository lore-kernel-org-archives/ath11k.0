Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDAC74A5B
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmgvR/oIyAbsiUEhtkXs0EVQ5TE4Hp0VUKWgp5/7UIg=; b=PU2jf2uDruLxsV
	//XdIOdOQbd/fXt2RPGO5HlgAUs8GTqTIUNNbtgdx7BgLlMQMg5jRM6n79CYddWAq+leM6+ymOU5O
	aRQv5Y4aDzCAEP8OkXhObxLJpYdESNYyMq+w7UvcsqhhUFYPrXNr5WNeR2JCIgPFxhag8G1xacXQ7
	JKEotPa9vY1Mj6a6wL83AwAvHE2ufcVhCQLPFCS83WwbhR/BooFSUCpViibd671cVDQyLacKTQ9+s
	bOLPqgwR3VZSBiAnrUrR+U8WZQQOKS/ILcaSoWO5dTIjDSu4JI/cWzd1/D2xCeJsVbRigp+/1+eET
	ZEWEWQYzN5shFHNR+uVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peXEc-00Beej-38;
	Tue, 21 Mar 2023 08:20:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peXEZ-00Bedu-2A
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 08:20:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 890DB618FE;
	Tue, 21 Mar 2023 08:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E53C433EF;
	Tue, 21 Mar 2023 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679386842;
	bh=r/XTwJ0ZGyepgVGIYhRMA7vXO27GpJFl+4EAu53pwyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I5AS0EjZPdovcIfa3Rxq3mpy1YE1tj4r7DxmltKUbA9HAIs/+Z3rldPFX190yJmF0
	 sQOuPslQRdYDEVdHQO75fgvUapJNFIno4orOhWPya+T2rV2URacZhPj7Ib5K3+/AQV
	 eeP68B66netd1yDsQpOLHJ51Z5lL6MIIe0CsV+2oO+KDJvJaLxCb7kFE6ccUF2XoCm
	 5DiKhfZXfXjpDckX6zxSpHh9VXoylVZ8H2EkCu2PRRvP6yLsiciU7S0MvKNFq+2585
	 tw4b7xjjkS2E+QM6dLgAiFdp99T5V0NSNsfHa0bALQkWc5iAc+wBwNVa8lQijepYHC
	 Zeu7EAiuL+f2w==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1peXFs-00006M-Bo; Tue, 21 Mar 2023 09:22:05 +0100
Date: Tue, 21 Mar 2023 09:22:04 +0100
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
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: wireless: add ath11k pcie bindings
Message-ID: <ZBlpLJfqB1Q7JfQ+@hovoldconsulting.com>
References: <20230320104658.22186-1-johan+linaro@kernel.org>
 <20230320104658.22186-2-johan+linaro@kernel.org>
 <87ttyfhatn.fsf@kernel.org>
 <ZBhUo1C08U5mp9zP@hovoldconsulting.com>
 <87a607fepa.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a607fepa.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_012043_790901_D28CFBA7 
X-CRM114-Status: GOOD (  33.07  )
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

On Mon, Mar 20, 2023 at 08:41:21PM +0200, Kalle Valo wrote:
> + ath11k list
> 
> Johan Hovold <johan@kernel.org> writes:
> 
> > On Mon, Mar 20, 2023 at 02:22:12PM +0200, Kalle Valo wrote:
> >> Johan Hovold <johan+linaro@kernel.org> writes:
> >> 
> >> > Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6856
> >> > for which the calibration data variant may need to be described.
> >> >
> >> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >> > ---
> >> >  .../bindings/net/wireless/pci17cb,1103.yaml   | 56 +++++++++++++++++++
> >> >  1 file changed, 56 insertions(+)
> >> >  create mode 100644
> >> > Documentation/devicetree/bindings/net/wireless/pci17cb,1103.yaml
> >> 
> >> I'm confused (as usual), how does this differ from
> >> bindings/net/wireless/qcom,ath11k.yaml? Why we need two .yaml files?
> >
> > Almost none of bindings/net/wireless/qcom,ath11k.yaml applies to WCN6856
> > when using PCIe (e.g. as most properties are then discoverable).
> >
> > We could try to encode everything in one file, but that would likely
> > just result in a big mess of a schema with conditionals all over.
> 
> Ah, so the current qcom,ath11k.yaml would be only for ath11k AHB devices
> and this new file is only for ath11k PCI devices?

Right, there would two separate schema files for the two device classes.

> But why still the odd
> name pci17cb,1103.yaml? It's not really descriptive and I'm for sure
> will not remember that pci17cb,1103.yaml is for ath11k :)

Yeah, it's not the best name from that perspective, but it follows the
current convention of naming the schema files after the first compatible
added.

That said, we don't have many schemas for PCI devices so perhaps we can
establish a new convention for those. Perhaps by replacing the numerical
ids with what we'd use if these were platform devices (e.g.
'qcom,wcn6855.yaml').

As long as the DT maintainers are OK with it, I'd also be happy with
something like you suggest below:

	qcom,ath11k-ahb.yaml
	qcom,ath11k-pci.yaml

(or simply not renaming the current file 'qcom,ath11k.yaml') but I have
gotten push back on that in the past.

> Also it doesn't look good that we have qcom,ath11k-calibration-variant
> documented twice now. I'm no DT expert but isn't there any other way? Is
> it possible to include other files? For example, if we would have three
> files:
> 
> qcom,ath11k.yaml
> qcom,ath11k-ahb.yaml
> qcom,ath11k-pci.yaml
> 
> Then have the common properties like ath11k-calibration-variant in the
> first file and ahb/pci files would include that.

That should be possible, but it's not necessarily better as you'd then
have to look up two files to see the bindings for either device class
(and as far as I can tell there would not be much sharing beyond this
single property).

Note that the property could just have well have been named
'qcom,calibration-variant' and then it would be shared also with the
ath10k set of devices which currently holds another definition of what
is essentially the same property ('qcom,ath10k-calibration-variant').

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
