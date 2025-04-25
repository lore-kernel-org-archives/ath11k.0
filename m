Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACC8C369D1
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 05:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=; b=ynhG4r8/4VoU/KsVwhSLK2REoU
	+b0r1GzHgDh4vpY3lYJBCt/wVV9xRbX3qxTMzJddZomYr1UDCZQ2vs3gfa7ORjA659TNGowN3a8SJ
	at1ICVoFso9yk5Vk+uNwmIzwUv7MTpyxA/sWJ1Ml7lllmxRxRUpNWF8Zvm4ioV3vUyhDjore0nxjC
	HFYihIr5La5whlssQ37J0qduNGqLMWX5OOB4RVMen+GQ+kmOlfIS8S5iedp+/T+ur7vInQ6zd7uh6
	BKZSfySWOpwqd1yh5pbc6rFMYLHAK81cgenGxsL7xK6+E4HFe3gVNQ6Kk/wVXj99Q3UnZUnaBShmG
	VMN2R21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8BkX-0000000FzYG-1BU1;
	Fri, 25 Apr 2025 05:37:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8BkU-0000000FzXP-46eP
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 05:37:20 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736c062b1f5so1611162b3a.0
        for <ath11k@lists.infradead.org>; Thu, 24 Apr 2025 22:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745559433; x=1746164233; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=;
        b=kXdAmzL47JWqjPg+cmB6MZ6QKKLEyFvhQzhE+YxXY0+GNLhO6L6PCWqjv0zl9ihcnD
         9xmk9KFT9B2P/lPhKP3AXUcOUUltlCh/G7tnFyjSPGQXWkC3mOIUjN4D8MxfFK/RsybE
         o3pfoIbjGdH1ZrpEQ4bqL1svU/hZ/g9GfL0/H+c9WfKQbRn8yLy5yMpMbYWQInI+/5Bm
         I3ZsXSbyAf7JBMdnamzx/FuO/nUYHNotEXlD2PnP5b8eV/M5aj0qvRKQHR6ksymB4iLE
         DIpz+OdGtzo4dcOPRpg77oUyIbqhqBsJOysGF5WXC4TPe4VxPadXyiZ4onuJrdPgm/Ls
         KD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559433; x=1746164233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=;
        b=Ji3i980RAYLbAeEtqFbUs6gMYTJ3zhLf+NW1z7hL8mT5mxF0IbdO6v1o/y5YnwQltE
         IrMRFSLd0ASXyhA+bLixcP21NHXtOEqlyKZaB1sA4PXYJfyZ44EAqgWtypbaBL06uiGA
         SS+YyFzbkPuZJOPKzo2WPhB0lL6CFYmGT2g8hryHuCQAR2dXt70W1D2V4DUGy3wm0Xc+
         Zxn06koR0BK2JrICWezuxqFbCUZa9Eil3I6lAiBUvFwYDHory/QKfbLmU7IBHCSbRy9M
         kclKQSAp+p8CzCftg3lWsmX0f2uaEbaFYbeC4VUJFQZfWeYVMhT2wsF2wl9MLWtg4V6S
         ri4g==
X-Forwarded-Encrypted: i=1; AJvYcCU7pNJ4fOR3kYgf2YcBNT/lhQljr2rPqfdzUtjzXW2tvwlGf2uEfY+QSHFudBUY/T9c/ijNGzA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpyRCihJHgELI7TCw16J4x8J3rm+JW2wPJEbNRxY9yNKitKZUp
	RBQEFE96OJ/GvYRNZmBO3CEpxy13g7D7JSiT4nzrjn2yfdK6ZwhObiShQmQ0nA==
X-Gm-Gg: ASbGncstkcVom1Ups7Ol0vNYTUV+opZHIxXqmtc2ZB9g4bict2iwjgJhxFgbrX/NJ8/
	Jaxx65veustRc9lGEgSMydKsiMr1QtU9tTvOiVRkI4INuLFhkaf9GLRgcTbrc1NRbqGsuMwsfaH
	arvjJm2dZrWgitaMH2RdyA4g7QI9bK3V8mzz1Fytt+gPkh9PwUmuzr+P8L73cBHmTGpmrFwPI1d
	yll7952mzLFTt94adt5Xhhh8zfVNh6qKxXIBX5RFN39/deVQQPbDQJ05CjBZYGcDocPsy+4MrGD
	u4SNfKzi8L0uPg7yDC+INf85ROHB72pQv4IBXdeNgY0q1mU/rSI=
X-Google-Smtp-Source: AGHT+IGcoqrCxQ/PlAvuIQ3GNQhMlOAxNWlv8vOGFLV8g7pv3hl+e+Uba/O0SiwZcqMn3LRnx3eY/Q==
X-Received: by 2002:a05:6a00:b4a:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-73fd6defd3emr1305557b3a.6.1745559433403;
        Thu, 24 Apr 2025 22:37:13 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25accfc9sm2436701b3a.176.2025.04.24.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:37:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:07:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, 
	ath11k@lists.infradead.org, jjohnson@kernel.org, quic_bqiang@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_223719_040007_0B6D5CE5 
X-CRM114-Status: GOOD (  39.11  )
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

+ ath11k list, Jeff and Baochen (for question regarding the use of reserved
memory for allocating the MHI data structures in host)

On Tue, Apr 08, 2025 at 08:56:43AM -0600, Jeff Hugo wrote:
> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
> > > From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > > 
> > > MHI control configurations such as channel context, event context, command
> > > context and rings, are currently allocated individually. During MHI
> > > initialization MHI bus driver needs to configure the address space in
> > > which this control configuration resides. Since different component of the
> > > config is being allocated separately, only logical solution is to give the
> > > entire RAM address space, as they could be anywhere.
> > > 
> > 
> > This is fine...
> 
> We tripped over this when experimenting with an automotive market product.
> The FW for that product had a rather strict interpretation of the spec,
> which we confirmed with the spec owner.
> 
> In the specific FW implementation, the device maps the entire MHI space of
> shared structures in a single ATU entry. The device cannot map an entire
> 64-bit address space, and it expects all of the shared structures in a
> single compact range.
> 
> This applies to the control structures, not the data buffers per the device
> implementation.
> 
> This restriction seems backed by the spec.  I can't find a reason why the
> device is invalid, if limited.  I don't think this should break anything,
> but more on that below.
> 

Yes, atleast I have heard about that limitation before.

> > 
> > > As per MHI specification the MHI control configuration address space should
> > > not be more them 4GB.
> > > 
> > 
> > Where exactly this limitation is specified in the spec? The spec supports full
> > 64 bit address space for the MHI control/data structures. But due to the device
> > DMA limitations, MHI controller drivers often use 32 bit address space. But
> > that's not a spec limitation.
> 
> Its not the clearest thing, sadly.
> 
> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers"
> table 6-19 (page 106) -
> 
> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and
> MHICTRLLIMIT registers must be equal."
> 
> This means we have a 4GB range (32-bit) to play with in a 64-bit address
> space.  If the upper 32-bits of the 64-bit address for both the base and the
> limit must be the same, then the range of addresses from the base to the
> limit can only vary the lower 32-bits.
> 
> Invalid:
> BASE: 0x0
> LIMIT: 0xffffffff_ffffffff
> 
> Valid:
> BASE: 0x0f_00000000
> LIMIT: 0x0f_ffffffff
> 

Ah. Didn't spot this before, thanks for explaining!

> > > Since the current implementation is in violation of MHI specification.
> 
> For example mhi_init_dev_ctxt()
> 
> We allocate the chan_ctxt with dma_alloc_coherent() as an individual
> allocation.  In the case of AIC100, the device can access the full 64-bit
> address space, but the DMA engine is limited to a 32-bit transfer size.  The
> chan_ctxt probably won't be larger than 4GB, so the size is rather
> irrelevant.  Can be allocated anywhere.  Lets say that it gets put in the
> lower 32-bit address space - 0x0_XXXXXXXX
> 
> Then a little bit later we allocate er_ctxt with a different
> dma_alloc_coherent() instance.  Being a unique allocation, it is not tied to
> the chan_ctxt and can exist anywhere.  Lets assume that it gets put
> somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
> 
> Now we have a problem because we cannot describe a single range covering
> both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
> 32-bits of both registers is the same.
> 

Yes, I get it. I do not have issues in allocating all the structures in one go.
But the problem is with MHICTRL_BASE/LIMIT. More below.

> > > Allocate a single giant DMA buffer for MHI control configurations and
> > > limit the configuration address space to that buffer.
> > > 
> > 
> > I don't think this could work for all devices. For instance, some ath11k devices
> > use a fixed reserved region in host address space for MHICTRL/BASE.
> 
> Why would we be unable to allocate all of the control structures in a single
> allocation out of that reserved region?  Is it larger than 4GB in size?
> 

I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
reserved region for the iova_start:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331

So this means the firmware will only map the memory from reserved + 0x1000000
for MHI data structures. But even with current implementation, the MHI stack
doesn't know anything about the offset, because it just relies on
dma_alloc_coherent() API which will only honor the reserved region pointed by
'memory' property in the node (without the offset).

So I'm not sure how the firmware makes sure that the data structures lives
within the offset region. This is more of a question to ath11k folks.

But your series is not going to make it any worse. Sorry about the confusion.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

