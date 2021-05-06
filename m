Return-Path: <SRS0=YmRY=KB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E146BC433B4
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 07:55:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86702611ED
	for <ath11k@archiver.kernel.org>; Thu,  6 May 2021 07:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86702611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tjnwhhp8A9YudjmBmSbjTNWs6F1qUwq/t6GdFgDGbds=; b=V+L9GVtCUR2U9tqCzHCwBmnKi
	gW5vw6/fK+zO6DZPK+RPbOFQDrBER6tfiUTaDq9CCoS7O1MZ8vmANNgKz/iiB8aCLSF5CHjlelMJ6
	LwOSRKZnrjKCo8/hVLMu4pEJ7JJhQLfyxWlL9TgUPjeMvB1W/WmhcfErXHC+zYcL9EXoXuCtWjSrE
	VJ68/m2i0HasGxYa6UcwZIVFHi8yrLaUK/V9q+zPjyMaxcR5FCeJ4PxD1M3lNKhkDnpuBP1FL5+CS
	9M44ynuaSf+CTcOrdYTgutNGqOdNuwKqFYhpwDt3IbvNbLOLFPFInIaLepvRLr/2t8Nr2J8Mag0+c
	OuFHQzi9A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leYr5-003XmO-PY; Thu, 06 May 2021 07:55:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYqz-003Xli-SG
 for ath11k@desiato.infradead.org; Thu, 06 May 2021 07:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ESVV/fMaAxNkE4WvbW0fxbJidb4bTYMGXoio537XTy8=; b=1NMZH8PxrPqMBtf9bR0cmmjfpM
 TUpp9LduhqjrHMuaKkg4F8a3mXTaGOqKOy6IT61OFcrTfkeFK2Wc1sa3idLvHHmVs1mu9KWSNSOl9
 cThBZYjRlq2KBQZsjPFbNTLr5V3+eofuKaYUERoXVOUWWSGqoyBjUK8nncR7/7p1wEBcq8vto+uMd
 jDx0TBbRLw/iGFOAttZ3vgZaZnz0brIFJA7MDrl+9uVriv7TS0v1fTWdwxPT6YrP2ESsJgCheMqx7
 ynsYbDr1eArQIjQihprseeTMTQLZMd8SEx4lRf59ifJ5FBGXaABW/33+jzyZN3/HYD9yqRPz2wfPh
 iek6szXg==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leYqw-005gGl-8t
 for ath11k@lists.infradead.org; Thu, 06 May 2021 07:55:23 +0000
Received: by mail-pg1-x52f.google.com with SMTP id s22so4157096pgk.6
 for <ath11k@lists.infradead.org>; Thu, 06 May 2021 00:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ESVV/fMaAxNkE4WvbW0fxbJidb4bTYMGXoio537XTy8=;
 b=CBl6iUCMWBc1+XteGpbJ9leQZsxPoMSOwx/iAOt5hsVC8kF9j8ypdYuGO1NLGxRqgf
 3Ykk1ylqzolhm9eRIbT68h92NVteUANOM1QfT0FYefqAV18aaXzlczPZ45hztQHrFb+a
 gBbpnbW6Y49Lpts8ib15JwNOaHgWZoc9wZTZ9cdz0IFMH5Nu5zrJTlQBNsZCjHmTVZyn
 tl2Y4l3ES+7g3boCezH0i/M934Qc7jBnF/aHXKTo/18PFCu+BbVtiuo076Nt9W6eNOXA
 sg9YqOHJ7wRmVywkTdw4YdnzYb/EOOmYxhTQKtUnx61935Ac57esFpzZeAspbfmKjgeR
 HIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ESVV/fMaAxNkE4WvbW0fxbJidb4bTYMGXoio537XTy8=;
 b=XWAAKOEhPEGlwFeHquXwh4SOgeCx9CNP68pCgH/4GaLYxSCWXYYc13r22SPMeBje93
 4hVx1HPy2lsf0CyY09lk42opg1e1ZknuiPI0+HsSkDKQVJgWdRxrgHIvLXr4IbCYSmiK
 4QFfiuGss+CdOM/jHYUimb8QNQQjvMA+PjZsgArirNHPfzqIOd3Dxc0kIFiEAmCmZCQy
 Vrgx41NR8zV2u6eh51LIMPzt4JRiZgDCeaSAc6w0e2wPpdAffARw4+hxJIOQwBcXmVm5
 cC7CvW6OFA9WtJaLOcyyxGd438UKHJ99ort8f/sUmFCxwWDbkhiipf+1Y+D+UXo0ssBG
 k6OQ==
X-Gm-Message-State: AOAM533IN35roAL0WM6TpjStqOYVNKH95ZjSAsQGvt7A18n87X/N+w8G
 AaJbZb6u8O8BUzOjjBaVeR/ARQT4mBwfvb0ZHQHFQw==
X-Google-Smtp-Source: ABdhPJz9+BbLcod0C8x9IKaB+7PNgAIm6oZ/AvRXYy2PJxruNemP5ifp+mZctZppylusL3o8E5DacbRjvD7abeeEMnE=
X-Received: by 2002:a63:9d4e:: with SMTP id i75mr2924857pgd.443.1620287720183; 
 Thu, 06 May 2021 00:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-6-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1620234501-30461-6-git-send-email-bbhatt@codeaurora.org>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 6 May 2021 10:03:53 +0200
Message-ID: <CAMZdPi8_MKyF8imaOc+9MGz4ifOKX=UMA1CzHe3aPuXC2BEoOg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] bus: mhi: pci_generic: Set register access length
 for MHI driver
To: Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Hemant Kumar <hemantk@codeaurora.org>, 
 Jeffrey Hugo <jhugo@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, 
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, 
 ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_005522_338148_995CD1A5 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, 5 May 2021 at 19:08, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> MHI driver requires register space length to add range checks and
> prevent memory region accesses outside of that for MMIO space.
> Set it from the PCI generic controller driver before registering
> the MHI controller.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
