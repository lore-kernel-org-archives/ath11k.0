Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06016C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 12:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC2560F25
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 12:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCC2560F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5WLKQgd3Y7SOBkrJBW+yrbUR8OE6kUeIb0TpP6MSoM=; b=Sbox1ITRfdS9Mf
	BIzxXUsy8fLlFabxpmu++ac3Og2Jx9j2aopWCSKvUCehVoIicR03n19bpyMlYaGOtSIItrFQvofRa
	b1daWVWIEidJDARnQw5mseaHIAbsEeKKdRYQ5Pdl0EUt/sLKhr/YTXX591TPmd3JT5vF5GWRajx7o
	DUo8JGwExhYtk1SYCZP1tntd/UCmJjUuYgUxc3AvCMtFd0CdM6GQYQEBLscXq3GJr7LtIJxUCkAUv
	uCLiXGX8CJKiFiFc6MnoEW8ZvC50KPuKkAAnX89dr9l+/lHiAaCn6fIH0KlOiHm8Lyv4zA4Ki1iCy
	rFWp6uhZGLd8IFdU5qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJbDe-00CS3Y-Ri; Fri, 27 Aug 2021 12:44:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJbDV-00CS2E-UT
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 12:44:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630068260; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=u+0kQZv41mny+Fwi1KMh+dQh0dHtpUUvJt6TRvhKLhs=;
 b=XwlQvSEVvRkkEKRLgT7PbHehOwMjK4tp4in31pp4IiulshXYk1jPD1iW91/PJMRoUMY+nitR
 BtAXWxibiRKsvfJUCKa4TpyA2s4+KOJ5yXaHVfE2x6tHLYiMstFtFhaZlyWdt55sQ471Wst7
 /WudHFqeUVv8SolAc1jeQ4Cp0bI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6128de13096d475c7c3f7649 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 12:44:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 13FBBC43460; Fri, 27 Aug 2021 12:44:03 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A485DC4338F;
 Fri, 27 Aug 2021 12:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A485DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wren Turkal <wt@penguintechs.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <d2795e7c-69cf-557d-19c4-f800c3a80997@penguintechs.org>
Date: Fri, 27 Aug 2021 15:43:58 +0300
In-Reply-To: <d2795e7c-69cf-557d-19c4-f800c3a80997@penguintechs.org> (Wren
 Turkal's message of "Mon, 23 Aug 2021 09:17:19 -0700")
Message-ID: <87o89j5a7l.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_054420_998750_F4B3153C 
X-CRM114-Status: GOOD (  13.78  )
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

Wren Turkal <wt@penguintechs.org> writes:

> On 8/23/21 5:53 AM, Kalle Valo wrote:
>> Do you get the same mhi error as in the forum post?
>>
>> qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22
>>
>> MHI folks, any ideas? I have XPS 13 9310 myself but I'm not able to test
>> v5.14-rc6 kernel right now.
>
> Yes, I get that same message in my logs.
>
> FWIW, ath11k_pci now does not get loaded on boot. I can manually load
> it, but it doesn't seem to do anything.

Do you know if this automatic module loading is related to this qrtr
regression or a separate problem? Can you try Linus' tree and report if
the module load problem still exists? The qrtr regression is fixed now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
