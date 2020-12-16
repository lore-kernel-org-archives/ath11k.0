Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7DFC4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 11:09:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E72923124
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 11:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E72923124
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RCDaSgadZEQJ+C1xfFQUrrKb/sKEtNY/zVeM/rYu83Q=; b=Q1+BcmDhwK+nFEQXd4LzvWLkQ
	f+7AvAX1jciTJL03KIUoPGmMxlpcM7cmQzF6zOM6X+b8tWmEC+45pH0dnlP/zq1hu3nYdMrwWnSmx
	y7Qwzocd7krjfp0qrDMgzzcxTqosDQXH/uBPONUB4ppmWR5qW63KdwuxVYNdgcY+3l2DF4oN308JV
	4IfVhTSibyQI/mg/QvRZnqG5sFQmeGKcxHthH2UdWVQkYg7AqSXMlnLlz5rnu/uXMgrEdKDdtxYa2
	fKy0ulzY9mYAW2EoJOn3DGjvHMYaK2oOC+wCLtzGgIkxyH/9lD2H9GHOpC+d1WrSBbaTunZiwZmEX
	c/4+iQ7DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUgI-0000WT-2s; Wed, 16 Dec 2020 11:09:18 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUZ3-0004QO-C3
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 11:01:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608116511; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=q6OEzWCfu959SIV59gx6IfRsmBl6yMGT0IZ5fqSXHaI=;
 b=wUG8CeAPAOPwg9Ka6LiDsDXYIGZ6VGEGat22CIl/TwxJyBJMITwNFixM0Z0BpRg/jbRzzt4Q
 k/2bW6IxTeS0J2YCcIkEiv4s1zHpd2Ql+oHyMUY7jIioGbTQLUAUXJkZD2UjRL43M66c2b0A
 HvMW/JhSC+eF6eEUx2UMY+UJk6Q=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fd9e8f9bfd08afb0d02e7df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 11:01:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D6719C433CA; Wed, 16 Dec 2020 11:01:12 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 02EBDC433ED;
 Wed, 16 Dec 2020 11:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02EBDC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/2] ath11k: Fix ath11k_pci_fix_l1ss()
References: <X9nGDHiTh+Z+asDy@mwanda>
Date: Wed, 16 Dec 2020 13:01:08 +0200
In-Reply-To: <X9nGDHiTh+Z+asDy@mwanda> (Dan Carpenter's message of "Wed, 16
 Dec 2020 11:32:12 +0300")
Message-ID: <878s9yxbez.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_060151_263017_52B216CB 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: linux-wireless@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>,
 kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> All these conditions are reversed so presumably most of the function is
> dead code.
>
> Fixes: 0699940755e9 ("ath11k: pci: fix L1ss clock unstable problem")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

And this caused a spurious warning:

[   95.734922] ath11k_pci 0000:06:00.0: failed to set sysclk: 0

I'll update the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
