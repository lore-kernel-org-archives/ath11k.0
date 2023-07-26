Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F88C41513
	for <ath11k@archiver.kernel.org>; Wed, 26 Jul 2023 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJAIjyml2vrcqorNweN1wD1ixXUCls5T2STUXNtuFCs=; b=I8goo7H9VoTYv6
	ioqJqkijgRbXRltDPFns77MObinImcSsahNUcTgG+TjtgUX1WUhCIyB8A3pmdd+zlWXkKYslmsPYW
	O9VXeQMAkQ4cHKTrjwciXcLlBY4vomJ1URAVNbVxiQ4dpSmOWFEjVSiqnWr98AtgjXLSzFR25zqyG
	8wPoiJj+WZmzY63Z+se1oPw5nDNQb2feaDsTTWr7snvCB2jFzAfjyk/g9AkaQJaK2o+CtLaWPwicT
	UVwS1sJTR7sPyhyyHqH+88SXSlCMJ/8ZuMWrZx2IfrQckRcA1ZAxA9onBro8BfmHgFpdD/h8gitEo
	2GYELNwjtyADlKMpBMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYSZ-009KAU-0O;
	Wed, 26 Jul 2023 06:57:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYST-009K8k-0z
	for ath11k@lists.infradead.org;
	Wed, 26 Jul 2023 06:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F4246145A
	for <ath11k@lists.infradead.org>; Wed, 26 Jul 2023 06:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54865C433C8;
	Wed, 26 Jul 2023 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690354636;
	bh=xHlm5bWMUQRL1QFrdtVePyYirEwMmuuFHBU4VTFFaAs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TLXto8tPa+qYK1hudIzzA9cAn3Vl8T7PkUdFfUh8boNtASqEQI2lH2sJl7ky6b6zv
	 9PDqus61KcI8DmMPZV+c40J4CfqS2yb6ni5tV3Jgl0YSYdiuf0b3ogj8IXUwjKztjT
	 omFySydNduyhCi3lPra42a7LHefRmtI9wDf+ZNq9kHZHdtSM9IRBQCGaxnhk3dbW4a
	 n73zHTvmtfFAQg1zd77HkIYHKxF6Y6pLF3UdkRzm/aKSnBNCrkLlo/QeHRcyopwrDt
	 2JIqfDzw44BvxFtMtU9b9eFTZXA5imbNfGmb1tWuEo7gxn1ajnZ0DL9cUsiH3GmiTZ
	 aDa4kPFnYCDQw==
MIME-Version: 1.0
Subject: Re: [PATCH v6.5] Revert "wifi: ath11k: Enable threaded NAPI"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230720151444.2016637-1-kvalo@kernel.org>
References: <20230720151444.2016637-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169035463311.3467307.11151341644167452252.kvalo@kernel.org>
Date: Wed, 26 Jul 2023 06:57:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_235717_381631_0C2BC2CE 
X-CRM114-Status: UNSURE (   7.43  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> This reverts commit 13aa2fb692d3717767303817f35b3e650109add3.
> 
> This commit broke QCN9074 initialisation:
> 
> [  358.960477] ath11k_pci 0000:04:00.0: ce desc not available for wmi command 36866
> [  358.960481] ath11k_pci 0000:04:00.0: failed to send WMI_STA_POWERSAVE_PARAM_CMDID
> [  358.960484] ath11k_pci 0000:04:00.0: could not set uapsd params -105
> 
> As there's no fix available let's just revert it to get QCN9074 working again.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217536
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to wireless.git, thanks.

d265ebe41c91 Revert "wifi: ath11k: Enable threaded NAPI"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230720151444.2016637-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
