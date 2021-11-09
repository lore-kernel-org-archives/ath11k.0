Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BECC433F5
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 06:09:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6009361184
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 06:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6009361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWBkrkrg1lM/yYXlqqmuib3qlhhHw+wuW5ijOYQ/fCY=; b=u89Yx0x/06Qhzd
	Z/2bwE8gvbkHY1xTGkB4YDEsmJf/TzuKMUwM9M3Aq9YmIjHZbwz+yBQwyTUhq2Sw4LDYm90TQkito
	3LdPrSGrSwm7GbGRfhKESkBswZeX5BR61XDfg3gOANx5/7fua1d1KYPnqV5u2STcnn/u1O4R2yXR0
	0XjiBSbSSy4eh9xh91thm8uABtfqPddkv/vrzOE66g4+v51p7PCN+n58AgSl1Tw6lCd5KpYNlx99+
	6505H1f5VBZeYFW3DheDeCNeWRd/lPW6BZyV5gMh7DMO0ZcASQVsyOxwnFgwKCoOtHXr86ZZnJv8H
	M3vNOSAOnqXbN7A4I01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkKKM-000n3C-Gy; Tue, 09 Nov 2021 06:09:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkKKK-000n2c-1d
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 06:09:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id k4so19009974plx.8
 for <ath11k@lists.infradead.org>; Mon, 08 Nov 2021 22:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3UMQ+IMa+soVBoyYN64G/6OyoEqBBdIjr60HkQKpNx8=;
 b=KZaPR85qHnb2yKJr4Zb3HksFeFbhp9G5ogo/MdQMtO2WH0hekoook0Vt4487LMv3DI
 EZ0IKoPmpz97Jb1XZ4sLl3X7/CAkjjsXH2vl5hzq6NE9fJDEPnlKhvOa7B3kiDVm6oxW
 EBstH3kSpqCyMwchR7NYBfno3q91DaVpBmKgc9HrHV8U9liDb+9Sz8Nvg/etv3fB0J82
 J62zQAeQDIJuNE/w/tCzN41cPMRJGyxZGWn6tp4GSsf3Zs/fa33GTpD4LdPiEnwVbgzR
 1PnxMKpiC510UXvkja82txpR8AqL0dO2xA1tZ/jotq5gaVtCGLxD0jKI7sv+7lc0W0EY
 suzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3UMQ+IMa+soVBoyYN64G/6OyoEqBBdIjr60HkQKpNx8=;
 b=cjEfq0sx67MPV/csIrYVv2gawBbyI6dGPyWy7XJscfeYA6nbFybGzQerrjOjyHy5PW
 zZ6+5fPNu5TOQazyUNjNDtL8WdN8tFKuvh7sELNUnC61rsAsAgqugXaXTzsfvsSe6DYk
 F9+y0w+1rqoes0jzCd0CqYgPJH90t5mzWM/2cPOewdoefCKVAjMQ7qUoM5oSMfQ2sEqY
 WrWeTzzk4ClvqnMxiz4u4XTcpz+D0NchscBtD5rw/w7HgagxIUdvkMshyednpqZTYxPY
 mAxI5rMN8RL0NdRjXqQ4E8McJ9hpr0BwGO6owhky/Ww4IdRsM2D8p0flnzK7qGjhd2ex
 ZYnA==
X-Gm-Message-State: AOAM5302C0cZRfar8xUv8e9hxkZmHDu11/c3QZOSrNxXmiHZpsL+DKWA
 qXZnsZRUB3uvNAgN1LNEujiN
X-Google-Smtp-Source: ABdhPJwNKVQwXClKhZuDD23mjW/GMmAAsVvWIADqtgxcYdFWepoXh4uyRFP3LuTv+g5FdbftBBcsaw==
X-Received: by 2002:a17:903:2093:b0:142:7dff:f7de with SMTP id
 d19-20020a170903209300b001427dfff7demr4995953plc.75.1636438186599; 
 Mon, 08 Nov 2021 22:09:46 -0800 (PST)
Received: from thinkpad ([117.217.177.76])
 by smtp.gmail.com with ESMTPSA id l11sm18755948pfu.129.2021.11.08.22.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 22:09:46 -0800 (PST)
Date: Tue, 9 Nov 2021 11:39:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 mhi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Message-ID: <20211109060938.GA5235@thinkpad>
References: <1635175648-23491-1-git-send-email-akolli@codeaurora.org>
 <YYBPd+Z/dA/pTReo@robh.at.kernel.org>
 <b142a4850d9cbc3bb451a78b488688cc@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b142a4850d9cbc3bb451a78b488688cc@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_220948_118469_AAA27FD6 
X-CRM114-Status: GOOD (  25.42  )
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

On Tue, Nov 09, 2021 at 10:33:58AM +0530, Anilkumar Kolli wrote:
> On 2021-11-02 02:05, Rob Herring wrote:
> > On Mon, Oct 25, 2021 at 08:57:27PM +0530, Anilkumar Kolli wrote:
> > > Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> > > Ath11k firmware uses host DDR memory, DT entry is used to reserve
> > > these host DDR memory regions, send these memory base
> > > addresses using DT entries.
> > > 
> > > Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> > > ---
> > >  .../bindings/net/wireless/qcom,ath11k.yaml         | 38
> > > ++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > index 5ac9616c9239..c7e6612e949c 100644
> > > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > > @@ -19,6 +19,10 @@ description: |
> > >    These devices use HOST DDR memory, HOST DDR memory can be reserved
> > >    and send to ath11k driver from DT.
> > > 
> > > +  ATH11K supports PCI devices like QCA6390,QCN9074.
> > > +  These devices use host DDR memory, host DDR memory can be reserved
> > > +  and send to ath11k driver from DT.
> > > +
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -177,6 +181,29 @@ properties:
> > >      description:
> > >        HOST DDR end address.
> > > 
> > > +  qcom,base-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR base address for firmware. QCN9074 firmware uses 45
> > > MB of host
> > > +      DDR memory in mode-0 and 15 MB of host DDR memory in mode-2.
> > > +
> > > +  qcom,caldb-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR address to store CALDB. CALDB is calibration data base
> > > +      for WLAN channel and tx power.
> > > +
> > 
> > Use /reserved-memory entries for these.
> > 
> 
> Sure.
> 
> > > +  qcom,start-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR start address. For example on x86 it is 0x0,
> > > +      on IPQ8074 it is 0x41000000.
> > > +
> > > +  qcom,end-addr:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Host DDR end address.
> > 
> > Nak. I don't know what you are doing with these 2, but it's wrong.
> > 
> 
> The DDR start address and end address are sent to MHI control bus,
> For x86 platform code snip in ath11k/mhi.c
> 
>         mhi_ctrl->iova_start = 0;
>         mhi_ctrl->iova_stop = 0xffffffff;
> 
> Similarly for ARM platfroms, send DDR addresses from DT entry.
> 

You can use the reserved memory node for ddr address also. In the ath11k driver,
use devicetree APIs for fetching the start and end addresses.

Thanks,
Mani

> Thanks
> Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
