Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E136DC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++zBVYrjnvxyjrK1IzfjguemSZ/+3UpIxqCSMIl6TDk=; b=s3EqQl1H6Xdfli
	xDYeU0FWS10/+L2zFOJqiS3dIxWM2K9LY6GreF+qGYYSn/q1uHjGOeJiC3P7CXuFuTmAtyXeWOfTj
	TFi2w3/Bu1JJYhVskuYzQbddGrcTbjZ/LIeUE3Al8I3bwmYdaOZa13qJ7MmwCQ5b3M/kvbdah8LAu
	ygpMxWCHRTop2BBH5wBoNafh7hEZ/vcROuLLYiNWs5UVe0/dd+FV899898GrrFDq1wzLDsqGFjOh1
	d8lnI0BLfVi6Je24U4KvopFFQckGC50sOsKFlJBilrTn60z3xa85glbHBo1iD+9cE2XeqmlK4cyC5
	3ZM5C/rTOymbakAXisTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKZ4-00GNUB-KI; Thu, 09 Dec 2021 14:38:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKWG-00GMQK-Q3
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 14:35:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A87FDB82488;
 Thu,  9 Dec 2021 14:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C625FC004DD;
 Thu,  9 Dec 2021 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639060533;
 bh=VwQ1u7crT9tT2d+BvG1u1dd1ZTTVlRbYTyboOZjY+2U=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=XRlSUYtInzZ/0oU2tmL9L3RnBGehjLPN3akfPhmYyn+TWDOwoxOnJmvhmtKLxONr+
 B9MSL2XrYtlcOky2Q4AHIJdu78ZPyBOhnXU8e1nBWMpLTgeN+DlBHsqZg9fEn9xIer
 28+yc/qdQIzX/5BPht4AiSZmBqe90zPaFvToxgQe6sTYeVEF7bACsTV0YEcTxuM9W3
 1shsjsfStzRavL5pvVZR5xDtdYXmluIjwZp2f8tT5nWsdgjgjW10xKI4KDg+b+EYTa
 RM8wN9sIcTO788kJ/1yszTfeMzyuz8+WikXuohnep8HXXtAjybJry7DDAbymSXWTv+
 vBOjSToSXzwEA==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev, hemantk@codeaurora.org,
 bbhatt@codeaurora.org, loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org,
 Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH v2] bus: mhi: core: Add support for forced PM resume
References: <20211209131633.4168-1-manivannan.sadhasivam@linaro.org>
Date: Thu, 09 Dec 2021 16:35:25 +0200
In-Reply-To: <20211209131633.4168-1-manivannan.sadhasivam@linaro.org>
 (Manivannan Sadhasivam's message of "Thu, 9 Dec 2021 18:46:33 +0530")
Message-ID: <87fsr13kya.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_063537_028090_33826945 
X-CRM114-Status: GOOD (  19.35  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> From: Loic Poulain <loic.poulain@linaro.org>
>
> For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> are not in M3 state during PM resume, but still functional. The
> mhi_pm_resume should then not fail in those cases, and let the higher
> level device specific stack continue resuming process.
>
> Add an API mhi_pm_resume_force(), to force resuming irrespective of the
> current MHI state. This fixes a regression with non functional ath11k WiFi
> after suspend/resume cycle on some machines.
>
> Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
>
> Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> Cc: stable@vger.kernel.org #5.13
> Link: https://lore.kernel.org/regressions/871r5p0x2u.fsf@codeaurora.org/
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Reported-by: Pengyu Ma <mapengyu@gmail.com>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [mani: Switched to API, added bug report, reported-by tags and CCed stable]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>
> Changes in v2:
>
> * Switched to a new API "mhi_pm_resume_force()" instead of the "force" flag as
>   suggested by Greg. The "force" flag is now used inside the API.
>
> Greg: I'm sending this patch directly to you so that you can apply it to
> char-misc once we get an ACK from Kalle.

Thanks! I now tested this patch on top v5.16-rc4 using QCA6390 and
firmware WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1, no issues found:

Tested-by: Kalle Valo <kvalo@kernel.org>

I'm not expecting any conflicts with ath11k, so please take this via
Greg's tree. It would be really good to get this regression fixed in
v5.16, so is it possible to send this to -rc releases?

For the ath11k part:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
