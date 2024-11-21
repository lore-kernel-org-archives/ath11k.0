Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171E1D6ED04
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/oNEz8wjE904MYAiSPNNWhNnTXZYinOn8l57s/PDho=; b=j7f/Jx9vXnlWc51pJ096NPU0xi
	jYHl2p1UzegpR7S8BQ1jNcXCvws4labZErFxduhsO4mw6tLZrqa+zSzoaPbVvqq98TP/Gh15Wqg3J
	bbmkCwdDyk2P73eyv7iXZny1OuDI0MVn1inJDYFphsYJnysZ+kCZtARolbZmgpDJRFhaXM9C1SvEk
	xkeRAJjza0QR35/7ileD+UopFRpBpPDYhUbiSL9Vghe/zo+GjJRL7mjHn0msLWETnSXfMYC4tKfFv
	llFAOeIzjjHgmjIDNa1Ty+favKlAG+GZZaLn2AbEMnTVXn7hybQJDEU6WfcWOZa6BNCRwADp4yRl5
	afCGTKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5EG-0000000HRw8-2fEs;
	Thu, 21 Nov 2024 11:20:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5ED-0000000HRvm-3HF3
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 11:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AE7A5C4D91;
	Thu, 21 Nov 2024 11:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5983C4CECC;
	Thu, 21 Nov 2024 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732188005;
	bh=mWqhOi5kNRqEpp8ydItF5JLam0/fEY56MYBvK355DRg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OoPYRGfK33eEaj4TSOXurZ1ficEBLcmADw14Aac2la9G0MyZyQ375x8K1RdrJng9w
	 gvDLnOIIwSfsC/WN0YSVXjOn56IlonUH7Quu/Yqqv8Rl1y+0Sx9shmrKXg1nrL8wkx
	 61V5xhKOsls5pPBShmdFWoKrc9zi1bHnaUnNNveKAqr9JILozoQyOHkgnSYJdSdS+q
	 Q/8boiWrZv9wpK6aXpwSRpmw8bU/Nx3BB0SQYbTzY8MXFU9epoiQAI3RhTLYK5j5vx
	 1eyFMBObvNI+AlAFfZF+Rh2c6T/Yz/OwyxQkRr/eE7dW6owOrC2qzF9V9g57Dh/Mxf
	 4gG53Bg4agTqg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
 Wendling <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,
  "Arnd Bergmann" <arnd@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <llvm@lists.linux.dev>
Subject: Re: [PATCH 1/3] wifi: ath11k: mark some QMI driver event helpers as
 noinline
References: <20241119-ath11k-noinline-v1-0-4ec0a8aa30b2@quicinc.com>
	<20241119-ath11k-noinline-v1-1-4ec0a8aa30b2@quicinc.com>
Date: Thu, 21 Nov 2024 13:20:01 +0200
In-Reply-To: <20241119-ath11k-noinline-v1-1-4ec0a8aa30b2@quicinc.com> (Jeff
	Johnson's message of "Tue, 19 Nov 2024 07:47:38 -0800")
Message-ID: <87y11cx28u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_032005_868674_280DF177 
X-CRM114-Status: GOOD (  12.87  )
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

> When compiling the ath11k driver using clang with KASAN enabled, the
> following warning is observed:
>
> drivers/net/wireless/ath/ath11k/qmi.c:3199:13: warning: stack frame size (1560) exceeds limit (1024) in 'ath11k_qmi_driver_event_work' [-Wframe-larger-than]
>
> This is similar to the issue found in ath12k/qmi.c that was discussed
> in [1] and fixed with [2]. The issue is that clang inlining can
> explode stack usage.
>
> Just as in ath12k, ath11k_qmi_driver_event_work() itself is a pretty
> lightweight function, but it dispatches to several other functions
> which do the real work:
>
> ath11k_qmi_driver_event_work()
> 	ath11k_qmi_event_server_arrive()
> 		ath11k_qmi_fw_ind_register_send()
> 		ath11k_qmi_host_cap_send() *
> 		ath11k_qmi_event_load_bdf()
> 	ath11k_qmi_event_mem_request()
> 		ath11k_qmi_respond_fw_mem_request()
> 	ath11k_qmi_event_load_bdf()
> 	ath11k_qmi_wlanfw_m3_info_send() *
> 		ath11k_qmi_m3_load()
> 	ath11k_qmi_process_coldboot_calibration()
>
> Of these, the two marked with * have non-trivial stack usage. Mark
> those functions as 'noinline_for_stack' to prevent them from being
> inlined in ath12k_qmi_driver_event_work(), thereby eliminating the
> excessive stack usage.
>
> Note that this approach is a bit more "surgical" than the ath12k
> approach as only the two functions with the largest stack usage are
> modified.
>
> Link: https://msgid.link/bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com # [1]
> Link: https://patch.msgid.link/20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com # [2]
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

