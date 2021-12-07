Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20B1C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 20:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDwVPtVA+0clixCYCgziQvm72GIKb8BWhN2e/u2li5w=; b=1RafBe/xNUBhc3
	d8AA2bvlSQ50fcXzIvCF1WSO8eaLtLLnm+dENJc4rbqqWVXIT9+CzENEGX7phhsJOkU0ujPa336ft
	SDUERlL2BW3vkD7BOzg2ymYij674MeM2zAxBTR97KLRQ2dh8PIaaxtmVQbhnxywDb0vbv2wdBKpIo
	3bpPYqRVcDx5Eb6tDdKUeEVNKdngHQ9kHFWgHlj8rU2LnaUWbKFoEiUMiSXhnWmaj8gVyn2dUBnZi
	LgQLZpaF/+Z+QG0WVTAZLkkEr8IPs713BEkATns72UXw1w8FKrojF7EtkOat/Qk7wHIkLF9Ud9iDu
	coipXZwAmCNC8eajUFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mugn5-009zPF-DF; Tue, 07 Dec 2021 20:10:19 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mugn2-009zOD-Sq
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 20:10:18 +0000
Received: by mail-oi1-f182.google.com with SMTP id o4so689963oia.10
 for <ath11k@lists.infradead.org>; Tue, 07 Dec 2021 12:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pyusDTTtm6Ksb63O7f9wrqjHxWGrxsnuuMVh3JVl9ps=;
 b=TTsW49Ut5Ze/75O5oQ8nJL2uYeyOE6gh2d46xRhVxji2fyrPtUg9AGk7Lw8MSKi2Z6
 jWZCzOIqq86s4y0xUHBPz4o4tkhl3tyyBUmuesrc7TkehRdwareVXlQEGvBTbDiycRgm
 zO3LB5umaI5tWzeIa5L+qu73bOwtG88AMDKUVVvJtJoL+REbtA8K010ww2GWVOSNtg49
 Ji1XO6GOGRfRWzf/bf+3SHdioHzV6oN1KR9IR2LWiOK+3qJM8n8ZiWh86g0AYX3Ab9br
 MTj9Ky0zm7GoqwDrxW96Jp4hKh057HxBo9//XDM8MkBvrrBaBJFTwuEKQ0uBTTFMsOxt
 WhNQ==
X-Gm-Message-State: AOAM532u0ZTPpGpXwk3Fk0P4IfUENgv59Ni6pw8+uDK0x97h1N8Sq8CP
 fvjJqZm24m2aBz2mabCHGnRqs4GFRQ==
X-Google-Smtp-Source: ABdhPJyy7ZP1i5bojmZinwovGShr1pBvwiUG+CXLD8f+MXjXQXmK97Y1qz1uVKQ+yTCQv51Phl1Pmw==
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr7064464oig.5.1638907815107; 
 Tue, 07 Dec 2021 12:10:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t14sm106454oth.81.2021.12.07.12.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:10:14 -0800 (PST)
Received: (nullmailer pid 746966 invoked by uid 1000);
 Tue, 07 Dec 2021 20:10:13 -0000
Date: Tue, 7 Dec 2021 14:10:13 -0600
From: Rob Herring <robh@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
Message-ID: <Ya+/pawARpqHwTES@robh.at.kernel.org>
References: <1638789319-2950-1-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638789319-2950-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_121016_960230_256D281D 
X-CRM114-Status: GOOD (  12.30  )
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

On Mon, 06 Dec 2021 16:45:18 +0530, Anilkumar Kolli wrote:
> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory, DT entry is used to
> reserve host DDR memory regions, send these memory base
> addresses using DT entries.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V4:
>   - Fix dt_binding_check warnings (Rob)
> V2:
>   - Use reserved-memory (Rob)
> 
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
