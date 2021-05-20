Return-Path: <SRS0=zVFH=KP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8199C433B4
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 09:48:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A5961279
	for <ath11k@archiver.kernel.org>; Thu, 20 May 2021 09:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79A5961279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9dAZ9X7vx/Eq0UfDLpf7SyIIWe+uoksgUgbNOEG6KKw=; b=nPullOiAv4vjC6WWxvcANtenna
	2rb6gAFHCUcVkEesZDyIw4iJtWQfTJRH/mO0Yjgof8Zzy8okphU+zA4b7mQbiOu5Cka0LXMDpd/6s
	ldEWq/nCpdubc1JcbNxjnlDpVY5gDCNuQX6PXoEuQJLh3GG+IYjdRyOzqPvs2KwVOPzygdT4vvBhQ
	aaZnTV3TeDotzPpa5vNxuCuttIoYYXBIyR2a/t5pRDQiCIMxUZ06wPEmXxdqQkKPkV5MyqewHMzHO
	Ae461/JLSSplnJNJsRiRU18MscusMSInRGWgOCbcoL2sH7KZ2nQLuNqlWSyzejSb4VuyWLTEOl5/q
	RhhKRQRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljfHx-0002Rl-Jt; Thu, 20 May 2021 09:48:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljfHw-0002RI-Fv
 for ath11k@desiato.infradead.org; Thu, 20 May 2021 09:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=H49bGQOtTMgeuENHMnla+QC4zWMuF1l90hEt5XsQN8U=; b=ZxhUtJW9eA19OBEIkJ9/soAFmO
 tTshcdnEWiFLScX4GLeEbsMSlxi/gE1pZd3QE7AndAz5gG60lo8w7s4MQj/jpI3JAvZCA3QfY7i06
 leT0X4CNX1/d3Qnf+1fcHxAMLJwmjk6kq+th+wwvp1KdD7ZhuuqyY6QZSqeKIGaMHfNCzXuxKHmmL
 VCC4+K4aTKjfXFRlkEJ2xL6qfcoAXeYmm/H5ll//PgnB+cTfN7bxJO51p3qHnnctroXsCRV4Ue7Gq
 Sulu/f/isatfBi1HPTNXjUhLDwqVMFUEjiDQLtvrW5coihma8jI73MUgPesrkqQaz4tb5SYhNtOjN
 CR9M/a0g==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljfHm-00G7j0-L1
 for ath11k@lists.infradead.org; Thu, 20 May 2021 09:48:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621504097; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: Sender;
 bh=H49bGQOtTMgeuENHMnla+QC4zWMuF1l90hEt5XsQN8U=;
 b=aQKBwVLqF9VWHamk42zraOWbk72RoPgmnaa4mq6gIW0/ghz5Zf+/GJCWHzuTsVF/O7eIsfaw
 qzlduuzsiO+udRorcC43ndszvlL/g+hHWazE3Lxu2UjWrGyAoLA6HRnH0z/3ZsoT6ME0fHCm
 K1bwnygMTsQkzVPPnceF1AQCZ5M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a6304ff752fca6681037a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 09:47:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 45378C4323A; Thu, 20 May 2021 09:47:59 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B86B1C43460;
 Thu, 20 May 2021 09:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B86B1C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: [regressions] ath11k: v5.12.3 mhi regression
Date: Thu, 20 May 2021 12:47:53 +0300
Message-ID: <87v97dhh2u.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_024817_899186_D182B11B 
X-CRM114-Status: UNSURE (   7.78  )
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

Hi,

I got several reports that this mhi commit broke ath11k in v5.12.3:

commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
Date:   Wed Feb 24 15:23:04 2021 -0800

    bus: mhi: core: Process execution environment changes serially
    
    [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]

Here are the reports:

https://bugzilla.kernel.org/show_bug.cgi?id=213055

https://bugzilla.kernel.org/show_bug.cgi?id=212187

https://bugs.archlinux.org/task/70849?project=1&string=linux

Interestingly v5.13-rc1 seems to work fine, at least for me, though I
have not tested v5.12.3 myself. Can someone revert this commit in the
stable release so that people get their wifi working again, please?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
