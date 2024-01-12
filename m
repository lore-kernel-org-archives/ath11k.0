Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E54C4706C
	for <ath11k@archiver.kernel.org>; Fri, 12 Jan 2024 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2J+k1SIthxRKnugzR1AaldE/aPDOVUzbgE3fekXgfQ=; b=5EmmJxFWmpnYhFy5gTFi0EnB0g
	Xg5jFEGr3P2Y6pngOHGLLJIrTTivvPcZjdzIzHWJtfdf5wsKFj+i8cAq2JYXcrh0Y7XoljKR1H1So
	bgQ7GmEWZvqTB5InSB4gTK1flxgANfof3aZaCabkYtrYH13tzd5Oa8g7r58h1iVN5D0jXanGudVjB
	lo56Q8eX0XNEMmXt0AEn+GyjHWM/nEHVYENB25AH37SWvIh4OTC1R9/ZTr1vvmr6A+f8drR/1+7pp
	GAV8Yv1pxoXIdzaSwnh/bIjYs+BnhSSPRKVCsgBQgqVwmZLnSPF7G7T+EPyCIFcSLPlr3Cc8cquMJ
	dNBhWQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOAyl-0020cB-1M;
	Fri, 12 Jan 2024 06:25:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOAyi-0020bl-0b
	for ath11k@lists.infradead.org;
	Fri, 12 Jan 2024 06:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C590CE233F;
	Fri, 12 Jan 2024 06:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE547C433C7;
	Fri, 12 Jan 2024 06:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705040709;
	bh=ltAFigckzoyq+M2uicYFrx84Y169sQJ1vb3Owsd0y+A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NYq7b5/pGPEK7Dwy0xcnWCOAJGelxrvR2igcEeYuflbsGcKCj9pGqjeZ95NQ6bc2W
	 qq7B5j3EpJUpHhvFfE0xZOeaF1XAnNFiziZOJL5a8ybavnivqyxn9sAPFP3zNYuY80
	 ETcXqvaLzJKVgWvhdRi7fsmd2U8yamIh9PE3JcvcQd8kEEoIr/onrL89o1bKr3ZyEI
	 99+pirHw7SoEmM1p5jiUEexbOTzMVr3kur5vNxFDVbBQIN43BrklU1nBIqRbkO4gUa
	 Fiw9oi3DOwt4xJVA42W46K3SGu0albHhNZsq0+lNsFiYig67o1XFMFCnITiDmXabbV
	 J7IOtEZsbkINw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v10 07/12] wifi: ath11k: add parse of transmit power
 envelope element
References: <20231218085844.2658-1-quic_bqiang@quicinc.com>
	<20231218085844.2658-8-quic_bqiang@quicinc.com>
	<93c178cd-8a16-48e5-b352-f14afab07498@quicinc.com>
Date: Fri, 12 Jan 2024 08:25:06 +0200
In-Reply-To: <93c178cd-8a16-48e5-b352-f14afab07498@quicinc.com> (Jeff
	Johnson's message of "Thu, 11 Jan 2024 09:13:19 -0800")
Message-ID: <87eden9igt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_222516_424637_68F38496 
X-CRM114-Status: UNSURE (   7.27  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 12/18/2023 12:58 AM, Baochen Qiang wrote:
>> +/**
>> + * struct reg_tpc_power_info - regulatory TPC power info
>
> Kalle,
>
> just spotted this kernel-doc issue in the pending branch
>
> s/reg_tpc_power_info/ath11k_reg_tpc_power_info/
>
> can you update?

Yup, did that now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=180335ddf80a8cd44a9b261db548c14ede01da44

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

