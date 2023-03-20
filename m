Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A6C7618A
	for <ath11k@archiver.kernel.org>; Mon, 20 Mar 2023 18:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=687REzTWC5CwLxFcyzxNPioDAjE3Hmob3m3DvJMJrbM=; b=aBodoFmvdaybM8
	kbIMTCxdV5LTHkvf2nD0efr7SY5bbF8Vck0CIoSuN7PCZpy0En9Wn/PUGc9U33uFEHSv68+iW6LRr
	wDYeDQtfVdhPUAIUUBV7lWuIjt9DkZrH/Sg/ooxoJhCc4Nz3bAcZnYryAVitSyQysusMQb3h9slpq
	0+h1CQT2GAjBdNkyGKxNQffuVenNMFRMhvTBQTH1TDMruHKW0NSFzndBqrL95aAP9FEJvgPJfIwXc
	HuZzQrYiwheCF8sq9IHmKmODsP0f+jy8VDUodnlAy615ruZNIUZKwcTYgwHEk7eEXTXhhiVzQ+l2e
	DGs5UxqDcGaTqReWbwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKRr-00AA9P-0P;
	Mon, 20 Mar 2023 18:41:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKRo-00AA8c-2X
	for ath11k@lists.infradead.org;
	Mon, 20 Mar 2023 18:41:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA9D2617B5;
	Mon, 20 Mar 2023 18:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF97C433D2;
	Mon, 20 Mar 2023 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337689;
	bh=2f37lfeV2uqUCawsoKtMP9QdXPtifZqxFzFW3xEcp8A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lWjFQyEDIo8MQTCiFBBVl1jHJQAxQmCPf74aa6CD2aNlUTBxZk29rMePvw8C6mLZc
	 wrLYKoBIJEJBr84jjiWrDCUAOen5B8fxBAYivmL2MrxnYEaa7BLtJ0yNKhlJyJlhJn
	 mwO2PQGUjdAF//4mjd+cijoCJT/NPCkgIT1s085wg/N6CmLzuCuhpmGN9xNZpRS996
	 QgdIbY2voj2IIg2MFiNX4yGIE86800v/tQ4SJLTjcZCL3l3WbgQyAALlno3xrapB+e
	 J9/eA4VdhrKZiarWIOG/mieT8wjMe8N+wVuD6CJPn5AKpxNeO6gSsg5qN2EH05S8Ga
	 B9glULQd/XfTA==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Andy Gross <agross@kernel.org>,  Konrad Dybcio <konrad.dybcio@linaro.org>,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
    ath11k@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: wireless: add ath11k pcie bindings
References: <20230320104658.22186-1-johan+linaro@kernel.org>
	<20230320104658.22186-2-johan+linaro@kernel.org>
	<87ttyfhatn.fsf@kernel.org> <ZBhUo1C08U5mp9zP@hovoldconsulting.com>
Date: Mon, 20 Mar 2023 20:41:21 +0200
In-Reply-To: <ZBhUo1C08U5mp9zP@hovoldconsulting.com> (Johan Hovold's message
	of "Mon, 20 Mar 2023 13:42:11 +0100")
Message-ID: <87a607fepa.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_114132_862738_090DB373 
X-CRM114-Status: GOOD (  21.74  )
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

+ ath11k list

Johan Hovold <johan@kernel.org> writes:

> On Mon, Mar 20, 2023 at 02:22:12PM +0200, Kalle Valo wrote:
>> Johan Hovold <johan+linaro@kernel.org> writes:
>> 
>> > Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6856
>> > for which the calibration data variant may need to be described.
>> >
>> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> > ---
>> >  .../bindings/net/wireless/pci17cb,1103.yaml   | 56 +++++++++++++++++++
>> >  1 file changed, 56 insertions(+)
>> >  create mode 100644
>> > Documentation/devicetree/bindings/net/wireless/pci17cb,1103.yaml
>> 
>> I'm confused (as usual), how does this differ from
>> bindings/net/wireless/qcom,ath11k.yaml? Why we need two .yaml files?
>
> Almost none of bindings/net/wireless/qcom,ath11k.yaml applies to WCN6856
> when using PCIe (e.g. as most properties are then discoverable).
>
> We could try to encode everything in one file, but that would likely
> just result in a big mess of a schema with conditionals all over.

Ah, so the current qcom,ath11k.yaml would be only for ath11k AHB devices
and this new file is only for ath11k PCI devices? But why still the odd
name pci17cb,1103.yaml? It's not really descriptive and I'm for sure
will not remember that pci17cb,1103.yaml is for ath11k :)

Also it doesn't look good that we have qcom,ath11k-calibration-variant
documented twice now. I'm no DT expert but isn't there any other way? Is
it possible to include other files? For example, if we would have three
files:

qcom,ath11k.yaml
qcom,ath11k-ahb.yaml
qcom,ath11k-pci.yaml

Then have the common properties like ath11k-calibration-variant in the
first file and ahb/pci files would include that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
