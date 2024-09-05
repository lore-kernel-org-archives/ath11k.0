Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F1FCD5BCB
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIl7AjXMSjWkK510uu0v+NO/oY8fQWVTgcR+e9hacYI=; b=UdyVyO2qyIrMXzfxVuTCLpGZfa
	P1AposDIXNp3yG4xceb26ERQnHNkbNEJuQjZn9Gzg9zjMjqhFZqvV63VECfOJeXOrN1xmn8vkISQc
	sN/5cg3il0xmWUGir03l3HcEQeIgdlKsEgXOnghmMQV4xAMIb0htWfPdRSbeb1gb5veLGiqBZd98V
	U94vMmP9etKEKrME7sFSUiqraR3ef1dPwNrww1cNgRk2R8ZiZt0vpgIGLecgRIcyuaHGtXRd+DpoY
	442KcRJ//3mvsozez/4SQwg3YPdQlVQ/xrOH6DbFPMjoYAIq9Txo1sZNhXFoanp45gkIA6Je6U2NR
	+kSLQwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smEhb-0000000906K-1krs;
	Thu, 05 Sep 2024 15:47:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smEhX-0000000903n-1ki1
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 15:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB4705C5D4F;
	Thu,  5 Sep 2024 15:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165F8C4CEC3;
	Thu,  5 Sep 2024 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725551234;
	bh=EAnWPkg+5+GfGadRDWc4j55kZwjPEaiqdZ04TSPhyos=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HOXtCC74HGrL730QZmOaBJtnFJEObt0esD22qKWieMiWmCIZv1EIusQv3CuAdLftm
	 FfM5xsYk7cxqk0TR3X0VVe0JOv63+s3k65JqPegMz0YeBbYesr64f7gNLSH3V+lXVM
	 ZlXLV3FXD4A/kB2ZP4YhthlwH7MFA3YHqZlbQrMySYOopoaHxFlIRHy32c9Tc9sGoQ
	 xyuoV0j//LEbTfOtYSFItG247fuA9/Ay2Kvo+fEERs/w/GHRPk/qb68QVM9EjyrPT0
	 L+sXiWp1PRjS4U7RvUoB43gxKTwDaKzVkJUAir0YbTs9RMQtsFT7T1ulEPtzK1skHL
	 0Vc1C7ncqcXhQ==
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
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
	<CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
Date: Thu, 05 Sep 2024 18:47:09 +0300
In-Reply-To: <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
	(Bartosz Golaszewski's message of "Fri, 16 Aug 2024 11:10:00 +0200")
Message-ID: <87y146ayrm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_084715_544739_21E23CD1 
X-CRM114-Status: GOOD (  10.00  )
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

>> > +  - if:
>> > +      properties:
>> > +        compatible:
>> > +          contains:
>> > +            const: pci17cb,1103
>> > +    then:
>> > +      required:
>> > +        - vddrfacmn-supply
>> > +        - vddaon-supply
>> > +        - vddwlcx-supply
>> > +        - vddwlmx-supply
>> > +        - vddrfa0p8-supply
>> > +        - vddrfa1p2-supply
>> > +        - vddrfa1p8-supply
>> > +        - vddpcie0p9-supply
>> > +        - vddpcie1p8-supply
>>
>> Like we discussed before, shouldn't these supplies be optional as not
>> all modules need them?
>>
>
> The answer is still the same: the ATH11K inside a WCN6855 does - in
> fact - always need them. The fact that the X13s doesn't define them is
> bad representation of HW and I'm fixing it in a subsequent DTS patch.

But, like we discussed earlier, M.2 boards don't need these so I think
this should be optional.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

