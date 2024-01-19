Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC57C4725D
	for <ath11k@archiver.kernel.org>; Fri, 19 Jan 2024 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Np7FsBCOSIMA7HGgHLTFNkG2rgsYtVjMNGX2Pv6QGag=; b=qeJaFlElMitSAyMigt/3N08GSL
	pVJCLDny2PaeEm1PPX4Pmv4++NHXSW03XDSCoj6bwjVL4scu4dg9wVXdGmwBmyHS+sTY8OZpNnYr3
	vE5/+8UdUnOZV/63n0HCq6XC565u+ynGyr/y0WcXgBNdDNDCZS3G1qdEoTQ2rq/W8xeA5ipadsBLl
	4h2C/doEVrFG3sIcTCoGkNShjvDwx1j8v+cz8iNvMpaziQD2WMGW3vtURX3HX03kjcMIlrZ2YFmZM
	HC+kawOpnoug2LXyfhC1HBm4OsKEU0w0bNc3l7JfdiccDgma6zLM0JrQUED1qiSUiBhN9Cv2qjSF8
	VHPqrQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQjdu-004lI9-0b;
	Fri, 19 Jan 2024 07:50:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQjdq-004lGK-2n
	for ath11k@lists.infradead.org;
	Fri, 19 Jan 2024 07:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D56D5CE2170
	for <ath11k@lists.infradead.org>; Fri, 19 Jan 2024 07:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2968CC433F1;
	Fri, 19 Jan 2024 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705650614;
	bh=JjuzPeeDJusOndPJB5nHYlqCcuovsdd3mDnUPIieTso=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=G2ANVHJ9/HMJ5xTii2nljbOfR+rfKawyMCAb+cXe9DonKUtBP/bCqfgeNU9QcUlMV
	 2iJZWSGCE6Vpvif82eHfvVMUXAY8xgjIw9AEtoi+eih2Vsg4rSUccklAk2Sz9mBZJC
	 FqgOQfGWfJGVXEGPP3HnseUuTSosoFE7S0w0QY7pjMi23JJIUVVtanvRLVYm2iMaEk
	 NaZRFwZY1XKe13djBvFz+lxPvmXkQ3XaUKcpUR9VqVxGU5X0zkbCuLz03vTtdWm5hx
	 70rd5aUCUafnU82KxDzSyomoWwpDAx07U7CUVTzVebfSZDzKOCoLfwz0dbpussCcEd
	 BTwi5laHAFRNw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,  regressions@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [regression] ath11k broken in v6.7
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
Date: Fri, 19 Jan 2024 09:50:11 +0200
In-Reply-To: <87frytg7b8.fsf@kernel.org> (Kalle Valo's message of "Fri, 19 Jan
	2024 08:34:35 +0200")
Message-ID: <878r4lg3t8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_235019_087968_CBF4BA75 
X-CRM114-Status: GOOD (  10.83  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Kalle Valo <kvalo@kernel.org> writes:
>
>> Just trying to make everyone aware because I suspect this will affect
>> quite a few people: ath11k is crashing during suspend on v6.7 due to a
>> mac80211 patch, more info:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=218364
>>
>> Proposed fix:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/
>
> The fix is now applied:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=556857aa1d0855aba02b1c63bc52b91ec63fc2cc
>
> I'll try to use regzbot for the first time, let's see how it goes:
>
> #regzbot introduced: 0a3d898ee9a8 ^

Forgot to include the bug report:

#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218364

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

