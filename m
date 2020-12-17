Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A500BC4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 09:53:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 440112360D
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 09:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 440112360D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YiqC96DUOfyMPd9UB9NdQRr/gtZCGUZe9LnATHeH98E=; b=NQdGWEb9GyEQchgvbQSAygexs
	zSM1gc5/ueyEME5P3EE0piu4xlgXfH5LtfCfoIHJmGI87mARC6ECtPA4rI35uAQo7kui64HC4k3vu
	7ixOAmx/1LvTsfk1Vz9zSeAEjimnauEM+6N/6c2qwFq+oiMDCtrJxiE0wc71BFyAjEgQAbY443qdS
	4GF38yKd/Q0Lz1vQRT/n91Md4h3xpjKx4NlX5KPqtMTJCG7T6c1h6T2BkGuG284TcPrn8gtv+bOpR
	vBiGCR8rvtCnocXI+AKEj2J9HS8RixnT3XLDh/Pgy76XupRj2BHzTa8wgOdMeieNFbkC3Sg7YfIPl
	Ky7XS00dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kppyG-0004A9-6N; Thu, 17 Dec 2020 09:53:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kppyE-00049l-9I
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 09:53:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id h186so8223962pfe.0
 for <ath11k@lists.infradead.org>; Thu, 17 Dec 2020 01:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xb9YXlNIKcBYGniysA8enO5M87stRU+17m3vyS8BgNI=;
 b=HNsnXpbUaqCTzZOjfbWDPAb1Csuxl4DqdQuTZS5S5BAXt0RqLtxCjGpa8ZWaO47Aec
 1AQ3bxkzkH/T/ajqYBLbXhP5voBHhGyGCJrGkt3NUVnoIeF8St31SgSoUi82Jlzs4r6n
 7blWTudNdpQHOdg1x07aKbPAm6mKGvvtmB3q4FKYyhM68l13JKnPQoS6fYJUu9zZ8UZn
 /xGRBy46tBYxPO7gvYIujk+HDMZ4muHXYZYxetQ+elRLLJzr8OA4zU7Am4MHmBs3NIxR
 84qoSwcI33hkFNG/zYwukxmbej8nY35whw0xFxgR1P40t2yXMHPxHVvuFUyh0PDPT0s4
 Gq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xb9YXlNIKcBYGniysA8enO5M87stRU+17m3vyS8BgNI=;
 b=VnXGHwSDhbfQgyfVx205LDEBGJCbEplnfrls2QDvBIKeXtiIG4wdLR4/o51eZIa9iJ
 Rv61TqUBqZ6Ffph1wF34YXwcKvqBVMdNvCbkRJoR7rtyU2Z1swYOw7l+n2bQHc5/W3BZ
 W3dXJXybhiBuTJNlCoMHQ2F077R/LYoZKgVVEsc/12Ypc9V5x84lbFxY+O9h0p217typ
 l8D4Ft4t2rQjdmzElbJGcw72ReDcDWWQlCq2OerZldGNTPlBjB+D7FMCDzUDJ4RV/3Kj
 09pZDyKfS/yHF5tFcyJMBk74hzrlF6yDi7lLPb6YIegWUQkMLWwAlPHAXfIba8KVG+W/
 3YWQ==
X-Gm-Message-State: AOAM530dUK/Xj85ez94a7Lj7Z5CnJNsE+qni43KdAMFkwz+RgM2k3gLE
 m9nQ6ElkK2wRgNg46sH6CdSt
X-Google-Smtp-Source: ABdhPJyxJuYhVpFtrzW9JFl9F/s1Jyej+FHtq3W//gZWBYrM8SWQDG1/y7SXOp4J+iHIVBPhqpPp1g==
X-Received: by 2002:a62:7b84:0:b029:19c:7146:4bbb with SMTP id
 w126-20020a627b840000b029019c71464bbbmr9210763pfc.52.1608198790500; 
 Thu, 17 Dec 2020 01:53:10 -0800 (PST)
Received: from work ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id c10sm5780507pfj.54.2020.12.17.01.53.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Dec 2020 01:53:09 -0800 (PST)
Date: Thu, 17 Dec 2020 15:23:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
Message-ID: <20201217095302.GA4640@work>
References: <87pn3axhm1.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pn3axhm1.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_045314_437745_D8BC2BB6 
X-CRM114-Status: GOOD (  15.74  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Liang <stephenliang7@gmail.com>, wink@technolu.st,
 Jeffrey Hugo <jhugo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, ath11k@lists.infradead.org,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On Wed, Dec 16, 2020 at 10:47:18AM +0200, Kalle Valo wrote:
> Hi MHI devs,
> 

[...]

> After extensive debugging from wink he found out that disabling M2 state
> makes the all problems go away:
> 
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>         },
>         {
>                 MHI_PM_M0,
> -               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> +               MHI_PM_M0 | MHI_PM_M3_ENTER |
>                 MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
>                 MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
>         },
>         {
> -               MHI_PM_M2,
> +               MHI_PM_M0,
>                 MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
>                 MHI_PM_LD_ERR_FATAL_DETECT
>         },
> 
> And indeed now we have numerous people reporting that with this
> workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
> earth could cause these kernel crashes/interrupt storms? And why is it
> visible only on Dell laptops? Why does disabling M2 state fix it?
> 

This is related to the ASPM state of the PCIe bus. In the meantime, I'd
suggest to turn off ASPM using "pcie_aspm=off" in the kernel command
line so that the MHI bus stays in M0.

For debugging this issue, can someone enable debug logs for MHI and share
the dmesg output (with ASPM enabled ofc)?

Thanks,
Mani

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
