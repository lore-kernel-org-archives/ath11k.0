Return-Path: <SRS0=mtRf=IH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D31C433DB
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 10:50:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DCF64DF5
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 10:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32DCF64DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xvcv10onv1jfZ301/vD26Pg30rKXoYvkB6PO/zgx5mU=; b=n7i9/7naKarrhd8afLz0CeyJc
	ZlZ0zmbYEe8IUHUiDcyF85Y/YcQ0yOASKQkSJheEIxXMFPjz06wCvRpCh2TMYjMFNb6iX1rGhLpxq
	nPgbx6iGkj8z4ZQ1CeYQ6zL5KQux6aU0vjKwNOMIFXTjTDg+oJrHFGHRqDydrVHSjyixwCcdnS5he
	tejdK9mSwr/keORS828HYQpsbbzJxrcZiKfeWjZCjB7PKaANmiPvHVrj09bxDD5MpuZW+7k954ZIq
	UsYhWZluIDbgaajhbtJf7s1kIVZYk5r21wnclSutppryAOPp/uQOQbP6FsjhebwiTTz2NbAiqp4Fb
	2f/vwgsJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJZwo-004F01-0b; Tue, 09 Mar 2021 10:50:42 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJZwd-004Eyv-0Z
 for ath11k@lists.infradead.org; Tue, 09 Mar 2021 10:50:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615287031; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=W+tHV6Vg7Q1LidNploZkW2JVF7uddrg/fD/mjTOPCEU=;
 b=cCx8bMplVuNDjjIW+JWjmjQhQMiTsYGsWSkHOMNQeDSfA6UjVPMdjhIrjxONXgXZRJZPTqSZ
 9JLCdvzz0sd5wzMx0HDUjJrxMnkE1dOBVYYc2kqSdLfAzwUmPYh5AO+eh9FSGmmlWipVSU3q
 9rcxNkTjxs91OBOi1vhNr4FsQUM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 604752f2f842f723a9da9932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 10:50:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 269ADC433CA; Tue,  9 Mar 2021 10:50:25 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 407B5C433C6;
 Tue,  9 Mar 2021 10:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 407B5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH V5 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210222192651.1782-2-alokad@codeaurora.org>
References: <20210222192651.1782-2-alokad@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 John Crispin <john@phrozen.org>, Aloka Dixit <alokad@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210309105025.269ADC433CA@smtp.codeaurora.org>
Date: Tue,  9 Mar 2021 10:50:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_105031_455843_BC8C9819 
X-CRM114-Status: UNSURE (   7.00  )
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

Aloka Dixit <alokad@codeaurora.org> wrote:

> These calls are used for debugging and will be required for WFA
> certification tests.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Co-developed-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This patchset had new warnings:

drivers/net/wireless/ath/ath11k/debugfs.c:16:15: warning: symbol 'debugfs_ath11k' was not declared. Should it be static?
drivers/net/wireless/ath/ath11k/wmi.c:7143: char * array declaration might be better as static const

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210222192651.1782-2-alokad@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
